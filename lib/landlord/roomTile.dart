import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pg_vala/Api/request_util.dart';
import 'package:pg_vala/page/updatePage.dart';
import 'package:http/http.dart' as http;

class roomTile extends StatefulWidget {
  roomTile({required this.changedAmount,required this.roomId,required this.displaysharing1,required this.displayFurnish1,required this.status,required this.depositAmount,required this.imgList});
  String changedAmount;
  String roomId;
  String displaysharing1;
  String displayFurnish1;
  String status;
  String depositAmount;
  String imgList;

  @override
  State<roomTile> createState() => _roomTileState();
}

class _roomTileState extends State<roomTile> {
  final CarouselController carouselController = CarouselController();
  final TextEditingController roomSharingController = TextEditingController();
  final TextEditingController furnishController = TextEditingController();
  final TextEditingController changedAmountController = TextEditingController();
  int currentindex=0;


  RequestUtil util=new RequestUtil();

  final List imageAssets = [
    // {"id":1,"image_path":'assets/bed1.png'},
    // {"id":2,"image_path":'assets/bed2.png'},
  ];
  void get_images(){
    String jsonString =widget.imgList;
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    List<String> filenames = jsonMap.values.map<String>((value) => value.toString()).toList();
    print(filenames);
    for (int i = 0; i < filenames.length; i++) {
      String imagePath = filenames[i];
      Map<String, dynamic> imageData = {"id": i, "image_path": imagePath};
      imageAssets.add(imageData);
    }
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
  late bool _isToggled1;
  void _ToggleButton1(bool value)async{
    http.Response res=await util.update(widget.roomId, 'status', stringToBool(widget.status)?'booked':'available');
    if(res.statusCode==200) print(res.body);
    setState(() {
      // _isToggled1=!_isToggled1;
      _isToggled1=value;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isToggled1=stringToBool(widget.status);
    get_images();
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
                              (item) => Image.network(
                            'https://pgvala.s3.amazonaws.com/${item["image_path"]}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )
                      ).toList(),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Update(roomId: widget.roomId,changesAmount: widget.changedAmount,displayFurnish1: widget.displayFurnish1,displaySharing1: widget.displaysharing1,depositAmount: widget.depositAmount)));
                          //depositAmount: widget.depositAmount
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
                        value: _isToggled1,
                        //stringToBool(widget.status)
                        onChanged: (value){
                          _ToggleButton1(value);
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