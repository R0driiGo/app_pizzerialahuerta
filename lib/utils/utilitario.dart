
class Utilitario {
  static String? validaCorreo(String? value) {
    String patron = r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$';
    RegExp reg = RegExp(patron);
    return reg.hasMatch(value ?? '') ? null : 'Error en el correo';
  }

  static String? validaContrasena(String? value) {
    return (value != null && value.length >= 6) ? null : 'La contraseña debe tener al menos 6 caracteres';
  }


}
