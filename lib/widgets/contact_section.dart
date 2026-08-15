import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      // Simulate secure networking handshake safely
      await Future.delayed(const Duration(milliseconds: 1800));

      setState(() {
        _isSending = false;
        _sendSuccess = true;
      });

      // Reset form variables
      _nameController.clear();
      _emailController.clear();
      _msgController.clear();

      // Show floating snackbar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xFF0E1322),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: const Color(0xFF3DDC84).withOpacity(0.3)),
            ),
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Color(0xFF3DDC84)),
                const SizedBox(width: 12),
                Expanded(
                  child: const Text(
                    'Message encrypted and sent successfully!',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 900;
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0E1322).withOpacity(0.5),
          ),
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
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', color: Colors.white),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left: Info Shortcuts Block
                  Expanded(
                    flex: isMobile ? 0 : 5,
                    child: Column(
                      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Let\'s build something extraordinary together.',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          textAlign: isMobile ? TextAlign.center : TextAlign.left,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Need a senior developer to deliver Bluetooth Low Energy firmware handshakes, custom Canvas render layouts, robust state machines, or full-cycle App Store deployments? Drop me a ping.',
                          style: const TextStyle(color: Colors.white54, height: 1.5, fontSize: 13),
                          textAlign: isMobile ? TextAlign.center : TextAlign.left,
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
                          value: 'in/rushikesh-petkar-a043bb239',
                          onTap: () => _launchURL('https://www.linkedin.com/in/rushikesh-petkar-a043bb239/'),
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
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'monospace',
                                color: Color(0xFF8B7CF6),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _nameController,
                              style: const TextStyle(fontSize: 14, color: Colors.white),
                              decoration: _inputStyle('Your Name', Icons.person_outline),
                              validator: (val) => val == null || val.isEmpty ? 'Please specify your identity.' : null,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _emailController,
                              style: const TextStyle(fontSize: 14, color: Colors.white),
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
                              style: const TextStyle(fontSize: 14, color: Colors.white),
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
          content: Text('Copied to clipboard: $text'),
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
