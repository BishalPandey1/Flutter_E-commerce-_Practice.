class Product {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final Rating rating;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      price: map['price'],

      description: map['description'],
      category: map['category'],
      image: map['image'],
      rating: Rating.fromMap(map['rating']),
    );
  }
}

class Rating {
  final num rate;
  final int count;
  Rating({required this.rate, required this.count});

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(rate: map['rate'], count: map['count']);
  }
}
