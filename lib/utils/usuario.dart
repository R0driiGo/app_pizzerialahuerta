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
  static List<Usuario> _usuarios = [
    Usuario(
      nombre: 'Admin',
      apellidos: 'Admin',
      correo: 'admin@ucv.com',
      contrasena: 'administrador', // Nueva contraseña
    ),
  ];

  static void registrarUsuario(String nombre, String apellidos, String correo, String contrasena) {
    _usuarios.add(Usuario(nombre: nombre, apellidos: apellidos, correo: correo, contrasena: contrasena));
  }

  static Usuario? verificarCredenciales(String correo, String contrasena) {
    for (var usuario in _usuarios) {
      if (usuario.correo == correo && usuario.contrasena == contrasena) {
        return usuario;
      }
    }
    return null;
  }
}
