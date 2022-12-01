import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_suhu_flutter/widgets/input.dart';
import 'package:konversi_suhu_flutter/widgets/result.dart';
import 'package:konversi_suhu_flutter/widgets/convert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// This widget is the root of your application.
  //variabel berubah
  TextEditingController Celcius = new TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double reamor = 0;

  void konversiSuhu() {
    setState(() {
      inputUser = double.parse(Celcius.text);
      kelvin = inputUser + 273;
      reamor = inputUser * (4 / 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(Celcius: Celcius),
              Result(kelvin: kelvin, reamor: reamor),
              Convert(konversiSuhu: konversiSuhu)
            ],
          ),
        ),
      ),
    );
  }
}
