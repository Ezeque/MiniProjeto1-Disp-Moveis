import 'package:flutter/material.dart';
import 'package:miniprojeto2/components/DropDown.dart';
import 'package:miniprojeto2/components/Input.dart';

class Home extends StatelessWidget {
  final List<String> states = ["State", "State 2", "State 3"];
  final List<String> countries = ["Country", "Brazil", "USA", "Japan"];
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application", style: TextStyle(color: Colors.white),),
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            child: Text("Personal Info", style: Theme.of(context).textTheme.headline4),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              
              children: [Input("First Name")],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [Input("Last Name")],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [Input("Brithday"), Input("Social Security")],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            child: Text("Residence Address", style: Theme.of(context).textTheme.headline4),
          ),
          Input("Address"),
          Row(children: [
            Input("City"),
            Dropdown(states)
          ],),
          Row(children: [
            Input("Zip Code"),
            Dropdown(countries)
          ],)
        ],
      ),
    );
  }
}
