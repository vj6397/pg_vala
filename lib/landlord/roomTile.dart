import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pg_vala/page/changes.dart';
import '../utils/location_list.dart';

class roomTile extends StatefulWidget {
  roomTile({required this.changedAmount,required this.roomId,required this.displaysharing1,required this.displayFurnish1,required this.status});
  String changedAmount;
  String roomId;
  String displaysharing1;
  String displayFurnish1;
  String status;


  @override
  State<roomTile> createState() => _roomTileState();
}

class _roomTileState extends State<roomTile> {
  final CarouselController carouselController = CarouselController();
  final TextEditingController roomSharingController = TextEditingController();
  final TextEditingController furnishController = TextEditingController();
  final TextEditingController changedAmountController = TextEditingController();
  int currentindex=0;
  bool isChecked=false;
  var roomsharing_list = rooomsharing;
  String dropdownvalue = rooomsharing.first;

  String? selectedOption ;


  final List imageAssets = [
    {"id":1,"image_path":'assets/bed1.png'},
    {"id":2,"image_path":'assets/bed2.png'},
  ];
  bool _isToggled1 = false;
  void _ToggleButton1(){
    setState(() {
      _isToggled1=!_isToggled1;
    });
  }
  void setSelectedradio(String value) {
    setState(() {
      selectedOption=value;
    });
  }
  bool stringToBool(String value) {
    if (value.toLowerCase() =="available") {
      return true;
    } else if (value.toLowerCase() == "booked") {
      return false;
    } else {
      throw Exception('Invalid string value for boolean conversion: $value');
    }
  }
  
  @override
  Widget build(BuildContext context) {
   
    return Container(
      margin: EdgeInsets.only(top: 10,right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  InkWell(
                    onTap: (){
                      print(currentindex);
                    },
                    child: CarouselSlider(
                      items: imageAssets.map(
                              (item) => Image.asset(
                            item['image_path'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )
                      )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: false,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason){
                            setState(() {
                              currentindex = index;
                            });
                          }
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageAssets.asMap().entries.map((entry){
                        // print(entry);
                        // print(entry.key);
                        return GestureDetector(
                          onTap: () => carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentindex == entry.key?17:7,
                            height: 7,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentindex == entry.key
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
                            '${double.parse(widget.changedAmount).toInt()}/Monthly ',
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
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.roomId,
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
                            widget.displaysharing1,
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
                            widget.displayFurnish1,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Changes(roomId: widget.roomId,changesAmount: widget.changedAmount,displayFurnish1: widget.displayFurnish1,displaySharing1: widget.displaysharing1,)));
                        },
                        child: Icon(Icons.more_vert,
                        color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Switch(
                        value: stringToBool(widget.status),
                        //stringToBool(widget.status)
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
                        stringToBool(widget.status)?'Avaliable':'Not Avaliable',
                        //stringToBool(widget.status)
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}