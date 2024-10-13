import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key?Key}):super(key:Key);

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();


  Future<void>insertrecord() async{
    if(name.text !="" || email.text!="" || password.text!=""){
      try{
        String uri="http://127.0.0.1/E_app/insert_record.php";

        var res=await http.post(Uri.parse(uri),body:{
          "name":name.text,
          "email":email.text,
          "password":password.text
      });

        var response=jsonDecode(res.body);
        if(response["success"]=="true"){
          print("Record Inserted");
        }
        else{
          print("some issue");
        }
      }
      catch(e){
        print(e);
      }

    }
    else(
      print("please Fill All Fileds")
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        title: const Text('Insert record'),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: name,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter the Name')
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: email,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter the Email')
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: password,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter the Password')
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(onPressed: (){insertrecord();}, child: Text('Insert')),
        )
      ],
      

      ),
      ),
    );
  }
}