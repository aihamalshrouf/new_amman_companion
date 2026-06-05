import 'package:flutter/material.dart';
import '../controllers/smart_district_controller.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'explore':
        return Icons.explore_rounded;
      case 'status':
        return Icons.verified_rounded;
      case 'info':
        return Icons.info_rounded;
      case 'feedback':
        return Icons.rate_review_rounded;
      default:
        return Icons.circle_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = SmartDistrictController().guideSteps;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: const Color(0xFFECFDF5),
            borderRadius: BorderRadius.circular(26),
          ),
          child: const Text(
            'This guide helps visitors understand how to explore the smart district safely and easily.',
            style: TextStyle(
              color: Color(0xFF064E3B),
              height: 1.6,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ...steps.map(
          (step) => Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: const Color(0xFF0F766E),
                  child: Icon(_getIcon(step.iconName), color: Colors.white),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Step ${step.stepNumber}',
                        style: const TextStyle(
                          color: Color(0xFF0F766E),
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        step.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 17,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        step.description,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
