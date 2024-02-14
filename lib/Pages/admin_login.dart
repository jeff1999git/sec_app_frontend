import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:security_app/Pages/admin_menu.dart';
import 'package:security_app/Pages/security_login.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController username=new TextEditingController();
  TextEditingController password=new TextEditingController();

  void checkCredential(){
    if(username.text == "admin" && password.text=="1234" ){
      print("successful login");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminMenu()));
    }
    else{
      print("Incorrect username or password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  //Color(0xFF009999).withOpacity(0.5),
                  Color(0xFF009999),
                  //Color(0xFF000066).withOpacity(0.7),
                  Color(0xFF000066)
                ]
            )
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 95,),
              SvgPicture.asset('assets/logo.svg',semanticsLabel: 'My SVG Image', height: 100,
                width: 70, ),
              Text("WELCOME !",style: TextStyle(fontSize: 22,color: Colors.white),),
              SizedBox(height: 50,),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small/profile-icon-design-free-vector.jpg"),
              ),
              SizedBox(height: 50,),
              TextField(
                controller: username,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "Enter admin username",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    )
                ),
              ),
              SizedBox(height: 35,),
              TextField(
                controller: password,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter admin password",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  )
                ),
              ),
              SizedBox(height: 55,),
              SizedBox(
                height: 45,
                width: 200,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                    onPressed: checkCredential,
                    child: Text("SIGN IN")),
              ),
              SizedBox(height: 75,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign in as Security Guard",style: TextStyle(color: Colors.white,fontSize: 15),),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SecurityLogin()));
                  },
                      icon: Icon(Icons.lock_open_sharp,color: Colors.white,size: 32,)
                  ),

                ],
              ),
             SizedBox(height: 55,)
            ],
          ),
        ),
      ),
      
    );
  }
}
