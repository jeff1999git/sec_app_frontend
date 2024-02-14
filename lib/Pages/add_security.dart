import 'package:flutter/material.dart';
import 'package:security_app/Service/security_service.dart';

class AddSecurity extends StatefulWidget {
  const AddSecurity({super.key});

  @override
  State<AddSecurity> createState() => _AddSecurityState();
}

class _AddSecurityState extends State<AddSecurity> {
  TextEditingController name1=new TextEditingController();
  TextEditingController empid1=new TextEditingController();
  TextEditingController address1=new TextEditingController();
  TextEditingController phone1=new TextEditingController();
  TextEditingController email1=new TextEditingController();
  TextEditingController pass1=new TextEditingController();

  void SendValuesToApiAddSecurity() async {

    final response = await SecurityApiService().addSecurityApi(
        name1.text,
        empid1.text,
        address1.text,
        phone1.text,
        email1.text,
        pass1.text);

    if(response["status"]=="success")
    {

      print("successfully added");
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
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("ADD SECURITY GUARD",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF027A7A),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextField(
                  controller: name1,
                  decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter guard's name",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: empid1,
                  decoration: InputDecoration(
                      labelText: "Employee Id",
                      hintText: "Enter employee id",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: address1,
                  decoration: InputDecoration(
                      labelText: "Address",
                      hintText: "Enter current address",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: phone1,
                  decoration: InputDecoration(
                      labelText: "Phone No",
                      hintText: "Enter contact number",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: email1,
                  decoration: InputDecoration(
                      labelText: "Email Id",
                      hintText: "Enter email id",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: pass1,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter password",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 35,),
                SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF027A7A),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: SendValuesToApiAddSecurity, child: Text("ADD"))),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
