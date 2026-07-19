// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class ProjectsShowcaseSection extends StatefulWidget {
//   const ProjectsShowcaseSection({Key? key}) : super(key: key);
//
//   @override
//   State<ProjectsShowcaseSection> createState() => _ProjectsShowcaseSectionState();
// }
//
// class _ProjectsShowcaseSectionState extends State<ProjectsShowcaseSection> {
//   String _currentFilter = 'All';
//
//   final List<ProjectCardData> _projects = [
//     ProjectCardData(
//       title: 'Infierms v2.4',
//       subtitle: 'Commercial Employee Shift & Attendance Engine',
//       category: 'Commercial',
//       description: 'Lead mobile app shipped to production, used daily by corporate teams for geofenced shift logging, biometric attendance checks, and offline log caching.',
//       techStack: ['Android SDK', 'Kotlin', 'BLoC', 'Biometrics', 'Room SQLite Cipher', 'Retrofit API'],
//       playStoreUrl: 'https://play.google.com/store/apps/details?id=com.pixelstat.erms&pcampaignid=web_share&pli=1',
//       isCommercial: true,
//     ),
//     ProjectCardData(
//       title: 'Eda Wallet',
//       subtitle: 'Multi-Signature Expense Sharing Crypt',
//       category: 'Fintech',
//       description: 'Fully decentralized ledger app allowing multiple trustees to authorize transaction drafts, split bills with OCR receipt parsing, and run secure group expenses ledger pools.',
//       techStack: ['Flutter', 'Dart', 'Provider', 'Dio API', 'Hive NoSQL', 'Razorpay Gateway'],
//       gitUrl: 'https://play.google.com/store/apps/details?id=com.pixelstat.edawallet&pcampaignid=web_share',
//       isCommercial: true,
//     ),
//     ProjectCardData(
//       title: 'LearningEcke',
//       subtitle: 'Flutter tutorials & BLE diagnostic workspace',
//       category: 'Tools',
//       description: 'Open source companion portal packed with educational guides, RxDart streams debugging exercises, and direct UART BLE profile diagnostics for EV charger telemetry.',
//       techStack: ['Flutter', 'BLE Core', 'RxDart', 'OCPP Telemetry', 'SQLite', 'Streams'],
//       gitUrl: 'https://github.com/petkarrushikesh/learning_ecke',
//       isCommercial: false,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final filtered = _projects.where((p) => _currentFilter == 'All' || p.category == _currentFilter).toList();
//
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final bool isMobile = constraints.maxWidth < 900;
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 100),
//           child: Column(
//             children: [
//               const Text(
//                 '// production_builds()',
//                 style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 13),
//               ),
//               const SizedBox(height: 12),
//               const Text(
//                 'Featured Shipped Apps',
//                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', color: Colors.white),
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 width: 60,
//                 height: 4,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFF3DDC84),
//                   borderRadius: BorderRadius.all(Radius.circular(2)),
//                 ),
//               ),
//               const SizedBox(height: 40),
//
//               // Filter Tabs
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: ['All', 'Commercial', 'Fintech', 'Tools'].map((filter) {
//                   final bool active = _currentFilter == filter;
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 4),
//                     child: ChoiceChip(
//                       label: Text(filter),
//                       selected: active,
//                       onSelected: (val) {
//                         if (val) {
//                           setState(() {
//                             _currentFilter = filter;
//                           });
//                         }
//                       },
//                       selectedColor: const Color(0xFF3DDC84).withOpacity(0.2),
//                       backgroundColor: Colors.transparent,
//                       checkmarkColor: const Color(0xFF3DDC84),
//                       labelStyle: TextStyle(
//                         color: active ? const Color(0xFF3DDC84) : Colors.white60,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                       side: BorderSide(color: active ? const Color(0xFF3DDC84).withOpacity(0.4) : Colors.white10),
//                     ),
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(height: 60),
//
//               // Cards Layout Grid
//               Wrap(
//                 spacing: 24,
//                 runSpacing: 24,
//                 alignment: WrapAlignment.center,
//                 children: filtered.map((project) => _buildProjectCard(project, isMobile)).toList(),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildProjectCard(ProjectCardData project, bool isMobile) {
//     return Container(
//       width: isMobile ? double.infinity : 420,
//       padding: const EdgeInsets.all(28),
//       decoration: BoxDecoration(
//         color: const Color(0xFF0E1322),
//         borderRadius: BorderRadius.circular(24),
//         border: Border.all(color: Colors.white.withOpacity(0.04)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           )
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Row Header with icon badge
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: project.isCommercial
//                       ? const Color(0xFF3DDC84).withOpacity(0.08)
//                       : const Color(0xFF8B7CF6).withOpacity(0.08),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(
//                     color: project.isCommercial
//                         ? const Color(0xFF3DDC84).withOpacity(0.2)
//                         : const Color(0xFF8B7CF6).withOpacity(0.2),
//                   ),
//                 ),
//                 child: Text(
//                   project.category.toUpperCase(),
//                   style: TextStyle(
//                     color: project.isCommercial ? const Color(0xFF3DDC84) : const Color(0xFF8B7CF6),
//                     fontSize: 9,
//                     fontFamily: 'monospace',
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   if (project.gitUrl != null)
//                     IconButton(
//                       icon: const Icon(Icons.code, size: 18, color: Colors.white54),
//                       onPressed: () => _launchURL(project.gitUrl!),
//                       tooltip: 'View Source Code',
//                     ),
//                   if (project.playStoreUrl != null)
//                     IconButton(
//                       icon: const Icon(Icons.shop_two, size: 18, color: Color(0xFF3DDC84)),
//                       onPressed: () => _launchURL(project.playStoreUrl!),
//                       tooltip: 'Google Play Store',
//                     ),
//                 ],
//               )
//             ],
//           ),
//           const SizedBox(height: 18),
//           Text(
//             project.title,
//             style: const TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Space Grotesk',
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             project.subtitle,
//             style: TextStyle(
//               fontSize: 12,
//               color: const Color(0xFF8B7CF6).withOpacity(0.8),
//               fontFamily: 'monospace',
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             project.description,
//             style: const TextStyle(
//               fontSize: 13.5,
//               color: Colors.white70,
//               height: 1.5,
//             ),
//           ),
//           const SizedBox(height: 24),
//           // Tech tag cloud
//           Wrap(
//             spacing: 6,
//             runSpacing: 6,
//             children: project.techStack.map((tag) {
//               return Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.3),
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.white.withOpacity(0.04)),
//                 ),
//                 child: Text(
//                   tag,
//                   style: const TextStyle(fontSize: 10.5, fontFamily: 'monospace', color: Colors.white54),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _launchURL(String url) async {
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     }
//   }
// }
//
// class ProjectCardData {
//   final String title;
//   final String subtitle;
//   final String category;
//   final String description;
//   final List<String> techStack;
//   final String? playStoreUrl;
//   final String? gitUrl;
//   final bool isCommercial;
//
//   ProjectCardData({
//     required this.title,
//     required this.subtitle,
//     required this.category,
//     required this.description,
//     required this.techStack,
//     this.playStoreUrl,
//     this.gitUrl,
//     required this.isCommercial,
//   });
// }


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsShowcaseSection extends StatefulWidget {
  const ProjectsShowcaseSection({Key? key}) : super(key: key);

  @override
  State<ProjectsShowcaseSection> createState() => _ProjectsShowcaseSectionState();
}

