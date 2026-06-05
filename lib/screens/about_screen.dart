import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _openLink(BuildContext context) async {
    final Uri url = Uri.parse('https://github.com/aihamalshrouf');
    final success = await launchUrl(url, mode: LaunchMode.externalApplication);

    if (!success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the link.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF061826), Color(0xFF008C8C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.white.withOpacity(0.16),
                child: Image.asset(
                  'assets/images/app_launcher_icon.png',
                  width: 68,
                  height: 68,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'NEW AMMAN Companion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Smart City Tourism / Visitor Guide App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFCFFAFE),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const _InfoCard(
          title: 'Project Purpose',
          content:
              'This Flutter app supports the NEW AMMAN Smart District graduation project by improving the visitor experience. It does not directly control the main system; it helps users explore services, check service status, read guidance, and submit feedback.',
        ),
        const _InfoCard(
          title: 'Student Information',
          content:
              'Student: Ayham Alshrouf\nMajor: Intelligent Systems Engineering\nSelected Idea: Tourism / Visitor Guide App\nProject Type: Companion Support Application',
        ),
        FilledButton.icon(
          onPressed: () => _openLink(context),
          icon: const Icon(Icons.link_rounded),
          label: const Text('Open GitHub Profile'),
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const _InfoCard({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              color: Color(0xFF475569),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
