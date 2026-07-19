import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          color: const Color(0xFF0E1322).withOpacity(0.5),
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 100),
          child: Column(
            children: [
              // Section Header
              const Text(
                '// about_me()',
                style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 13),
              ),
              const SizedBox(height: 12),
              const Text(
                'About Me',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', color: Colors.white),
              ),
              const SizedBox(height: 16),
              Container(
                width: 60,
                height: 4,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF3DDC84), Color(0xFF8B7CF6)]),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 60),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar Photo Frame (only on Desktop)
                  if (!isMobile)
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: _buildAvatarFrame(),
                      ),
                    ),
                  if (!isMobile) const SizedBox(width: 60),

                  // About Copy Block
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0E1322),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white.withOpacity(0.04)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Full-Stack Mobile Engineer with a Hardware Edge',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            "I'm a B.Tech graduate in Electronics and Communication who now builds high-performance, real-world Android and Flutter apps for a living. As an Android Developer at Pixelstat eSolutions, I've taken 3 commercial applications from first commit to production releases on the Google Play Store—orchestrating BLE integrations, local secure database layers, payment gateways, and backend endpoints.",
                            style: TextStyle(color: Colors.white70, height: 1.6, fontSize: 14),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Earlier, during my research & development internship at S.Charge Pvt. Ltd., I built a Flutter app to configure and diagnose EV charging stations over BLE, analyzing OCPP logs to root-cause complex charging sequences.",
                            style: TextStyle(color: Colors.white70, height: 1.6, fontSize: 14),
                          ),
                          const SizedBox(height: 28),
                          ElevatedButton.icon(
                            onPressed: _launchResume,
                            icon: const Icon(Icons.download),
                            label: const Text('Download My Resume'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3DDC84),
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (isMobile) ...[
                const SizedBox(height: 40),
                _buildAvatarFrame(),
              ],

              const SizedBox(height: 80),
              // Highlights Stats Grid
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: [
                  _statItem(Icons.phone_iphone, '3+', 'Production Apps', 'Taken from first commit to Play Store', const Color(0xFF3DDC84)),
                  _statItem(Icons.bluetooth, 'BLE / IoT', 'Hardware Connected', 'Configure EV chargers over BLE', const Color(0xFF8B7CF6)),
                  _statItem(Icons.layers, 'Clean Arch', 'Modular Scalable', 'BLoC, Repository, local cache cipher', const Color(0xFF3DDC84)),
                  _statItem(Icons.school, 'B.Tech ECE', 'Academic Core', 'Electronics & Communications graduate', const Color(0xFF8B7CF6)),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildAvatarFrame() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(colors: [Color(0xFF3DDC84), Color(0xFF8B7CF6)]),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3DDC84).withOpacity(0.15),
            blurRadius: 24,
            spreadRadius: 2,
          )
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: const CircleAvatar(
        radius: 96,
        backgroundImage: NetworkImage(
          'https://media.licdn.com/dms/image/v2/D5603AQEjuzLWvLHhtg/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1715193306913?e=1755734400&v=beta&t=7gqfT8qFFOmPznlRjzVsLCCMdNOQJrPbW9HO6nSEijQ',
        ),
      ),
    );
  }

  Widget _statItem(IconData icon, String value, String title, String subtitle, Color glowColor) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1322),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: glowColor, size: 28),
          const SizedBox(height: 16),
          Text(value, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'monospace')),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.white30)),
        ],
      ),
    );
  }

  void _launchResume() async {
    const url = 'https://drive.google.com/file/d/11ZugEt3v8U2VN8hcNauJ1UsfkOP1ttdd/view?usp=sharing';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