class _ProjectsShowcaseSectionState extends State<ProjectsShowcaseSection> {
  String _currentFilter = 'All';

  final List<ProjectData> _projects = [
    ProjectData(
      title: 'Infierms v2.4',
      subtitle: 'Commercial Employee Shift & Attendance Engine',
      category: 'Commercial',
      description: 'Lead mobile app shipped to production, used daily by corporate teams for geofenced shift logging, biometric attendance checks, and offline log caching.',
      tags: ['Android SDK', 'Flutter', 'Webview', 'Sharfedprefrence auth', 'FCM(Firebase Cloud Messaging)', 'Logout'],
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.pixelstat.erms&pcampaignid=web_share&pli=1',
      isCommercial: true,
    ),
    ProjectData(
      title: 'Eda Wallet',
      subtitle: 'Application with store Company Data.',
      category: 'Fintech',
      description: 'It manages expenses and income of users and company that allowing multiple trustees to authorize transaction drafts, split bills with OCR receipt parsing, and run secure group expenses and downloads bills.',
      tags: ['Flutter', 'Dart', 'Flutter_inappwebview', 'Sharedpreferences', 'Python', 'Firebase Cloud Messaging'],
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.pixelstat.edawallet&pcampaignid=web_share',
      isCommercial: true,
    ),
    ProjectData(
      title: 'LearningEcke',
      subtitle: 'Books application with Quizzes and Subscription',
      category: 'Tools',
      description: 'Created a English Learning, Grammar Books Applications with Quizzes of different sections also added Razorpay subscription features.',
      tags: ['Flutter', 'Webview', 'Razorpay', 'Webhook', 'Django Api', 'SQLite', 'Firebase Auth'],
      gitUrl: 'https://play.google.com/apps/internaltest/4701364296673681446',
      isCommercial: false,
    ),
    ProjectData(
      title: 'Multipurpose Agribot',
      category: 'IoT & Robotics',
      description: 'An advanced IoT-powered solar agribot designed for automated smart irrigation and field monitoring. Integrated sensor arrays communicate telemetry data dynamically to coordinate agricultural activities.',
      tags: ['IoT & Robotics', 'Hardware Integration', 'Solar Power'],
      mediaUrl: 'https://www.youtube.com/watch?v=ySlZIa4Xd5g',
      gitUrl: 'https://github.com/petkarrushikesh',
      isCommercial: false,
    ),
    ProjectData(
      title: 'Weather Sync App',
      category: 'Mobile API',
      description: 'A responsive mobile application delivering real-time geo-located climate dashboards. Integrated third-party REST Weather APIs with robust local device caching state sheets.',
      tags: ['Mobile API', 'Flutter', 'State Caching'],
      mediaUrl: 'https://youtu.be/7EjgHbQNEvg?si=GcPXfCPQczmPWnQs',
      gitUrl: 'https://github.com/petkarrushikesh/flutter_weather_api',
      isCommercial: false,
    ),
    ProjectData(
      title: 'Life on Land (SDG 15)',
      category: 'Flutter',
      description: 'Award-entry for the prestigious Google Developer Student Clubs Solution Challenge 2024. Designed around UN Sustainable Development Goals (SDG-15) to track and protect terrestrial biodiversity.',
      tags: ['Google Challenge', 'Flutter', 'UI Design'],
      mediaUrl: 'https://www.youtube.com/watch?v=5jPrpNcQNhg',
      gitUrl: 'https://github.com/petkarrushikesh/SDG1_15',
      isCommercial: false,
    ),
    ProjectData(
      title: 'EV Charger App',
      category: 'IoT & Robotics',
      description: 'Created EV Charger Configuration app for testing purpose of EV Chargers and added Resume Start Features..',
      tags: ['Firebase', 'Rest API', 'Authentication','Bluetooth Communication '],
      mediaUrl: 'https://youtu.be/sEMdpu_hcc8',
      gitUrl: 'https://github.com/petkarrushikesh/chatapp',
      isCommercial: false,
    ),
    ProjectData(
      title: 'Dynamic Event Manager',
      category: 'Tools',
      description: 'Interactive social scheduler parsing structured JSON catalogs. Features custom-built profile editors, search filters, and smooth cross-axis list animations.',
      tags: ['JSON Parsing', 'UI Layouts', 'State Persistence'],
      mediaUrl: 'https://drive.google.com/file/d/1DeuBSnVsQ4d6STaf_MAKOLBaUEwzvmrr/view',
      gitUrl: 'https://drive.google.com/file/d/1nEiAv5KZrBtoFb7tXgwQD4PaMLMoLgJj/view?usp=sharing',
      isCommercial: false,
    ),
  ];

