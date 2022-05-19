import 'package:flutter/material.dart';

import '../../page2/page2screen.dart';
import '../../widgets/curved_widget.dart';
import 'pahe1form.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfff2cbd0), Color(0xfff4ced9)],
          )),
          child: SingleChildScrollView(
            child: Stack(children: [
              CurvedWidget(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 50),
                  width: double.infinity,
                  height: 300,
                  // color: Colors.red,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.white24],
                    ),
                  ),

                  child: const Text(
                    'Complete Setting',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff6a515e),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 230),
                child: LoginForm(),
              )
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (getUsernamena() == '') {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                          alignment: Alignment.topCenter,
                          overflow: Overflow.visible,
                          children: [
                            Container(
                              height: 250,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text("Warning!!",
                                          style: TextStyle(
                                              fontFamily: "Segoe UI",
                                              fontWeight: FontWeight.w700,
                                              fontSize: 23,
                                              color: Color.fromARGB(
                                                  255, 233, 35, 35))),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Text(
                                          "Please make sure you enter all the information before proceeeding to the next page.",
                                          style: TextStyle(
                                              fontFamily: "Segoe UI",
                                              fontSize: 16,
                                              color: Color(0xff070707))),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 70,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xffffae88),
                                              Color(0xff8f93ea)
                                            ],
                                          ),
                                        ),
                                        child: MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: StadiumBorder(),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: const <Widget>[
                                                  Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                top: -50,
                                child: CircleAvatar(
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(70)),
                                      child:
                                          Image.asset("assets/images/log.jpg")),
                                  radius: 45,
                                ))
                          ]),
                    );
                  });
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => RegisterScreen(),
                  ));
            }
          },
          label: Text(
            'Next',
            style: TextStyle(fontSize: 16),
          ),
          icon: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
          backgroundColor: Color(0xff6a515e),
          elevation: 10,
        ));
  }
}

// extendBodyBehindAppBar: true,
// appBar: AppBar(
// elevation: 0,
// backgroundColor: Colors.transparent,
// ),
// body:  Container(
// height: double.infinity,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// colors: [Color(0xfff2cbd0), Color(0xfff4ced9)],
// )),
// child: SingleChildScrollView(
// child: Stack(
// children: <Widget>[
// CurvedWidget(
// child: Container(
// padding: const EdgeInsets.only(top: 100, left: 50),
// width: double.infinity,
// height: 300,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topCenter,
// end: Alignment.bottomCenter,
// colors: [Colors.white, Colors.white.withOpacity(0.4)],
// ),
// ),
// child: Text(
// 'Login',
// style: TextStyle(
// fontSize: 40,
// color: Color(0xff6a515e),
// ),
// ),
// ),
// ),
// Container(
// margin: const EdgeInsets.only(top: 230),
// child: LoginForm(userRepository: _userRepository,),
// )
// ],
// ),
// ),
// ),
// ),