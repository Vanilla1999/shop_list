import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class ShopListScreen extends StatelessWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Container(
        child: const TextField(decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.login),
          hintText: "Введите логин",
          helperText: "Логин используется для входа в систему",
        )),
      ) ,
    );
  }
}
