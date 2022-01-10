import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text ('Страница авторизации'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children:  [
            const SizedBox(height: 25,),
            LoginForm()
          ],
        ),
      ),
    );
  }
}


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;
  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == '+79110000000' && password == 'q') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold ,
      color: Color(0xFF03203e),
    );
    final textFieldDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Введите логин', style: textStyle),
        SizedBox(height: 5,),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecoration,),
        SizedBox(height: 20,),
        Text('Введите пароль', style: textStyle),
        SizedBox(height: 5,),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,),
        SizedBox(height: 20,),
        if (errorText != null)
          Text(errorText, style: TextStyle(color: Colors.red),),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Color(0xFFFDFBFE)),
              backgroundColor: MaterialStateProperty.all(Color(0xFF03203e)),
            ),
            onPressed: _auth,
            child: Text('Войти'),
          ),
        )
      ],
    );
  }
}