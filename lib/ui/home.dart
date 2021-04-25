import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {

  final TextEditingController _age= new TextEditingController();
  final TextEditingController _height= new TextEditingController();

  final TextEditingController _Weight= new TextEditingController();
  double inch=0;
  double result=0;
  double pound=0;

  String fresult="";
  String condition="";


  void calculateBmi(){
    setState(() {
//      int age = int.parse(_age.text);
//      double height = double.parse(_height.text);
//      inch=height*12;
//      double weight = double.parse(_Weight.text);

      if(_age.text.isEmpty||_height.text.isEmpty||_Weight.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter All Data")));
        fresult="";
        condition="";
      }
      else
        {
          int age = int.parse(_age.text);
          double height = double.parse(_height.text);
          inch=height*12;
          double weight = double.parse(_Weight.text);
          pound=weight*2.20462262;

          result= pound/(inch*inch)*703;

          fresult="Your BMI is ${result.toStringAsFixed(1)}";

          if(result<18.5){
              condition="UnderWeight";


          }
          else if(result>=18.5 && result<=24.9){

              condition="Normal Weight";
          }

          else if(result>=25.0 && result<=29.9){


              condition="Over Weight";
          }
          else if(result>=30){

              condition="Obesity";

          }

        }




    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Body Mass Index"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),

      body: new Container(
      //  alignment: Alignment.center,
        child: new ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/bmi.png",
              width: 150,
                height: 150,
                color: Colors.lightGreen,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new  Container(
              margin: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red.shade100,
                ),
                height: 245.0 ,
                width: 250.0,


              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _age,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: ("Enter your age."),
                        hintText: ("e.g.34"),
                        icon: new Icon(Icons.person)
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: ("Height In Feet."),
                          hintText: ("e.g.5.9"),
                          icon: new Icon(Icons.person)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _Weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: ("Weight in Kgs."),
                          hintText: ("e.g. 80"),
                          icon: new Icon(Icons.person)
                      ),
                    ),
                  )
                ],
              ),
              ),
          ),
            Container(
              child: Column(
                children: [
                  RaisedButton(onPressed:calculateBmi,

                  child: Text("Calculate"),
                    color: Colors.red,
                    textColor: Colors.white,

                  ),
                  Padding(padding: new EdgeInsets.all(8.0)),
                  Text("$fresult", style: TextStyle(
                    color: Colors.green.shade700, fontSize: 24.0, fontWeight: FontWeight.bold
                  ),),
                  Text("$condition", style: TextStyle(
                      color: Colors.green.shade700, fontSize: 24.0, fontWeight: FontWeight.bold
                  ),),
                ],

              ),
            )
          ],

        ),
      ),
    );
  }
}
