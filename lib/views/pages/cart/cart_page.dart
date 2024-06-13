import 'package:flutter/material.dart';
import 'package:flutter_day_29/views/pages/cart/cart_course_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../services/cart_http_service.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartHttpService = CartHttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${AppLocalizations.of(context)!.cart} 🛒"),
      ),
      body: FutureBuilder(
        future: cartHttpService.fetchCartCourses(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return CartCourseItem(course: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}
