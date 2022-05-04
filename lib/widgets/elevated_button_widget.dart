import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {Key? key,
      required this.text,
      required this.height,
      required this.width,
      required this.onPressed,
      this.fontSize = 16.0,
      this.primaryColor= Colors.blue,
      this.textColor = Colors.white
      })
      : super(key: key);

  final String text;
  final Color? primaryColor;
  final Color? textColor;
  final double height;
  final double width;
  final double? fontSize;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          
            primary: primaryColor,  elevation: 2, shape: const StadiumBorder()),
        onPressed: onPressed,
        child: Container(
          width: width,
          height: height,
          child: Center(
            child: Text(
              text,
              style:  TextStyle(
                color: textColor,
                fontSize: 17,
              ),
            ),
          ),
        ));
  }
}
