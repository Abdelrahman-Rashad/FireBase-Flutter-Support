import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key,required this.text,required this.onTop});
  String text;
  VoidCallback onTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: onTop,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepOrange,
          ),
          width: double.infinity,
          height: 50,
          child: Center(
              child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
