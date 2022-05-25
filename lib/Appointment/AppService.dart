import 'package:country_picker/country_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_booking/loginpage/login/login_form.dart';

var userReg = getUsername();

class AppService {
  Dio dio = new Dio();

  addApp(username, Doctorname, date) async {
    return await dio.post('http://10.0.2.2:3000/addapp',
        data: {"username": username, "Doctorname": Doctorname, "date": date},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }
}
