import 'course.dart';

class Cart {
  final List<Course> cartCourses;
  final String userId;

  const Cart({
    required this.cartCourses,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'cartCourses': cartCourses,
      'userId': userId,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      cartCourses: map['cartCourses'] as List<Course>,
      userId: map['userId'] as String,
    );
  }
}
