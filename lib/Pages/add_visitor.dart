import 'package:flutter/material.dart';
import 'package:security_app/Service/visitor_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddVisitor extends StatefulWidget {
  const AddVisitor({super.key});

  @override
  State<AddVisitor> createState() => _AddVisitorState();
}

class _AddVisitorState extends State<AddVisitor> {
  TextEditingController name1=new TextEditingController();
  TextEditingController address1=new TextEditingController();
  TextEditingController phone1=new TextEditingController();
  TextEditingController purpose1=new TextEditingController();


  void SendValuesToApiAddVisitors() async {
    SharedPreferences prefer=await SharedPreferences.getInstance();
    String securityId=prefer.getString("securityId")?? "";

    final response = await VisitorApiService().addVisitorApi(
        securityId,
        name1.text,
        address1.text,
        phone1.text,
        purpose1.text,
        );

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
          title: Text("ADD VISITORS",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF000066),
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
                      hintText: "Enter visitor name",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: address1,
                  decoration: InputDecoration(
                      labelText: "Address",
                      hintText: "Enter visitor address",
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
                  controller: purpose1,
                  decoration: InputDecoration(
                      labelText: "Purpose",
                      hintText: "Enter purpose of visit",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 35,),
                SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF000066),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: SendValuesToApiAddVisitors, child: Text("ADD"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
