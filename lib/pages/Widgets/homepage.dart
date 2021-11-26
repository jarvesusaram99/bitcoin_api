import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 300,
            width: 499,
            color: Color(0xff1c2a51),
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                children: [
                SafeArea(
    child: 
    
    Column(children: [
          Text('Hello👋' , style: TextStyle(
          fontSize: 20,
          // fontWeight: FontWeight.bold
          color: Colors.white
    ),
    ),
          Text("Welcome to Crypto Cluster!" , style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 26
  ),),
    Text("Are to ready to explore crypto?" , style: TextStyle(
    color: Colors.white,
    // fontWeight: FontWeight.bold,
    fontSize: 16
  ),),

Padding(
  padding: const EdgeInsets.all(20),
  child:   SizedBox(
   width: 600,
    height: 50,
           child:   ElevatedButton(onPressed: (){
  
    },style: ButtonStyle(
          // backgroundColor: Color(0xff4963d1),
          alignment: Alignment.center
    ), 
    child: Row( children: [
           Text("Sign up for free" ,style: TextStyle(
              fontSize: 16
            ) ,
            ) , 
            Icon(Icons.arrow_forward)
          ],
    ),
     ),
  
  ),
),
Text("Benefits of Signing Up" ,
style: TextStyle(
  color: Colors.white,
  fontSize: 16,
   decoration: TextDecoration.underline,
   fontWeight: FontWeight.bold
),
)
 ],
    )
      ),
          ],
            ),
            ),
          ),


          Text("sldckdjc")
        ],
      ),
      
    );
  }
}