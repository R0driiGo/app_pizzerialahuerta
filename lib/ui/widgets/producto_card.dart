import 'package:flutter/material.dart';

class ProductoCard extends StatefulWidget {
  final String nombre;
  final String descripcion;
  final String imagen;
  final double precio;
  final void Function(double precio) onAgregar;
  final List<Map<String, dynamic>> opciones;

  ProductoCard({
    required this.nombre,
    required this.descripcion,
    required this.imagen,
    required this.precio,
    required this.onAgregar,
    this.opciones = const [],
  });

  @override
  _ProductoCardState createState() => _ProductoCardState();
}

class _ProductoCardState extends State<ProductoCard> {
  String? _opcionSeleccionada;
  double _precioSeleccionado = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.opciones.isNotEmpty) {
      _opcionSeleccionada = widget.opciones[0]['tamaño'];
      _precioSeleccionado = widget.opciones[0]['precio'];
    } else {
      _precioSeleccionado = widget.precio;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset(widget.imagen, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(widget.nombre, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(widget.descripcion),
                if (widget.opciones.isNotEmpty)
                  DropdownButton<String>(
                    value: _opcionSeleccionada,
                    items: widget.opciones.map((opcion) {
                      return DropdownMenuItem<String>(
                        value: opcion['tamaño'],
                        child: Text('${opcion['tamaño']} - S/ ${opcion['precio'].toStringAsFixed(2)}'),
                      );
                    }).toList(),
                    onChanged: (nuevaOpcion) {
                      setState(() {
                        _opcionSeleccionada = nuevaOpcion;
                        _precioSeleccionado = widget.opciones
                            .firstWhere((opcion) => opcion['tamaño'] == nuevaOpcion)['precio'];
                      });
                    },
                  ),
                SizedBox(height: 8.0),
                Text('S/ ${_precioSeleccionado.toStringAsFixed(2)}'),
                ElevatedButton(
                  onPressed: () {
                    widget.onAgregar(_precioSeleccionado);
                  },
                  child: Text('Agregar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
