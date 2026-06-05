import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  Color get _backgroundColor {
    switch (status) {
      case 'Available':
        return const Color(0xFFD1FAE5);
      case 'Busy':
        return const Color(0xFFFEF3C7);
      case 'Maintenance':
        return const Color(0xFFFEE2E2);
      case 'Coming Soon':
        return const Color(0xFFE0E7FF);
      default:
        return const Color(0xFFE5E7EB);
    }
  }

  Color get _textColor {
    switch (status) {
      case 'Available':
        return const Color(0xFF065F46);
      case 'Busy':
        return const Color(0xFF92400E);
      case 'Maintenance':
        return const Color(0xFF991B1B);
      case 'Coming Soon':
        return const Color(0xFF3730A3);
      default:
        return const Color(0xFF374151);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: _textColor,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}
