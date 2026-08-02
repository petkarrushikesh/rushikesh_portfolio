import 'package:flutter/material.dart';
import '../skills_visualization.dart';

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
                '// technical_ecosystem()',
                style: TextStyle(color: Color(0xFF3DDC84), fontFamily: 'monospace', fontSize: 13),
              ),
              const SizedBox(height: 12),
              const Text(
                'Interactive Skill Topology',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', color: Colors.white),
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
              const SizedBox(height: 30),
              const Text(
                'Tapped node coordinates load hardware credentials & package telemetry on the diagnostic HUD panel.',
                style: TextStyle(fontSize: 14, color: Colors.white54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),

              // Custom painted interactable Node Graph Widget
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1000),
                child: const SkillsVisualization(),
              ),
            ],
          ),
        );
      },
    );
  }
}
