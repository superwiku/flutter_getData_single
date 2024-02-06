import 'package:flutter/material.dart';
import 'package:get_flutter/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GET'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((user != null)?user!.id:"tidak ada data", style: TextStyle(fontSize: 25),),
              Text((user != null)?user!.email:"tidak ada data", style: TextStyle(fontSize: 25),),
              Text((user != null)?user!.name:"tidak ada data", style: TextStyle(fontSize: 25),),
              Image.network((user != null)?user!.gbr:"https://ameltrias.com/wp-content/uploads/2021/07/m-Jasa-Pas-Foto-Malang-Ameltrias-P-Ameltrias.jpg"),
              ElevatedButton(
                  onPressed: () {
                    User.connectToApi("1").then((value) {
                      user = value;
                    });
                    setState(() {});
                  },
                  child: Text("PRESS"))
            ],
          ),
        ),
      ),
    );
  }
}
