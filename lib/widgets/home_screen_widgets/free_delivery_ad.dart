import 'package:flutter/material.dart';

class FreeDeliveryAd extends StatelessWidget {
  const FreeDeliveryAd({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            width: double.infinity,
            height: 225,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/images/others/free_delivery_image.jpg')))),
        Positioned(
            top: 50,
            left: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Free Delivery for\n1 Month!',
                  style: TextStyle(fontSize: 36),
                ),
                SizedBox(height: 10),
                Text(
                  'You\'ve to order at least \$10 for\nusing free delivery for 1 month.',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ],
            )),
      ],
    );
  }
}
