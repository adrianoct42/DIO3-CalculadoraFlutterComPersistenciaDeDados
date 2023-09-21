import 'package:hive/hive.dart';
import 'package:imcflutter/classes/imc_model.dart';
import 'package:flutter/material.dart';

class ImcRepository {
  static late Box _box;

  ImcRepository._criar();

  static Future<ImcRepository> start() async {
    if (Hive.isBoxOpen("imc_model")) {
      _box = Hive.box<List<ImcModel>>("imc_model");
      debugPrint(
          "imc_repository --> CAIU NO isBoxOpen como true! VAI SER CARREGADA!");
    } else {
      _box = await Hive.openBox<List<ImcModel>>("imc_model");
      debugPrint("imc_repository --> CAIU NO openBox! VAI SER CRIADA");
    }

    return ImcRepository._criar();
  }

  salvar(List<ImcModel> imcModel) async {
    await _box.put('imc_model', imcModel);
  }

  List<ImcModel> obterDados() {
    List<ImcModel> imcModel = _box.get("imc_model");
    debugPrint(imcModel[0].toString());
    return imcModel;
  }
}
