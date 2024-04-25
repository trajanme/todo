import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class Registration extends StatelessWidget {
  String? mailAdress;
  String? password;
  String? passwordCheck;

  Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: Column(
        children: [
          CustomTextField(
            label: 'メールアドレス',
            onChangedfunc: (newText) => mailAdress = newText,
            isPassword: false,
          ),
          CustomTextField(
            label: 'パスワード',
            onChangedfunc: (newText) => password = newText,
            isPassword: true,
          ),
          CustomTextField(
            label: 'パスワード確認',
            onChangedfunc: (newText) => passwordCheck = newText,
            isPassword: true,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  '新規登録',
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }
}
