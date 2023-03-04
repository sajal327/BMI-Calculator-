import 'package:flutter/material.dart';
import 'package:bmi_app/provider/data.dart';
import 'package:provider/provider.dart';
import 'home_screen2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022025),
      //backgroundColor:Color(0xFF02181D),
       //backgroundColor: Color(0xFF101428),
      appBar: AppBar(
        title: const Text(" BMI Calculator ",
          style: TextStyle(fontSize: 27,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
          ),
        ),
        //backgroundColor: Color(0xFF013940),
        backgroundColor: Color(0xFF022025),
        //backgroundColor: Color(0xFF02181D),
        // backgroundColor: Color(0xFF101428),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<DataProvider>(builder: (context,provider,child){
           return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child : GestureDetector(
                    onTap:(){
                      provider.setGender(false);
                    },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        //color: provider.Gender ?  Color(0xFF232336) : Color(0xFFFF1D1E33),
                        color: const Color(0xFF013940),
                        //color: Color(0xFF232336),//#013940
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male,
                          color: provider.Gender ?  Colors.white70 : Color(0xFFFB9C22),
                          //color: provider.Gender ?  Color(0xFF232336) : Color(0xFFFF1D1E33),
                          //color: Colors.white70,
                          size: 85.0,),
                        const Text("Male",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                child: GestureDetector(
                onTap: (){
                provider.setGender(true);
                },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Color(0xFF013940),
                        //color: Color(0xFF232336),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female,
                          color: provider.Gender ?  Color(0xFFFB9C22) : Colors.white70,
                          //color: Colors.white70,
                          size: 85,
                        ),
                        const Text("Female",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                 ),
                ),
              ],
             );
            }),
            //SizedBox(
             // height: 10,
              //height: 37,
           // ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFF013940),
                  //color: Color(0xFF232336),
                  borderRadius: BorderRadius.circular(25)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Height",
                    style: TextStyle(color: Colors.white,
                        fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Consumer<DataProvider>(builder: (context,provider,child){
                        return Text(provider.Height.toString(),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical:21),
                        child: Text("CM",
                          style:  TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Consumer<DataProvider>(builder: (context,provider,child) {
                    return Slider(
                        activeColor: const Color(0xFFFB9C22),
                        // activeColor: Color(0xFFca1b53),
                        inactiveColor: Colors.white,
                        value: provider.Height.toDouble(),
                        min: provider.kminSliderHeight,
                        max: provider.kmaxSliderHeight,
                        onChanged: (double value)
                    {
                      provider.setHeight(value.round());
                      //setState(() {});
                    });
                  }),
                ],
              ),
            ),
            //SizedBox(
              //height: 5,
              //height: 37,
           // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    //color: Colors.teal,
                    decoration: BoxDecoration(
                        color: const Color(0xFF013940),
                        // color: Color(0xFF232336),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Weight",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Consumer<DataProvider>(builder: (context,provider,child){
                         return Text(provider.Weight.toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        ),
                        Consumer<DataProvider>(builder: (context,provider,child){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  provider.setWeight(provider.Weight+1);
                                  print(provider.Weight.toString());
                                },
                                child: const CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.white12,
                                  child: Icon(Icons.add,
                                    color: Color(0xFFFB9C22),
                                    //color: Colors.white,
                                    size: 43,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: (){
                                  provider.setWeight(provider.Weight-1);
                                },
                                child: const CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.white12,
                                  child: Icon(Icons.remove,
                                    color: Color(0xFFFB9C22),
                                    //color: Colors.white,
                                    size: 43,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Color(0xFF013940),
                        //color: Color(0xFF232336),
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Age",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Consumer<DataProvider>(builder: (context,provider,child){
                        return Text(provider.Age.toString(),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                        }),
                        Consumer<DataProvider>(builder: (context,provider,child){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  provider.setAge(provider.Age+1);
                                },
                                child: const CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.white12,
                                  child: Icon(Icons.add,
                                    color: Color(0xFFFB9C22),
                                    //color: Colors.white,
                                    size: 43,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: (){
                                  provider.setAge(provider.Age-1);
                                },
                                child: const CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.white12,
                                  child: Icon(Icons.remove,
                                    //color: Colors.white,
                                    color: Color(0xFFFB9C22),
                                    size: 43,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              //height: 10,
              height: 45,
            ),
          ],
        ),
      ),

      bottomSheet: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>const ResultPage_02()),
          );
        },
        child: Container(
          height: 80,
          decoration: const BoxDecoration(
              color: Color(0xFFFB9C22)
            //color: Color(0xFFca1b53),
          ),
          alignment: Alignment.center,
          child: const Text("CALCULATE",
            style:  TextStyle(
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

