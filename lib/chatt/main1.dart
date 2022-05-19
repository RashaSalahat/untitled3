import 'package:hotel_booking/chatt/app.dart';
import 'package:hotel_booking/chatt/page1chat.dart';
import 'package:hotel_booking/chatt/screens/screens.dart';
import 'package:hotel_booking/chatt/screens/select_user_screen.dart';
import 'package:hotel_booking/chatt/screens/splash_screen.dart';
import 'package:hotel_booking/chatt/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/doctor/chatting_page.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

String user = getUserFlag();
String doctor = getDoctorFlag();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final client = StreamChatClient('8ekr7aku664w');

  runApp(
    MyApp(
      client: client,
      appTheme: AppTheme(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
    required this.appTheme,
  }) : super(key: key);

  final StreamChatClient client;
  final AppTheme appTheme;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      themeMode: ThemeMode.light,
      title: 'Chatter',
      builder: (context, child) {
        return StreamChatCore(
          client: client,
          child: ChannelsBloc(
            child: UsersBloc(
              child: child!,
            ),
          ),
        );
      },
      home: const SplashScreen(),
    );
  }
}
