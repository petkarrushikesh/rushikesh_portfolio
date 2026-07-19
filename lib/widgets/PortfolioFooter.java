import 'package:flutter/material.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      border: const Border(top: BorderSide(color: Colors.white10)),
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
                children: [
                  TextSpan(text: 'rushikesh', style: TextStyle(color: Colors.white54)),
                  TextSpan(text: '.dev', style: TextStyle(color: Color(0xFF3DDC84))),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Designed & Compiled with ⚡ Flutter & Dart\n© 2026 Rushikesh Petkar. All rights reserved.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white24, fontSize: 11, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
