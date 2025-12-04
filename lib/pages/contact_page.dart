import 'package:flutter/material.dart';
import '../theme/text_styles.dart';
import '../theme/app_colors.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🏷️ Page Title
          Text(
            "Contact Us",
            style: TextStyles.heading1.copyWith(
              fontSize: 36,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          Text(
            "Get in touch with I Power Tech — we’re here to help with all your generator and power service needs.",
            style: TextStyles.body.copyWith(
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 50),

          // 🧭 Contact Details Section
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.15),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: isWide
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildContactInfo(context)),
                      const SizedBox(width: 50),
                      Expanded(child: _buildOfficeInfo(context)),
                    ],
                  )
                : Column(
                    children: [
                      _buildContactInfo(context),
                      const SizedBox(height: 30),
                      _buildOfficeInfo(context),
                    ],
                  ),
          ),

          const SizedBox(height: 50),

          // 🗺️ Optional: Map or Location Placeholder
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "lib/assets/office_location.png", // 👉 Add your office map or building image
              height: isWide ? 400 : 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 60),
        ],
      ),
    );
  }

  // 📞 Contact Information Section
  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reach Us At",
          style: TextStyles.heading2.copyWith(
            color: AppColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        _infoRow(Icons.phone, "+91 99804 33136"),
        const SizedBox(height: 10),
        _infoRow(Icons.phone_android, "+91 79978 08057"),
        const SizedBox(height: 10),
        _infoRow(Icons.email, "intetiravikumar123@gmail.com"),
        const SizedBox(height: 10),
        _infoRow(Icons.language, "www.ipowertech.com"),
        const SizedBox(height: 10),
        _infoRow(Icons.access_time, "Mon - Sat: 9:00 AM - 8:00 PM"),
      ],
    );
  }

  // 🏢 Office Info Section
  Widget _buildOfficeInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Our Office Address",
          style: TextStyles.heading2.copyWith(
            color: AppColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _infoRow(
          Icons.location_on,
          "Guntur,A.P",
        ),
        const SizedBox(height: 15),
        Text(
          "Our office is located in the heart of Chennai, making it easily accessible for customers from all directions. "
          "We welcome you to visit us for consultations, on-site service requests, or detailed discussions about generator maintenance and installation.",
          style: TextStyles.body.copyWith(fontSize: 16, height: 1.6),
        ),
      ],
    );
  }

  // Reusable info row
  Widget _infoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.redAccent, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyles.body.copyWith(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
