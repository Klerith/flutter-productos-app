import 'package:flutter/material.dart';

class ImageTextWidget extends StatelessWidget {
  const ImageTextWidget(
      {Key? key, required this.imageRoute, required this.text})
      : super(key: key);
  final String imageRoute;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Image(image: AssetImage(imageRoute)),
            const SizedBox(height: 20.0),
            Text(
              text,
              style: const TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}