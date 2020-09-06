import 'package:flutter/material.dart';

import 'About.dart';
import 'BMI.dart';
import 'StartInterface.dart';

class WaterPercentage extends StatefulWidget {
  _WaterPercentageState createState() => _WaterPercentageState();
}

class _WaterPercentageState extends State<WaterPercentage> {
  String r = '';
  TextEditingController wController = TextEditingController();

  double w;

  double a;

  double result;

  String result3;
  @override
  Widget build(BuildContext context) {
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
            "حساب نسبة الماء(L)",
            style: TextStyle(
              fontFamily: "Segoe UI",
              fontSize: queryData.textScaleFactor * 16,
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
                            fontSize: queryData.textScaleFactor * 22)),
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
          padding: const EdgeInsets.all(16.0),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  new Text(
                    "أدخل وزنك",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.w700,
                      fontSize: queryData.textScaleFactor * 28,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'الوزن'),
                    keyboardType: TextInputType.number,
                    controller: wController,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'الأحتياج اليومي باللتر, $r',
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: queryData.textScaleFactor * 18,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: queryData.size.width * 0.35,
                        height: 60,
                        child: new RaisedButton(
                            child: Align(
                              alignment: Alignment.center,
                              child: new Text(
                                "أحسب",
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
                              w = double.parse(wController.text);
                              a = w * 30;
                              result = a / 1000;
                              result3 = result.toString();

                              setState(() {
                                r = result3;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: queryData.size.width * 0.35,
                        height: 60,
                        child: new RaisedButton(
                            child: Align(
                              alignment: Alignment.center,
                              child: new Text(
                                "مسح",
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
                              setState(() {
                                wController.clear();
                                r = '';
                              });
                            }),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
