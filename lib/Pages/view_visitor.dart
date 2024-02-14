import 'package:flutter/material.dart';
import 'package:security_app/Model/visitor_model.dart';
import 'package:security_app/Service/visitor_service.dart';

class ViewVisitor extends StatefulWidget {
  const ViewVisitor({super.key});

  @override
  State<ViewVisitor> createState() => _ViewVisitorState();
}

class _ViewVisitorState extends State<ViewVisitor> {
  Future<List<Visitor>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=VisitorApiService().getVisitor();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("View Visitor Details",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFF000066),
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return Card(
                        color: Color(0xFF9EB7D3),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("Visitor : "+snapshot.data![index].name,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                              subtitle: Text("Address : "+snapshot.data![index].address+ "\n"+"Phone no : "
                                  + snapshot.data![index].phone+"\n"+"Purpose :"+snapshot.data![index].purpose
                                  ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Added By :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Color(0xFF000066)),),
                                    Text("Officer : "+snapshot.data![index].securityId.name,style: TextStyle(fontSize: 15),),
                                    Text("Emp Id : "+snapshot.data![index].securityId.empid,style: TextStyle(fontSize: 15),),
                                    Text(snapshot.data![index].postedDate.toIso8601String(),style: TextStyle(fontSize: 15),),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),
                      );
                    });
              }
              else
              {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
