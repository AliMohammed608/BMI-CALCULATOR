import 'package:flutter/material.dart';

import 'BMI.dart';
import 'StartInterface.dart';
import 'WaterPercentage.dart';

//About page
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//Different screen size handler
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xffd3d3d3),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F0D4B),
        leading: IconButton(
          alignment: Alignment.centerRight,
          icon: Image.asset('assets/L_arr.png'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text(
            "عن البرنامج",
            style: TextStyle(
              fontFamily: "Segoe UI",
              fontSize: queryData.textScaleFactor * 14,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
      endDrawer: new Drawer(
        child: new Container(
          color: Color(0xff0F0D4B),
          child: new ListView(
            children: <Widget>[
              Material(
                child: Image.asset(
                  'assets/main_logo.png',
                  width: 160.5,
                  height: 160.5,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                child: ListTile(
                    title: Text('صفحة البداية',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffD3D3D3),
                            fontSize: queryData.textScaleFactor * 20)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartInterface()));
                    }),
              ),
              Container(
                child: ListTile(
                    title: Text('BMI',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffD3D3D3),
                            fontSize: queryData.textScaleFactor * 20)),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BMI()));
                    }),
              ),
              Container(
                child: ListTile(
                    title: Text('حساب الماء',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffD3D3D3),
                            fontSize: queryData.textScaleFactor * 20)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WaterPercentage()));
                    }),
              ),
              Container(
                child: ListTile(
                    title: Text('حول البرنامج',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffD3D3D3),
                            fontSize: queryData.textScaleFactor * 20)),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About()));
                    }),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset('assets/main_logo.png'),
                  SizedBox(
                    height: 50,
                  ),
		//Print the title
                  new Text(
                    "برنامج حساب BMI",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.w700,
                      fontSize: queryData.textScaleFactor * 19,
                      color: Color(0xff000000),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: new Text(
                        "برنامج يسمح للمستخدم بحساب نسبة الماء اليومي باللتر, أيضا يستطيع حساب BMI  و السعرات الحرارية التي يحتاجها الجسم يوميا.",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: "Segoe UI",
                          fontSize: queryData.textScaleFactor * 20,
                          color: Color(0xff000000),
                        ),
                      )),
                ]),
          ),
        ),
      ),
      bottomNavigationBar: new Container(
        margin: EdgeInsets.all(15),
        child: new Text(
          "برمجة:  Ali_Salam (alibukarrar@gmail.com)",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Segoe UI",
            fontSize: queryData.textScaleFactor * 18,
            color: Color(0xff000000),
          ),
        ),
      ),
    );
  }
}
