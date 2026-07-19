// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'package:url_launcher/url_launcher.dart';
//
// void main() {
//   runApp(const RushikeshPortfolioApp());
// }
//
// class RushikeshPortfolioApp extends StatelessWidget {
//   const RushikeshPortfolioApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rushikesh Petkar | Android & Flutter Developer',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         scaffoldBackgroundColor: const Color(0xFF0A0E17),
//         fontFamily: 'Inter',
//         colorScheme: const ColorScheme.dark(
//           primary: Color(0xFF3DDC84), // Android Green
//           secondary: Color(0xFF8B7CF6), // Violet Accent
//           surface: Color(0xFF0E1322),
//           background: Color(0xFF0A0E17),
//         ),
//       ),
//       home: const PortfolioShell(),
//     );
//   }
// }
//
// class PortfolioShell extends StatefulWidget {
//   const PortfolioShell({Key? key}) : super(key: key);
//
//   @override
//   State<PortfolioShell> createState() => _PortfolioShellState();
// }
//
// class _PortfolioShellState extends State<PortfolioShell> {
//   final ScrollController _scrollController = ScrollController();
//
//   // Section GlobalKeys for smooth scrolling anchors
//   final GlobalKey _heroKey = GlobalKey();
//   final GlobalKey _aboutKey = GlobalKey();
//   final GlobalKey _experienceKey = GlobalKey();
//   final GlobalKey _skillsKey = GlobalKey();
//   final GlobalKey _projectsKey = GlobalKey();
//   final GlobalKey _contactKey = GlobalKey();
//
//   String _activeSection = 'hero';
//
//   void _scrollToSection(GlobalKey key, String sectionId) {
//     final context = key.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 800),
//         curve: Curves.easeInOutCubic,
//       );
//       setState(() {
//         _activeSection = sectionId;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Ambient Immersive Background Glows
//           Positioned(
//             top: -200,
//             left: -200,
//             child: Container(
//               width: 600,
//               height: 600,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: const Color(0xFF3DDC84).withOpacity(0.04),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: -200,
//             right: -200,
//             child: Container(
//               width: 700,
//               height: 700,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: const Color(0xFF8B7CF6).withOpacity(0.04),
//               ),
//             ),
//           ),
//
//           // Main Scrollable Contents
//           CustomScrollView(
//             controller: _scrollController,
//             slivers: [
//               // Sticky Navigation Header bar
//               SliverAppBar(
//                 floating: false,
//                 pinned: true,
//                 backgroundColor: const Color(0xFF0A0E17).withOpacity(0.85),
//                 elevation: 0,
//                 title: Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () => _scrollToSection(_heroKey, 'hero'),
//                       child: RichText(
//                         text: const TextSpan(
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
//                           children: [
//                             TextSpan(text: 'Rushikesh', style: TextStyle(color: Colors.white)),
//                             TextSpan(text: '.dev', style: TextStyle(color: Color(0xFF3DDC84))),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 actions: [
//                   _navButton('About', _aboutKey, 'about'),
//                   _navButton('Experience', _experienceKey, 'experience'),
//                   _navButton('Skills', _skillsKey, 'skills'),
//                   _navButton('Projects', _projectsKey, 'projects'),
//                   const SizedBox(width: 12),
//                   Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 16),
//                       child: ElevatedButton(
//                         onPressed: () => _scrollToSection(_contactKey, 'contact'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF3DDC84),
//                           foregroundColor: Colors.black,
//                           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: const Text('Hire Me', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               // Portfolio Sections List
//               SliverList(
//                 delegate: SliverChildListDelegate([
//                   // 1. Hero Section
//                   HeroSection(key: _heroKey, onContactPressed: () => _scrollToSection(_contactKey, 'contact'), onAppsPressed: () => _scrollToSection(_experienceKey, 'experience')),
//
//                   // 2. About Section
//                   AboutSection(key: _aboutKey, onResumePressed: _launchResume),
//
//                   // 3. Experience Timeline Section
//                   ExperienceTimelineSection(key: _experienceKey),
//
//                   // 4. Skills Node Graph Visualizer Section
//                   SkillsNodeGraphSection(key: _skillsKey, onContactPressed: () => _scrollToSection(_contactKey, 'contact')),
//
//                   // 5. Featured Projects Showcase Section
//                   ProjectsShowcaseSection(key: _projectsKey),
//
//                   // 6. Secure Contact Portal Section
//                   ContactPortalSection(key: _contactKey),
//                 ]),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _navButton(String title, GlobalKey key, String sectionId) {
//     final bool isActive = _activeSection == sectionId;
//     return TextButton(
//       onPressed: () => _scrollToSection(key, sectionId),
//       child: Text(
//         isActive ? '// ${title.toLowerCase()}' : title.toLowerCase(),
//         style: TextStyle(
//           color: isActive ? const Color(0xFF3DDC84) : Colors.white60,
//           fontFamily: 'monospace',
//           fontSize: 12,
//           fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     );
//   }
//
//   void _launchResume() async {
//     const url = 'https://drive.google.com/file/d/11ZugEt3v8U2VN8hcNauJ1UsfkOP1ttdd/view?usp=sharing';
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     }
//   }
// }
//
// // ==================== 1. HERO SECTION ====================
// class HeroSection extends StatefulWidget {
//   final VoidCallback onContactPressed;
//   final VoidCallback onAppsPressed;
//   const HeroSection({Key? key, required this.onContactPressed, required this.onAppsPressed}) : super(key: key);
//
//   @override
//   State<HeroSection> createState() => _HeroSectionState();
// }
//
// class _HeroSectionState extends State<HeroSection> {
//   String _selectedApp = 'infier';
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final bool isMobile = constraints.maxWidth < 900;
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 80),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Left Display Column
//                   Expanded(
//                     flex: isMobile ? 1 : 7,
//                     child: Column(
//                       crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
//                       children: [
//                         // Pill badge
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFF3DDC84).withOpacity(0.1),
//                             border: Border.all(color: const Color(0xFF3DDC84).withOpacity(0.2)),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Container(
//                                 width: 6,
//                                 height: 6,
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xFF3DDC84),
//                                   shape: BoxShape.circle,
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               const Text(
//                                 'ANDROID & FLUTTER DEVELOPER',
//                                 style: TextStyle(
//                                   color: Color(0xFF3DDC84),
//                                   fontSize: 10,
//                                   fontFamily: 'monospace',
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 1.2,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         Text(
//                           'Rushikesh\nPetkar',
//                           style: TextStyle(
//                             fontSize: isMobile ? 48 : 72,
//                             fontWeight: FontWeight.bold,
//                             height: 0.95,
//                             fontFamily: 'Space Grotesk',
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         Text(
//                           'I own the Android app lifecycle end-to-end. Shipped 3 commercial apps directly to the Google Play Store—handling BLE synchronization, biometric authentication, global payment gateways, and high-performance clean architecture.',
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: isMobile ? 15 : 18,
//                             height: 1.5,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                         const SizedBox(height: 40),
//                         // CTA buttons
//                         Wrap(
//                           spacing: 16,
//                           runSpacing: 16,
//                           children: [
//                             ElevatedButton(
//                               onPressed: widget.onAppsPressed,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xFF3DDC84),
//                                 foregroundColor: Colors.black,
//                                 padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               child: const Text('View My Apps', style: TextStyle(fontWeight: FontWeight.bold)),
//                             ),
//                             OutlinedButton(
//                               onPressed: widget.onContactPressed,
//                               style: OutlinedButton.styleFrom(
//                                 foregroundColor: Colors.white,
//                                 side: BorderSide(color: Colors.white.withOpacity(0.15)),
//                                 padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               child: const Text('Contact Me'),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   if (!isMobile) const SizedBox(width: 60),
//
//                   // Right Simulator Column (only on Desktop)
//                   if (!isMobile)
//                     Expanded(
//                       flex: 5,
//                       child: Center(
//                         child: _buildPhoneSimulator(),
//                       ),
//                     ),
//                 ],
//               ),
//               if (isMobile) ...[
//                 const SizedBox(height: 60),
//                 _buildPhoneSimulator(),
//               ]
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildPhoneSimulator() {
//     return Container(
//       width: 280,
//       height: 520,
//       decoration: BoxDecoration(
//         color: const Color(0xFF070A13),
//         borderRadius: BorderRadius.circular(40),
//         border: Border.all(color: Colors.white12, width: 8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.5),
//             blurRadius: 40,
//             spreadRadius: 5,
//           )
//         ],
//       ),
//       child: Column(
//         children: [
//           // Camera Notch
//           Container(
//             width: 100,
//             height: 20,
//             decoration: const BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(14),
//                 bottomRight: Radius.circular(14),
//               ),
//             ),
//           ),
//           // Inner Simulator screen content
//           Expanded(
//             child: Container(
//               margin: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF0E1322),
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('09:41 AM', style: TextStyle(fontSize: 10, fontFamily: 'monospace')),
//                         Row(
//                           children: [
//                             Icon(Icons.wifi, size: 10),
//                             SizedBox(width: 4),
//                             Icon(Icons.battery_full, size: 10),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: _getSimulatedAppScreen(),
//                   ),
//                   // Device pill selection tab bar
//                   Container(
//                     color: Colors.black38,
//                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         _simulatorTab('Infierms', 'infier', const Color(0xFF3DDC84)),
//                         _simulatorTab('Eda Wallet', 'eda', const Color(0xFF8B7CF6)),
//                         _simulatorTab('Ecke', 'ecke', const Color(0xFFFFB84D)),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _simulatorTab(String title, String appId, Color color) {
//     final bool isActive = _selectedApp == appId;
//     return GestureDetector(
//       onTap: () => setState(() => _selectedApp = appId),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//         decoration: BoxDecoration(
//           color: isActive ? Colors.white.withOpacity(0.08) : Colors.transparent,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: isActive ? color.withOpacity(0.5) : Colors.transparent),
//         ),
//         child: Text(
//           title,
//           style: TextStyle(
//             fontSize: 9,
//             fontWeight: FontWeight.bold,
//             color: isActive ? Colors.white : Colors.white38,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _getSimulatedAppScreen() {
//     switch (_selectedApp) {
//       case 'eda':
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('EdaWallet™', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF8B7CF6))),
//               const SizedBox(height: 16),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF8B7CF6).withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: const Color(0xFF8B7CF6).withOpacity(0.2)),
//                 ),
//                 child: const Column(
//                   children: [
//                     Text('Total Group Balance', style: TextStyle(fontSize: 10, color: Colors.white54)),
//                     SizedBox(height: 4),
//                     Text('\$14,248.50', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'monospace')),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text('Recent Expenses', style: TextStyle(fontSize: 10, color: Colors.white38)),
//               const SizedBox(height: 8),
//               _simulatedExpenseItem('Server Hosting', '-\$120.00'),
//               _simulatedExpenseItem('Team Dinner', '-\$340.50'),
//             ],
//           ),
//         );
//       case 'ecke':
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('LearningEcke', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFFFB84D))),
//               const SizedBox(height: 16),
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.02),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.white10),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.book, color: Color(0xFFFFB84D), size: 18),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('Flutter & BLE Guides', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 4),
//                           LinearProgressIndicator(value: 0.75, backgroundColor: Colors.black26, color: const Color(0xFFFFB84D)),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Spacer(),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFFFFB84D),
//                   minimumSize: const Size(double.infinity, 36),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                 ),
//                 child: const Text('Start Learning', style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
//               )
//             ],
//           ),
//         );
//       case 'infier':
//       default:
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Infierms v2.4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF3DDC84))),
//                   Icon(Icons.check_circle, color: Color(0xFF3DDC84), size: 14),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.white.withOpacity(0.02),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.white10),
//                 ),
//                 child: const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Employee Profile', style: TextStyle(fontSize: 10, color: Colors.white54)),
//                     SizedBox(height: 2),
//                     Text('Rushikesh Petkar', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
//                     SizedBox(height: 12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Shift Logged', style: TextStyle(fontSize: 9, color: Colors.white38)),
//                         Text('8h 45m', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF3DDC84))),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF3DDC84),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Text(
//                   'Fingerprint Verified',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11),
//                 ),
//               )
//             ],
//           ),
//         );
//     }
//   }
//
//   Widget _simulatedExpenseItem(String desc, String amount) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(desc, style: const TextStyle(fontSize: 10, color: Colors.white70)),
//           Text(amount, style: const TextStyle(fontSize: 10, color: Colors.redAccent, fontFamily: 'monospace')),
//         ],
//       ),
//     );
//   }
// }
//
// // ==================== 2. ABOUT SECTION ====================
// class AboutSection extends StatelessWidget {
//   final VoidCallback onResumePressed;
//   const AboutSection({Key? key, required this.onResumePressed}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final bool isMobile = constraints.maxWidth < 900;
//         return Container(
//           color: const Color(0xFF0E1322).withOpacity(0.4),
//           padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 100),
//           child: Column(
//             children: [
//               // Header
//               const Text(
//                 '// about_me()',
//                 style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 12),
//               ),
//               const SizedBox(height: 12),
//               const Text(
//                 'About Me',
//                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 width: 60,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(colors: [Color(0xFF3DDC84), Color(0xFF8B7CF6)]),
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//               const SizedBox(height: 60),
//
//               Row(
//                 verticalDirection: VerticalDirection.down,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Photo (centered in mobile, left-aligned in desktop)
//                   if (!isMobile)
//                     Expanded(
//                       flex: 4,
//                       child: Center(
//                         child: _buildAvatarFrame(),
//                       ),
//                     ),
//                   if (!isMobile) const SizedBox(width: 40),
//
//                   // About Bio Paragraphs
//                   Expanded(
//                     flex: 6,
//                     child: Container(
//                       padding: const EdgeInsets.all(28),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0E1322),
//                         borderRadius: BorderRadius.circular(24),
//                         border: Border.all(color: Colors.white.withOpacity(0.05)),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Full-Stack Mobile Engineer with a Hardware Edge',
//                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//                           ),
//                           const SizedBox(height: 16),
//                           const Text(
//                             "I'm a B.Tech graduate in Electronics and Communication who now builds high-performance, real-world Android and Flutter apps for a living. As an Android Developer at Pixelstat eSolutions, I've taken 3 commercial applications from first commit to production releases on the Google Play Store—orchestrating BLE integrations, local secure database layers, payment gateways, and backend endpoints.",
//                             style: TextStyle(color: Colors.white70, height: 1.5, fontSize: 14),
//                           ),
//                           const SizedBox(height: 12),
//                           const Text(
//                             "Earlier, during my research & development internship at S.Charge Pvt. Ltd., I built a Flutter app to configure and diagnose EV charging stations over BLE, analyzing OCPP logs to root-cause complex charging sequences.",
//                             style: TextStyle(color: Colors.white70, height: 1.5, fontSize: 14),
//                           ),
//                           const SizedBox(height: 24),
//                           ElevatedButton.icon(
//                             onPressed: onResumePressed,
//                             icon: const Icon(Icons.download),
//                             label: const Text('Download My Resume'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFF3DDC84),
//                               foregroundColor: Colors.black,
//                               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               if (isMobile) ...[
//                 const SizedBox(height: 40),
//                 _buildAvatarFrame(),
//               ],
//
//               const SizedBox(height: 60),
//               // Highlights Grid
//               Wrap(
//                 spacing: 24,
//                 runSpacing: 24,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   _statCard(Icons.phone_iphone, '3+', 'Production Apps', 'Taken from first commit to Play Store', const Color(0xFF3DDC84)),
//                   _statCard(Icons.bluetooth, 'BLE & IoT', 'Hardware Integrated', 'Configure EV chargers over BLE', const Color(0xFF8B7CF6)),
//                   _statCard(Icons.layers, 'Clean Arch', 'Scalable Patterns', 'BLoC, Provider, SQLite cipher cache', const Color(0xFF3DDC84)),
//                   _statCard(Icons.school, 'B.Tech ECE', 'Engineering Core', 'Electronics & Communications grad', const Color(0xFF8B7CF6)),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildAvatarFrame() {
//     return Container(
//       width: 180,
//       height: 180,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         gradient: const LinearGradient(colors: [Color(0xFF3DDC84), Color(0xFF8B7CF6)]),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF3DDC84).withOpacity(0.2),
//             blurRadius: 20,
//           )
//         ],
//       ),
//       padding: const EdgeInsets.all(4),
//       child: const CircleAvatar(
//         radius: 86,
//         backgroundImage: NetworkImage(
//           'https://media.licdn.com/dms/image/v2/D5603AQEjuzLWvLHhtg/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1715193306913?e=1755734400&v=beta&t=7gqfT8qFFOmPznlRjzVsLCCMdNOQJrPbW9HO6nSEijQ',
//         ),
//       ),
//     );
//   }
//
//   Widget _statCard(IconData icon, String val, String label, String sub, Color color) {
//     return Container(
//       width: 220,
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: const Color(0xFF0E1322).withOpacity(0.6),
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.white.withOpacity(0.04)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: color, size: 28),
//           const SizedBox(height: 16),
//           Text(val, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
//           const SizedBox(height: 4),
//           Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white70)),
//           const SizedBox(height: 4),
//           Text(sub, style: const TextStyle(fontSize: 10, color: Colors.white30)),
//         ],
//       ),
//     );
//   }
// }
//
// // ==================== 3. EXPERIENCE SECTION ====================
// class ExperienceTimelineSection extends StatelessWidget {
//   const ExperienceTimelineSection({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
//       child: Column(
//         children: [
//           const Text(
//             '// experience.log()',
//             style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 12),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Where I\'ve Worked',
//             style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
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
//
//           // Timeline
//           Container(
//             width: 800,
//             child: Column(
//               children: [
//                 _buildJobNode(
//                   role: 'Android Developer',
//                   company: 'Pixelstat eSolutions',
//                   location: 'Hyderabad, India',
//                   duration: 'Jan 2026 — Present',
//                   isCurrent: true,
//                   duties: [
//                     'Own the Android app lifecycle end-to-end—directing mobile architecture, writing performant Kotlin codebase, testing, and handling production-grade Play Store releases.',
//                     'Successfully shipped and maintain 3 production apps, integrating complex multi-layered BLoC/Provider state management, RESTful APIs, Firebase services, and global Razorpay payment gateway.'
//                   ],
//                 ),
//                 _buildJobNode(
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
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildJobNode({
//     required String role,
//     required String company,
//     required String location,
//     required String duration,
//     required bool isCurrent,
//     required List<String> duties,
//   }) {
//     return IntrinsicHeight(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Left Line Timeline marker
//           Column(
//             children: [
//               Container(
//                 width: 12,
//                 height: 12,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: isCurrent ? const Color(0xFF3DDC84) : Colors.grey,
//                   border: Border.all(color: Colors.black, width: 2),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   width: 2,
//                   color: Colors.white12,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(width: 20),
//           // Content block
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text(role, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//                       if (isCurrent) ...[
//                         const SizedBox(width: 12),
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFF3DDC84).withOpacity(0.12),
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: const Color(0xFF3DDC84).withOpacity(0.25)),
//                           ),
//                           child: const Text('CURRENT', style: TextStyle(color: Color(0xFF3DDC84), fontSize: 9, fontWeight: FontWeight.bold)),
//                         )
//                       ]
//                     ],
//                   ),
//                   const SizedBox(height: 6),
//                   Text('$company • $location • $duration', style: const TextStyle(color: Color(0xFF8B7CF6), fontSize: 13, fontFamily: 'monospace')),
//                   const SizedBox(height: 16),
//                   ...duties.map((duty) => Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text('• ', style: TextStyle(color: Color(0xFF3DDC84), fontWeight: FontWeight.bold)),
//                         Expanded(child: Text(duty, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4))),
//                       ],
//                     ),
//                   )).toList()
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// // ==================== 4. SKILLS NODE GRAPH SECTION ====================
// class SkillsNodeGraphSection extends StatefulWidget {
//   final VoidCallback onContactPressed;
//   const SkillsNodeGraphSection({Key? key, required this.onContactPressed}) : super(key: key);
//
//   @override
//   State<SkillsNodeGraphSection> createState() => _SkillsNodeGraphSectionState();
// }
//
// class _SkillsNodeGraphSectionState extends State<SkillsNodeGraphSection> {
//   String _selectedSkillId = 'flutter';
//
//   final List<SkillItem> _skills = [
//     SkillItem('android', 'Android SDK', 'core', 95, 'Native SDK core. Coroutines, Compose, Room local cipher, secure bindings.'),
//     SkillItem('flutter', 'Flutter Engine', 'core', 95, 'Multi-platform custom rendering canvas, high-fidelity gesture handlers, bluetooth bindings.'),
//     SkillItem('dart', 'Dart Programming', 'core', 90, 'Thread isolates pipelines, async stream manipulation, custom null-safety.'),
//     SkillItem('bloc', 'BLoC & Provider', 'core', 95, 'Unidirectional modular state maps, stream flow cubit management patterns.'),
//     SkillItem('ble_iot', 'BLE / IoT Layers', 'specialized', 85, 'Direct GATT service profiles interaction, UART serial ports, OCPP charging telemetry logs.'),
//     SkillItem('rest_api', 'REST Web Services', 'specialized', 90, 'JWT interceptor tokens refresh, secure dynamic payload mappings, robust caching policies.'),
//     SkillItem('firebase', 'Firebase Stack', 'tools', 92, 'FCM real-time push engines, live sync firestores, crash diagnostics metrics.'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final activeSkill = _skills.firstWhere((s) => s.id == _selectedSkillId);
//     return Container(
//       color: const Color(0xFF0E1322).withOpacity(0.3),
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
//       child: Column(
//         children: [
//           const Text(
//             '// skills.visualization()',
//             style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 12),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Technical Architecture',
//             style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
//           ),
//           const SizedBox(height: 40),
//
//           // Flex Interactive Area
//           LayoutBuilder(
//             builder: (context, constraints) {
//               final bool isMobile = constraints.maxWidth < 800;
//               return Container(
//                 width: 1000,
//                 child: Flex(
//                   direction: isMobile ? Axis.vertical : Axis.horizontal,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // Left list of nodes
//                     Expanded(
//                       flex: isMobile ? 0 : 5,
//                       child: Column(
//                         children: _skills.map((skill) {
//                           final bool isActive = skill.id == _selectedSkillId;
//                           return Padding(
//                             padding: const EdgeInsets.only(bottom: 8.0),
//                             child: InkWell(
//                               onTap: () => setState(() => _selectedSkillId = skill.id),
//                               borderRadius: BorderRadius.circular(12),
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                                 decoration: BoxDecoration(
//                                   color: isActive ? const Color(0xFF3DDC84).withOpacity(0.1) : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(color: isActive ? const Color(0xFF3DDC84).withOpacity(0.3) : Colors.transparent),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(skill.name, style: TextStyle(fontWeight: FontWeight.bold, color: isActive ? Colors.white : Colors.white60)),
//                                     Icon(Icons.chevron_right, color: isActive ? const Color(0xFF3DDC84) : Colors.white12),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     if (!isMobile) const SizedBox(width: 40),
//                     if (isMobile) const SizedBox(height: 24),
//                     // Right telemetry HUD card
//                     Expanded(
//                       flex: isMobile ? 0 : 5,
//                       child: Container(
//                         padding: const EdgeInsets.all(28),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF0E1322),
//                           borderRadius: BorderRadius.circular(24),
//                           border: Border.all(color: Colors.white10),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                                   decoration: BoxDecoration(
//                                     color: activeSkill.category == 'core' ? const Color(0xFF3DDC84).withOpacity(0.12) : const Color(0xFF8B7CF6).withOpacity(0.12),
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: Text(activeSkill.category.toUpperCase(), style: TextStyle(color: activeSkill.category == 'core' ? const Color(0xFF3DDC84) : const Color(0xFF8B7CF6), fontSize: 9, fontWeight: FontWeight.bold)),
//                                 ),
//                                 const SizedBox(height: 16),
//                                 Text(activeSkill.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                                 const SizedBox(height: 8),
//                                 Row(
//                                   children: [
//                                     const Text('Proficiency Rating: ', style: TextStyle(fontSize: 11, color: Colors.white38)),
//                                     Text('${activeSkill.val}%', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF3DDC84))),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 12),
//                                 LinearProgressIndicator(
//                                   value: activeSkill.val / 100,
//                                   color: const Color(0xFF3DDC84),
//                                   backgroundColor: Colors.black,
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Text(activeSkill.desc, style: const TextStyle(color: Colors.white70, height: 1.5, fontSize: 13)),
//                               ],
//                             ),
//                             const SizedBox(height: 40),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text('LEVEL: SECURE_COMPILED', style: TextStyle(fontSize: 9, fontFamily: 'monospace', color: Colors.white24)),
//                                 TextButton(
//                                   onPressed: widget.onContactPressed,
//                                   child: const Row(
//                                     children: [
//                                       Text('Ask for SDK Details', style: TextStyle(color: Color(0xFF3DDC84), fontSize: 12, fontWeight: FontWeight.bold)),
//                                       SizedBox(width: 4),
//                                       Icon(Icons.arrow_forward, size: 14, color: Color(0xFF3DDC84)),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class SkillItem {
//   final String id;
//   final String name;
//   final String category;
//   final int val;
//   final String desc;
//
//   SkillItem(this.id, this.name, this.category, this.val, this.desc);
// }
//
// // ==================== 5. FEATURED PROJECTS SECTION ====================
// class ProjectsShowcaseSection extends StatelessWidget {
//   const ProjectsShowcaseSection({Key? key}) : super(key: key);
//
//   final List<ProjectRecord> _projects = const [
//     ProjectRecord(
//       'Multipurpose Agribot',
//       'An advanced IoT-powered solar agribot designed for automated smart irrigation and field monitoring.',
//       ['IoT & Robotics', 'Hardware Integration', 'Solar Power'],
//     ),
//     ProjectRecord(
//       'Weather Sync App',
//       'A responsive mobile application delivering real-time geo-located climate dashboards.',
//       ['Mobile API', 'Flutter', 'State Caching'],
//     ),
//     ProjectRecord(
//       'Life on Land (SDG 15)',
//       'Award-entry for the prestigious Google Developer Student Clubs Solution Challenge 2024.',
//       ['Google Challenge', 'Flutter', 'UI Design'],
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
//       child: Column(
//         children: [
//           const Text(
//             '// projects[]',
//             style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 12),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Featured Projects',
//             style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
//           ),
//           const SizedBox(height: 40),
//
//           Wrap(
//             spacing: 24,
//             runSpacing: 24,
//             alignment: WrapAlignment.center,
//             children: _projects.map((project) {
//               return Container(
//                 width: 280,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0E1322),
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(color: Colors.white.withOpacity(0.06)),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Mock Visual Header
//                     Container(
//                       height: 140,
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.3),
//                         borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//                       ),
//                       child: const Center(
//                         child: Icon(Icons.video_library_outlined, color: Color(0xFF3DDC84), size: 36),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(project.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                           const SizedBox(height: 8),
//                           Text(project.desc, style: const TextStyle(color: Colors.white54, fontSize: 12, height: 1.4)),
//                           const SizedBox(height: 16),
//                           Wrap(
//                             spacing: 6,
//                             runSpacing: 6,
//                             children: project.tags.map((tag) {
//                               return Container(
//                                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color: Colors.black26,
//                                   borderRadius: BorderRadius.circular(6),
//                                 ),
//                                 child: Text('#${tag.replaceAll(' ', '').toLowerCase()}', style: const TextStyle(fontSize: 9, color: Colors.white38)),
//                               );
//                             }).toList(),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             }).toList(),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class ProjectRecord {
//   final String title;
//   final String desc;
//   final List<String> tags;
//
//   const ProjectRecord(this.title, this.desc, this.tags);
// }
//
// // ==================== 6. SECURE CONTACT PORTAL SECTION ====================
// class ContactPortalSection extends StatefulWidget {
//   const ContactPortalSection({Key? key}) : super(key: key);
//
//   @override
//   State<ContactPortalSection> createState() => _ContactPortalSectionState();
// }
//
// class _ContactPortalSectionState extends State<ContactPortalSection> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isSending = false;
//   bool _isSuccess = false;
//
//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isSending = true;
//       });
//       // Simulate API submit latency
//       Future.delayed(const Duration(seconds: 2), () {
//         setState(() {
//           _isSending = false;
//           _isSuccess = true;
//         });
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFF0E1322).withOpacity(0.4),
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
//       child: Column(
//         children: [
//           const Text(
//             '// contact.send()',
//             style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 12),
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Get In Touch',
//             style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
//           ),
//           const SizedBox(height: 40),
//
//           LayoutBuilder(
//             builder: (context, constraints) {
//               final bool isMobile = constraints.maxWidth < 800;
//               return Container(
//                 width: 900,
//                 child: Flex(
//                   direction: isMobile ? Axis.vertical : Axis.horizontal,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Info column
//                     Expanded(
//                       flex: isMobile ? 0 : 5,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('Let\'s build something exceptional together', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 16),
//                           const Text(
//                             'I am currently open to full-time Android and Flutter developer positions. If you are a recruiter, hiring manager, or have a challenging mobile problem worth solving, let\'s connect!',
//                             style: TextStyle(color: Colors.white70, height: 1.5, fontSize: 14),
//                           ),
//                           const SizedBox(height: 24),
//                           _contactInfoRow(Icons.timer, 'Response time: Under 24 hours'),
//                           _contactInfoRow(Icons.pin_drop, 'Location: Hyderabad, India'),
//                           _contactInfoRow(Icons.email, 'rushikeshpetkar40@gmail.com'),
//                         ],
//                       ),
//                     ),
//                     if (!isMobile) const SizedBox(width: 40),
//                     if (isMobile) const SizedBox(height: 40),
//                     // Form Card column
//                     Expanded(
//                       flex: isMobile ? 0 : 5,
//                       child: Container(
//                         padding: const EdgeInsets.all(28),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF0E1322),
//                           borderRadius: BorderRadius.circular(24),
//                           border: Border.all(color: Colors.white10),
//                         ),
//                         child: _isSuccess
//                             ? _buildSuccessCard()
//                             : Form(
//                           key: _formKey,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text('Send a secure message', style: TextStyle(fontWeight: FontWeight.bold)),
//                               const SizedBox(height: 20),
//                               _buildTextField('Your Name', 'Alexander Mercer'),
//                               const SizedBox(height: 16),
//                               _buildTextField('Email Address', 'alexander@company.com'),
//                               const SizedBox(height: 16),
//                               _buildTextField('Message', 'Let\'s talk about Flutter roles...', maxLines: 4),
//                               const SizedBox(height: 24),
//                               SizedBox(
//                                 width: double.infinity,
//                                 height: 48,
//                                 child: ElevatedButton(
//                                   onPressed: _isSending ? null : _submitForm,
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color(0xFF3DDC84),
//                                     foregroundColor: Colors.black,
//                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                                   ),
//                                   child: _isSending
//                                       ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
//                                       : const Text('Send Message', style: TextStyle(fontWeight: FontWeight.bold)),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _contactInfoRow(IconData icon, String label) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: Row(
//         children: [
//           Icon(icon, color: const Color(0xFF3DDC84), size: 18),
//           const SizedBox(width: 12),
//           Text(label, style: const TextStyle(fontSize: 13, color: Colors.white70)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, String placeholder, {int maxLines = 1}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label.toUpperCase(), style: const TextStyle(fontSize: 9, fontFamily: 'monospace', color: Colors.white38)),
//         const SizedBox(height: 6),
//         TextFormField(
//           maxLines: maxLines,
//           validator: (val) => val == null || val.isEmpty ? 'This field is required' : null,
//           decoration: InputDecoration(
//             hintText: placeholder,
//             hintStyle: const TextStyle(color: Colors.white12, fontSize: 13),
//             filled: true,
//             fillColor: Colors.black45,
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
//             contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSuccessCard() {
//     return Column(
//       children: [
//         const Icon(Icons.check_circle_outline, color: Color(0xFF3DDC84), size: 48),
//         const SizedBox(height: 16),
//         const Text('Message Dispatched!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//         const SizedBox(height: 8),
//         const Text('Thank you! I will get back to you shortly.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white60, fontSize: 12)),
//         const SizedBox(height: 20),
//         TextButton(
//           onPressed: () => setState(() => _isSuccess = false),
//           child: const Text('Send Another', style: TextStyle(color: Color(0xFF3DDC84), fontSize: 12)),
//         )
//       ],
//     );
//   }
// }

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';
import 'skills_visualization.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const RushikeshPortfolioApp());
}

