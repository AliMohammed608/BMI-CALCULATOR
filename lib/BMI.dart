import 'dart:math';

import 'package:flutter/material.dart';

import 'About.dart';
import 'Calories.dart';
import 'StartInterface.dart';
import 'WaterPercentage.dart';

//BMI Calculater page
class BMI extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BMI> {
  double t;
  double w;
  TextEditingController tallController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double a;
  String result;
  String r = '';
  String yourWeight = '';

  double c;

  var ww;

  String q = '';

  String button = '';
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
            " حساب كتلة الجسم (BMI)",
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
                  new Text(
                    "أدخل وزنك وطولك",
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontWeight: FontWeight.w700,
                      fontSize: queryData.textScaleFactor * 22,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
		//Take tall of the user
                  TextField(
                    decoration: InputDecoration(labelText: 'الطول'),
                    keyboardType: TextInputType.number,
                    controller: tallController,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
		//Take wight of the user
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'الوزن',
                    ),
                    keyboardType: TextInputType.number,
                    controller: weightController,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
		//print the BMI
                  Text(
                    'كتلة جسمك هي, $r',
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: queryData.textScaleFactor * 19,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
			//Calculate BMI Button
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
                              t = double.parse(tallController.text);
                              w = double.parse(weightController.text);
                              c = t * 2;
                              a = w / pow(t / 100, 2);
                              result = a.toStringAsFixed(1);

                              setState(() {
                                r = result;
                              });
                              _getResult(r);
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
                                tallController.clear();
                                weightController.clear();
                                q = '';
                                button = '';
                                r = '';
                                yourWeight = '';
                              });
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
		//Print your wight status
                  Text(
                    '$yourWeight',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Segoe UI",
                      fontSize: queryData.textScaleFactor * 22,
                      color: Color(0xff000000),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
			//print question ask if want to calculate his calories
                        Text(
                          '$q',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Segoe UI",
                            fontSize: queryData.textScaleFactor * 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff000000),
                          ),
                        ),
			//Text with lint to calculate calorie page
                        GestureDeteor(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => calories()));
                          },
                          child: Text(
                            '$button',
                            style: TextStyle(
                              fontFamily: "Segoe UI",
                              fontSize: queryData.textScaleFactor * 20,
                              color: Colors.blue[700],
                            ),
                          ),
                        ),
                      ],
                    ),
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
//Function that print result of the user weight status
  _getResult(r) {
    double rr = double.parse(r);
    if (rr >= 40) {
      setState(() {
        yourWeight = 'سمنة مفرطة';
        button = 'اضغط هنا';
        q = 'تريد حساب سعراتك الحرارية';
      });
    } else if (rr >= 35 && rr < 40) {
      setState(() {
        yourWeight = 'سمين جدا';
        button = 'اضغط هنا';
        q = 'تريد حساب سعراتك الحرارية';
      });
    } else if (rr >= 30 && rr < 35) {
      setState(() {
        yourWeight = 'سمين';
        button = 'اضغط هنا';
        q = 'تريد حساب سعراتك الحرارية';
      });
    } else if (rr >= 25 && rr < 30) {
      setState(() {
        yourWeight = 'زائد عن الطبيعي';
        button = 'اضغط هنا';
        q = 'تريد حساب سعراتك الحرارية';
      });
    } else if (rr >= 20 && rr < 25) {
      setState(() {
        yourWeight = 'طبيعي';
        button = 'اضغط هنا';
        q = 'تريد حساب سعراتك الحرارية';
      });
    } else {
      setState(() {
        yourWeight = 'نحيف';
        button = 'اضغط هنا';
        q = 'تريد حساب سعراتك الحرارية';
      });
    }
  }
}
