import 'package:flutter/material.dart';

import 'About.dart';
import 'BMI.dart';
import 'WaterPercentage.dart';

//Start Interface(HomePage)
class StartInterface extends StatelessWidget {
  StartInterface({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //queryData for supporting different screen sizes
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Color(0xffD3D3D3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: new Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
		//Container with App Logo
                new Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  height: queryData.size.height * 0.40,
                  width: queryData.size.width * 450.00,
                  color: Color(0xff0f0d4b),
                  child: Container(
                    alignment: Alignment.center,
                    height: 316.00,
                    width: 316.00,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/main_logo.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: queryData.size.height * 0.07,
                ),
                new Text(
                  'أهلاوسهلا',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontWeight: FontWeight.bold,
                    fontSize: queryData.textScaleFactor * 30,
                    color: Color(0xff000000),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
		//Button transfer to watterPercentage Page
                SizedBox(
                  width: queryData.size.width * 0.50,
                  height: 60,
                  child: RaisedButton(
                      child: Align(
                        alignment: Alignment.center,
                        child: new Text(
                          "أحتياج الماء",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: queryData.textScaleFactor * 20,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.00),
                      ),
                      color: Color(0xFFFFFFFF),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WaterPercentage()));
                      }),
                ),
                SizedBox(
                  height: 26.0,
                ),
		//Button transfer to BMI calculator Page
                SizedBox(
                  width: queryData.size.width * 0.50,
                  height: 60,
                  child: RaisedButton(
                      padding: EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.center,
                        child: new Text(
                          " حساب BMI",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: queryData.textScaleFactor * 20,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.00),
                      ),
                      color: Color(0xFFFFFFFF),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BMI()));
                      }),
                ),
                SizedBox(
                  height: 26.0,
                ),
		//Button transfer to About Page
                SizedBox(
                  width: queryData.size.width * 0.50,
                  height: 60,
                  child: RaisedButton(
                      child: Align(
                        alignment: Alignment.center,
                        child: new Text(
                          "عن البرنامج",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: queryData.textScaleFactor * 20,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.00),
                      ),
                      color: Color(0xFFFFFFFF),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => About()));
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
