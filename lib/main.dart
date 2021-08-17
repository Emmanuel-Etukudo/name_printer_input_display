import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:name_printer_input_display/NamePrinter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Stage Two Task"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Task 2",
                ),
                Tab(
                  text: "Task 5",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              NamePrinter(),
              InputDisplay()
            ],
          ),
        ),
      ),
    );
  }
}

class InputDisplay extends StatefulWidget {
  const InputDisplay({Key? key}) : super(key: key);

  @override
  _InputDisplayState createState() => _InputDisplayState();
}

class _InputDisplayState extends State<InputDisplay> {

  TextEditingController input = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Form(child: TextFormField(
            controller: input,
          )),
          GestureDetector(
            onTap: (){

            },
            child: Container(
              child: Text(
                "Display Input"
              ),
            ),
          )
        ],
      ),
    );
  }
}

