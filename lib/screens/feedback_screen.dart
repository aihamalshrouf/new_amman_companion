import 'package:flutter/material.dart';
import '../controllers/smart_district_controller.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _commentController = TextEditingController();
  final _services = SmartDistrictController().services;
  String? _selectedService;
  double _rating = 4;

  @override
  void initState() {
    super.initState();
    _selectedService = _services.first.title;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Thank you! Feedback submitted for $_selectedService with rating ${_rating.toStringAsFixed(1)}.',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
    _commentController.clear();
    setState(() {
      _rating = 4;
      _selectedService = _services.first.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF312E81), Color(0xFF0EA5E9)],
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.rate_review_rounded, color: Colors.white, size: 34),
              SizedBox(height: 12),
              Text(
                'Visitor Feedback',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Your opinion helps improve the smart district visitor experience.',
                style: TextStyle(color: Colors.white70, height: 1.5),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Select Service',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedService,
          items: _services
              .map(
                (service) => DropdownMenuItem(
                  value: service.title,
                  child: Text(service.title),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedService = value;
            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'Rating: ${_rating.toStringAsFixed(1)}',
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        Slider(
          value: _rating,
          min: 1,
          max: 5,
          divisions: 8,
          label: _rating.toStringAsFixed(1),
          onChanged: (value) {
            setState(() {
              _rating = value;
            });
          },
        ),
        const SizedBox(height: 12),
        const Text(
          'Comment',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _commentController,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Write your feedback here...',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: _submitFeedback,
          icon: const Icon(Icons.send_rounded),
          label: const Text('Submit Feedback'),
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
