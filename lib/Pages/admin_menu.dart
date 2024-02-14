import 'package:flutter/material.dart';
import 'package:security_app/Pages/add_security.dart';
import 'package:security_app/Pages/view_security.dart';
import 'package:security_app/Pages/view_visitor.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("ADMIN MENU",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF027A7A),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF009999).withOpacity(0.3),
                    Color(0xFF009999).withOpacity(0.5),
                    Color(0xE2000066).withOpacity(0.5),
                    //Color(0xFF000066)
                  ]
              )
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 130,
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xE2000066),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewSecurity()));
                    },
                    child: Text("VIEW ALL SECURITY GUARDS")),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 130,
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF006666),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSecurity()));
                    },
                    child: Text("ADD SECURITY GUARD")),
              ),
              SizedBox(height: 35,),
              SizedBox(
                height: 130,
                width: 250,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF000066),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewVisitor()));
                    },
                    child: Text("VIEW ALL VISITORS")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
