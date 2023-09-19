import 'package:flutter/material.dart';
import 'package:practice/Modern Calculator/Intropage.dart';
import 'package:practice/Modern Calculator/Splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.fromIntro }) : super(key: key);

  final String fromIntro;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var no1controller = TextEditingController();
  var no2controller = TextEditingController();
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,

        title: Text('Calculator'),

      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: <Color>[Colors.black87,Colors.purple])
        ),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Welcome, ${widget.fromIntro}', style: TextStyle(fontSize: 32, color: Colors.white, fontWeight:FontWeight.bold),),
                ),

                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.white54,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: no1controller,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.white54,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: no2controller,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){

                      var no1 = int.parse(no1controller.text.toString());
                      var no2 = int.parse(no2controller.text.toString());

                      var sum = no1 + no2;

                       result = "$sum" ;
                       setState(() {
                       });
                    }, child: Text(' + ',style: TextStyle(fontSize: 35),)),

                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(no1controller.text.toString());
                      var no2 = int.parse(no2controller.text.toString());

                      var subs = no1 - no2;

                       result = '$subs' ;
                       setState(() {

                       });

                    }, child: Text(' - ',style: TextStyle(fontSize: 35),)),

                    ElevatedButton(onPressed: (){
                       var no1 = int.parse(no1controller.text.toString());
                       var no2 = int.parse(no2controller.text.toString());

                       var mul = no1 * no2;

                        result = '$mul' ;
                        setState(() {

                        });

                    } , child: Text(' X ',style: TextStyle(fontSize: 35),)),

                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(no1controller.text.toString());
                      var no2 = int.parse(no2controller.text.toString());

                      var div = no1 / no2;

                      result = "${div.toStringAsFixed(2)}" ;
                      setState(() {

                      });

                    }, child: Text (' / ', style: TextStyle(fontSize: 35),)),
                  ],
                ),
                Container(height: 25,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(result, style: TextStyle(fontSize: 55, color: Colors.black87),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}