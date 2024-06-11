import 'package:flutter/material.dart';

import '../../../models/course.dart';

class CartCourseItem extends StatelessWidget {
  const CartCourseItem({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(
        //   context,
        //   RouteNames.courseDetails,
        //   arguments: course,
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              offset: Offset(0, 1),
            )
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(course.imageUrl, width: 100),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(course.description),
                  const SizedBox(height: 6),
                  Text(
                    "\$${course.price.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            //const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}