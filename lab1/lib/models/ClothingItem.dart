class ClothingItem {
  int id;
  String title;
  String image;
  double price;
  String description;

  ClothingItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description
  });

  ClothingItem.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        title = data['title'],
        image = data['image'],
        price = (data['price'] is int) ? (data['price'] as int).toDouble() : data['price'].toDouble(),
        description = data['description'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': title,
    'image': image,
    'price': price,
    'description': description
  };
}
