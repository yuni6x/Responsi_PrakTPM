import 'package:flutter/material.dart';
import 'searchpage.dart';

void main() => runApp(LoginApp());

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  void _handleLogin() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (username == 'yuni' && password == '123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SearchPage()),
      );
    } else {
      setState(() {
        _errorMessage = 'Username atau password salah!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              _errorMessage,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Login'),
              onPressed: _handleLogin,
            ),
          ],
        ),
      ),
    );
  }
}
