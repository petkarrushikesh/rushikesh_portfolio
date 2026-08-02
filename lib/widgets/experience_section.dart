import 'package:flutter/material.dart';

class ExperienceTimelineSection extends StatelessWidget {
  const ExperienceTimelineSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: Column(
        children: [
          const Text(
            '// experience_log()',
            style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 13),
          ),
          const SizedBox(height: 12),
          const Text(
            'Where I\'ve Worked',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', color: Colors.white),
          ),
          const SizedBox(height: 16),
          Container(
            width: 60,
            height: 4,
            decoration: const BoxDecoration(
              color: Color(0xFF3DDC84),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
          const SizedBox(height: 60),

          // Timeline Node Stack
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                _buildTimelineNode(
                  role: 'Android Developer',
                  company: 'Pixelstat eSolutions',
                  location: 'Hyderabad, India',
                  duration: 'Jan 2026 — Present',
                  isCurrent: true,
                  duties: [
                      'Owned the complete Flutter application lifecycle—from architecture and feature development to testing, debugging, deployment, and Google Play Store releases.'
                      'Successfully shipped and maintained 3 production mobile applications, integrating Provider state management, RESTful APIs, Firebase Authentication, Cloud Firestore, BLE communication, and Razorpay payment gateway.'

                  ],
                ),
                _buildTimelineNode(
                  role: 'Project Trainee — R&D',
                  company: 'S.Charge Pvt. Ltd.',
                  location: 'India',
                  duration: 'Dec 2024 — Jun 2025',
                  isCurrent: false,
                  duties: [
                    'Designed and compiled an internal BLE-based EV charging station configuration utility in Flutter, drastically accelerating technician debugging pipelines.',
                    'Contributed critical UI components and core service bugfixes to the flagship consumer-facing S.Charge EV mobile network app.',
                    'Maintained and audited diagnostic sessions, parsing OCPP (Open Charge Point Protocol) transaction logs to isolate client-server handshake conflicts.',
                    'Performed physical, safety-critical charger validation testing—verifying insulation integrity, magnetic interference tolerances, and grid voltage dips.'
                  ],
                  isLast: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimelineNode({
    required String role,
    required String company,
    required String location,
    required String duration,
    required bool isCurrent,
    required List<String> duties,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Line Timeline marker
        Column(
          children: [
            Container(
              width: 14,
              height: 14,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCurrent ? const Color(0xFF3DDC84) : Colors.grey[700],
                border: Border.all(color: const Color(0xFF0A0E17), width: 3),
                boxShadow: isCurrent
                    ? [
                        BoxShadow(
                          color: const Color(0xFF3DDC84).withOpacity(0.4),
                          blurRadius: 8,
                          spreadRadius: 2,
                        )
                      ]
                    : null,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 200, // Fixed height to avoid IntrinsicHeight layout issues
                color: Colors.white12,
              ),
          ],
        ),
        const SizedBox(width: 24),
        // Content block
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(role, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                    if (isCurrent) ...[
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3DDC84).withOpacity(0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF3DDC84).withOpacity(0.25)),
                        ),
                        child: const Text('CURRENT', style: TextStyle(color: Color(0xFF3DDC84), fontSize: 9, fontWeight: FontWeight.bold)),
                      )
                    ]
                  ],
                ),
                const SizedBox(height: 6),
                Text('$company • $location • $duration', style: const TextStyle(color: Color(0xFF8B7CF6), fontSize: 13, fontFamily: 'monospace')),
                const SizedBox(height: 16),
                ...duties.map((duty) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(color: Color(0xFF3DDC84), fontWeight: FontWeight.bold)),
                      Expanded(child: Text(duty, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.5))),
                    ],
                  ),
                )).toList()
              ],
            ),
          ),
        )
      ],
    );
  }
}
