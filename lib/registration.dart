import 'package:firebase_auth/firebase_auth.dart';
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
              onPressed: () async {
                if (passwordCheck != password) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('エラー'),
                          content: const Text('パスワードが一致していません'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            )
                          ],
                        );
                      });
                } else {
                  if (mailAdress != null && password != null) {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: mailAdress!, password: password!);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('登録しました'),
                              content: const Text('登録が完了しました。'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.popUntil(
                                          context, (route) => route.isFirst);
                                    },
                                    child: const Text('OK'))
                              ],
                            );
                          });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        // ここにアラートを表示させる処理を追加する
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('エラー'),
                                content: const Text('パスワードが簡単すぎます。'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'))
                                ],
                              );
                            });
                      } else if (e.code == 'email-already-in-use') {
                        // ここにアラートを表示させる処理を追加する
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('エラー'),
                                content: const Text('入力されたメールアドレスは既に使われています。'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'))
                                ],
                              );
                            });
                      }
                    } catch (e) {
                      // ここにアラートを表示させる処理を追加する
                      debugPrint(e.toString());
                    }
                  } else {}
                }
              },
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
