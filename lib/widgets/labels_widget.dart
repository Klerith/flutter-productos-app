import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels(
      {Key? key,
      required this.route,
      required this.textQuestion,
      required this.textGesture})
      : super(key: key);
  final Function()? route;
  final String textQuestion;
  final String textGesture;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textQuestion,
          style: const TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: route,
          child: Text(
            textGesture,
            style: TextStyle(
                color: Color.fromARGB(255, 127, 4, 149),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
