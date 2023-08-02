import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:davai_wala/utils/cityList.dart';

class PateintDetailsDelivery extends StatefulWidget {
  const PateintDetailsDelivery({Key? key}) : super(key: key);

  @override
  State<PateintDetailsDelivery> createState() => _PateintDetailsDeliveryState();
}

class _PateintDetailsDeliveryState extends State<PateintDetailsDelivery> {
  String? selectedRadio;
  String name = "";
  String number = "";
  bool isChecked = false;


  // var cities=list_of_cities;
  // String dropdownvalue = list_of_cities.first;
  // List of items in our dropdown menu


  setSelectedRadio(String val) {
    setState(() {
      selectedRadio = val;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: <Widget>[
                      RadioListTile(
                        title: Text(
                          'Yourself',
                          style: GoogleFonts.notoSans(
                              fontSize: 14, color: Color(0xff666666)),
                        ),
                        value: 'Option 1',
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setSelectedRadio(val!);
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      RadioListTile(
                        title: Text(
                          'Family',
                          style: GoogleFonts.notoSans(
                              fontSize: 14, color: Color(0xff666666)),
                        ),
                        value: 'Option 2',
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setSelectedRadio(val!);
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      RadioListTile(
                        title: Text(
                          'Friend',
                          style: GoogleFonts.notoSans(
                              fontSize: 14, color: Color(0xff666666)),
                        ),
                        value: 'Option 3',
                        groupValue: selectedRadio,
                        onChanged: (val) {
                          setSelectedRadio(val!);
                        },
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Patient Name',
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    onChanged: (val) {
                      name = val;
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
                        hintText: 'Enter Name'),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Phone number',
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    onChanged: (val) {
                      number = val;
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
                        hintText: 'Enter Number'),
                  ),
                ),
                SizedBox(height: 2),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Your phone number must be 10 digits',
                    style: GoogleFonts.notoSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff666666),
                    ),
                  ),
                ),
                SizedBox(height: 15),
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
                  margin: EdgeInsets.only(left: 15,top: 5),
                  child: Text(
                    'City',
                    style: GoogleFonts.notoSans(
                        fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 15,top: 10,right: 10),
                  // child:
                  // SingleChildScrollView(
                  //   child:
                  //   // DropdownButton(
                  //   //   value: dropdownvalue,
                  //   //   icon: Icon(Icons.keyboard_arrow_down),
                  //   //   isExpanded: true,
                  //   //   menuMaxHeight: 200,
                  //   //   padding: EdgeInsets.only(left: 15,right: 10),
                  //   //   items: cities.map((String items) {
                  //   //     return DropdownMenuItem(
                  //   //       value: items,
                  //   //       child: Text(items,style: GoogleFonts.notoSans (
                  //   //         fontSize:  15,
                  //   //         fontWeight:  FontWeight.w400,
                  //   //         color:  Colors.black,
                  //   //       ),),
                  //   //     );
                  //   //   }).toList(),
                  //   //   onChanged: (String? newValue) {
                  //   //     setState(() {
                  //   //       dropdownvalue = newValue!;
                  //   //     });
                  //   //   },
                  //   // ),
                  // ),
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
                        onTap: (){},
                        child: Container(
                          height: 38,width: 114,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            //border:Border.all(width: 1,color: Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text('Payment',
                              style: TextStyle(
                                  color: Colors.white
                              ),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
