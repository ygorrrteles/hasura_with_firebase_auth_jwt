import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hasura_with_firebase_auth_jwt/controller/bindings/home_page_binding.dart';
import 'package:hasura_with_firebase_auth_jwt/pages/home_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Teste(),
    ),
  );
}

class Teste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () => Get.to(HomePage(), binding: HomePageBinding()),
        ),
      ),
    );
  }
}
