import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gleebem/src/ui/dashboard.dart';
import 'package:gleebem/src/ui/pageviewer/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
    @override
    _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    String _type = '';
    String _access_token = '';

    Future<String> getPrefs() async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        _type = prefs.getString("type");
        _access_token = prefs.getString("access_token");
    }

    startTime() async {
        getPrefs();
        var _duration = new Duration(seconds: 2);
        return new Timer(_duration, navigationPage);
    }

    void navigationPage() {
        if(_access_token != null){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
        }else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewer()));
        }
    }

    @override
    void initState() {
        super.initState();
        startTime();
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            body: new Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
                child: new Image.asset('assets/splash.jpg', fit: BoxFit.fill),
            ),
        );
    }
}