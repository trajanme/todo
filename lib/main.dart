import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン画面'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Todoアプリ',
                  style: TextStyle(fontSize: 50),
                ),
                Text('ログインしてください')
              ],
            ),
          ),
          const CustomTextField(label: 'メールアドレス'),
          const CustomTextField(label: 'パスワード'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("新規登録は"),
              TextButton(onPressed: () {}, child: const Text("こちら"))
            ],
          ),
          ElevatedButton(
              onPressed: () {},
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'ログイン',
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;

  const CustomTextField({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (newText) {},
        decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}
