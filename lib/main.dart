import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:name_printer_input_display/NamePrinter.dart';
import 'package:name_printer_input_display/constants.dart';
import 'package:name_printer_input_display/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: zuriBlack,
            title: Text("Stage Two Task"),
            bottom: TabBar(
              indicatorColor: zuriWhite,
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
          body: SafeArea(
            child: TabBarView(
              children: [NamePrinter(), InputDisplay()],
            ),
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
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: (){
                _launchUrl();
              },
                child: Image.asset("assets/images/zuri.png",)),
            // Field to receive input
            Form(
                child: TextFormField(
              controller: input,
              style: simpleTextStyle(zuriBlack),
              decoration: InputDecoration(
                  hintText: "Enter any text here",
                  hintStyle: TextStyle(color: zuriBlack),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: zuriRed)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: zuriRed))),
            )),
            SizedBox(
              height: 16,
            ),

            //button to display
            GestureDetector(
              onTap: () {
                displayDialog(context);
                input.clear();
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: zuriRed, borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Display Input",
                  style: simpleTextStyle(zuriWhite),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
// dialog box to display input
  void displayDialog(BuildContext context) {
    Widget okButton = TextButton(onPressed: (){
      Navigator.of(context).pop();
    }, child: Text('OK',style: TextStyle(
       color: zuriRed
    ),));

    AlertDialog alert = AlertDialog(
      title: Text("Your Input"),
      content: Text(input.text),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  // launch zuri link
  _launchUrl() async{
    if( await canLaunch(zuriUrl)){
      await launch(zuriUrl);
    } else {
      throw 'Could not launch $zuriUrl';
    }
  }
}
