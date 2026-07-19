import 'package:flutter/material.dart';
import 'phone_simulator.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onAppsPressed;

  const HeroSection({
    Key? key,
    required this.onContactPressed,
    required this.onAppsPressed,
  }) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 80,
            vertical: isMobile ? 40 : 80,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left copy column
                  Expanded(
                    flex: isMobile ? 1 : 7,
                    child: Column(
                      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                      children: [
                        // Decorative Pill Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3DDC84).withOpacity(0.08),
                            border: Border.all(color: const Color(0xFF3DDC84).withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF3DDC84),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'ANDROID & FLUTTER SPECIALIST',
                                style: TextStyle(
                                  color: Color(0xFF3DDC84),
                                  fontSize: 10,
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'Rushikesh\nPetkar',
                          textAlign: isMobile ? TextAlign.center : TextAlign.left,
                          style: TextStyle(
                            fontSize: isMobile ? 48 : 72,
                            fontWeight: FontWeight.extrabold,
                            height: 0.95,
                            fontFamily: 'Space Grotesk',
                            letterSpacing: -1.5,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'I own the Android app lifecycle end-to-end. Shipped 3 commercial apps directly to the Google Play Store—handling BLE synchronization, biometric authentication, global payment gateways, and high-performance clean architecture.',
                          textAlign: isMobile ? TextAlign.center : TextAlign.left,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: isMobile ? 15 : 18,
                            height: 1.6,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Action Buttons
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: widget.onAppsPressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF3DDC84),
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'View Shipped Apps',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: widget.onContactPressed,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: BorderSide(color: Colors.white.withOpacity(0.15)),
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Get In Touch',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  if (!isMobile) const SizedBox(width: 60),

                  // Right Phone Simulator (Visible on desktop only)
                  if (!isMobile)
                    const Expanded(
                      flex: 5,
                      child: Center(
                        child: PhoneSimulator(),
                      ),
                    ),
                ],
              ),
              if (isMobile) ...[
                const SizedBox(height: 60),
                const PhoneSimulator(),
              ]
            ],
          ),
        );
      },
    );
  }
}
