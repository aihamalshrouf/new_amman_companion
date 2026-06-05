import '../models/service_model.dart';
import '../models/guide_step_model.dart';

class SmartDistrictController {
  final List<ServiceModel> services = const [
    ServiceModel(
      title: 'Jarvis Café',
      type: 'Café',
      status: 'Available',
      location: 'Smart Plaza - Zone A',
      imagePath: 'assets/images/cafe.png',
      logoPath: 'assets/images/service_cafe_logo.png',
      networkImageUrl: 'https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?w=900',
      description:
          'A smart café experience that introduces visitors to digital ordering, modern service flow, and technology-supported interaction inside the smart city environment.',
      highlights: [
        'Digital visitor service',
        'Smart café concept',
        'Clear usage instructions',
      ],
    ),
    ServiceModel(
      title: 'Smart Fashion Corner',
      type: 'Shopping',
      status: 'Busy',
      location: 'Retail District - Zone B',
      imagePath: 'assets/images/fashion.png',
      logoPath: 'assets/images/service_fashion_logo.png',
      networkImageUrl: 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=900',
      description:
          'A modern retail guide that helps visitors understand smart shopping services, organized product categories, and future fashion technology concepts.',
      highlights: [
        'Smart retail experience',
        'Organized product guidance',
        'Visitor-friendly shopping flow',
      ],
    ),
    ServiceModel(
      title: 'Robot Assistance Point',
      type: 'Technology',
      status: 'Available',
      location: 'Automation Hub - Zone C',
      imagePath: 'assets/images/robot.png',
      logoPath: 'assets/images/service_robot_logo.png',
      networkImageUrl: 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=900',
      description:
          'An information point that explains robot-assisted services and automation concepts to visitors.',
      highlights: [
        'Robot service awareness',
        'Automation explanation',
        'Safe visitor instructions',
      ],
    ),
    ServiceModel(
      title: 'Smart Parking Guide',
      type: 'Mobility',
      status: 'Maintenance',
      location: 'Mobility Gate - Zone D',
      imagePath: 'assets/images/parking.png',
      logoPath: 'assets/images/service_parking_logo.png',
      networkImageUrl: 'https://images.unsplash.com/photo-1506521781263-d8422e82f27a?w=900',
      description:
          'A smart mobility guide for parking areas, entrance instructions, traffic flow support, and visitor movement inside the district.',
      highlights: [
        'Parking guidance',
        'Smart mobility concept',
        'Entrance support',
      ],
    ),
    ServiceModel(
      title: 'Emergency Safety Point',
      type: 'Safety',
      status: 'Available',
      location: 'Safety Node - Zone E',
      imagePath: 'assets/images/safety.png',
      logoPath: 'assets/images/service_safety_logo.png',
      networkImageUrl: 'https://images.unsplash.com/photo-1581090464777-f3220bbe1b8b?w=900',
      description:
          'A safety information point that helps visitors identify emergency areas, understand safety instructions, and follow basic response guidance.',
      highlights: [
        'Emergency awareness',
        'Safety zone information',
        'Visitor support',
      ],
    ),
  ];

  final List<GuideStepModel> guideSteps = const [
    GuideStepModel(
      stepNumber: 1,
      title: 'Open the Smart City Map',
      description: 'Start by exploring the available services, zones, and smart city points.',
      iconName: 'explore',
    ),
    GuideStepModel(
      stepNumber: 2,
      title: 'Check Service Status',
      description: 'Each service shows a clear status: Available, Busy, Maintenance, or Coming Soon.',
      iconName: 'status',
    ),
    GuideStepModel(
      stepNumber: 3,
      title: 'Read Service Instructions',
      description: 'Open the details screen to understand the location, purpose, and visitor instructions.',
      iconName: 'info',
    ),
    GuideStepModel(
      stepNumber: 4,
      title: 'Submit Visitor Feedback',
      description: 'Rate the service and write a comment to support future improvement.',
      iconName: 'feedback',
    ),
  ];

  List<String> get serviceTypes {
    final types = services.map((service) => service.type).toSet().toList();
    return ['All', ...types];
  }

  List<ServiceModel> filterServices({
    required String query,
    required String selectedType,
  }) {
    final cleanQuery = query.trim().toLowerCase();

    return services.where((service) {
      final matchesSearch = service.title.toLowerCase().contains(cleanQuery) ||
          service.description.toLowerCase().contains(cleanQuery) ||
          service.type.toLowerCase().contains(cleanQuery) ||
          service.status.toLowerCase().contains(cleanQuery) ||
          service.location.toLowerCase().contains(cleanQuery);

      final matchesType = selectedType == 'All' || service.type == selectedType;

      return matchesSearch && matchesType;
    }).toList();
  }
}
