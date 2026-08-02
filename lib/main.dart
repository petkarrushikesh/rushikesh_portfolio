import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import our modular custom components
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer_section.dart';

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

  // --- FIX: approximate fallback offsets, reusing the same thresholds
  // already used in _onScroll. If a section's GlobalKey hasn't been laid
  // out yet (can happen with lazy slivers), we scroll here instead of
  // silently doing nothing. Real ensureVisible is still tried first.
  static const Map<String, double> _fallbackOffsets = {
    'hero': 0,
    'about': 500,
    'experience': 1200,
    'skills': 2100,
    'projects': 2900,
    'contact': 3900,
  };

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

  // --- FIX: this is the actual bug. With CustomScrollView + SliverList,
  // sections far from the viewport aren't built/laid out yet, so
  // key.currentContext can be null and Scrollable.ensureVisible silently
  // no-ops. We now retry on the next frame, and fall back to a direct
  // animateTo() using known approximate offsets if the context still
  // isn't available.
  void _scrollToSection(GlobalKey key, String sectionId) {
    setState(() => _activeSection = sectionId);

    void attemptScroll() {
      final targetContext = key.currentContext;
      if (targetContext != null) {
        Scrollable.ensureVisible(
          targetContext,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
        );
      } else if (_scrollController.hasClients) {
        final fallback = _fallbackOffsets[sectionId] ?? 0.0;
        final maxExtent = _scrollController.position.maxScrollExtent;
        _scrollController.animateTo(
          fallback.clamp(0.0, maxExtent),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
        );
      }
    }

    // Give the frame a chance to build/lay out the target sliver child
    // before we try to measure it (matters right after closing the drawer).
    WidgetsBinding.instance.addPostFrameCallback((_) => attemptScroll());
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
                // --- FIX: force every sliver child to be built and laid
                // out up front (instead of only near the viewport) so
                // every GlobalKey has a valid currentContext at all times,
                // no matter where you tap from (navbar or drawer).
                cacheExtent: 6000,
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
                      ExperienceSection(key: _experienceKey),

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