class RushikeshPortfolioApp extends StatelessWidget {
  const RushikeshPortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rushikesh Petkar | Android & Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0E17),
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF3DDC84), // Android Green
          secondary: Color(0xFF8B7CF6), // Violet Accent
          tertiary: Color(0xFFFFB84D), // Ecke Orange
          surface: Color(0xFF0E1322),
          background: Color(0xFF0A0E17),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const PortfolioShell(),
    );
  }
}

class PortfolioShell extends StatefulWidget {
  const PortfolioShell({Key? key}) : super(key: key);

  @override
  State<PortfolioShell> createState() => _PortfolioShellState();
}

class _PortfolioShellState extends State<PortfolioShell> {
  final ScrollController _scrollController = ScrollController();

  // Section GlobalKeys for smooth scrolling anchors
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String _activeSection = 'hero';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final double scrollY = _scrollController.offset;
    if (scrollY < 500) {
      _updateActiveSection('hero');
    } else if (scrollY < 1200) {
      _updateActiveSection('about');
    } else if (scrollY < 2100) {
      _updateActiveSection('experience');
    } else if (scrollY < 2900) {
      _updateActiveSection('skills');
    } else if (scrollY < 3900) {
      _updateActiveSection('projects');
    } else {
      _updateActiveSection('contact');
    }
  }

  void _updateActiveSection(String sectionId) {
    if (_activeSection != sectionId) {
      setState(() {
        _activeSection = sectionId;
      });
    }
  }

  void _scrollToSection(GlobalKey key, String sectionId) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
      setState(() {
        _activeSection = sectionId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;

        return Scaffold(
          drawer: isMobile ? _buildMobileDrawer() : null,
          body: Stack(
            children: [
              // 1. Ambient Background Glowing Orbs
              Positioned(
                top: -300,
                left: -300,
                child: Container(
                  width: 800,
                  height: 800,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF3DDC84).withOpacity(0.03),
                  ),
                ),
              ),
              Positioned(
                bottom: -300,
                right: -300,
                child: Container(
                  width: 900,
                  height: 900,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF8B7CF6).withOpacity(0.03),
                  ),
                ),
              ),

              // 2. Main Scroll View
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // Header Navbar
                  SliverAppBar(
                    floating: false,
                    pinned: true,
                    backgroundColor: const Color(0xFF0A0E17).withOpacity(0.9),
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    leading: isMobile
                        ? Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    )
                        : null,
                    title: Row(
                      children: [
                        if (!isMobile) const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () => _scrollToSection(_heroKey, 'hero'),
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'monospace',
                              ),
                              children: [
                                TextSpan(text: 'rushikesh', style: TextStyle(color: Colors.white)),
                                TextSpan(text: '.dev', style: TextStyle(color: Color(0xFF3DDC84))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: isMobile
                        ? null
                        : [
                      _navButton('About', _aboutKey, 'about'),
                      _navButton('Experience', _experienceKey, 'experience'),
                      _navButton('Skills', _skillsKey, 'skills'),
                      _navButton('Projects', _projectsKey, 'projects'),
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.only(right: 32),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () => _scrollToSection(_contactKey, 'contact'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF3DDC84),
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 4,
                              shadowColor: const Color(0xFF3DDC84).withOpacity(0.3),
                            ),
                            child: const Text(
                              'Hire Me',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Scrollable Sections Delegate
                  SliverList(
                    delegate: SliverChildListDelegate([
                      // 1. Hero Section
                      HeroSection(
                        key: _heroKey,
                        onContactPressed: () => _scrollToSection(_contactKey, 'contact'),
                        onAppsPressed: () => _scrollToSection(_projectsKey, 'projects'),
                      ),

                      // 2. About Section
                      AboutSection(key: _aboutKey),

                      // 3. Experience Timeline Section
                      ExperienceTimelineSection(key: _experienceKey),

                      // 4. Interactive Skills Node Graph Wrapping
                      SkillsWrapperSection(key: _skillsKey),

                      // 5. Featured Projects Showcase
                      ProjectsShowcaseSection(key: _projectsKey),

                      // 6. Validated Contact Section
                      ContactPortalSection(key: _contactKey),

                      // 7. Copyright Footer
                      const PortfolioFooter(),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _navButton(String title, GlobalKey key, String sectionId) {
    final bool isActive = _activeSection == sectionId;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextButton(
        onPressed: () => _scrollToSection(key, sectionId),
        style: TextButton.styleFrom(
          overlayColor: const Color(0xFF3DDC84).withOpacity(0.1),
        ),
        child: Text(
          isActive ? '// ${title.toLowerCase()}' : title.toLowerCase(),
          style: TextStyle(
            color: isActive ? const Color(0xFF3DDC84) : Colors.white60,
            fontFamily: 'monospace',
            fontSize: 13,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF0E1322),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
                  children: [
                    TextSpan(text: 'rushikesh', style: TextStyle(color: Colors.white)),
                    TextSpan(text: '.dev', style: TextStyle(color: Color(0xFF3DDC84))),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.white10),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _drawerItem('About', _aboutKey, 'about'),
                  _drawerItem('Experience', _experienceKey, 'experience'),
                  _drawerItem('Skills Graph', _skillsKey, 'skills'),
                  _drawerItem('Projects', _projectsKey, 'projects'),
                  _drawerItem('Contact Portal', _contactKey, 'contact'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _scrollToSection(_contactKey, 'contact');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3DDC84),
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Get In Touch', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(String title, GlobalKey key, String sectionId) {
    final bool isActive = _activeSection == sectionId;
    return ListTile(
      leading: Icon(
        isActive ? Icons.chevron_right : Icons.arrow_right,
        color: isActive ? const Color(0xFF3DDC84) : Colors.white30,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? const Color(0xFF3DDC84) : Colors.white70,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        _scrollToSection(key, sectionId);
      },
    );
  }
}

// ==================== 1. HERO SECTION ====================
class HeroSection extends StatefulWidget {
  final VoidCallback onContactPressed;
  final VoidCallback onAppsPressed;
  const HeroSection({Key? key, required this.onContactPressed, required this.onAppsPressed}) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  String _simulatedAppId = 'infier';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: isMobile ? 40 : 80),
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
                            fontWeight: FontWeight.bold,
                            height: 0.95,
                            fontFamily: 'Space Grotesk',
                            letterSpacing: -1.5,
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
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: _buildPhoneSimulator(),
                      ),
                    ),
                ],
              ),
              if (isMobile) ...[
                const SizedBox(height: 60),
                _buildPhoneSimulator(),
              ]
            ],
          ),
        );
      },
    );
  }

  Widget _buildPhoneSimulator() {
    return Container(
      width: 290,
      height: 540,
      decoration: BoxDecoration(
        color: const Color(0xFF070A13),
        borderRadius: BorderRadius.circular(44),
        border: Border.all(color: Colors.white12, width: 8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 40,
            spreadRadius: 8,
          ),
          BoxShadow(
            color: const Color(0xFF3DDC84).withOpacity(0.05),
            blurRadius: 20,
            spreadRadius: 2,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: Column(
          children: [
            // Speaker/Notch
            Container(
              width: 110,
              height: 22,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            // Simulator Screen Canvas
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF0E1322),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  children: [
                    // System Status bar
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '09:41 AM',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'monospace',
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.wifi, size: 12, color: Colors.white70),
                              SizedBox(width: 4),
                              Icon(Icons.signal_cellular_alt, size: 12, color: Colors.white70),
                              SizedBox(width: 4),
                              Icon(Icons.battery_full, size: 12, color: Color(0xFF3DDC84)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: _getSimulatorAppContent(),
                    ),
                    // Device navigation tabs select
                    Container(
                      color: Colors.black45,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _simTab('Infierms', 'infier', const Color(0xFF3DDC84)),
                          _simTab('EdaWallet', 'eda', const Color(0xFF8B7CF6)),
                          _simTab('Ecke', 'ecke', const Color(0xFFFFB84D)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _simTab(String label, String id, Color activeColor) {
    final bool isActive = _simulatedAppId == id;
    return GestureDetector(
      onTap: () {
        setState(() {
          _simulatedAppId = id;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? activeColor.withOpacity(0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive ? activeColor.withOpacity(0.4) : Colors.transparent,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.white : Colors.white38,
          ),
        ),
      ),
    );
  }

  Widget _getSimulatorAppContent() {
    switch (_simulatedAppId) {
      case 'eda':
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Eda Wallet',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF8B7CF6)),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(color: Color(0xFF8B7CF6), shape: BoxShape.circle),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFF8B7CF6).withOpacity(0.15), Colors.black26],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF8B7CF6).withOpacity(0.2)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Safe Multi-Sig Balance', style: TextStyle(fontSize: 9, color: Colors.white54)),
                    SizedBox(height: 4),
                    Text('\$14,248.50', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'monospace')),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const Text('Shared Expense Pool', style: TextStyle(fontSize: 10, color: Colors.white38, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _simExpenseItem('AWS Server Host', '-\$120.00'),
              _simExpenseItem('Play Store Fee', '-\$25.00'),
              _simExpenseItem('Hacker House Dinner', '-\$340.50'),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B7CF6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Approve Group Ledger',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ),
            ],
          ),
        );
      case 'ecke':
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.school, color: Color(0xFFFFB84D), size: 16),
                  SizedBox(width: 8),
                  Text('LearningEcke', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFFFB84D))),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.bluetooth, color: Color(0xFFFFB84D), size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Flutter BLE Tutorial', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          LinearProgressIndicator(value: 0.75, backgroundColor: Colors.black26, color: const Color(0xFFFFB84D)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text('Lessons list:', style: TextStyle(fontSize: 10, color: Colors.white38)),
              const SizedBox(height: 6),
              _simLesson('1. GATT Services & UUIDs', true),
              _simLesson('2. MTU Packets Structuring', true),
              _simLesson('3. RxDart State Streams', false),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB84D),
                  minimumSize: const Size(double.infinity, 38),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Resume Course', style: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      case 'infier':
      default:
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Infierms v2.4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF3DDC84))),
                  Icon(Icons.check_circle, color: Color(0xFF3DDC84), size: 14),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white10),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Active Shift Profile', style: TextStyle(fontSize: 9, color: Colors.white54)),
                    SizedBox(height: 2),
                    Text('Rushikesh Petkar', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shift Clock Log', style: TextStyle(fontSize: 9, color: Colors.white38)),
                        Text('8h 45m', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF3DDC84))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const Row(
                children: [
                  Icon(Icons.location_on, size: 12, color: Colors.redAccent),
                  SizedBox(width: 4),
                  Text('Geofence: Inside Pixelstat HQ', style: TextStyle(fontSize: 10, color: Colors.white54)),
                ],
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF3DDC84),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.fingerprint, color: Colors.black, size: 14),
                    SizedBox(width: 6),
                    Text(
                      'Biometric Verified',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }

  Widget _simExpenseItem(String name, String amount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontSize: 9, color: Colors.white70)),
          Text(amount, style: const TextStyle(fontSize: 9, color: Colors.redAccent, fontFamily: 'monospace')),
        ],
      ),
    );
  }

  Widget _simLesson(String title, bool done) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(done ? Icons.check_circle_outline : Icons.radio_button_off, size: 12, color: done ? const Color(0xFFFFB84D) : Colors.white30),
          const SizedBox(width: 6),
          Text(title, style: TextStyle(fontSize: 10, color: done ? Colors.white70 : Colors.white30)),
        ],
      ),
    );
  }
}

