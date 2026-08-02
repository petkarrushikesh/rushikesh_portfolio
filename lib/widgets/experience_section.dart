// import 'package:flutter/material.dart';

// class ExperienceTimelineSection extends StatelessWidget {
//   const ExperienceTimelineSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
//       child: Column(
//         children: [
//           const Text(
//             '// experience_log()',
//             style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 13),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Where I\'ve Worked',
//             style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', color: Colors.white),
//           ),
//           const SizedBox(height: 16),
//           Container(
//             width: 60,
//             height: 4,
//             decoration: const BoxDecoration(
//               color: Color(0xFF3DDC84),
//               borderRadius: BorderRadius.all(Radius.circular(2)),
//             ),
//           ),
//           const SizedBox(height: 60),

//           // Timeline Node Stack
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 800),
//             child: Column(
//               children: [
//                 _buildTimelineNode(
//                   role: 'Android Developer',
//                   company: 'Pixelstat eSolutions',
//                   location: 'Hyderabad, India',
//                   duration: 'Jan 2026 — Present',
//                   isCurrent: true,
//                   duties: [
//                       'Owned the complete Flutter application lifecycle—from architecture and feature development to testing, debugging, deployment, and Google Play Store releases.'
//                       'Successfully shipped and maintained 3 production mobile applications, integrating Provider state management, RESTful APIs, Firebase Authentication, Cloud Firestore, BLE communication, and Razorpay payment gateway.'

//                   ],
//                 ),
//                 _buildTimelineNode(
//                   role: 'Project Trainee — R&D',
//                   company: 'S.Charge Pvt. Ltd.',
//                   location: 'India',
//                   duration: 'Dec 2024 — Jun 2025',
//                   isCurrent: false,
//                   duties: [
//                     'Designed and compiled an internal BLE-based EV charging station configuration utility in Flutter, drastically accelerating technician debugging pipelines.',
//                     'Contributed critical UI components and core service bugfixes to the flagship consumer-facing S.Charge EV mobile network app.',
//                     'Maintained and audited diagnostic sessions, parsing OCPP (Open Charge Point Protocol) transaction logs to isolate client-server handshake conflicts.',
//                     'Performed physical, safety-critical charger validation testing—verifying insulation integrity, magnetic interference tolerances, and grid voltage dips.'
//                   ],
//                   isLast: true,
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildTimelineNode({
//     required String role,
//     required String company,
//     required String location,
//     required String duration,
//     required bool isCurrent,
//     required List<String> duties,
//     bool isLast = false,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Left Line Timeline marker
//         Column(
//           children: [
//             Container(
//               width: 14,
//               height: 14,
//               margin: const EdgeInsets.only(top: 4),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: isCurrent ? const Color(0xFF3DDC84) : Colors.grey[700],
//                 border: Border.all(color: const Color(0xFF0A0E17), width: 3),
//                 boxShadow: isCurrent
//                     ? [
//                         BoxShadow(
//                           color: const Color(0xFF3DDC84).withOpacity(0.4),
//                           blurRadius: 8,
//                           spreadRadius: 2,
//                         )
//                       ]
//                     : null,
//               ),
//             ),
//             if (!isLast)
//               Container(
//                 width: 2,
//                 height: 200, // Fixed height to avoid IntrinsicHeight layout issues
//                 color: Colors.white12,
//               ),
//           ],
//         ),
//         const SizedBox(width: 24),
//         // Content block
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 40),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(role, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//                     ),
//                     if (isCurrent) ...[
//                       const SizedBox(width: 12),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF3DDC84).withOpacity(0.12),
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: const Color(0xFF3DDC84).withOpacity(0.25)),
//                         ),
//                         child: const Text('CURRENT', style: TextStyle(color: Color(0xFF3DDC84), fontSize: 9, fontWeight: FontWeight.bold)),
//                       )
//                     ]
//                   ],
//                 ),
//                 const SizedBox(height: 6),
//                 Text('$company • $location • $duration', style: const TextStyle(color: Color(0xFF8B7CF6), fontSize: 13, fontFamily: 'monospace')),
//                 const SizedBox(height: 16),
//                 ...duties.map((duty) => Padding(
//                   padding: const EdgeInsets.only(bottom: 8.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text('• ', style: TextStyle(color: Color(0xFF3DDC84), fontWeight: FontWeight.bold)),
//                       Expanded(child: Text(duty, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.5))),
//                     ],
//                   ),
//                 )).toList()
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// lib/widgets/experience_section.dart
//
// Self-contained: does not import app_theme.dart or fade_in_on_scroll.dart,
// so it compiles even if those files aren't present in the project.
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// --- Local color palette (mirrors the rest of the site: Android green + violet) ---
class _Colors {
  static const Color background = Color(0xFF0A0E17);
  static const Color surface = Color(0xFF131A29);
  static const Color surfaceElevated = Color(0xFF1B2436);
  static const Color border = Color(0x1FFFFFFF);
  static const Color androidGreen = Color(0xFF3DDC84);
  static const Color violet = Color(0xFF8B7CF6);
  static const Color amber = Color(0xFFFFB84D);
  static const Color textSecondary = Color(0xB3FFFFFF);
  static const Color textMuted = Color(0x66FFFFFF);

  static const LinearGradient signatureGradient = LinearGradient(
    colors: [androidGreen, violet],
  );
  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [surfaceElevated, surface],
  );
}

