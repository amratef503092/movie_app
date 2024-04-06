import 'package:flutter/material.dart';
class CustomTitleAppBar extends StatelessWidget {
  const CustomTitleAppBar({
    super.key,
  required  this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Text.rich(
      TextSpan(
        children: [
          TextSpan(
    text: title,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 0,
    ),
          ),
          const TextSpan(
    text: '.',
    style: TextStyle(
      color: Color(0xFFFFC700),
      fontSize: 30,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 0,
    ),
          ),
        ],
      ),
    );
  }
}
