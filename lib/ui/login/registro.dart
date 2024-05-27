import 'package:flutter/material.dart';
import 'package:app_pizzerialahuerta/utils/usuario.dart';
import 'package:app_pizzerialahuerta/utils/utilitario.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  void register() {
    if (_formKey.currentState?.validate() ?? false) {
      final firstName = firstNameController.text;
      final lastName = lastNameController.text;
      final email = emailController.text;
      final password = passwordController.text;

      GestionUsuarios.registrarUsuario(firstName, lastName, email, password);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cuenta creada exitosamente')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Nombres',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              validator: (value) {
                return value?.isEmpty ?? true ? 'Este campo es obligatorio' : null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: 'Apellidos',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              validator: (value) {
                return value?.isEmpty ?? true ? 'Este campo es obligatorio' : null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              validator: Utilitario.validaCorreo,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              validator: Utilitario.validaContrasena,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: register,
              style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Registrar',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          ],
        ),
      ),
    ),
    ),
    );
  }
}
