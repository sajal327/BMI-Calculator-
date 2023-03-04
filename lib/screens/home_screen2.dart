import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bmi_app/provider/data.dart';

class ResultPage_02 extends StatelessWidget {
  const ResultPage_02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022025),
      // backgroundColor: Color(0xFF101428),Color(0xFF02262C),FF022025 Color(0xFF02181D),
      appBar: AppBar(
        title: const Text("BMI Calculator",
          style: TextStyle(fontSize: 27,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
          ),
        ),
        //backgroundColor: Color(0xFF013940),
        backgroundColor: const Color(0xFF022025),
        //backgroundColor: Color(0xFF02181D),
         //backgroundColor: Color(0xFF101428),
      ),

      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text("Your Result",
              //textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              height: 500,
              width: double.infinity,
              decoration:  BoxDecoration(
                color: const Color(0xFF013940),
                //color: const Color(0xFF232336),
                borderRadius: BorderRadius.circular(15),
              ),

              child: Consumer<DataProvider>(builder: (context,provider,child){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text(provider.calculateBMI().toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(provider.intro().toString(),
                      style: const TextStyle(
                        color: Color(0xFF7ED779),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(provider.msg().toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
      bottomSheet: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          height: 80,
          decoration: const BoxDecoration(
           color: Color(0xFFFB9C22),
           // color: Color(0xFFca1b53),
          ),
          alignment: Alignment.center,
          child: const Text("RE-CALCULATE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}