import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/doctor/Doctor/page_doctor/sortable_page.dart';

class TableDoctor extends StatefulWidget {
  @override
  _TableDoctorState createState() => _TableDoctorState();
}

class _TableDoctorState extends State<TableDoctor> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffffae88), Color(0xff8f93ea)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              tabs: [
                Tab(icon: Icon(Icons.sort_by_alpha), text: 'Sortable'),
                Tab(icon: Icon(Icons.select_all), text: 'Selectable'),
                Tab(icon: Icon(Icons.edit), text: 'Editable'),
              ],
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(
            children: [
              SortablePage(),
              Container(),
              Container(),

              // PharmaciesScreen(),
              // ProductsScreen(),
              // ClothScreen(),
              // HomeToyScreen(),
              // buildPage('Settings Page'),
            ],
          ),
        ),
      );

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}
