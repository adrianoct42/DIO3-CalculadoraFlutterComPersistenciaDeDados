import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:imcflutter/classes/imc_model.dart";

class ImcRecords extends StatelessWidget {
  const ImcRecords(this.listaImc, {super.key});

  final List<ImcModel> listaImc;

  @override
  Widget build(BuildContext context) {
    void checkStatus() async {
      if (Hive.isBoxOpen("imc_model")) {
        debugPrint(
            "imc_records --> CAIU NO isBoxOpen como true! VAI SER CARREGADA!");
      } else {
        debugPrint("imc_records --> CAIU NO openBox! VAI SER CRIADA");
      }
    }

    checkStatus();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("IMCs Calculados"),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listaImc.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.greenAccent,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    "Peso: ${listaImc[index].peso.toStringAsFixed(2)}"),
                                Text(
                                    "Altura: ${listaImc[index].altura.toStringAsFixed(2)}"),
                                const SizedBox(height: 10),
                                Text(
                                  "IMC: ${listaImc[index].imcString()}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
