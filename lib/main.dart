import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String? mailAdress;
  String? password;

  MyHomePage({super.key});

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
          CustomTextField(
            label: 'メールアドレス',
            onChangedfunc: (newText) {
              mailAdress = newText;
            },
            isPassword: false,
          ),
          CustomTextField(
            label: 'パスワード',
            onChangedfunc: (newText) {
              password = newText;
            },
            isPassword: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("新規登録は"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Registration()));
                  },
                  child: const Text("こちら"))
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
  final void Function(String text) onChangedfunc;
  final bool isPassword;

  const CustomTextField(
      {required this.label,
      required this.onChangedfunc,
      required this.isPassword,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (newText) {
          onChangedfunc(newText);
        },
        obscureText: isPassword ? true : false,
        decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}
