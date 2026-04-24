import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 800;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "About I Power Tech",
            style: TextStyles.heading1.copyWith(
              color: AppColors.primary,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),

          Text(
            "Powering Reliability and Excellence — Backed by 15+ Years of Technical Expertise.",
            style: TextStyles.body.copyWith(
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 60),

          _buildImageTextSection(
            context: context,
            imagePath: "lib/assets/about_company.jpg",
            title: "Driven by Experience, Defined by Quality",
            description:
                "Founded with a vision to deliver world-class power solutions, I Power Tech specializes in generator installation, repair, and maintenance services. "
                "Our commitment lies in ensuring seamless power continuity for homes, industries, and institutions. "
                "With every project, we bring together innovation, reliability, and precision to create solutions that keep your operations running — no matter what.",
            isImageLeft: false,
          ),

          const SizedBox(height: 60),

          _buildProfileSection(isWide),

          const SizedBox(height: 60),

          _buildImageTextSection(
            context: context,
            imagePath: "lib/assets/about_services.jpg",
            title: "Our Areas of Expertise",
            description:
                "At I Power Tech, we handle every aspect of generator service — from installation and preventive maintenance to repairs and performance optimization. "
                "Our approach combines technical skill with practical experience to minimize downtime and maximize generator efficiency. "
                "We cater to both residential and industrial clients with personalized service and high-quality components.",
            isImageLeft: true,
          ),

          const SizedBox(height: 60),

          _buildImageTextSection(
            context: context,
            imagePath: "lib/assets/about_commitment.png",
            title: "Our Commitment to You",
            description:
                "We believe that true reliability begins with trust. Every service at I Power Tech is delivered with integrity, transparency, and an unwavering focus on quality. "
                "We use only genuine parts, adhere to strict safety standards, and ensure timely, responsive support — because your power matters to us.",
            isImageLeft: false,
          ),

          const SizedBox(height: 60),

          // ✅ NEW IMAGE SECTION ADDED
          _buildImageTextSection(
            context: context,
            imagePath: "lib/assets/about_extra.jpg", // 👈 add your new image
            title: "Our Work in Action",
            description:
                "Take a look at our team delivering reliable generator solutions across various projects. Our hands-on expertise ensures every installation and service meets the highest standards of quality and safety.",
            isImageLeft: true,
          ),

          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildImageTextSection({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String description,
    required bool isImageLeft,
  }) {
    final isWide = MediaQuery.of(context).size.width > 800;

    final bool isCommitmentSection = title.contains("Commitment");
    final bool isServiceSection = title.contains("Expertise");

    final imageWidget = Container(
      color: Colors.black,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          width: isWide ? 550 : double.infinity,
          height: isCommitmentSection
              ? (isWide ? 460 : 320)
              : (isWide ? 340 : 240),
          fit: isServiceSection ? BoxFit.contain : BoxFit.cover,
        ),
      ),
    );

    final textWidget = Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: isWide
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyles.heading2.copyWith(
                color: AppColors.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: isWide ? TextAlign.left : TextAlign.center,
            ),
            const SizedBox(height: 14),
            Text(
              description,
              style: TextStyles.body.copyWith(
                fontSize: 17,
                height: 1.6,
                color: Colors.black,
              ),
              textAlign: isWide ? TextAlign.left : TextAlign.center,
            ),
          ],
        ),
      ),
    );

    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: isWide
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: isImageLeft
                  ? [imageWidget, const SizedBox(width: 40), textWidget]
                  : [textWidget, const SizedBox(width: 40), imageWidget],
            )
          : Column(
              children: [imageWidget, const SizedBox(height: 25), textWidget],
            ),
    );
  }

  Widget _buildProfileSection(bool isWide) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: isWide
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.black,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "lib/assets/ravikumar_profile.jpg",
                      width: 340,
                      height: 340,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                Expanded(child: _buildProfileText()),
              ],
            )
          : Column(
              children: [
                Container(
                  color: Colors.black,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "lib/assets/ravikumar_profile.jpg",
                      width: 280,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                _buildProfileText(),
              ],
            ),
    );
  }

  Widget _buildProfileText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Meet Our Expert — Mr. I. Ravikumar",
          style: TextStyles.heading2.copyWith(
            fontSize: 28,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "Mr. I. Ravikumar, the founder of I Power Tech, is a highly skilled professional with over 15 years of in-depth experience in the generator and power solutions industry.",
          style: TextStyles.body.copyWith(fontSize: 17, height: 1.6),
        ),
      ],
    );
  }
}
