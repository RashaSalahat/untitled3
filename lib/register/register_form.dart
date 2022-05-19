import 'package:flutter/material.dart';

import '../../widgets/gradient_button.dart';
import '../info1.dart';

//import '../page2/page2screen.dart';
String s = '';
setUsername(String s1) {
  s = s1;
}

getUsername() {
  return s;
}

String p = '';
setUserpassword(String p1) {
  p = p1;
}

getUserpassword() {
  return p;
}

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  static var name, password;
  //final TextEditingController _emailController=TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration:
                  InputDecoration(icon: Icon(Icons.email), labelText: 'Name'),
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (val) {
                name = val;
                setUsername(name);
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock), labelText: 'Password'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true,
              onChanged: (val) {
                password = val;
                setUserpassword(password);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xffffae88), Color(0xff8f93ea)])),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 150,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffffae88), Color(0xff8f93ea)],
                ),
              ),
              child: MaterialButton(
                  onPressed: () {
                    if (getUsername() == '' || getUserpassword() == '') {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  overflow: Overflow.visible,
                                  children: [
                                    Container(
                                      height: 250,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Text("Warning!!",
                                                  style: TextStyle(
                                                      fontFamily: "Segoe UI",
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                      color:
                                                          Color(0xff070707))),
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
                                                      BorderRadius.circular(
                                                          100),
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
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: const <
                                                            Widget>[
                                                          Text(
                                                            "OK",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(70)),
                                              child: Image.asset(
                                                  "assets/images/log.jpg")),
                                          radius: 45,
                                        ))
                                  ]),
                            );
                          });
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => information(),
                          ));
                    }
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
