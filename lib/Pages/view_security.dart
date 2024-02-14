import 'package:flutter/material.dart';
import 'package:security_app/Model/security_model.dart';
import 'package:security_app/Service/security_service.dart';

class ViewSecurity extends StatefulWidget {
  const ViewSecurity({super.key});

  @override
  State<ViewSecurity> createState() => _ViewSecurityState();
}

class _ViewSecurityState extends State<ViewSecurity> {
  Future<List<Security>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=SecurityApiService().getSecurityApi();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("Security Guard Details",style: TextStyle(color: Colors.white),),
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
                        color: Colors.white.withOpacity(0.9),
                        child: Column(
                          children: [
                            ListTile(
                              trailing: CircleAvatar(
                                radius: 27,
                                backgroundColor: Color(0xFF000066),
                                child: Text(snapshot.data![index].name[0],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                              title: Text(
                                snapshot.data![index].name,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Color(0xFF000066)),
                              ),
                              subtitle: Text(snapshot.data![index].empid
                                +"\n"+snapshot.data![index].email
                                  +"\n"+snapshot.data![index].address
                                  +"\n"+snapshot.data![index].phno
                                ,style:TextStyle(fontSize: 16) ,
                              ),
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
