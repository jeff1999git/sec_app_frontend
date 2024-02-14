import 'package:flutter/material.dart';
import 'package:security_app/Pages/add_visitor.dart';
import 'package:security_app/Service/security_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecurityLogin extends StatefulWidget {
  const SecurityLogin({super.key});

  @override
  State<SecurityLogin> createState() => _SecurityLoginState();
}

class _SecurityLoginState extends State<SecurityLogin> {

  TextEditingController email1=new TextEditingController();
  TextEditingController pass1=new TextEditingController();

  void SendValuesToApi() async {
    final response = await SecurityApiService().SecurityloginData(email1.text, pass1.text);
    if(response["status"]=="success")
    {
      String securityId=response["userdata"]["_id"].toString();
      SharedPreferences.setMockInitialValues({});
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString("securityId", securityId);
      print("successfully login");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddVisitor()));
    }
    else if(response["status"]=="invalid email")
    {
      print("Invalid email id");
    }
    else if(response["status"]=="invalid password")
    {
      print("Invalid password");
    }
    else
    {
      print("Error");
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF009999).withOpacity(0.4),
                      Color(0xFF009999).withOpacity(0.5),
                      Color(0xFF000066).withOpacity(0.7),
                      Color(0xFF000066).withOpacity(0.8),
                      Color(0xFF000066)
                    ]
                )
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60,),
                Text("Sign In here !",style: TextStyle(color: Colors.white,fontSize: 22),),
                SizedBox(height: 40,),
               Image.network(height: 180,"https://cdn-icons-png.freepik.com/512/8631/8631487.png"),
                SizedBox(height: 40,),
                TextField(
                  controller: email1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "Email Id",
                      hintText: "Enter email id",
                      prefixIcon:   Icon(Icons.email_outlined,color: Color(0xFF009999),size: 27,),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009999))
                      )
                  ),
                ),
                SizedBox(height: 35,),
                SizedBox(width: 10,),
                TextField(
                  controller: pass1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter valid password",
                      prefixIcon:  Icon(Icons.lock_outline,color: Color(0xFF009999),size: 27,),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF009999))
                      )
                  ),
                ),
                SizedBox(height: 55,),
                SizedBox(
                  height: 45,
                  width: 200,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF009999)),
                          foregroundColor: Color(0xFF009999),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: SendValuesToApi,
                      child: Text("SIGN IN",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                SizedBox(height: 25,),
                SizedBox(
                  height: 45,
                  width: 200,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Color(0xFF009999)),
                          foregroundColor: Color(0xFF009999),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("GO BACK",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                SizedBox(height: 105,),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
