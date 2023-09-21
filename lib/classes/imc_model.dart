import 'package:hive/hive.dart';

part 'imc_model.g.dart';

@HiveType(typeId: 0)
class ImcModel extends HiveObject {
  @HiveField(0)
  double? _peso;

  @HiveField(1)
  double? _altura;

  get peso => _peso;
  get altura => _altura;

  ImcModel(this._peso, this._altura);

  ImcModel.vazio() {
    <ImcModel>[];
  }

  String imcString() {
    double imc = peso / (altura * altura);

    if (imc < 16) {
      return "${imc.toStringAsFixed(2)} - MAGREZA GRAVE";
    } else if (imc >= 16 && imc < 17) {
      return "${imc.toStringAsFixed(2)} - MAGREZA MODERADA";
    } else if (imc >= 17 && imc < 18.5) {
      return "${imc.toStringAsFixed(2)} - MAGREZA LEVE";
    } else if (imc >= 18.5 && imc < 25) {
      return "${imc.toStringAsFixed(2)} - SAUDÁVEL";
    } else if (imc >= 25 && imc < 30) {
      return "${imc.toStringAsFixed(2)} - SOBREPESO";
    } else if (imc >= 30 && imc < 35) {
      return "${imc.toStringAsFixed(2)} - OBESIDADE GRAU I";
    } else if (imc >= 35 && imc < 40) {
      return "${imc.toStringAsFixed(2)} - OBESIDADE GRAU II";
    } else {
      return "${imc.toStringAsFixed(2)} - OBESIDADE GRAU III";
    }
  }
}
