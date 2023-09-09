import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerAltura = TextEditingController();

  TextEditingController controllerPeso = TextEditingController();

  double imc = 0.0;
  String imcLabel = "";
  Color? get textColor {
    return (imcLabel == "Abaixo do Peso"
        ? Colors.blue[900]
        : imcLabel == "Peso Ideal"
            ? Colors.green
            : imcLabel == "Acima do Peso"
                ? Colors.yellow
                : imcLabel == "Obesidade Grau I"
                    ? Colors.red[600]
                    : imcLabel == "Obesidade Grau II"
                        ? Colors.red[700]
                        : imcLabel == "Obesidade Grau III"
                            ? Colors.red[800]
                            : Colors.black);
  }

  void updateImc() {
    setState(() {
      if (double.tryParse(controllerAltura.text) != null &&
          double.tryParse(controllerPeso.text) != null) {
        double peso = double.tryParse(controllerPeso.text)!;
        double quadradoAltura =
            (double.tryParse(controllerAltura.text)! / 100) *
                (double.tryParse(controllerAltura.text)! / 100);
        imc = peso / quadradoAltura;
        if (imc <= 18.5) {
          imcLabel = "Abaixo do Peso";
        } else if (imc > 18.5 && imc < 25) {
          imcLabel = "Peso Ideal";
        } else if (imc >= 25 && imc < 30) {
          imcLabel = "Acima do Peso";
        } else if (imc >= 30 && imc < 35) {
          imcLabel = "Obesidade Grau I";
        } else if (imc >= 35 && imc < 40) {
          imcLabel = "Obesidade Grau II";
        } else if (imc >= 40) {
          imcLabel = "Obesidade Grau III";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "IMC Calculator",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigoAccent,
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.indigo),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          controller: controllerPeso,
                          decoration: InputDecoration(
                              labelText: "Peso(kg)",
                              labelStyle: TextStyle(color: Colors.white))),
                      TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          controller: controllerAltura,
                          decoration: InputDecoration(
                              labelText: "Altura(cm)",
                              labelStyle: TextStyle(color: Colors.white))),
                    ],
                  )),
              ElevatedButton(
                  onPressed: () =>
                      {updateImc(), FocusScope.of(context).unfocus()},
                  child: Text("Calcular")),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                width: double.infinity,
                child: Column(children: [
                  Visibility(
                      visible: imc > 0,
                      child: Text(
                        imc.toStringAsFixed(1),
                        style: TextStyle(fontSize: 30, color: textColor),
                      )),
                  Visibility(
                      visible: imc > 0,
                      child: Text(
                        imcLabel,
                        style: TextStyle(fontSize: 40, color: textColor),
                      )),
                  Visibility(
                      visible: imc > 0,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Image.asset(imcLabel == "Abaixo do Peso"
                              ? "assets/images/UnderWeight.png"
                              : imcLabel == "Peso Ideal"
                                  ? "assets/images/Optimal.png"
                                  : imcLabel == "Acima do Peso"
                                      ? "assets/images/OverWeight.png"
                                      : imcLabel == "Obesidade Grau I"
                                          ? "assets/images/Obese.png"
                                          : imcLabel == "Obesidade Grau II"
                                              ? "assets/images/ObeseII.png"
                                              : imcLabel == "Obesidade Grau III"
                                                  ? "assets/images/ObeseII.png"
                                                  : "")))
                ]),
              )
            ],
          ),
        ));
  }
}
