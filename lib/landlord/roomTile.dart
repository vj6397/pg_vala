import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class roomTile extends StatefulWidget {
  roomTile({required this.changedAmount,required this.roomId,required this.displaysharing1,required this.displayFurnish1});
  String changedAmount;
  String roomId;
  String displaysharing1;
  String displayFurnish1;

  @override
  State<roomTile> createState() => _roomTileState();
}

class _roomTileState extends State<roomTile> {
  final CarouselController carouselController = CarouselController();
  final TextEditingController roomSharingController = TextEditingController();
  final TextEditingController furnishController = TextEditingController();
  final TextEditingController changedAmountController = TextEditingController();
  int currentindex=0;


  final List imageAssets = [
    {"id":1,"image_path":'assets/bed1.png'},
    {"id":2,"image_path":'assets/bed2.png'},
  ];
  bool _isToggled1 = false;
  void _ToggleButton1(){
    setState(() {
      _isToggled1 = !_isToggled1;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedRentPrice = (rentPriceString).contains('.')
        ? (rentPriceString).replaceAll(RegExp(r'\.0*$'), '')
        : (rentPriceString);
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
                              +' Monthly',
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
                          onPressed: (){
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context){
                                return SingleChildScrollView(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.7,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height:500,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Divider(),
                                              TextFormField(
                                                controller:changedAmountController,
                                                keyboardType: TextInputType.number,
                                                onChanged: (value){
                                                  setState(() {
                                                    //changedAmount = int.tryParse(value)??0;
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
                                                   // displaysharing1 = value;
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
                                                    //displayFurnish1 = value;
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
                                  ),
                                );
                              },
                            );
                          },
                          child: Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
