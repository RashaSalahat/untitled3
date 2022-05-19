import 'package:flutter/material.dart';
import 'package:hotel_booking/api/toy.dart';
import 'package:hotel_booking/configuration.dart';
import 'package:hotel_booking/toy.dart';

class Screen2 extends StatelessWidget {
  Screen2({Key? key, required this.ind}) : super(key: key);
  final int ind;
  @override
  Widget build(BuildContext context) {
    Toy Service = Toy();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff2cbd0),
        elevation: 0,
        leading: IconButton(
          // padding: EdgeInsets.only(left: kDefaultPadding),
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        actions: <Widget>[
          // IconButton(
          //   icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: FutureBuilder<List>(
        future: Service.getAllToys(),
        builder: (context, snapshot) {
          int? d = snapshot.data?.length;
          print(snapshot.data?.length);
          if (snapshot.hasData) {
            // print(snapshot.data![0]["openst"]);
            return Stack(
              children: [
                Positioned.fill(
                    child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Color(0xfff2cbd0),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                      ),
                    )
                  ],
                )),
                // Container(
                //   margin: EdgeInsets.only(top: 30),
                //   child: Align(
                //     alignment: Alignment.topCenter,
                //     child: Row(
                //       //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         IconButton(
                //             icon: Icon(Icons.arrow_back),
                //             onPressed: () {
                //               print('fffff');
                //               Navigator.pop(context);
                //             }),
                //       ],
                //     ),
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                        tag: ind, child: Image.asset(productToys[ind].image)),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data![ind]['name'],
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontFamily: 'Courier'),
                          ),
                          Text(snapshot.data![ind]['describtion'] + "\n",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                  fontFamily: 'Courier')),
                          SizedBox(
                            height: 70,
                          ),
                          Text("Store:" + snapshot.data![ind]['stores'] + "\n",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.redAccent,
                                  fontFamily: 'Courier')),
                        ]),
                    height: 250,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Color(0xff6a515e),
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(0xFFf5bde8),
                                borderRadius: BorderRadius.circular(20)),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff6a515e),
                                  shape: const StadiumBorder()),
                              child: const Text(
                                "Add to Favorite ",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: Text('No Data Found'),
            );
          }
        },
      ),
    );
  }
}