  final List<String> _filters = [
    'All', 'Commercial', 'Fintech', 'Tools', 'IoT & Robotics', 'Firebase', 'Mobile API', 'Flutter',
  ];

  String? _getYouTubeId(String url) {
    final RegExp regExp = RegExp(
      r'^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*',
    );
    final match = regExp.firstMatch(url);
    if (match != null && match.groupCount >= 2) {
      final id = match.group(2);
      if (id != null && id.length == 11) {
        return id;
      }
    }
    return null;
  }

  void _handleMediaClick(ProjectData project) {
    final ytId = _getYouTubeId(project.mediaUrl ?? '');
    if (ytId != null) {
      _showCinematicVideoModal(project, ytId);
    } else if (project.mediaUrl != null) {
      _launchURL(project.mediaUrl!);
    }
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showCinematicVideoModal(ProjectData project, String ytId) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      builder: (BuildContext context) {
        return CinematicVideoModal(project: project, youtubeId: ytId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _projects.where((p) {
      if (_currentFilter == 'All') return true;
      return p.category == _currentFilter || p.tags.contains(_currentFilter);
    }).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 100),
          child: Column(
            children: [
              const Text(
                '// production_builds()',
                style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 13),
              ),
              const SizedBox(height: 12),
              const Text(
                'Projects & Shipped Apps',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', color: Colors.white),
              ),
              const SizedBox(height: 16),
              Container(
                width: 60,
                height: 4,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xFF3DDC84), Color(0xFF8B7CF6)]),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              const SizedBox(height: 40),

              // Filter Tabs
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: _filters.map((filter) {
                  final bool active = _currentFilter == filter;
                  return ChoiceChip(
                    label: Text(filter),
                    selected: active,
                    onSelected: (val) {
                      if (val) {
                        setState(() {
                          _currentFilter = filter;
                        });
                      }
                    },
                    selectedColor: const Color(0xFF3DDC84).withOpacity(0.15),
                    backgroundColor: Colors.transparent,
                    checkmarkColor: const Color(0xFF3DDC84),
                    labelStyle: TextStyle(
                      color: active ? const Color(0xFF3DDC84) : Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: 'monospace',
                    ),
                    side: BorderSide(color: active ? const Color(0xFF3DDC84).withOpacity(0.4) : Colors.white10),
                  );
                }).toList(),
              ),
              const SizedBox(height: 60),

