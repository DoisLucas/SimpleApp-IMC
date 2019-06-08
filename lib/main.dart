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
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String info = "Informe seus dados!";

  void _calc() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text) / 100;
    double imc = peso / (altura * altura);

    print(imc);

    String imc_formated = imc.toStringAsPrecision(2);

    setState(() {
      if (imc < 18.6) {
        info = "Abaixo do peso ($imc_formated)";
      } else if (imc >= 18.6 && imc < 24.9) {
        info = "Peso ideial ($imc_formated)";
      } else if (imc >= 24.9 && imc < 29.9) {
        info = "Levemente acima do peso ($imc_formated)";
      } else if (imc >= 29.9 && imc < 34.9) {
        info = "Obesidade Grau I ($imc_formated)";
      } else if (imc >= 34.9 && imc < 34.9) {
        info = "Obesidade Grau II ($imc_formated)";
      } else if (imc >= 40) {
        info = "Obesidade Grau III ($imc_formated)";
      }
    });
  }

  void _resetFields() {
    pesoController.text = "";
    alturaController.text = "";

    setState(() {
      info = 'Informe seus dados!';
    });
  }

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
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline, size: 110, color: Colors.black54),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.black45)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black45, fontSize: 20),
                  controller: pesoController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira seu peso!";
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.black45)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black45, fontSize: 20),
                  controller: alturaController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira sua altura!";
                    }
                  },
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _calc;
                        }
                      },
                      child: Text("Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      color: Colors.black45,
                    ),
                  )),
              Text(info,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))
            ],
          ),
        )));
  }
}
