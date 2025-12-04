import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🏢 Title
          Text(
            "Our Generator Services",
            style: TextStyles.heading1.copyWith(
              color: AppColors.primary,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          Text(
            "Complete Power Solutions — Installation, Maintenance & Support",
            style: TextStyles.body.copyWith(
              fontSize: 18,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),

          // ✅ Firestore Service List (dynamic)
          StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection('services')
                .orderBy('createdAt', descending: false)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                // 🔁 If no data in Firestore, show default static layout
                return _buildStaticServices(context);
              }

              final services = snapshot.data!.docs;

              return Column(
                children: services.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final title = data['title'] ?? 'Untitled Service';
                  final description =
                      data['description'] ?? 'No description available.';
                  final imageUrl =
                      data['imageUrl'] ?? 'lib/assets/service_placeholder.png';
                  final isImageLeft = data['isImageLeft'] ?? true;

                  return _buildImageTextSection(
                    context: context,
                    imagePath: imageUrl,
                    title: title,
                    description: description,
                    isImageLeft: isImageLeft,
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }

  // 🔁 Static layout (fallback if Firestore is empty)
  Widget _buildStaticServices(BuildContext context) {
    return Column(
      children: [
        _buildImageTextSection(
          context: context,
          imagePath: "lib/assets/service_installation.png",
          title: "Generator Installation",
          description:
              "We provide professional generator installation services for both homes and industries. "
              "Our team ensures safe electrical integration, optimal positioning, and seamless setup for reliable operation.",
          isImageLeft: true,
        ),
        const SizedBox(height: 60),
        _buildImageTextSection(
          context: context,
          imagePath: "lib/assets/service_maintenance.png",
          title: "Preventive Maintenance",
          description:
              "Routine maintenance ensures your generator stays in peak condition. "
              "We offer regular inspection, cleaning, oil changes, and part replacement to prevent unexpected downtime.",
          isImageLeft: false,
        ),
        const SizedBox(height: 60),
        _buildImageTextSection(
          context: context,
          imagePath: "lib/assets/service_repair.png",
          title: "Repair & Troubleshooting",
          description:
              "Our skilled engineers quickly diagnose and repair electrical or mechanical issues. "
              "We use only genuine spare parts and advanced tools for accurate problem-solving.",
          isImageLeft: true,
        ),
        const SizedBox(height: 60),
        _buildImageTextSection(
          context: context,
          imagePath: "lib/assets/service_amc.png",
          title: "Annual Maintenance Contract (AMC)",
          description:
              "Keep your generator running worry-free all year round. "
              "Our AMC plans cover regular maintenance visits, emergency support, and priority service.",
          isImageLeft: false,
        ),
        const SizedBox(height: 60),
        _buildImageTextSection(
          context: context,
          imagePath: "lib/assets/service_parts.png",
          title: "Genuine Parts & Generator Sales",
          description:
              "We supply and install high-quality, genuine generator parts and offer new generator units for sale. "
              "From compact models to industrial-grade systems — we’ve got you covered.",
          isImageLeft: true,
        ),
      ],
    );
  }

  // 📸 Reusable image + text section
  Widget _buildImageTextSection({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String description,
    required bool isImageLeft,
  }) {
    final isWide = MediaQuery.of(context).size.width > 800;

    final imageWidget = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: imagePath.startsWith('http')
          ? Image.network(
              imagePath,
              width: isWide ? 420 : double.infinity,
              height: isWide ? 260 : 200,
              fit: BoxFit.cover,
            )
          : Image.asset(
              imagePath,
              width: isWide ? 420 : double.infinity,
              height: isWide ? 260 : 200,
              fit: BoxFit.cover,
            ),
    );

    final textWidget = Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: isWide
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyles.heading2.copyWith(
                color: AppColors.primary,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              textAlign: isWide ? TextAlign.left : TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyles.body.copyWith(
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
              textAlign: isWide ? TextAlign.left : TextAlign.center,
            ),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: isWide
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: isImageLeft
                    ? [imageWidget, const SizedBox(width: 30), textWidget]
                    : [textWidget, const SizedBox(width: 30), imageWidget],
              )
            : Column(
                children: [imageWidget, const SizedBox(height: 20), textWidget],
              ),
      ),
    );
  }
}
