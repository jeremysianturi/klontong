class Post {
  final int id;
  final int categoryId;
  final String categoryName;
  final String sku;
  final String name;
  final String description;
  final int weight;
  final int width;
  final int length;
  final int height;
  final String image;
  final int price;

  Post({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.sku,
    required this.name,
    required this.description,
    required this.weight,
    required this.width,
    required this.length,
    required this.height,
    required this.image,
    required this.price,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        categoryId: json['categoryId'],
        categoryName: json['categoryName'],
        sku: json['sku'],
        name: json['name'],
        description: json['description'],
        weight: json['weight'],
        width: json['width'],
        length: json['length'],
        height: json['height'],
        image: json['image'],
        price: json['price']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'categoryName': categoryName,
      'sku': sku,
      'name': name,
      'description': description,
      'weight': weight,
      'width': width,
      'length': length,
      'height': height,
      'image': image,
      'price': price,
    };
  }
}
