import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _alcoolController = TextEditingController();
  final TextEditingController _gasolinaController = TextEditingController();

  String _resultado = "Informe os preços!";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void limparCampos() {
    _alcoolController.text = "";
    _gasolinaController.text = "";

    setState(() {
      _resultado = "Informe os preços!";
    });
  }

  void _calcular() {
    double alcool = double.parse(_alcoolController.text);
    double gasolina = double.parse(_gasolinaController.text);

    double media = alcool / gasolina;

    setState(() {
      if (media < 0.7) {
        _resultado = "Abasteça com Álcool!";
      } else {
        _resultado = "Abasteça com Gasolina!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: Text(
    "Calculadora de Combustível",
    style: TextStyle(
      color: Colors.white,
      fontFamily: 'Roboto', // Fonte Roboto
      fontWeight: FontWeight.bold, // Engrossar a fonte
      fontSize: 24.0, // Tamanho da fonte
    ),
  ),
  centerTitle: true,
  backgroundColor: Color(0xFF0ABAB5),
),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.local_gas_station_outlined, size: 120.0, color: Color.fromARGB(255, 66, 171, 169)),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço do Álcool (R\$)",
                  labelStyle: TextStyle(color: Color(0xFF0ABAB5), fontSize: 25.0),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF0ABAB5), fontSize: 25.0),
                controller: _alcoolController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira o preço do álcool!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina",
                  labelStyle: TextStyle(color: Color(0xFF0ABAB5), fontSize: 25.0),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF0ABAB5), fontSize: 25.0),
                controller: _gasolinaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira o preço da gasolina!";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: limparCampos,
                          child: Text(
                            "Limpar",
                            style: TextStyle(color: const Color.fromARGB(255, 124, 193, 189), fontSize: 25.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 229, 248, 248),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _calcular();
                            }
                          },
                          child: Text(
                            "Calcular",
                            style: TextStyle(color: Colors.white, fontSize: 25.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0ABAB5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF0ABAB5), fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
