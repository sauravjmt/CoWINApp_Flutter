import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      left: 0,
      right: 0,
      child: Container(
        child: Icon(
          Icons.assistant_outlined,
          color: Colors.white,
        ),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).accentColor,
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 7, offset: Offset(0, 4))
            ]),
      ),
    );
  }
}
