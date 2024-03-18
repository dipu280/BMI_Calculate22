// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bmi_calculate22/calculate.dart';
import 'package:bmi_calculate22/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int age=20;
  int weight=60;
  int hight=180;
  bool isMale=true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 219, 219, 219),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),

                  child:Row(children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            isMale=false;
                          });
                        },
                        child: Card(color: isMale==true?Colors.grey:Colors.white,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Icon(Icons.male),
                            Text("MALE")
                            
                          ],),
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          setState(() {
                             isMale=true;
                          });
                        },
                        child: Card(color: isMale==true?Colors.white:Colors.grey,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Icon(Icons.female),
                            Text("Female")
                            
                          ],),
                        ),
                      ),
                    ),
                  ],) ,
                ),
              ),
              Expanded(flex: 10,
                child: Container(margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child:Card(
                    child: Column(children: [
                       SizedBox(height: 20,),
                      Text("Hight"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                        Text("$hight",style: myStyle(30, Colors.black),),
                        Text("cm",style: myStyle(14, Colors.black),)
                      ],),
                      SliderTheme(
                        
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius:15.0,

                             ),
                             overlayShape: RoundSliderOverlayShape(
                              overlayRadius: 30,
                             ),
                             thumbColor:Colors.pink,
                             overlayColor: Color.fromARGB(255, 255, 255, 255),
                             activeTrackColor: Color.fromARGB(255, 88, 92, 88),
                             inactiveTickMarkColor: Colors.red,
                             inactiveTrackColor: Color.fromARGB(255, 164, 235, 240)
                        ),
                         child: Slider(
                          min: 50,
                          max: 210,
                          value: hight.toDouble(),
                          onChanged: (double value){
                            setState(() {
                              hight=value.toInt();
                              print("value is :$hight");
                            });
                          }))
                    ],),
                  ) ,)),

                      Expanded(
                flex: 10,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),

                  child:Row(children: [
                    Expanded(
                      child: Card(color: Colors.white,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                         
                          Text("WEIGHT"),
                          Text(weight.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                margin: EdgeInsets.all(6),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),
                                child: Icon(Icons.remove),
                              ),
                            ),
                             InkWell(
                              onTap: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                margin: EdgeInsets.all(6),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],)
                          
                        ],),
                      ),
                    ),
                    SizedBox(width: 8,),
                  Expanded(
                      child: Card(color: Colors.white,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                         
                          Text("AGE"),
                          Text(age.toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                margin: EdgeInsets.all(6),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),
                                child: Icon(Icons.remove),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  age++;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(6),
                                margin: EdgeInsets.all(6),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],)
                          
                        ],),
                      ),
                    ),
                  ],) ,
                ),
              ),

               Expanded(
            flex:3 ,
            child: GestureDetector(
              onTap: () {
                CalculateBmi calc =
                    CalculateBmi(height: hight, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        bmi: calc.calulate(),
                        comment: calc.getComment(),
                        result: calc.getResult(),
                      );
                    },
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFE83D66),
                  borderRadius: BorderRadius.circular(12),

                ),
                margin: EdgeInsets.all(8),
                
                width: double.infinity,
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
             
            ],
          ),
        ),
      ),
    );
  }
}

myStyle(double size,Color clr){
  return TextStyle(fontSize: size,color: clr);
}