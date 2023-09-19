import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/Modern Calculator/Calc.dart';


class IntroPage extends StatelessWidget{
var fromIntro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator', style: TextStyle(fontWeight: FontWeight.bold),)
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[Colors.black87,Colors.purple])
        ),

        // color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Write Your Name", style: TextStyle(fontSize: 35, color: Colors.blue.shade200, fontWeight: FontWeight.w900),),

            SizedBox(height: 35,),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 300,
                  child: TextField(
                    controller: fromIntro,
                    decoration:InputDecoration(
                      enabledBorder:OutlineInputBorder(
                          borderSide: BorderSide(width: 2,color: Colors.black87,)
                      ) ,
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(width: 4,color: Colors.black87,)
                      ) ,
                      label: Text('Write Your Name', style: TextStyle(fontSize: 22, color: Colors.black87),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(fromIntro: fromIntro.text.toString(),),));
                }, child: Text('Next -->', style: TextStyle(fontSize: 22),)),
              ],
            )

          ],
        ),
      ),
    );
  }

}