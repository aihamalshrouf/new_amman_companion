import 'package:flutter/material.dart';
import '../controllers/smart_district_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SmartDistrictController();
    final availableCount = controller.services
        .where((service) => service.status == 'Available')
        .length;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SmartCityHero(
            servicesCount: controller.services.length,
            availableCount: availableCount,
          ),
          const SizedBox(height: 24),
          const _SectionHeader(
            title: 'Smart City Experience',
            subtitle: 'A companion app that supports visitors inside NEW AMMAN.',
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(
                child: _MiniFeatureCard(
                  icon: Icons.location_city_rounded,
                  title: 'Smart Zones',
                  subtitle: 'Services organized by city areas.',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MiniFeatureCard(
                  icon: Icons.sensors_rounded,
                  title: 'Live Status',
                  subtitle: 'Availability shown clearly.',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: _MiniFeatureCard(
                  icon: Icons.route_rounded,
                  title: 'Visitor Guide',
                  subtitle: 'Simple steps for users.',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _MiniFeatureCard(
                  icon: Icons.rate_review_rounded,
                  title: 'Feedback',
                  subtitle: 'Ratings improve services.',
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          const _SectionHeader(
            title: 'Explore NEW AMMAN',
            subtitle: 'Discover smart city services through a clean visitor guide.',
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.public_rounded,
                  color: Color(0xFF008C8C),
                  size: 34,
                ),
                SizedBox(height: 14),
                Text(
                  'Your Smart District Guide',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF071827),
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Use the app to view smart services, understand each zone, check service status, and send visitor feedback by email.',
                  style: TextStyle(
                    color: Color(0xFF475569),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SmartCityHero extends StatelessWidget {
  final int servicesCount;
  final int availableCount;

  const _SmartCityHero({
    required this.servicesCount,
    required this.availableCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF061826),
            Color(0xFF063A4B),
            Color(0xFF00A6A6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00A6A6).withOpacity(0.22),
            blurRadius: 28,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -45,
            top: -55,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.10),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomPaint(
              size: const Size(double.infinity, 130),
              painter: _SkylinePainter(),
            ),
          ),
          Positioned(
            left: 24,
            top: 26,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.16),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.white.withOpacity(0.24)),
                  ),
                  child: const Text(
                    'SMART CITY VISITOR GUIDE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'NEW AMMAN\nCompanion',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    height: 1.04,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'A professional Flutter companion app for exploring smart city services, visitor guidance, service status, and feedback.',
                  style: TextStyle(
                    color: Color(0xFFE0F7FA),
                    height: 1.55,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _HeroMetric(value: '$servicesCount', label: 'Services'),
                    const SizedBox(width: 12),
                    _HeroMetric(value: '$availableCount', label: 'Available'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroMetric extends StatelessWidget {
  final String value;
  final String label;

  const _HeroMetric({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.14),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFFBDECEF),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkylinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final buildingPaint = Paint()..color = Colors.white.withOpacity(0.16);
    final lightPaint = Paint()..color = const Color(0xFF67E8F9).withOpacity(0.60);

    final buildings = [
      const Rect.fromLTWH(16, 46, 38, 84),
      const Rect.fromLTWH(66, 20, 46, 110),
      const Rect.fromLTWH(126, 58, 52, 72),
      const Rect.fromLTWH(194, 10, 42, 120),
      const Rect.fromLTWH(252, 38, 58, 92),
      const Rect.fromLTWH(328, 28, 44, 102),
    ];

    for (final rect in buildings) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(6)),
        buildingPaint,
      );

      for (double y = rect.top + 14; y < rect.bottom - 10; y += 18) {
        for (double x = rect.left + 9; x < rect.right - 8; x += 16) {
          canvas.drawCircle(Offset(x, y), 2, lightPaint);
        }
      }
    }

    final roadPaint = Paint()..color = Colors.white.withOpacity(0.08);
    canvas.drawRect(Rect.fromLTWH(0, 112, size.width, 18), roadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionHeader({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 21,
            color: Color(0xFF071827),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF64748B),
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class _MiniFeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _MiniFeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xFFE0F7FA),
            child: Icon(icon, color: const Color(0xFF008C8C)),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0xFF071827),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 12,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