// --- Simple fade+slide-in on first build (no visibility_detector needed) ---
class _FadeIn extends StatefulWidget {
  final Widget child;
  const _FadeIn({required this.child});

  @override
  State<_FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<_FadeIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curved = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    return FadeTransition(
      opacity: curved,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero)
            .animate(curved),
        child: widget.child,
      ),
    );
  }
}

// --- Small "code comment" section header, matching the rest of the site ---
class _SectionHeader extends StatelessWidget {
  final String eyebrow;
  final String title;
  const _SectionHeader({required this.eyebrow, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          eyebrow,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: _Colors.androidGreen,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 14),
        Container(
          height: 3,
          width: 56,
          decoration: BoxDecoration(
            gradient: _Colors.signatureGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

// --- An app shipped during a role, shown as a Play-Store-style tile ---
class AppShowcase {
  final String name;
  final String description;
  final String status; // e.g. 'Live on Play Store' or 'In Testing'
  final bool isLive;
  final String? url;
  final IconData icon;

  const AppShowcase({
    required this.name,
    required this.description,
    required this.status,
    required this.isLive,
    required this.icon,
    this.url,
  });
}

// --- DATA MODEL FOR AN EXPERIENCE ---
class Experience {
  final String role;
  final String company;
  final String location;
  final String duration;
  final bool current;
  final List<String> duties;
  final List<AppShowcase>? apps;

  const Experience({
    required this.role,
    required this.company,
    required this.location,
    required this.duration,
    this.current = false,
    required this.duties,
    this.apps,
  });
}

// Exposed so other widgets (e.g. a phone simulator) can reuse the same data.
const List<AppShowcase> pixelstatApps = [
  AppShowcase(
    name: 'LearningEcke',
    description:
        'Subscription-based e-book & learning app. Users subscribe via Razorpay, read books served from a Django backend, take quizzes, and get subscription + auth handled through Firebase.',
    status: 'In Testing',
    isLive: false,
    icon: Icons.menu_book_rounded,
  ),
  AppShowcase(
    name: 'Infierms',
    description: 'Employee attendance and workforce management system for organizations.',
    status: 'Live on Play Store',
    isLive: true,
    icon: Icons.fingerprint_rounded,
    url: 'https://play.google.com/store/apps/details?id=com.pixelstat.erms&pcampaignid=web_share',
  ),
  AppShowcase(
    name: 'Eda Wallet',
    description: 'Digital wallet that tracks income and expenditure for individuals, groups and companies.',
    status: 'Live on Play Store',
    isLive: true,
    icon: Icons.account_balance_wallet_rounded,
    url: 'https://play.google.com/store/apps/details?id=com.pixelstat.edawallet&pcampaignid=web_share',
  ),
  AppShowcase(
    name: 'ABMCM',
    description:
        'Employee management app built for ABMCM Maharashtra — attendance tracking, leave management, and staff profiles in one platform.',
    status: 'Live on Play Store',
    isLive: true,
    icon: Icons.badge_rounded,
    url: 'https://play.google.com/store/apps/details?id=com.pixelstat.abmcm&pcampaignid=web_share',
  ),
];

// --- MAIN SECTION WIDGET ---
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  List<Experience> get experiences => [
        Experience(
          role: 'Android Developer',
          company: 'Pixelstat eSolutions',
          location: 'Hyderabad, India',
          duration: 'Jan 2026 — Present',
          current: true,
          duties: const [
            'Own the Android app lifecycle end-to-end — architecture, development, testing and Play Store releases.',
            'Shipped and maintain 4 production apps, working across BLoC/Provider, REST APIs, Firebase and third-party payment integrations.',
          ],
          apps: pixelstatApps,
        ),
        const Experience(
          role: 'Project Trainee — R&D',
          company: 'S.Charge Pvt. Ltd.',
          location: 'India',
          duration: 'Dec 2024 — Jun 2025',
          duties: [
            'Developed a BLE-based EV charger configuration app for internal testing.',
            'Contributed to feature development and bug fixing in the S.Charge mobile app.',
            'Analyzed OCPP server logs to identify charger and app issues.',
            'Performed key EV charger tests: insulation resistance, voltage dips, and magnetic field.',
          ],
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _Colors.surface.withOpacity(0.4),
      padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 24.0),
      child: Column(
        children: [
          const _SectionHeader(
            eyebrow: '// experience.log()',
            title: 'Where I\'ve Worked',
          ),
          const SizedBox(height: 56),
          _FadeIn(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: experiences.length,
                separatorBuilder: (context, index) => const SizedBox(height: 48),
                itemBuilder: (context, index) {
                  return ExperienceCard(
                    experience: experiences[index],
                    isLast: index == experiences.length - 1,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- CARD WIDGET FOR EACH EXPERIENCE, WITH A TIMELINE RAIL ---
class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.experience, required this.isLast});

  final Experience experience;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: experience.current ? _Colors.androidGreen : _Colors.surfaceElevated,
                  border: Border.all(color: _Colors.androidGreen, width: 2),
                  boxShadow: experience.current
                      ? [
                          BoxShadow(
                            color: _Colors.androidGreen.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ]
                      : null,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    color: _Colors.border,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: _Colors.cardGradient,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _Colors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          experience.role,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        if (experience.current)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: _Colors.androidGreen.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: _Colors.androidGreen.withOpacity(0.4)),
                            ),
                            child: const Text(
                              'CURRENT',
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.4,
                                color: _Colors.androidGreen,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${experience.company} · ${experience.location}',
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                        color: _Colors.violet,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      experience.duration,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12.5,
                        color: _Colors.textMuted,
                      ),
                    ),
                    const SizedBox(height: 18),
                    ...experience.duties.map(
                      (duty) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 7),
                              child: Icon(Icons.circle, size: 5, color: _Colors.androidGreen),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                duty,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.6,
                                  color: _Colors.textSecondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (experience.apps != null) ...[
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: experience.apps!.map((app) => AppShowcaseCard(app: app)).toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- MINI "PLAY STORE LISTING" CARD FOR A SHIPPED APP ---
class AppShowcaseCard extends StatelessWidget {
  const AppShowcaseCard({super.key, required this.app});
  final AppShowcase app;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: app.url != null
          ? () => launchUrl(Uri.parse(app.url!), mode: LaunchMode.externalApplication)
          : null,
      child: Container(
        width: 260,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _Colors.background.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: _Colors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    gradient: _Colors.signatureGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(app.icon, color: Colors.black, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        app.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            app.isLive ? Icons.check_circle : Icons.science_rounded,
                            size: 12,
                            color: app.isLive ? _Colors.androidGreen : _Colors.amber,
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              app.status,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'monospace',
                                fontSize: 11,
                                color: app.isLive ? _Colors.androidGreen : _Colors.amber,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (app.url != null)
                  const Icon(Icons.arrow_outward_rounded, size: 16, color: _Colors.textMuted),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              app.description,
              style: const TextStyle(fontSize: 13.5, height: 1.5, color: _Colors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