              // Cards Layout Grid
              Wrap(
                spacing: 24,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                children: filtered.map((project) => _buildProjectCard(project, isMobile)).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectCard(ProjectData project, bool isMobile) {
    final ytId = _getYouTubeId(project.mediaUrl ?? '');
    final bool hasMedia = project.mediaUrl != null;
    final Color accent = project.isCommercial ? const Color(0xFF3DDC84) : const Color(0xFF8B7CF6);

    return Container(
      width: isMobile ? double.infinity : 380,
      decoration: BoxDecoration(
        color: const Color(0xFF0E1322),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Media preview header (only for projects with a demo/resource link)
          if (hasMedia)
            GestureDetector(
              onTap: () => _handleMediaClick(project),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        ytId != null
                            ? 'https://img.youtube.com/vi/$ytId/hqdefault.jpg'
                            : 'https://images.unsplash.com/photo-1618761714954-0b8cd0026e5d?auto=format&fit=crop&w=600&q=80',
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 160,
                          color: Colors.black38,
                          child: const Icon(Icons.broken_image, color: Colors.white24),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(color: Colors.black.withOpacity(0.35)),
                      ),
                      Center(
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white12),
                          ),
                          child: Icon(
                            ytId != null ? Icons.play_arrow_rounded : Icons.open_in_new_rounded,
                            color: const Color(0xFF3DDC84),
                            size: 24,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: _categoryBadge(project.category, accent),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badge + quick action icons row (for cards without a media header)
                if (!hasMedia)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _categoryBadge(project.category, accent),
                      Row(
                        children: [
                          if (project.gitUrl != null)
                            IconButton(
                              icon: const Icon(Icons.code, size: 18, color: Colors.white54),
                              onPressed: () => _launchURL(project.gitUrl!),
                              tooltip: 'View Source Code',
                            ),
                          if (project.playStoreUrl != null)
                            IconButton(
                              icon: const Icon(Icons.shop_two, size: 18, color: Color(0xFF3DDC84)),
                              onPressed: () => _launchURL(project.playStoreUrl!),
                              tooltip: 'Google Play Store',
                            ),
                        ],
                      ),
                    ],
                  ),
                if (!hasMedia) const SizedBox(height: 18),

                Text(
                  project.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Space Grotesk',
                    color: Colors.white,
                  ),
                ),
                if (project.subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    project.subtitle!,
                    style: const TextStyle(fontSize: 12, color: Color(0xFFB8ACF9), fontFamily: 'monospace'),
                  ),
                ],
                const SizedBox(height: 14),
                Text(
                  project.description,
                  maxLines: hasMedia ? 4 : null,
                  overflow: hasMedia ? TextOverflow.ellipsis : null,
                  style: const TextStyle(fontSize: 13, color: Colors.white70, height: 1.5),
                ),
                const SizedBox(height: 20),

