import 'package:flutter/material.dart';
import 'package:imcflutter/classes/imc_model.dart';
import 'package:imcflutter/repository/imc_repository.dart';
import 'package:imcflutter/screens/imc_records.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");
  var listaImc = <ImcModel>[];
  late ImcRepository imcRepository;

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  void carregarDados() async {
    // INICIALIZA UMA BOX OU ABRE
    imcRepository = await ImcRepository.start();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Bem Vindo(a) a Calculadora de IMC Flutter!",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text("Peso em KG:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextField(
                controller: pesoController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Altura em M:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextField(
                controller: alturaController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: OutlinedButton(
                  child: const Text(
                    "Calcular IMC",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (pesoController.text != "" &&
                        alturaController.text != "" &&
                        double.parse(alturaController.text) > 0 &&
                        double.parse(pesoController.text) > 0) {
                      listaImc.add(
                        ImcModel(
                          double.parse(pesoController.text),
                          double.parse(alturaController.text),
                        ),
                      );
                      imcRepository.salvar(listaImc);
                      setState(() {});
                    }
                    pesoController.text = alturaController.text = "";
                  },
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                alignment: Alignment.center,
                child: OutlinedButton(
                  child: const Text(
                    "Visualizar IMCs",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    // Teste quando acordar se esse ImcRepository.carregar() abaixo faz alguma diferença...
                    // Coloquei ASYNC AWAIT mas não tenho certeza se é necessário.
                    // Sugestão: Tente fazer o carregamento aqui, MANUAL, sem chamar o método carregar... Digite-o aqui, recorte e cole do imc_repository...

                    var visualizarLista = imcRepository.obterDados();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImcRecords(visualizarLista)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
