import 'package:flutter/material.dart';
import 'package:name_printer_input_display/constants.dart';
import 'package:name_printer_input_display/widgets.dart';

// code to print name
class NamePrinter extends StatelessWidget {
  const NamePrinter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(0.15),
          decoration: BoxDecoration(border: Border.all(color: zuriRed)),
          child: Text('Etukudo Emmanuel', style: simpleTextStyle(zuriBlack)),
        ),
      ),
    );
  }
}