// ==================== 2. ABOUT SECTION ====================
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
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
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

// ==================== 3. EXPERIENCE SECTION ====================
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
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
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
          Container(
            width: 800,
            child: Column(
              children: [
                _buildTimelineNode(
                  role: 'Android Developer',
                  company: 'Pixelstat eSolutions',
                  location: 'Hyderabad, India',
                  duration: 'Jan 2026 — Present',
                  isCurrent: true,
                  duties: [
                    'Own the Android app lifecycle end-to-end—directing mobile architecture, writing performant Kotlin codebase, testing, and handling production-grade Play Store releases.',
                    'Successfully shipped and maintain 3 production apps, integrating complex multi-layered BLoC/Provider state management, RESTful APIs, Firebase services, and global Razorpay payment gateway.'
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
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Line Timeline marker
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
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
              Expanded(
                child: Container(
                  width: 2,
                  color: Colors.white12,
                ),
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
                      Text(role, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
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
      ),
    );
  }
}

// ==================== 4. SKILLS WRAPPER SECTION ====================
class SkillsWrapperSection extends StatelessWidget {
  const SkillsWrapperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          color: const Color(0xFF0E1322).withOpacity(0.3),
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 100),
          child: Column(
            children: [
              const Text(
                '// technical_mindmap()',
                style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 13),
              ),
              const SizedBox(height: 12),
              const Text(
                'Technical Mindmap',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
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
              const SizedBox(height: 24),
              const Text(
                'Click or hover on any skill node to query libraries, integrated SDKs, and deep proficiency gauges.',
                style: TextStyle(color: Colors.white38, fontSize: 13),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Embedded Interactive Custom Painter Node Network Graph
              const SkillsVisualization(),
            ],
          ),
        );
      },
    );
  }
}

