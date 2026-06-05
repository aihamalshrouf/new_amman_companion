import 'package:flutter/material.dart';
import '../controllers/smart_district_controller.dart';
import '../models/service_model.dart';
import '../widgets/service_card.dart';
import 'service_details_screen.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final SmartDistrictController _controller = SmartDistrictController();
  String _searchQuery = '';
  String _selectedType = 'All';

  @override
  Widget build(BuildContext context) {
    final List<ServiceModel> filteredServices = _controller.filterServices(
      query: _searchQuery,
      selectedType: _selectedType,
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search services...',
              prefixIcon: const Icon(Icons.search_rounded),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 48,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemCount: _controller.serviceTypes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final type = _controller.serviceTypes[index];
              final isSelected = type == _selectedType;

              return ChoiceChip(
                label: Text(type),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    _selectedType = type;
                  });
                },
                selectedColor: const Color(0xFF0F766E),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF334155),
                  fontWeight: FontWeight.w700,
                ),
                backgroundColor: Colors.white,
                side: BorderSide.none,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: filteredServices.isEmpty
              ? const Center(
                  child: Text(
                    'No services found.',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  itemCount: filteredServices.length,
                  itemBuilder: (context, index) {
                    final service = filteredServices[index];

                    return ServiceCard(
                      service: service,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ServiceDetailsScreen(service: service),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
