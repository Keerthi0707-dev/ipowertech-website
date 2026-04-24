import 'package:flutter/material.dart';
import '../theme/text_styles.dart';
import '../theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bannerHeight =
        screenHeight * (MediaQuery.of(context).size.width < 600 ? 0.50 : 0.50);

    return Container(
      color: AppColors.background,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🖼 Hero Banner (✅ Overlay Removed)
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "lib/assets/banner.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: bannerHeight,
                ),

                // ❌ REMOVED THIS OVERLAY
                // Container(
                //   height: bannerHeight,
                //   width: double.infinity,
                //   color: const Color.fromARGB(255, 218, 214, 214)
                //       .withValues(alpha: 0.4),
                // ),

                Text("",
                  style: TextStyles.heading1.copyWith(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      const Shadow(blurRadius: 10, color: Colors.black),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 🆕 TRAINING IMAGE SECTION
            _buildSectionHeader("I Power Tech Generator Services"),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "lib/assets/ourjourney.jpg",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🔘 WhatsApp Button ONLY
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 6,
                  ),
                  onPressed: () async {
                    const phone = "919980433136";
                    const message =
                        "Hello! I would like to enquire about your generator services.";

                    final url = Uri.parse(
                      "https://wa.me/$phone?text=${Uri.encodeFull(message)}",
                    );

                    await launchUrl(url,
                        mode: LaunchMode.externalApplication);
                  },
                  icon: const Icon(Icons.chat, color: Colors.white),
                  label: const Text(
                    "Contact on WhatsApp",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            // 💬 About Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    "At I Power Tech, we specialize in generator installation, maintenance, and repair for homes, offices, and industries. "
                    "Our mission is to provide uninterrupted power solutions with advanced technology and skilled professionals.",
                    style: TextStyles.body.copyWith(
                      fontSize: 18,
                      height: 1.6,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "“Powering Your World — Reliable Energy, Anytime, Anywhere.”",
                    style: TextStyles.body.copyWith(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: AppColors.accent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 60),

            // 💼 Services Section
            _buildSectionHeader("Our Services"),
            const SizedBox(height: 30),

            Wrap(
              spacing: 40,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                _buildServiceCard(
                  icon: Icons.bolt,
                  title: "Generator Installation",
                  description:
                      "Professional setup and commissioning for residential, commercial, and industrial generators.",
                ),
                _buildServiceCard(
                  icon: Icons.build,
                  title: "Maintenance & Repairs",
                  description:
                      "Routine servicing and emergency repairs to keep your power running smoothly.",
                ),
                _buildServiceCard(
                  icon: Icons.engineering,
                  title: "AMC Contracts",
                  description:
                      "Comprehensive Annual Maintenance Contracts for consistent reliability and reduced downtime.",
                ),
                _buildServiceCard(
                  icon: Icons.local_shipping,
                  title: "Parts & Accessories",
                  description:
                      "Genuine spare parts, lubricants, and accessories for all generator models.",
                ),

                // EXTRA SERVICES
                _buildServiceCard(
                  icon: Icons.power,
                  title: "DG Set Rental",
                  description:
                      "Reliable generator rental services for events, construction sites, and temporary needs.",
                ),
                _buildServiceCard(
                  icon: Icons.settings,
                  title: "Control Panel Setup",
                  description:
                      "Installation and configuration of advanced control panels.",
                ),
                _buildServiceCard(
                  icon: Icons.battery_charging_full,
                  title: "Battery Services",
                  description:
                      "Battery inspection, replacement, and charging solutions.",
                ),
                _buildServiceCard(
                  icon: Icons.security,
                  title: "Load Testing",
                  description:
                      "Ensure generator efficiency with accurate load testing.",
                ),
              ],
            ),

            const SizedBox(height: 80),

            // 🌟 Why Choose Us Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.9),
                    AppColors.primary.withValues(alpha: 0.6),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Why Choose I Power Tech?",
                    style: TextStyles.heading1.copyWith(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 40,
                    runSpacing: 30,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildFeatureCard(
                        icon: Icons.access_time,
                        title: "24/7 Emergency Support",
                        description:
                            "Our dedicated team ensures round-the-clock service.",
                      ),
                      _buildFeatureCard(
                        icon: Icons.verified,
                        title: "Trusted Expertise",
                        description:
                            "Highly trained technicians with years of experience.",
                      ),
                      _buildFeatureCard(
                        icon: Icons.energy_savings_leaf,
                        title: "Eco-Friendly Solutions",
                        description:
                            "Fuel-efficient and sustainable generator systems.",
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyles.heading1.copyWith(
        color: AppColors.primary,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 260,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.4)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: AppColors.primary, size: 42),
            const SizedBox(height: 15),
            Text(
              title,
              style: TextStyles.heading2.copyWith(
                fontSize: 20,
                color: AppColors.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyles.body.copyWith(fontSize: 15, height: 1.5),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.accent, size: 42),
          const SizedBox(height: 15),
          Text(
            title,
            style: TextStyles.heading2.copyWith(
              fontSize: 20,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyles.body.copyWith(
              fontSize: 14,
              color: Colors.white70,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}