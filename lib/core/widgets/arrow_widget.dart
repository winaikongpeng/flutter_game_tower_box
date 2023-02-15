import 'package:flutter/material.dart';

class ArrowWidget extends StatelessWidget {
  const ArrowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 30, right: 10),
          child: Icon(
            Icons.arrow_right,
            size: 60,
            color: Colors.white,
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Colors.transparent),
        const Padding(
          padding: EdgeInsets.only(bottom: 30, left: 10),
          child: Icon(
            Icons.arrow_left,
            size: 60,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
