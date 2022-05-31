
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';

class DetailScreenContent extends StatelessWidget {
  final category;
  final result;
  const DetailScreenContent(
      {Key? key, required this.category, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
