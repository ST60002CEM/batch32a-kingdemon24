import 'package:final_assignment/app/app.dart';
import 'package:final_assignment/core/networking/local/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
