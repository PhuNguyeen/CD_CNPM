import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewLine extends StatelessWidget {
  const ReviewLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "time user review",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name user",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  RatingBarIndicator(
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    rating: 3,
                    itemSize: 12,
                    direction: Axis.horizontal,
                    itemCount: 5,
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                  "Sản phẩm này rất tốt và đẳng cấp, nhất định tôi sẽ mua hàng tiếp để ủng hộ của hàng. Tôi cũng se giới thiệu nó cho mọi người")
            ],
          ),
        ),
      ),
    );
  }
}
