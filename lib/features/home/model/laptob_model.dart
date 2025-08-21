class laptobModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final num price;

  laptobModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price, 
  });

  factory laptobModel.fromJson(Map<String, dynamic> json) {
    return laptobModel(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'], 
    );
  }
}
