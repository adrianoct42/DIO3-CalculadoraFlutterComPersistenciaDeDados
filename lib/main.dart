import 'package:flutter/material.dart';
import 'package:imcflutter/classes/imc_model.dart';
import 'package:imcflutter/myapp.dart';
import "package:hive/hive.dart";
import "package:path_provider/path_provider.dart" as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(ImcModelAdapter());
  runApp(const MyApp());
}
