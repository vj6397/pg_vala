import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/location_list.dart';


class registerRoom extends StatefulWidget {
  const registerRoom({super.key});

  @override
  State<registerRoom> createState() => _registerRoomState();
}

class _registerRoomState extends State<registerRoom> {
  String accid = "";
  String roomid = "";
  String contact1= "";
  String contact2 = "";
  String email = "";
  String rent_price = "";
  String security_price="";
  String tenant="";
  bool isChecked = false;
  List radioOptionwashroomStatus=['Attached','Not Attached'];
  String? selectedOptionwashroomStatus;
  List radioOptionAvailabitystatus=['Booked','Available'];
  String? selectedAvailabitystatus;
  List radioOptionfurnish=['Un Furnished','Semi Furnished','Fully Furnished'];
  String? selectedOptionfurnish;
  List radioOptiontenent=['Girls','Boys','Family'];
  String? selectedOptiontenant;
  var roomsharing_list = rooomsharing;
  String dropdownvalueRoomSharing = rooomsharing.first;
  var rate_list=rate;
  String dropdownvalueRate=rate.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded)),
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.only(left: 15,bottom: 10),
                      child: Text(
                        'Accid',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          accid = val;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors
                                    .black, // Set the desired border width here
                              ),
                            ),
                            hintText: 'Enter accid'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'RoomId',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          roomid = val;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors
                                    .black, // Set the desired border width here
                              ),
                            ),
                            hintText: 'Enter Room Id'),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text('Washroom Status ',
                                style: GoogleFonts.notoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            for(String option in radioOptionwashroomStatus)
                              RadioListTile(
                                title: Text(option),
                                value: option,
                                groupValue: selectedOptionwashroomStatus,
                                onChanged: (val){
                                  setState(() {
                                    selectedOptionwashroomStatus=val;
                                  });
                                },
                              ),
                          ],
                        )
                    ),
                    SizedBox(height: 20),
                    //radiobutton for availability status
                    Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text('Washroom Status ',
                                style: GoogleFonts.notoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            for(String option in radioOptionAvailabitystatus)
                              RadioListTile(
                                title: Text(option),
                                value: option,
                                groupValue: selectedAvailabitystatus,
                                onChanged: (val){
                                  setState(() {
                                    selectedAvailabitystatus=val;
                                  });
                                },
                              ),
                          ],
                        )
                    ),
                    //perks
                    SizedBox(height: 20),
                    //radiobutton accomodation_type
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Accomodation Type',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 5, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownvalueRoomSharing,
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
                                dropdownvalueRoomSharing = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Rent Price details',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          rent_price = val;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors
                                    .black, // Set the desired border width here
                              ),
                            ),
                            hintText: 'Enter Rent Price'),
                      ),
                    ),
                    SizedBox(height: 20),
                    //Radiobutton for category Furnished
                    Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text('Furnish Status',
                                style: GoogleFonts.notoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
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
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Accomodation Type',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(left: 5, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownvalueRate,
                            icon: Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            menuMaxHeight: 200,
                            items: rate_list.map<DropdownMenuItem<String>>((e) {
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
                                dropdownvalueRate = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    //Radiobutton for tenant type
                    SizedBox(height: 20,),
                    Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text('Tenant Type',
                                style: GoogleFonts.notoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
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
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Security deposit',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          security_price = val;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide(
                                color: Colors
                                    .black, // Set the desired border width here
                              ),
                            ),
                            hintText: 'Enter Security Deposit'),
                      ),
                    ),
                    SizedBox(height: 5),
                    CheckboxListTile(
                      title: Text('Remember me'),
                      checkColor: Colors.white,
                      value: isChecked,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Container(
                              height: 38,width: 114,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:Border.all(width: 1,color: Colors.green),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.green
                                  ),),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=> stateLoc()));
                            },
                            child: Container(
                              height: 38,width: 114,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                //border:Border.all(width: 1,color: Colors.green),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text('Continue',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
