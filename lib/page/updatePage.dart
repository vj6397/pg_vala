import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pg_vala/Api/request_util.dart';
import 'package:pg_vala/circularProgressIndicator/circularProgressIndicator.dart';
import 'package:pg_vala/landlord/landlord.dart';
import 'package:http/http.dart' as http;
import 'package:pg_vala/ownerPage/ownerProfile.dart';
import '../main.dart';
import '../utils/location_list.dart';

class Update extends StatefulWidget {
  Update({required this.roomId,required this.changesAmount,required this.displayFurnish1,required this.displaySharing1,required this.depositAmount});
  //
  String roomId;
  String displayFurnish1;
  String changesAmount;
  String displaySharing1;
  String depositAmount;

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var roomsharing_list = rooomsharing;
  String dropdownvalue = rooomsharing.first;
  String? selectedOptionfurnish;
  String? selectedOptiontenant;
  List radioOptionfurnish=['UnFurnished','Semi Furnished','Fully Furnished'];
  List radioOptiontenent=['Girls','Boys','Family'];

  String changedAmount="";
  String deposit="";
  RequestUtil util=new RequestUtil();
  UpdateDetails() async{
    http.Response res_changeAmount= await util.update(widget.roomId, 'rent_price', changedAmount);
    http.Response res_Dep= await util.update(widget.roomId, 'security_deposit', deposit);
    http.Response res_Sharing= await util.update(widget.roomId, 'accomotation_type', dropdownvalue);
    http.Response res_Fur= await util.update(widget.roomId, 'category', selectedOptionfurnish!);
    http.Response res_Type= await util.update(widget.roomId, 'tenant', selectedOptiontenant!);
    if(res_changeAmount.statusCode==200) print(res_changeAmount.body);
    if(res_Dep.statusCode==200) print(res_Dep.body);
    if(res_Sharing.statusCode==200) print(res_Sharing.body);
    if(res_Fur.statusCode==200) print(res_Fur.body);
    if(res_Type.statusCode==200) print(res_Type.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                          },
                          icon: Icon(
                              Icons.arrow_back_rounded
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10,left: 15),
                        child: Text(
                            'RoomId: ${widget.roomId}',
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 5, right: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value){
                              setState(() {
                                changedAmount =value;
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: Icon(Icons.currency_rupee),
                              hintText: '${widget.changesAmount}',
                              labelText: 'Enter the changed amount',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),

                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:5,),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 5, right: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value){
                              setState(() {
                                deposit=value;
                              });
                            },
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: Icon(Icons.currency_rupee),
                              hintText: '${widget.depositAmount}',
                              labelText: 'Security Deposit',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(left: 5, right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropdownvalue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              isExpanded: true,
                              menuMaxHeight: 200,
                              items: roomsharing_list.map<DropdownMenuItem<String>>((e) {
                                return DropdownMenuItem<String>(
                                  value: e,
                                  child: Padding( // Add padding to the DropdownMenuItem to match the style
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                    child: Text(
                                      e.toString(),
                                      style: GoogleFonts.notoSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text('Furnished Type ',
                                style: GoogleFonts.notoSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            for(String option in radioOptionfurnish)
                              RadioListTile(
                                title: Text(option),
                                value: option,
                                groupValue: selectedOptionfurnish,
                                onChanged: (val){
                                  setState(() {
                                    selectedOptionfurnish=val;
                                  });
                                },
                              ),
                          ],
                        )
                      ),
                      SizedBox(height: 5,),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 13.0),
                                child: Text('Tenant Type',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              for(String option in radioOptiontenent)
                                RadioListTile(
                                  title: Text(option),
                                  value: option,
                                  groupValue: selectedOptiontenant,
                                  onChanged: (val){
                                    setState(() {
                                      selectedOptiontenant=val;
                                    });
                                  },
                                ),
                            ],
                          )
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        onTap: (){
                          UpdateDetails();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>circularProgressIndicator()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left:MediaQuery.of(context).size.width/2-60,bottom: 10),
                          height: 38,width: 114,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            //border:Border.all(width: 1,color: Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text('Update',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}


