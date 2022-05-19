import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/constants_clinic.dart';
import 'package:hotel_booking/models_Clinic/product.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final int index;

  const DetailsScreen({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2cbd0),
      appBar: buildAppBar(context),
      body: Body(
        index: index,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: false,
      title: Text(
        'Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: <Widget>[
        // IconButton(
        //   icon: SvgPicture.asset('assets/icons/cart_with_item.svg'),
        //   onPressed: () {},
        // ),
      ],
    );
  }
}
