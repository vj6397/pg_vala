import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class paymentStatus extends StatefulWidget {
  paymentStatus({required this.date,required this.roomId,required this.visiting_time,required this.name,required this.contact,required this.agg_fee,required this.payment_status,required this.transaction_id});
  String date;
  String roomId;
  String visiting_time;
  String name;
  String contact;
  String agg_fee;
  String payment_status;
  String transaction_id;


  @override
  State<paymentStatus> createState() => _paymentStatusState();
}

class _paymentStatusState extends State<paymentStatus> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
          elevation: 5,
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          child:Container(
            height: 250,
            width: MediaQuery.of(context).size.width-20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15,top: 10,right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Room ID :-${widget.roomId}',style: GoogleFonts.roboto (
                        fontSize:  17,
                        fontWeight:  FontWeight.w500,
                        color:  Colors.black,
                      ),),
                      SizedBox(height: 4,),
                      Text('Date :-${widget.date}',style: GoogleFonts.roboto (
                        fontSize:  17,
                        fontWeight:  FontWeight.w500,
                        color:  Colors.black,
                      ),),
                      SizedBox(height: 4,),
                      Text('Visiting Time :-${widget.visiting_time}',style: GoogleFonts.roboto (
                        fontSize:  17,
                        fontWeight:  FontWeight.w500,
                        color:  Colors.black,
                      ),),
                      SizedBox(height: 4,),
                      Text('Name :-${widget.name}',style: GoogleFonts.roboto (
                        fontSize:  17,
                        fontWeight:  FontWeight.w500,
                        color:  Colors.black,
                      ),),
                      SizedBox(height: 4,),
                      Text('Contact :-${widget.contact}',style: GoogleFonts.roboto (
                        fontSize:  17,
                        fontWeight:  FontWeight.w500,
                        color:  Colors.black,
                      ),),
                      SizedBox(height: 4,),
                      Text('Agg Fee :-${widget.agg_fee}',style: GoogleFonts.roboto (
                        fontSize:  17,
                        fontWeight:  FontWeight.w500,
                        color:  Colors.black,
                      ),),
                      SizedBox(height: 4,),
                      Text('Payment Status :-${widget.payment_status}',style: GoogleFonts.roboto (
                        fontSize:  17,
                        fontWeight:  FontWeight.w500,
                        color:  Colors.black,
                      ),),
                      SizedBox(height: 4,),
                      Text('Transcation ID :-${widget.transaction_id}',style: GoogleFonts.roboto (
                        fontSize:  17,
                        fontWeight:  FontWeight.w500,
                        color:  Colors.black,
                      ),),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
