import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../widgets/status_badge.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetailsScreen({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          service.title,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.network(
              service.networkImageUrl,
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Image.asset(
                service.imagePath,
                height: 230,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              StatusBadge(status: service.status),
              const SizedBox(width: 10),
              Chip(
                label: Text(service.type),
                backgroundColor: const Color(0xFFE0F2FE),
                labelStyle: const TextStyle(
                  color: Color(0xFF0369A1),
                  fontWeight: FontWeight.w700,
                ),
                side: BorderSide.none,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            service.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on_rounded, color: Color(0xFF0F766E)),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  service.location,
                  style: const TextStyle(
                    color: Color(0xFF475569),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            service.description,
            style: const TextStyle(
              color: Color(0xFF334155),
              height: 1.65,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Highlights',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          ...service.highlights.map(
            (highlight) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle_rounded, color: Color(0xFF0F766E)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      highlight,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
