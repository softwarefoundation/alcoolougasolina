import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = new TextEditingController();
  TextEditingController _controllerGasolina = new TextEditingController();
  var _resultado = "";
  MaterialColor _viewResultadoAlert = Colors.lightBlue;

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if (!isValidForm(precoAlcool, precoGasolina)) {
      _viewResultadoAlert = Colors.red;
      setState(() {});
      return;
    }

    _viewResultadoAlert = Colors.lightGreen;
    if ((precoAlcool / precoGasolina) >= 0.7) {
      _resultado = "Gasolina é a melhor opção";
    } else {
      _resultado = "Álcool é a melhor opção";
    }

    setState(() {});
  }

  bool isValidForm(double precoAlcool, double precoGasolina) {
    bool isValidForm = true;
    if (precoAlcool == null) {
      _resultado = "Preço do Álcool inválido";
      isValidForm = false;
    } else if (precoAlcool <= 0) {
      _resultado = "Preço do Álcool deve ser maior que 0.0";
      isValidForm = false;
    }else if (precoGasolina == null) {
      _resultado = "Preço do Gasolina inválido";
      isValidForm = false;
    } else if (precoGasolina <= 0) {
      _resultado = "Preço do Gasolina deve ser maior que 0.0";
      isValidForm = false;
    }

    return isValidForm;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset('images/logo.png'),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Qual a melhor opção no momento Álcool ou Gasolina?",
                  style: TextStyle(fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: _viewResultadoAlert),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço do Álcool, ex: 2.89"),
                maxLength: 4,
                maxLengthEnforced: true,
                style: TextStyle(fontSize: 25),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: "Preço da Gasolina, ex: 4.59"),
                style: TextStyle(fontSize: 25),
                maxLength: 4,
                maxLengthEnforced: true,
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  child: Text(
                    "CALCULAR",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: _calcular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
