import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController alcool = TextEditingController();
  final TextEditingController gasolina = TextEditingController();
  String _resultado = ""; // Variável para armazenar o resultado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Álcool vs Gasolina"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: 80,
            height: 80,
            child: const Image(image: AssetImage("image/posto.png")),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: alcool,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Valor do Álcool",
                prefix: Text("R\$"),
                labelStyle: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: gasolina,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Valor da Gasolina",
                prefix: Text("R\$"),
                labelStyle: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 50,
            width: 200,
            child: ElevatedButton(
              child: const Text(
                "Calcular",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                double valorAlcool = double.tryParse(alcool.text) ?? 0;
                double valorGasolina = double.tryParse(gasolina.text) ?? 0;

                if (valorGasolina > 0) {
                  double relacao = valorAlcool / valorGasolina;
                  if (relacao < 0.7) {
                    setState(() {
                      _resultado = "Abasteça com Álcool";
                    });
                  } else {
                    setState(() {
                      _resultado = "Abasteça com Gasolina";
                    });
                  }
                } else {
                  setState(() {
                    _resultado = "Valor inválido";
                  });
                }
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              _resultado,
              style:
                  const TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
            ),
          )
        ],
      ),
    );
  }
}
