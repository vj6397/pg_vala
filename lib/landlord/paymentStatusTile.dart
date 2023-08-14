import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pg_vala/landlord/paymentStatus.dart';
import '../Api/request_util.dart';

class paymentStatusTile extends StatefulWidget {
  const paymentStatusTile({super.key});

  @override
  State<paymentStatusTile> createState() => _paymentStatusTileState();
}

class _paymentStatusTileState extends State<paymentStatusTile> {
  RequestUtil util = new RequestUtil();
  List<dynamic> jsonData=[];
  List<Widget> transactions=[];


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
            transactions.add(paymentStatus(date: jsonData[i]["date"], roomId: jsonData[i]["roomid"], visiting_time: jsonData[i]["visting_time"], name: jsonData[i]["name"], contact: jsonData[i]["contact"], agg_fee: jsonData[i]["agg_fee"].toString(), payment_status: jsonData[i]["payment_status"]??"pending", transaction_id: jsonData[i]["transcationid"]??"-"));
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
                child: Text('Transaction history',
                  style:  GoogleFonts.poppins (
                    fontSize:  15,
                    fontWeight:  FontWeight.w600,
                    color:  Color(0xff201a25),
                  ),
                ),
              ),
              Column(
                children: transactions,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
