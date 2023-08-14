import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:pg_vala/Api/request_util.dart';
import 'package:pg_vala/main.dart';

class OwnerProfile extends StatefulWidget {
  @override
  State<OwnerProfile> createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {
  RequestUtil util=new RequestUtil();
  List<dynamic> jsonData=[];
  Future<void> _getData() async{
    http.Response res = await util.ownerDetail();
    if(res.statusCode==200){
      setState(() {
        //addList();
        print(res.body);
        jsonData = jsonDecode(res.body);
      });
    }
    else{
      print("error:${res.statusCode}");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 20,left: 15,top: 10),
                    child: Text("Owner's Profile",
                      style:  GoogleFonts.poppins (
                        fontSize:  15,
                        fontWeight:  FontWeight.w600,
                        color:  Color(0xff201a25),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  width: 300,
                  height: 270,
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 255,48,68),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage('assets/bed1.png'),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(jsonData[0]['owner_name'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                        Text('${jsonData[0]['contact1']} '+"|"+' ${jsonData[0]['contact2']}',
                          style: TextStyle(
                            color:Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(jsonData[0]['email'],
                          style: TextStyle(
                            color:Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    width: 300,
                    height: 340,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255,48,68),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      readOnly: true,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: jsonData[0]['apartment_name'],
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    TextField(
                                      readOnly: true,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: jsonData[0]['locality'],
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    TextField(
                                      readOnly: true,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: jsonData[0]['city'],
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    TextField(
                                      readOnly: true,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: jsonData[0]['address'],
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20),
                                          borderSide: BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}