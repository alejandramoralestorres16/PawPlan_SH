import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'inicio.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      final List<GoogleSignInAccount> accounts = await _googleSignIn.signInSilently().then((value) {
        if (value != null) {
          return [_googleSignIn.currentUser!];
        } else {
          return _googleSignIn.signIn().then((value) => [value!]);
        }
      });

      if (accounts.isNotEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Selecciona una cuenta'),
            content: ListView.builder(
              shrinkWrap: true,
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                return ListTile(
                  title: Text(account.email ?? 'Correo no disponible'),
                  onTap: () {
                    Navigator.pop(context); // Cerrar el AlertDialog
                    _signInWithGoogle(account);
                  },
                );
              },
            ),
          ),
        );
      } else {
        print('No hay cuentas disponibles');
      }
    } catch (error) {
      print('Error al iniciar sesión con Google: $error');
    }
  }

  void _signInWithGoogle(GoogleSignInAccount account) {
    // Implementar la lógica para iniciar sesión con la cuenta seleccionada
    print('Iniciando sesión con ${account.email}');
    // Aquí puedes añadir la lógica para iniciar sesión con la cuenta de Google seleccionada
    // Por ejemplo, puedes utilizar Firebase Authentication para manejar la autenticación.
    // Consulta la documentación de Firebase para más información: https://firebase.flutter.dev/docs/auth/overview
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Iniciar sesión',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed: () {
                  // Lógica para iniciar sesión con usuario y contraseña
                },
                icon: Icon(Icons.login),
                label: Text('Acceder'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton.icon(
                onPressed: () => _handleGoogleSignIn(context),
                icon: Icon(Icons.account_circle),
                label: Text('Acceder con Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

