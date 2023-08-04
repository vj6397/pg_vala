import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'otp_verification.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String num="";
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
                  margin: EdgeInsets.only(right: 20),
                  height: 120,width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.jpg'),
                        fit: BoxFit.fill
                      )
                  ),
                ),
                SizedBox(height: 5.0),
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
                          child: Text('Login',style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                        SizedBox(height: 25.0),
                        Container(
                          child: Text('mobile number',style: TextStyle(
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
                              num=st;
                            },
                            keyboardType: TextInputType.phone,
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
                            color: Color(0xff419f7d)
                          ),
                          child: InkWell(
                            onTap:(){
                              if(num.length==10){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>OtpVerify(number: num)),
                                );
                              }
                              else{
                                print('hello');
                                Fluttertoast.showToast(
                                    msg: "Enter valid number",
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
                              child: Text('Send OTP',style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          margin: EdgeInsets.only(left: 20,right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Don\'t have an account yet?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13
                              ),),
                              InkWell(
                                onTap: (){
                                  print('hello');
                                },
                                child: Text('Register for free',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
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
  void _showErrorSnackbar(BuildContext context, String errorMessage) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(errorMessage),
    //     backgroundColor: Colors.grey,
    //     duration: Duration(seconds: 2),
    //   ),
    // );

  }
}
