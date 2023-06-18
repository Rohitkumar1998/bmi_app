import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

var wtControlller=TextEditingController();
var ftControlller=TextEditingController();
var inControlller=TextEditingController();
var result="";
var bgColor=Colors.blue.shade200;
// =Colors.yellow.shade300;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:Container(
        color:bgColor,
        // color: Colors.indigo.shade200,
        child: Center(

          child: Container(

            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 21,),
                Text("BMI",style: TextStyle(fontWeight:FontWeight.w700,fontSize: 35,
                ),),
                TextField(controller:wtControlller,
                decoration:InputDecoration(
                  label: Text("Enter your Weight(in kgs)"),
                  prefixIcon:   Icon(Icons.line_weight)
                ) ,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),
                TextField(
                  controller: ftControlller,
                  decoration: InputDecoration(
                    label: Text("Enter your height  (in feet) "),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,

                ),
                SizedBox(
                  height: 16,
                ),


                TextField(
                  controller: inControlller,
                  decoration: InputDecoration(
                    label: Text("Enter your height in inch"),
                    prefixIcon: Icon(Icons.height)

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21,),

                ElevatedButton(onPressed: (){
                  var wt=wtControlller.text.toString();
                  var ft=ftControlller.text.toString();
                  var inch=inControlller.text.toString();
                  if(wt!=""&& ft!=''&& inch!=""){
                    var iwt=int.parse(wt);
                    var ift=int.parse(ft);
                    var iInch=int.parse(inch);
                    var tnIch= (ift*12)+iInch;
                    var tCm=tnIch*2.54;
                    var tMetr=tCm/100;
                    var bmi=iwt/(tMetr*tMetr);
                    var msg="";
                    if(bmi>25){
                      msg="You are OverWeight!!";
                      bgColor=Colors.orange.shade200;

                    }else if(bmi<18){
                      msg="You are UnderWeight ";
                      bgColor=Colors.red.shade200;

                    }else{
                      msg="You  are Healthy";
                      bgColor=Colors.green.shade200;

                    }
                    // result="Your BMI is :${bmi}";
                    setState(() {
                      result=" $msg \n Your BMI is :${bmi.toStringAsFixed(2)}";

                    });
                    // result="Your BMI is :${bmi}";

                  }else{
                    setState(() {
                      result = "Please fill all the required blanks ";
                    });
                  }
                }, child: Text("Calculate")
                ),
                Text(result,style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      )
    );

  }
}
