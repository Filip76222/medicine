import 'package:flutter/material.dart';

//ignore: must_be_immutable
class genLogSignHeader extends StatelessWidget {
  String headerText;

  genLogSignHeader({required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Image.asset(
            "images/logo.png",
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 20),
          Text(
            headerText,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
