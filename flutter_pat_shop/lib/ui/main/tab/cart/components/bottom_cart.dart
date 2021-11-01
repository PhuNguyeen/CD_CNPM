import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomCart extends StatelessWidget {
  const BottomCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.local_offer_outlined),
            label: Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text("User coupons"),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(locale: 'vi', decimalDigits: 0)
                        .format(int.parse("100000000")),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              MaterialButton(
                color: Colors.green.shade600,
                textColor: Colors.white,
                elevation: 8,
                height: 52,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  // Respond to button press
                },
                child: Text(
                  "Next",
                  style: TextStyle(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