// ==================== 5. PROJECTS SECTION ====================
class ProjectsShowcaseSection extends StatelessWidget {
  const ProjectsShowcaseSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80, vertical: 100),
          child: Column(
            children: [
              const Text(
                '// shipped_applications()',
                style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 13),
              ),
              const SizedBox(height: 12),
              const Text(
                'Shipped Commercial Products',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
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

              // Production Grid
              GridView.count(
                crossAxisCount: isMobile ? 1 : 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: isMobile ? 0.8 : 0.72,
                children: [
                  _projectCard(
                    title: 'Infierms',
                    subtitle: 'Shift & Security Manager',
                    platform: 'ANDROID (KOTLIN) • PLAY STORE',
                    description: 'A commercial enterprise shift logging and verification tool used daily by active security forces to track patrol points and manage shifts.',
                    metrics: [
                      'Biometric authentication fingerprint loop integration.',
                      'Geofencing limits tracking via background Location Services.',
                      'Full MVVM repository architecture.'
                    ],
                    accentColor: const Color(0xFF3DDC84),
                    icon: Icons.fingerprint_rounded,
                  ),
                  _projectCard(
                    title: 'Eda Wallet',
                    subtitle: 'Shared Expense Ledger',
                    platform: 'FLUTTER • IOS & ANDROID',
                    description: 'A finance application to organize group budgets, securely sign shared expense logs, and split multi-party server or hardware invoices.',
                    metrics: [
                      'Offline-first synchronization with secure local SQLite database.',
                      'Tokenized authorization layers and signature validations.',
                      'Beautiful material widgets with smooth transitions.'
                    ],
                    accentColor: const Color(0xFF8B7CF6),
                    icon: Icons.account_balance_wallet_outlined,
                  ),
                  _projectCard(
                    title: 'LearningEcke',
                    subtitle: 'Interactive BLE Sandbox',
                    platform: 'FLUTTER • WEB & MOBILE',
                    description: 'An educational app used in tech colleges to teach hardware IoT protocols and Bluetooth GATT characteristics.',
                    metrics: [
                      'Simulated virtual bluetooth terminal logs.',
                      'Asynchronous RxDart streams and event subscriptions.',
                      'Progress caching using persistent Hive database.'
                    ],
                    accentColor: const Color(0xFFFFB84D),
                    icon: Icons.bluetooth_searching,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _projectCard({
    required String title,
    required String subtitle,
    required String platform,
    required String description,
    required List<String> metrics,
    required Color accentColor,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0E1322),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.04)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
          )
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Accent Banner
          Container(
            height: 6,
            color: accentColor,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(icon, color: accentColor, size: 32),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: accentColor.withOpacity(0.2)),
                        ),
                        child: Text(
                          title.toUpperCase(),
                          style: TextStyle(color: accentColor, fontSize: 9, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Space Grotesk')),
                  Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.4))),
                  const SizedBox(height: 8),
                  Text(platform, style: TextStyle(color: accentColor, fontSize: 10, fontWeight: FontWeight.bold, fontFamily: 'monospace')),
                  const SizedBox(height: 16),
                  Text(description, style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.4)),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.white10),
                  const SizedBox(height: 16),
                  ...metrics.map((m) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('⚡ ', style: TextStyle(color: accentColor, fontSize: 10)),
                        Expanded(child: Text(m, style: const TextStyle(color: Colors.white54, fontSize: 12))),
                      ],
                    ),
                  )).toList()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ==================== 6. CONTACT SECTION ====================
