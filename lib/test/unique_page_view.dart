import 'package:flutter/material.dart';
import 'package:folio/acceuil.dart';
import 'package:folio/login.dart';
import 'package:folio/main.dart';
import 'package:folio/test/FirstView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UniquePageView extends StatefulWidget {
  const UniquePageView({super.key});

  @override
  State<UniquePageView> createState() => _UniquePageViewState();
}

class _UniquePageViewState extends State<UniquePageView> {
  bool _isFirstTime = true;

  @override
  void initState(){
    super.initState();
    _checkFirstTime();
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isFirstTime = prefs.getBool("isFirstTime") ?? true;
    if(_isFirstTime){
      await prefs.setBool("isFirstTime", false);
    }
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isFirstTime? const FirstView(): const acceuil();
  }
}
