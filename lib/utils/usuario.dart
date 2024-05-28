import 'database_helper.dart';

class Usuario {
  String nombre;
  String apellidos;
  String correo;
  String contrasena;

  Usuario({
    required this.nombre,
    required this.apellidos,
    required this.correo,
    required this.contrasena,
  });
}

class GestionUsuarios {
  static Future<void> registrarUsuario(String nombre, String apellidos,
      String correo, String contrasena) async {
    // Crea un mapa con los datos del nuevo usuario
    final Map<String, dynamic> user = {
      'firstName': nombre,
      'lastName': apellidos,
      'email': correo,
      'password': contrasena,
    };

    // Inserta el nuevo usuario en la base de datos
    await DatabaseHelper().insertUser(user);
  }

  static Future<Usuario?> verificarCredenciales(String correo, String contrasena) async {
    // Busca al usuario en la base de datos
    final usuario = await DatabaseHelper().getUserByEmailAndPassword(correo, contrasena);

    // Si el usuario no es null, significa que se encontró en la base de datos
    if (usuario != null) {
      return usuario; // Retorna el usuario encontrado
    } else {
      return null; // No se encontró el usuario, retorna null
    }
  }
}
