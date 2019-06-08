import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body:

      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 110, color: Colors.black54),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.black45)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black45, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.black45)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black45, fontSize: 20),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 45,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    color: Colors.black45,
                  ),
                )),
            Text("Resultado do IMC",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black45, fontSize: 20, fontWeight: FontWeight.bold))
          ],
        ),
      )


    );
  }
}
