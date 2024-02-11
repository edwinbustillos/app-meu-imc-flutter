import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard(
      {required Key key,
      required this.icon,
      this.color,
      this.title = "",
      this.onPressedC})
      : super(key: key);

  final String title;
  final IconData icon;
  final Function? onPressedC;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {
            onPressedC?.call();
          },
          elevation: 2.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          fillColor: color ?? Colors.blue,
          constraints: const BoxConstraints.tightFor(
            width: 56.0,
            height: 56.0,
          ),
          child: Icon(
            icon,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
