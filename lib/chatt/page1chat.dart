import 'package:flutter/material.dart';

import 'main1.dart';

//Flag

String s = " ";
setUserFlag(String s1) {
  s = s1;
}

getUserFlag() {
  return s;
}

class ChattingPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
            // displayColor: kBlackColor,
            ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Bitmap.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                // style: Theme.of(context).textTheme.display3,
                children: [
                  TextSpan(
                    text: "flamin",
                  ),
                  TextSpan(
                    text: "go.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: GestureDetector(
                  onTap: () {
                    print("fff");
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 16),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 15),
                          blurRadius: 30,
                          color: Color(0xFF666666).withOpacity(.11),
                        ),
                      ],
                    ),
                    child: MaterialButton(
                      child: Padding(
                        padding: const EdgeInsets.all(0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text("   Start Chatting",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      onPressed: () {
                        setUserFlag("user");
                        print(getUserFlag());
                        main();
                      },
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
