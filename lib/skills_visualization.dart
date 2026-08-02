import 'package:flutter/material.dart';

class SkillsVisualization extends StatefulWidget {
  const SkillsVisualization({Key? key}) : super(key: key);

  @override
  State<SkillsVisualization> createState() => _SkillsVisualizationState();
}

class _SkillsVisualizationState extends State<SkillsVisualization> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  final ValueNotifier<String?> _hoveredSkillId = ValueNotifier<String?>(null);
  String? _selectedSkillId;

  final List<SkillNode> _skills = [
    SkillNode(
      id: 'android',
      name: 'Android (Kotlin/Java)',
      category: 'core',
      proficiency: 0.95,
      description: 'Native Android application developer. Extensive experience managing threads, performance optimization, and hardware bindings.',
      libraries: ['Retrofit', 'Coroutines', 'Jetpack Compose', 'Room Database', 'Dagger Hilt', 'WorkManager'],
      x: 0.3,
      y: 0.22,
      connections: ['flutter', 'rest_api', 'firebase'],
    ),
    SkillNode(
      id: 'flutter',
      name: 'Flutter',
      category: 'core',
      proficiency: 0.95,
      description: 'Cross-platform app development engine. Experienced in building custom renderers, BLE services, and state synchronization pipelines.',
      libraries: ['Flutter Blue Plus', 'flutter_bloc', 'Provider', 'Hive DB', 'Dio', 'Path Provider'],
      x: 0.5,
      y: 0.35,
      connections: ['dart', 'bloc', 'ble_iot'],
    ),
    SkillNode(
      id: 'dart',
      name: 'Dart',
      category: 'core',
      proficiency: 0.90,
      description: 'Structured programming for reactive user interfaces. Proficient with isolates, stream manipulation, and asynchronous programming.',
      libraries: ['Streams & Sinks', 'Isolates', 'Reflection', 'JSON Serialization'],
      x: 0.68,
      y: 0.20,
      connections: ['flutter', 'rest_api'],
    ),
    SkillNode(
      id: 'bloc',
      name: 'BLoC / Provider',
      category: 'core',
      proficiency: 0.95,
      description: 'Advanced state management to decouple presentation from business layers. Zero-leak streams and scalable state machines.',
      libraries: ['BlocProvider', 'MultiBlocListener', 'StreamController', 'ChangeNotifier'],
      x: 0.45,
      y: 0.58,
      connections: ['flutter', 'sql'],
    ),
    SkillNode(
      id: 'ble_iot',
      name: 'BLE / IoT',
      category: 'specialized',
      proficiency: 0.85,
      description: 'Bluetooth Low Energy interaction with microcontrollers and EV chargers. Proficient in GATT profiles, services, and OCPP packet logs parsing.',
      libraries: ['GATT Services', 'MTU Negotiation', 'Serial UART', 'OCPP Protocols'],
      x: 0.22,
      y: 0.50,
      connections: ['flutter', 'android', 'sql'],
    ),
    SkillNode(
      id: 'rest_api',
      name: 'REST APIs',
      category: 'specialized',
      proficiency: 0.90,
      description: 'Secure, high-speed transactional client-server integrations. Token caching, interceptors, and robust HTTP error status mapping.',
      libraries: ['Dio Client', 'Http Interceptors', 'JWT Security', 'Mock Adapter'],
      x: 0.78,
      y: 0.45,
      connections: ['android', 'dart', 'firebase'],
    ),
    SkillNode(
      id: 'razorpay',
      name: 'Razorpay / Payments',
      category: 'specialized',
      proficiency: 0.88,
      description: 'Secure commercial monetization. Implemented order creation checkout sheets and validation signatures verification.',
      libraries: ['Checkout Sheets', 'Razorpay SDK', 'Webhooks', 'Transaction Audits'],
      x: 0.60,
      y: 0.75,
      connections: ['flutter', 'rest_api'],
    ),
    SkillNode(
      id: 'sql',
      name: 'SQL / Local Cache',
      category: 'specialized',
      proficiency: 0.82,
      description: 'Relational local databases to enforce offline-first capability. Highly optimized query schemas and database encryption.',
      libraries: ['SQLite Cipher', 'Room Caching', 'Hive NoSQL', 'Shared Prefs'],
      x: 0.32,
      y: 0.78,
      connections: ['ble_iot', 'bloc'],
    ),
    SkillNode(
      id: 'play_store',
      name: 'Play Store Deploy',
      category: 'tools',
      proficiency: 0.95,
      description: 'Complete release management on Google Play Console. Keystore signing, App Bundle optimizations, and setting up testing tracks.',
      libraries: ['Keystore Vault', 'App Bundles (AAB)', 'Internal Testing', 'Crash Reports'],
      x: 0.10,
      y: 0.30,
      connections: ['android', 'firebase'],
    ),
    SkillNode(
      id: 'git_github',
      name: 'Git & GitHub',
      category: 'tools',
      proficiency: 0.90,
      description: 'Distributed source control with strict branching workflows. PR reviews, merge conflict resolutions, and CI/CD GitHub actions.',
      libraries: ['Git Branching', 'CI/CD YAML Actions', 'Rebase & Cherry-pick'],
      x: 0.90,
      y: 0.30,
      connections: ['rest_api'],
    ),
    SkillNode(
      id: 'firebase',
      name: 'Firebase Suite',
      category: 'tools',
      proficiency: 0.92,
      description: 'Cloud platform services. Firebase Cloud Messaging (FCM) dynamic push alerts, firestore cloud database, and crashlytics diagnostic logs.',
      libraries: ['FCM Push Service', 'Firestore NoSQL', 'Crashlytics', 'Google Analytics'],
      x: 0.85,
      y: 0.70,
      connections: ['rest_api', 'razorpay'],
    ),
    SkillNode(
      id: 'ui_ux',
      name: 'UI/UX Design',
      category: 'tools',
      proficiency: 0.85,
      description: 'Atomic visual system architecture in Figma. Transcribing layout wireframes into responsive, high-performance animation streams.',
      libraries: ['Figma Tooling', 'Motion Animation Curves', 'Typography Pairing'],
      x: 0.12,
      y: 0.72,
      connections: ['ble_iot', 'play_store'],
    ),
    SkillNode(
      id: 'java',
      name: 'Java',
      category: 'tools',
      proficiency: 0.85,
      description: 'Basic Java programming. with basic DSA',
      libraries: ['JDK', 'SpringBoot', 'Threading'],
      x: 0.12,
      y: 0.72,
      connections: ['ble', 'play'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    )..repeat();
    _selectedSkillId = 'flutter';
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _hoveredSkillId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: _hoveredSkillId,
      builder: (context, hoveredId, _) {
        final activeSkillId = hoveredId ?? _selectedSkillId;
        final activeSkill = _skills.firstWhere((s) => s.id == activeSkillId);

        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 768;

            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF070A13),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Interactive Area - Fixed height is CRITICAL here
                  SizedBox(
                    height: isMobile ? 350 : 500,
                    child: Stack(
                      children: [
                        Positioned.fill(child: CustomPaint(painter: GridBackgroundPainter())),
                        Positioned.fill(
                          child: CustomPaint(
                            painter: NetworkLinesPainter(
                              skills: _skills,
                              activeSkillId: activeSkillId,
                            ),
                          ),
                        ),
                        ..._skills.map((skill) {
                          final isActive = skill.id == activeSkillId;
                          return Positioned(
                            left: skill.x * constraints.maxWidth * (isMobile ? 0.85 : 0.8) + (isMobile ? 10 : 60),
                            top: skill.y * (isMobile ? 280 : 440) + 20,
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              onEnter: (_) => _hoveredSkillId.value = skill.id,
                              onExit: (_) => _hoveredSkillId.value = null,
                              child: GestureDetector(
                                onTap: () => setState(() => _selectedSkillId = skill.id),
                                child: SkillNodeBubble(skill: skill, isActive: isActive),
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  Container(height: 1, color: Colors.white.withOpacity(0.08)),
                  // HUD Panel
                  _buildHUDPanel(activeSkill),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHUDPanel(SkillNode activeSkill) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Color(0xFF0E1322),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: activeSkill.category == 'core' ? const Color(0xFF3DDC84).withOpacity(0.3) : const Color(0xFF8B7CF6).withOpacity(0.3)),
                ),
                child: Icon(_getIconData(activeSkill.id), color: activeSkill.category == 'core' ? const Color(0xFF3DDC84) : const Color(0xFF8B7CF6), size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(activeSkill.name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk')),
                        const SizedBox(width: 8),
                        _buildCategoryBadge(activeSkill),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _buildProficiencyBar(activeSkill),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(activeSkill.description, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 13, height: 1.5)),
          const SizedBox(height: 16),
          const Text('LIBRARIES / CORE TECHNOLOGIES', style: TextStyle(color: Color(0xFF475569), fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: activeSkill.libraries.map((lib) => _buildTechTag(lib)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge(SkillNode skill) {
    final color = skill.category == 'core' ? const Color(0xFF3DDC84) : const Color(0xFF8B7CF6);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Text(skill.category.toUpperCase(), style: TextStyle(color: color, fontSize: 9, fontWeight: FontWeight.bold, fontFamily: 'monospace')),
    );
  }

  Widget _buildProficiencyBar(SkillNode skill) {
    final color = skill.category == 'core' ? const Color(0xFF3DDC84) : const Color(0xFF8B7CF6);
    return Row(
      children: [
        Text('${(skill.proficiency * 100).toInt()}%', style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold, fontFamily: 'monospace')),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 4,
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(2)),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: skill.proficiency,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [const Color(0xFF3DDC84), color]),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTechTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.35),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 11, fontFamily: 'monospace')),
    );
  }

  IconData _getIconData(String id) {
    switch (id) {
      case 'android': return Icons.developer_mode;
      case 'flutter': return Icons.layers_outlined;
      case 'dart': return Icons.code;
      case 'bloc': return Icons.alt_route;
      case 'ble_iot': return Icons.bluetooth;
      case 'rest_api': return Icons.cloud_queue;
      case 'razorpay': return Icons.payment;
      case 'sql': return Icons.storage;
      case 'play_store': return Icons.shop_two_outlined;
      case 'git_github': return Icons.source_outlined;
      case 'firebase': return Icons.local_fire_department_outlined;
      case 'java' : return Icons.javascript_rounded;
      default: return Icons.star_border;
    }
  }
}

class SkillNodeBubble extends StatelessWidget {
  final SkillNode skill;
  final bool isActive;
  const SkillNodeBubble({Key? key, required this.skill, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColor = skill.category == 'core' ? const Color(0xFF3DDC84) : const Color(0xFF8B7CF6);
    return Container(
      width: 48, height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? themeColor : const Color(0xFF0E1322),
        shape: BoxShape.circle,
        border: Border.all(color: isActive ? Colors.white : themeColor.withOpacity(0.4), width: 2),
        boxShadow: isActive ? [BoxShadow(color: themeColor.withOpacity(0.4), blurRadius: 16, spreadRadius: 2)] : [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 6)],
      ),
      child: Icon(_getIconData(skill.id), color: isActive ? Colors.black : themeColor, size: 20),
    );
  }

  IconData _getIconData(String id) {
    switch (id) {
      case 'android': return Icons.developer_mode;
      case 'flutter': return Icons.layers_outlined;
      case 'dart': return Icons.code;
      case 'bloc': return Icons.alt_route;
      case 'ble_iot': return Icons.bluetooth;
      case 'rest_api': return Icons.cloud_queue;
      case 'razorpay': return Icons.payment;
      case 'sql': return Icons.storage;
      case 'play_store': return Icons.shop_two_outlined;
      case 'git_github': return Icons.source_outlined;
      case 'firebase': return Icons.local_fire_department_outlined;
      case 'java' : return Icons.javascript_rounded;
      default: return Icons.star_border;
    }
  }
}

class NetworkLinesPainter extends CustomPainter {
  final List<SkillNode> skills;
  final String? activeSkillId;
  NetworkLinesPainter({required this.skills, required this.activeSkillId});

  @override
  void paint(Canvas canvas, Size size) {
    final activeSkill = activeSkillId != null ? skills.firstWhere((s) => s.id == activeSkillId) : null;
    for (var skill in skills) {
      final startOffset = Offset(skill.x * size.width * 0.8 + 84, skill.y * size.height + 44);
      for (var targetId in skill.connections) {
        final target = skills.firstWhere((s) => s.id == targetId, orElse: () => skill);
        if (target == skill) continue;
        final endOffset = Offset(target.x * size.width * 0.8 + 84, target.y * size.height + 44);
        final bool isHighlighted = activeSkill != null && (skill.id == activeSkillId || target.id == activeSkillId);
        final paint = Paint()..strokeWidth = isHighlighted ? 2.5 : 1.0..style = PaintingStyle.stroke;
        if (isHighlighted) {
          paint.shader = LinearGradient(colors: [skill.category == 'core' ? const Color(0xFF3DDC84) : const Color(0xFF8B7CF6), target.category == 'core' ? const Color(0xFF3DDC84) : const Color(0xFF8B7CF6)]).createShader(Rect.fromPoints(startOffset, endOffset));
        } else {
          paint.color = Colors.white.withOpacity(0.04);
        }
        canvas.drawLine(startOffset, endOffset, paint);
      }
    }
  }
  @override
  bool shouldRepaint(covariant NetworkLinesPainter oldDelegate) => oldDelegate.activeSkillId != activeSkillId;
}

class GridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.015)..strokeWidth = 1.0;
    const double step = 40.0;
    for (double x = 0; x < size.width; x += step) { canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint); }
    for (double y = 0; y < size.height; y += step) { canvas.drawLine(Offset(0, y), Offset(size.width, y), paint); }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SkillNode {
  final String id, name, category, description;
  final double proficiency, x, y;
  final List<String> libraries, connections;
  SkillNode({required this.id, required this.name, required this.category, required this.proficiency, required this.description, required this.libraries, required this.x, required this.y, required this.connections});
}
