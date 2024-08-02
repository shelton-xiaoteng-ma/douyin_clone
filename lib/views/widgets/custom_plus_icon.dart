import 'package:flutter/material.dart';

class CustomPlusIcon extends StatelessWidget {
  const CustomPlusIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: 50,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
