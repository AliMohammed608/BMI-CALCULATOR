import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';

import 'About.dart';
import 'BMI.dart';
import 'StartInterface.dart';
import 'WaterPercentage.dart';

//Calculate calories page
class calories extends StatefulWidget {
  @override
  _caloriesState createState() => _caloriesState();
}

class _caloriesState extends State<calories> {
  TextEditingController wController = TextEditingController();

  double w;

  String result;

  double a;

  double result1;

  String r = '';

  String result2;

  String increase = '';

  String decrease = '';

  String fix = '';

  String result3;
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
            }),
        title: Center(
          child: Text(
            " حساب السعرات الحرارية",
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "النشاط اليومي",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff000066),
                        fontFamily: "Segoe UI",
                        fontSize: queryData.textScaleFactor * 18,
                      ),
                    ),
                  ),
		//List the daily activity average
                  DropDownField(
                    controller: selectedCounsellor,
                    hintText: "اختر مستوى النشاط اليومي",
                    enabled: true,
                    items: counselors,
                    onValueChanged: (value) {
                      setState(() {
                        selectCounsel = value;
                      });
                      _clc(selectedCounsellor);
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
		//Take the weight of the user
                  TextField(
                    decoration: InputDecoration(labelText: 'الوزن'),
                    keyboardType: TextInputType.number,
                    controller: wController,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
		//Print the calories
                  Text(
                    'سعراتك الحرارية, $r',
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: queryData.textScaleFactor * 19,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
			//Calculate calorie button
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
                              result1 = w * a * 24;
                              result3 = result1.toStringAsFixed(1);
                              result2 = result3.toString();
                              setState(() {
                                r = result2;
                                increase = 'لزيادة الوزن اضف 500 سعرة يوميا';
                                decrease = 'لانقاص الوزن اخفض 500 سعرة يوميا';
                                fix = 'لثبات الوزن تناول سعراتك كاملة يوميا';
                              });
                            }),
                      ),
                      SizedBox(
                        width: 10,
                      ),
			//Reset button
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
                                selectedCounsellor.clear();
                                wController.clear();
                                r = '';
                                increase = '';
                                decrease = '';
                                fix = '';
                              });
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
		//Print three lines to what to do
                  Text(
                    '$increase',
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: queryData.textScaleFactor * 18,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    '$decrease',
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: queryData.textScaleFactor * 18,
                      color: Color(0xff000000),
                    ),
                  ),
                  Text(
                    '$fix',
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: queryData.textScaleFactor * 18,
                      color: Color(0xff000000),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

//provide const values based on daily activity that choosen from the list
  _clc(selectedCounsellor) {
    result = selectedCounsellor.text;
    if (result == 'منخفض') {
      setState(() {
        a = 1.3;
      });
    }
    if (result == 'متوسط') {
      setState(() {
        a = 1.4;
      });
    }
    if (result == 'عالي') {
      setState(() {
        a = 1.5;
      });
    }
  }
}

String selectCounsel = "";
final selectedCounsellor = TextEditingController();
List<String> counselors = [
  'منخفض',
  'متوسط',
  'عالي',
];