                // Tag cloud
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white.withOpacity(0.04)),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(fontSize: 10.5, fontFamily: 'monospace', color: Colors.white54),
                      ),
                    );
                  }).toList(),
                ),

                // Bottom action row for media/source (only shown when it adds something new)
                if (hasMedia || (project.gitUrl != null && !hasMedia == false)) ...[
                  const Divider(color: Colors.white10, height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (hasMedia)
                        TextButton.icon(
                          onPressed: () => _handleMediaClick(project),
                          icon: Icon(
                            ytId != null ? Icons.play_circle_outline : Icons.insert_drive_file_outlined,
                            size: 14,
                            color: const Color(0xFF3DDC84),
                          ),
                          label: Text(
                            ytId != null ? 'Watch Demo' : 'View File',
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, fontFamily: 'monospace', color: Color(0xFF3DDC84)),
                          ),
                        )
                      else
                        const SizedBox.shrink(),
                      if (project.gitUrl != null)
                        TextButton.icon(
                          onPressed: () => _launchURL(project.gitUrl!),
                          icon: const Icon(Icons.code, size: 14, color: Colors.white38),
                          label: const Text('Source', style: TextStyle(fontSize: 11, fontFamily: 'monospace', color: Colors.white38)),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryBadge(String category, Color accent) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: accent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accent.withOpacity(0.25)),
      ),
      child: Text(
        category.toUpperCase(),
        style: TextStyle(color: accent, fontSize: 9, fontFamily: 'monospace', fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProjectData {
  final String title;
  final String? subtitle;
  final String category;
  final String description;
  final List<String> tags;
  final String? playStoreUrl;
  final String? gitUrl;
  final String? mediaUrl;
  final bool isCommercial;

  ProjectData({
    required this.title,
    this.subtitle,
    required this.category,
    required this.description,
    required this.tags,
    this.playStoreUrl,
    this.gitUrl,
    this.mediaUrl,
    required this.isCommercial,
  });
}

// Cinematic video player modal (moved here from featured_projects_section.dart)
class CinematicVideoModal extends StatefulWidget {
  final ProjectData project;
  final String youtubeId;

  const CinematicVideoModal({
    Key? key,
    required this.project,
    required this.youtubeId,
  }) : super(key: key);

  @override
  State<CinematicVideoModal> createState() => _CinematicVideoModalState();
}

class _CinematicVideoModalState extends State<CinematicVideoModal> with TickerProviderStateMixin {
  late AnimationController _soundWaveController;
  bool _isPlaying = true;
  double _playbackProgress = 0.35;

  @override
  void initState() {
    super.initState();
    _soundWaveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _soundWaveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800),
        decoration: BoxDecoration(
          color: const Color(0xFF070A13),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white12, width: 1),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 40, spreadRadius: 5),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.black26,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CINEMATIC LAB PLAYER',
                            style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.project.title,
                            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white54),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.black,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        'https://img.youtube.com/vi/${widget.youtubeId}/hqdefault.jpg',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        child: Container(color: Colors.black.withOpacity(_isPlaying ? 0.45 : 0.75)),
                      ),
                      if (!_isPlaying)
                        GestureDetector(
                          onTap: () => setState(() => _isPlaying = true),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF3DDC84).withOpacity(0.12),
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFF3DDC84).withOpacity(0.5), width: 2),
                            ),
                            child: const Icon(Icons.play_arrow_rounded, color: Color(0xFF3DDC84), size: 48),
                          ),
                        ),
                      if (_isPlaying)
                        Positioned(
                          top: 20,
                          right: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'STREAMING DEMO',
                                  style: TextStyle(fontSize: 8, color: Color(0xFF3DDC84), fontFamily: 'monospace', fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                _buildSoundWaveBars(),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: const Color(0xFF0C0F19),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('01:14', style: TextStyle(color: Colors.white30, fontSize: 10, fontFamily: 'monospace')),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: const Color(0xFF3DDC84),
                              inactiveTrackColor: Colors.white10,
                              thumbColor: const Color(0xFF3DDC84),
                              overlayColor: const Color(0xFF3DDC84).withOpacity(0.12),
                              trackHeight: 3,
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                            ),
                            child: Slider(
                              value: _playbackProgress,
                              onChanged: (val) => setState(() => _playbackProgress = val),
                            ),
                          ),
                        ),
                        const Text('03:45', style: TextStyle(color: Colors.white30, fontSize: 10, fontFamily: 'monospace')),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(_isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded, color: const Color(0xFF3DDC84)),
                              onPressed: () => setState(() => _isPlaying = !_isPlaying),
                            ),
                            IconButton(
                              icon: const Icon(Icons.replay_10_rounded, color: Colors.white54),
                              onPressed: () => setState(() => _playbackProgress = (_playbackProgress - 0.05).clamp(0.0, 1.0)),
                            ),
                            IconButton(
                              icon: const Icon(Icons.forward_10_rounded, color: Colors.white54),
                              onPressed: () => setState(() => _playbackProgress = (_playbackProgress + 0.05).clamp(0.0, 1.0)),
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            final uri = Uri.parse('https://www.youtube.com/watch?v=${widget.youtubeId}');
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri, mode: LaunchMode.externalApplication);
                            }
                          },
                          icon: const Icon(Icons.open_in_new_rounded, size: 14),
                          label: const Text('Open Direct YouTube Player'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF3DDC84),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSoundWaveBars() {
    return AnimatedBuilder(
      animation: _soundWaveController,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(4, (index) {
            double heightFactor;
            switch (index) {
              case 0:
                heightFactor = 0.3 + 0.7 * _soundWaveController.value;
                break;
              case 1:
                heightFactor = 0.1 + 0.9 * (1.0 - _soundWaveController.value);
                break;
              case 2:
                heightFactor = 0.5 + 0.5 * _soundWaveController.value;
                break;
              default:
                heightFactor = 0.2 + 0.8 * (1.0 - _soundWaveController.value);
                break;
            }
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              width: 2,
              height: 12 * heightFactor,
              color: const Color(0xFF3DDC84),
            );
          }),
        );
      },
    );
  }
}
