import 'package:flutter/material.dart';

class Encabezado extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  final bool mostrarRegresar;

  Encabezado({required this.titulo, this.mostrarRegresar = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titulo),
      leading: mostrarRegresar
          ? IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
