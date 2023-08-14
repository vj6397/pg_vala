import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../Api/request_util.dart';
import 'bookingTile.dart';

class bookingPage extends StatefulWidget {
  const bookingPage({super.key});

  @override
  State<bookingPage> createState() => _bookingPageState();
}

class _bookingPageState extends State<bookingPage> {
  RequestUtil util = new RequestUtil();
  List<dynamic> jsonData=[];
  List<Widget> bookings=[];

  Future<void> _getData() async{
    http.Response response = await util.visitTime();
    if(response.statusCode==200) {
      print(response.body);
      // addList();
      var i=0;
      setState(() {
        jsonData= jsonDecode(response.body);
        while(i<jsonData.length){
          if(jsonData[i]["status"]?.toLowerCase() != "cancelled"){
            bookings.add(bookingTile(date: jsonData[i]["date"]??"2023-04-11",visiting_time: jsonData[i]["visting_time"]??"9:30 AM",contact: jsonData[i]["contact"]??"6263567229",city: jsonData[i]["city"]??"Bhilai",roomId: jsonData[i]["roomid"],name: jsonData[i]["name"]??"Chakradhar", entry_id: jsonData[i]["entery_id"].toString(), status: jsonData[i]["status"]??"visit"));
          }
          i++;
        }
        print(jsonData[0]["date"]);
        print(jsonData[0]["status"]);
        print(jsonData[0]["visting_time"]);
        print(jsonData[0]["entery_id"]);
      });
    }
    else print("error");
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
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20,left: 15,top: 10),
                child: Text('Bookings',
                  style:  GoogleFonts.poppins (
                    fontSize:  15,
                    fontWeight:  FontWeight.w600,
                    color:  Color(0xff201a25),
                  ),
                ),
              ),
              Column(
                children: bookings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
