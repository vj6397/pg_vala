import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pg_vala/Api/request_util.dart';
import 'package:http/http.dart'as http;
import 'package:pg_vala/Onboarding/registerAccomodation.dart';

class salesLogin extends StatefulWidget {
  const salesLogin({super.key});

  @override
  State<salesLogin> createState() => _salesLoginState();
}

class _salesLoginState extends State<salesLogin> {
  String password="";
  String Sales_id="";
  RequestUtil util = new RequestUtil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width-20,
                  margin: EdgeInsets.only(left:15,right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xfff3f3f3),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30,left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text('Sales_id',style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          padding: EdgeInsets.only(right: 30.0),
                          height: 45,
                          child: TextField(
                            onChanged: (String st){
                              setState(() {
                                Sales_id=st;
                              });
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              disabledBorder:InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 25,),
                        Container(
                          child: Text('Password',style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          padding: EdgeInsets.only(right: 30.0),
                          height: 45,
                          child: TextField(
                            onChanged: (String st){
                              setState(() {
                                password=st;
                              });
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              disabledBorder:InputBorder.none,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 45.0),
                        Container(
                          height: 45.0,
                          width: MediaQuery.of(context).size.width-50,
                          margin: EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                          child: InkWell(
                            onTap:()async{
                              if(Sales_id.isNotEmpty && password.isNotEmpty){
                                http.Response res=await util.sales_logIn(Sales_id, password);
                                if(res.statusCode==200) print(res.body);
                                else print(res.body);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>landlordform()),
                                );
                              }
                              else{
                                print('hello');
                                Fluttertoast.showToast(
                                    msg: "Enter valid sales_id",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            },
                            child: Center(
                              child: Text('Register',style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


