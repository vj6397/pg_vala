import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pg_vala/circularProgressIndicator/circularProgressIndicator.dart';
import '../Api/request_util.dart';


class bookingTile extends StatefulWidget {
  bookingTile({required this.date,required this.visiting_time,required this.contact,required this.city,required this.entry_id,required this.status,required this.roomId,required this.name});
  String date;
  String visiting_time;
  String contact;
  String name;
  String roomId;
  String city;
  String entry_id;
  String status;


  @override
  State<bookingTile> createState() => _bookingTileState();
}

class _bookingTileState extends State<bookingTile> {
  RequestUtil util = new RequestUtil();
  List<dynamic> jsonData=[];
  void _showAlertDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Alert'),
            content: Text('Do you want to allot the room for the id ${widget.roomId}'),
            actions:<Widget>[
              TextButton(
                onPressed: ()async{
                  http.Response response=await util.updateDetail(widget.roomId,"status","Booked");
                  print(response.body);
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>circularProgressIndicator()));
                },
                child: Text('OK'),
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Material(
            elevation: 5,
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width-20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 17,top: 10,right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booking Date',
                          style:  GoogleFonts.poppins (
                            fontSize:  15,
                            fontWeight:  FontWeight.w500,
                            color:  Color(0xff201a25),
                          ),
                        ),
                        InkWell(
                          onTap: () async{
                            _showAlertDialog(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 5),
                            width:  81,
                            height:  30,
                            decoration:  BoxDecoration (
                              color:  Color.fromARGB(255, 255, 48, 68),
                              borderRadius:  BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                'Alloted',
                                style:  GoogleFonts.roboto (
                                  fontSize:  12,
                                  fontWeight:  FontWeight.w500,
                                  color:  Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    width:MediaQuery.of(context).size.width-20,
                    height: 20,
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.access_time_outlined,size: 12,color: Color.fromARGB(255, 255, 48, 68)),
                        SizedBox(width: 2,),
                        Text('${widget.date}, ${widget.visiting_time}'),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    width:MediaQuery.of(context).size.width-20,
                    height: 20,
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Status:- ${widget.status}'),
                      ],
                    ),
                  ),

                  Divider(),
                  Container(
                    width: MediaQuery.of(context).size.width-20,
                    height: 90,
                    margin: EdgeInsets.only(left: 15,top:6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${widget.name}',style:  GoogleFonts.poppins (
                          fontSize:  15,
                          fontWeight:  FontWeight.w500,
                          color:  Color(0xff201a25),
                        )
                        ),
                        SizedBox(height: 2,),
                        Text('${widget.contact}',style:  GoogleFonts.poppins (
                          fontSize:  13,
                          fontWeight:  FontWeight.w500,
                          color:  Color(0xff201a25),
                        ),
                        ),
                        Text('${widget.roomId}',style:  GoogleFonts.poppins (
                          fontSize:  13,
                          fontWeight:  FontWeight.w500,
                          color:  Color(0xff201a25),
                        ),
                        ),
                        // SizedBox(height: 4,),
                        Container(
                          width: MediaQuery.of(context).size.width-20,
                          height: 20,
                          child: Text('${widget.city}',style:  GoogleFonts.poppins (
                            fontSize:  13,
                            fontWeight:  FontWeight.w500,
                            color:  Color(0xff201a25),
                          ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

