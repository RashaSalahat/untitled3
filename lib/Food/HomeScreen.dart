import 'package:flutter/material.dart';
import 'package:hotel_booking/Food/DetailsScreen.dart';
import 'package:hotel_booking/Food/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/Food/food.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../bottomappfood.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Food foodService = Food();
  bool tag = false;
  bool im = false;
  List recommendedList = [
    //  {"image": "assets/images/food1.png", "name": "Asian Glazed Chicken Thighs"},
    //{"image": "assets/images/food2.png", "name": "Blueberry Muffins"},
    // {"image": "assets/images/food1.png", "name": "Asian Glazed Chicken Thighs"},
    // {"image": "assets/images/food2.png", "name": "Blueberry Muffins"},
    // {"image": "assets/images/food3.png", "name": "Fresh Toast with Berries"},
    // {"image": "assets/images/food4.png", "name": "Glazed Salmon"},
    // {"image": "assets/images/food5.png", "name": "Cherry Clafoutis"},
    {"image": "assets/images/food3.png", "name": "Fresh Toast with Berries"},
    {"image": "assets/images/food4.png", "name": "Glazed Salmon"},
    {"image": "assets/images/food5.png", "name": "Cherry Clafoutis"},
  ];
  List freshList = [
    {"image": "assets/images/food1.png", "name": "Asian Glazed Chicken Thighs"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 64.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (() => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => BottomParFood(),
                          ))),
                      child: Icon(Icons.arrow_back)),
                  // GestureDetector(
                  //   onTap: (() => print("Notification")),
                  //   child: SvgPicture.asset(
                  //     "assets/icons/notification.svg",
                  //     height: 32.0,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 12.0),
              Text(
                "Bonjor",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                "What would you like to cook today ?",
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: "HellixBold",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextField(
                        cursorColor: kDarkColor,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 34.0,
                          ),
                          hintText: "Search for Recipes",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  GestureDetector(
                    onTap: () => print("Filter"),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 18.0,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/settings.svg",
                        //color: kDarkColor,
                        height: 22.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's fresh Recipies",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: "HellixBold",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("See All Fresh Recipes"),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kOrangeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Container(
                height: 240.0,
                child: FutureBuilder<List>(
                  future: foodService.getAllFood(),
                  builder: (context, snapshot) {
                    print("print food next line");
                    print(snapshot.data);
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            print(snapshot.data![index]['foodname']);
                            print(snapshot.data![index]['time']);
                            print(snapshot.data![index]['calories']);
                            print(snapshot.data![index]['duration']);
                            print(snapshot.data![index]['duration']);

                            var imageUrl =
                                "https://raw.githubusercontent.com/RashaSalahat/Eating-Done/master/assets/images/food1.png";

                            //freshList[0]["name"];

                            //"http://10.0.2.2:3000/" +
                            //  snapshot.data![index]['foodImage'];
                            //  "http://10.0.2.2:3000/uploads/2022-05-18T10-26-22.797Zfood1.png";

                            //tring = imageUrl.replaceAll(letter, newLetter);
                            //String image= snapshot.data![index]["foodImage"];
                            //  print(string);
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      index,
                                      snapshot.data![index]["foodname"],
                                      imageUrl,
                                      // Image.network(string) as String,
                                      tag = true),
                                ),
                              ),
                              child: Container(
                                height: 240.0,
                                width: 200.0,
                                margin: EdgeInsets.only(
                                  right: 32.0,
                                ),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      top: 16.0,
                                      left: 16.0,
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Positioned(
                                      top: 16.0,
                                      right: -32.0,
                                      child: Hero(
                                        tag: "fresh$index",
                                        child: Container(
                                          width: 120.0,
                                          height: 120.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  imageUrl),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 100.0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data![index]['time'],
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: kBlueColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Container(
                                              width: 180.0,
                                              child: Text(
                                                snapshot.data![index]
                                                    ["foodname"],
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontFamily: "HellixBold",
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              children: List.generate(
                                                5,
                                                (index) => Icon(
                                                  Icons.star,
                                                  color: kOrangeColor,
                                                  size: 16.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              snapshot.data![index]['calories'],
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: kOrangeColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.access_time,
                                                      color: Colors.grey,
                                                      size: 14.0,
                                                    ),
                                                    SizedBox(height: 8.0),
                                                    Text(
                                                      snapshot.data![index]
                                                          ['duration'],
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 32.0),
                                                Row(
                                                  children: [
                                                    /*
                                                    SvgPicture.asset(
                                                      "assets/icons/bell.svg",//bell
                                                      height: 14.0,
                                                      color: Colors.grey,
                                                    ),*/
                                                    SizedBox(width: 8.0),
                                                    Text(
                                                      snapshot.data![index]
                                                          ['description'],
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: Text('No Data Found'),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: "HellixBold",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("See All Recommended"),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kOrangeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recommendedList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          index,
                          recommendedList[index]["name"],
                          recommendedList[index]["image"],
                          tag = false,
                        ),
                      ),
                    ),
                    child: Container(
                      height: 120.0,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 12.0,
                      ),
                      margin: EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          Hero(
                            tag: "recommended$index",
                            child: Image.asset(
                              recommendedList[index]["image"],
                              height: 180.0,
                              width: 120.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Breakfast",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: kBlueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 6.0),
                                  Text(
                                    recommendedList[index]["name"],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: "HellixBold",
                                    ),
                                  ),
                                  SizedBox(height: 6.0),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(
                                          5,
                                          (index) => Icon(
                                            Icons.star,
                                            color: kOrangeColor,
                                            size: 16.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 6.0),
                                      Text(
                                        "120 Cal",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: kOrangeColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6.0),
                                  Row(
                                    children: [
                                      /*
                                      SvgPicture.asset(
                                        "assets/icons/bell.svg",
                                        height: 14.0,
                                        color: Colors.grey,
                                      ),
*/

                                      SizedBox(width: 8.0),
                                      Text(
                                        "1 serving ",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 28.0,
                              width: 36.0,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
