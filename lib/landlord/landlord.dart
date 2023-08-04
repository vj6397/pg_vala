import 'package:flutter/material.dart';
import 'package:pg_vala/Api/request_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pg_vala/utils/location_list.dart';
import 'package:pg_vala/landlord/roomTile.dart';

class Landlord extends StatefulWidget {
  const Landlord({super.key});

  @override
  State<Landlord> createState() => _LandlordState();
}

class _LandlordState extends State<Landlord> {

  RequestUtil util  = new RequestUtil();
  List<dynamic> jsonData=[];
  List<Widget> rooms=[];

  Future<void> _getData() async{
    http.Response response = await util.roomList();
    if(response.statusCode==200){
      setState(() {
        //addList();
        print(response.body);
        jsonData = jsonDecode(response.body);
        var i=0;
        while(i<jsonData.length){
          rooms.add(roomTile(changedAmount:jsonData[i]["rent_price"].toString(),roomId: jsonData[i]["roomid"],displaysharing1: jsonData[i]["accomotation_type"],displayFurnish1: jsonData[i]["category"],status: jsonData[i]["status"],));
          i++;
        }
        print(jsonData[0]["rent_price"]);print(jsonData[0]["roomid"]);
        print(jsonData[0]["accomotation_type"]);
        print(jsonData[0]["category"]);
        print(jsonData[0]["status"]);
        print(jsonData.length);
        print(jsonData[0]);
      });
    }
    else{
      print("error:${response.statusCode}");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: rooms,
          ),
        ),
      ),
    );
  }
}