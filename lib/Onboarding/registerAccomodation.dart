import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pg_vala/forms/state.dart';
import '../utils/location_list.dart';

//register_accomodation.
class landlordform extends StatefulWidget {
  const landlordform({super.key});
  @override
  State<landlordform> createState() => _landlordformState();
}

class _landlordformState extends State<landlordform> {
  String Apartmentname = "";
  String Ownername = "";
  String contact1= "";
  String contact2 = "";
  String email = "";
  String total_accomodation = "";
  String tenant="";
  bool isChecked = false;

  var states_list=states;
  String dropdownvalue = states.first;
  var cities_list=cities;
  String dropdownvalue2 = cities.first;
  var locality_list=localities;
  String dropdownvalue3 = localities.first;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded)),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,bottom: 10),
                      child: Text(
                        'Apartment Name',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        onChanged: (val) {
                          Apartmentname = val;
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
                            hintText: 'Enter Apartment Name'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Owner Name',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        onChanged: (val) {
                          Ownername = val;
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
                            hintText: 'Enter Owner Name'),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Contact details',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        onChanged: (val) {
                          contact1 = val;
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
                            hintText: 'Enter Conatct1'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Contact details',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        onChanged: (val) {
                          contact2 = val;
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
                            hintText: 'Enter Conatct2'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Email',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        onChanged: (val) {
                          email = val;
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
                            hintText: 'Enter Email'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Accomodation details',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        onChanged: (val) {
                          total_accomodation = val;
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
                            hintText: 'Total number of Accomodation'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Tenant details',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        onChanged: (val) {
                          tenant = val;
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
                            hintText: 'Enter tenant details'),
                      ),
                    ),
                    SizedBox(height: 15,),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> stateLoc()));
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
