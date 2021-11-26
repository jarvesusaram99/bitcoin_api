import 'package:flutter/material.dart';
import 'package:login_app/pages/Widgets/data.dart';
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Hey Jarves" , style: TextStyle(
                fontSize: 17
              ),),
              accountEmail: Text("usaramwasi99@gmail.com", style: TextStyle(
                fontSize: 12),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/image/login.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.black,),
              title: Text("Jarves Usaram" , style: TextStyle(
                color: Colors.black,
                fontSize: 15
              ),),
            ),
            ListTile(
              leading: Icon(Icons.shop, color: Colors.black,),
              title: Text("Shop" , style: TextStyle(
                color: Colors.black,
                fontSize: 15
              ),),
            ),
            ListTile(
              leading: Icon(Icons.login_rounded, color: Colors.black,),
              title: Text("Login" ,style: TextStyle(
                color: Colors.black,
                fontSize: 15
              ),),
              onTap: () {
                Navigator.pushNamed(context, "/login");
              },
            ),
            ListTile(
              leading: Icon(Icons.app_registration , color: Colors.black,),
              title: Text("Register",style: TextStyle(
                color: Colors.black,
                fontSize: 15
              ),),
              onTap: () {
                Navigator.pushNamed(context, "/signup");
              },
            ),
             ],
        ),
      ),
    );
  }
}