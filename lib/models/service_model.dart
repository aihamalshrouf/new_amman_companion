class ServiceModel {
  final String title;
  final String type;
  final String description;
  final String imagePath;
  final String logoPath;
  final String networkImageUrl;
  final String status;
  final String location;
  final List<String> highlights;

  const ServiceModel({
    required this.title,
    required this.type,
    required this.description,
    required this.imagePath,
    required this.logoPath,
    required this.networkImageUrl,
    required this.status,
    required this.location,
    required this.highlights,
  });
}
