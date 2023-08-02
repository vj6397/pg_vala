import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pg_vala/Api/request_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Landlord extends StatefulWidget {
  const Landlord({super.key});

  @override
  State<Landlord> createState() => _LandlordState();
}

class _LandlordState extends State<Landlord> {

  int currentIndex=0;
  int _inputValue1 = 3000;
  int _inputValue2 = 3000;
  String _roomid1 ='';
  double _rentPrice = 0.0;
  String _accommodationType = '';
  String _category = '';
  String _displaysharing1 = '1 Sharing';
  String _displaysharing2 = '1 Sharing';
  String _displayFurnish1 = 'Semi Furnished';
  String _displayFurnish2 = 'Furnished';
  bool _isToggled1 = false;
  bool _isToggled2 = false;
  final TextEditingController roomSharingController = TextEditingController();
  final TextEditingController furnishController = TextEditingController();
  final TextEditingController changedAmountController = TextEditingController();

  RequestUtil util  = new RequestUtil();

  Future<void> _getData() async{
    http.Response response = await util.check();
    if(response.statusCode==200) {
      print(response.body);
      List<dynamic> jsonData = jsonDecode(response.body);
      print(jsonData);
      print(jsonData[0]["roomid"]);
      if(jsonData.isNotEmpty){
        _roomid1=jsonData[0]["roomid"];
        _rentPrice = jsonData[0]["rent_price"];
        _accommodationType = jsonData[0]["accomotation_type"];
        _category = jsonData[0]["category"];
        setState(() {

        });
      }

      // print(jsonData["apartment_name"]);
    }
    else print("error");
  }



  @override
  void initState() {
    // TODO: implement initState
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _ToggleButton1(){
      setState(() {
        _isToggled1 = !_isToggled1;
      });
    }


    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
        child: ListView(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: (){
                          print(currentIndex);
                        },
                        child: imageSlider,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imageAssets.asMap().entries.map((entry){
                            print(entry);
                            print(entry.key);
                            return GestureDetector(
                              onTap: () => carouselController.animateToPage(entry.key),
                              child: Container(
                                width: currentIndex == entry.key?17:7,
                                height: 7,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 3.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: currentIndex == entry.key
                                    ?Colors.red
                                    :Colors.teal,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 15, 0, 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 150,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 255, 48, 68),
                            ),
                            child: Center(
                              child: Text(
                                '${_rentPrice} Bed/Month',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_roomid1}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 255, 48, 68),
                          ),
                          child: Center(
                            child: Text(
                              '${_accommodationType}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 255,48,68),
                          ),
                          child: Center(
                            child: Text(
                              '${_category}',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context){
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 580,
                                            child: Column(
                                              children: [
                                                Divider(),
                                                TextFormField(
                                                  controller:changedAmountController,
                                                    keyboardType: TextInputType.number,
                                                    onChanged: (value){
                                                        setState(() {
                                                          _inputValue1 = int.tryParse(value)??0;
                                                        });
                                                    },
                                                    decoration: InputDecoration(
                                                    filled: true,
                                                    prefixIcon: Icon(Icons.currency_rupee),
                                                    hintText: 'Enter the changed amount',
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide.none,
                                                    ),
                                                  ),
                                                ),
                                                Divider(),
                                                TextFormField(
                                                  controller: roomSharingController,
                                                  keyboardType: TextInputType.text,
                                                  onChanged: (value){
                                                    setState(() {
                                                      _displaysharing1 = value;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    prefixIcon: Icon(Icons.roofing),
                                                    hintText: 'Room Sharing',
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide.none,
                                                    ),
                                                  ),
                                                ),
                                                Divider(),
                                                TextFormField(
                                                  controller: furnishController,
                                                  keyboardType: TextInputType.text,
                                                  onChanged: (value){
                                                    setState(() {
                                                      _displayFurnish1 = value;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    prefixIcon: Icon(Icons.bed),
                                                    hintText: 'Room furnish type',
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide.none,
                                                    ),
                                                  ),
                                                ),
                                                Divider(),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child: Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Switch(
                          value: _isToggled1,
                          onChanged: (value){
                            _ToggleButton1();
                          },
                          activeTrackColor: Colors.lightGreen,
                          activeColor: Colors.green,
                          inactiveTrackColor: Colors.grey,
                          inactiveThumbColor: Colors.grey,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          _isToggled1?'Avaliable':'Not Avaliable',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(),
              ],
            ),
          ],
        )
      ),
    );
  }
}






