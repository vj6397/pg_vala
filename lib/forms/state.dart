import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pg_vala/forms/city.dart';
import 'package:pg_vala/forms/landlordForm.dart';

import '../utils/location_list.dart';

class stateLoc extends StatefulWidget {

  @override
  State<stateLoc> createState() => _stateLocState();
}

class _stateLocState extends State<stateLoc> {
  var states_list = states;
  String dropdownvalue = states.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Stack(
          children: [
            Positioned(
              top: 10,
              left: 15,
              child: IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>landlordform()));
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(left: 1),
                    child: Text(
                      'State',
                      style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width-70,
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
                      items: states_list.map<DropdownMenuItem<String>>((e) {
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
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CityLocation()),
                    );
                  },
                  child: Container(
                    height: 38,
                    width: 114,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
