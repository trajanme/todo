import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: Column(
        children: [
          const CustomTextField(label: 'メールアドレス'),
          const CustomTextField(label: 'パスワード'),
          const CustomTextField(label: 'パスワード確認'),
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