class ContactPortalSection extends StatefulWidget {
  const ContactPortalSection({Key? key}) : super(key: key);

  @override
  State<ContactPortalSection> createState() => _ContactPortalSectionState();
}

class _ContactPortalSectionState extends State<ContactPortalSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _msgController = TextEditingController();

  bool _isSending = false;
  bool _sendSuccess = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _msgController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      // Simulate network communication loop
      Future.delayed(const Duration(seconds: 1500), () {
        if (mounted) {
          setState(() {
            _isSending = false;
            _sendSuccess = true;
          });
          _nameController.clear();
          _emailController.clear();
          _msgController.clear();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color(0xFF3DDC84),
              content: Text('Envelope dispatched successfully! Rushikesh will get back to you shortly.', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          );
        }
      });
    }
  }

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
              const Text(
                '// contact_portal()',
                style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 13),
              ),
              const SizedBox(height: 12),
              const Text(
                'Secure Communication Portal',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                width: 60,
                height: 4,
                decoration: const BoxDecoration(
                  color: Color(0xFF8B7CF6),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              const SizedBox(height: 60),

              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left: Form Info Cards
                  Expanded(
                    flex: isMobile ? 0 : 5,
                    child: Column(
                      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Let\'s build something extraordinary together.',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Need a senior developer to deliver Bluetooth Low Energy firmware handshakes, custom Canvas render layouts, robust state machines, or full-cycle App Store deployments? Drop me a ping.',
                          style: TextStyle(color: Colors.white54, height: 1.5, fontSize: 13),
                        ),
                        const SizedBox(height: 40),
                        _contactShortcutTile(
                          icon: Icons.email,
                          label: 'Direct Email',
                          value: 'petkarrushikesh666@gmail.com',
                          onTap: () => _copyToClipboard('petkarrushikesh666@gmail.com'),
                        ),
                        const SizedBox(height: 16),
                        _contactShortcutTile(
                          icon: Icons.link,
                          label: 'LinkedIn Professional Profile',
                          value: 'linkedin.com/in/rushikesh-petkar-991560249',
                          onTap: () => _launchURL('https://linkedin.com/in/rushikesh-petkar-991560249'),
                        ),
                        const SizedBox(height: 16),
                        _contactShortcutTile(
                          icon: Icons.code,
                          label: 'GitHub Repositories',
                          value: 'github.com/petkarrushikesh',
                          onTap: () => _launchURL('https://github.com/petkarrushikesh'),
                        ),
                      ],
                    ),
                  ),

                  if (!isMobile) const SizedBox(width: 60),
                  if (isMobile) const SizedBox(height: 50),

                  // Right: Form Canvas
                  Expanded(
                    flex: isMobile ? 0 : 5,
                    child: Container(
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0E1322),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white.withOpacity(0.04)),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ENCRYPTED ENVELOPE',
                              style: TextStyle(fontSize: 10, fontFamily: 'monospace', color: Color(0xFF8B7CF6), fontWeight: FontWeight.bold, letterSpacing: 1.2),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _nameController,
                              style: const TextStyle(fontSize: 14),
                              decoration: _inputStyle('Your Name', Icons.person_outline),
                              validator: (val) => val == null || val.isEmpty ? 'Please specify your identity.' : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _emailController,
                              style: const TextStyle(fontSize: 14),
                              keyboardType: TextInputType.emailAddress,
                              decoration: _inputStyle('Email Address', Icons.mail_outline),
                              validator: (val) {
                                if (val == null || val.isEmpty) return 'Please specify contact email.';
                                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                if (!emailRegex.hasMatch(val)) return 'Please provide a valid email format.';
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _msgController,
                              style: const TextStyle(fontSize: 14),
                              maxLines: 4,
                              decoration: _inputStyle('Task Requirements / Message', Icons.edit_note),
                              validator: (val) => val == null || val.isEmpty ? 'Please write your query.' : null,
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _isSending ? null : _submitForm,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3DDC84),
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                child: _isSending
                                    ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
                                )
                                    : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.send_rounded, size: 16),
                                    const SizedBox(width: 8),
                                    Text(
                                      _sendSuccess ? 'Resend Envelope' : 'Send Encrypted Message',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _contactShortcutTile({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.01),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.03)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF3DDC84).withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF3DDC84), size: 18),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontSize: 10, color: Colors.white38, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(value, style: const TextStyle(fontSize: 12.5, fontFamily: 'monospace', color: Colors.white70)),
                ],
              ),
            ),
            const Icon(Icons.copy, size: 14, color: Colors.white24),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputStyle(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.white38, size: 18),
      filled: true,
      fillColor: Colors.black26,
      hintStyle: const TextStyle(color: Colors.white24, fontSize: 13),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white10),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF3DDC84), width: 1.5),
      ),
    );
  }

  void _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Copied: $text'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}

// ==================== 7.FOOTER ====================
class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10);
  }
} */