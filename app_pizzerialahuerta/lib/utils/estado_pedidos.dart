import 'package:flutter/material.dart';

class Pedido {
  final String nombre;
  int cantidad;
  final double precio;

  Pedido({
    required this.nombre,
    required this.cantidad,
    required this.precio,
  });

  double get importe => cantidad * precio;
}

class EstadoPedidos extends ChangeNotifier {
  List<Pedido> _pedidos = [];

  List<Pedido> get pedidos => _pedidos;

  void agregarPedido(String nombre, int cantidad, double precio) {
    final pedidoExistente = _pedidos.firstWhere(
          (pedido) => pedido.nombre == nombre,
      orElse: () => Pedido(nombre: nombre, cantidad: 0, precio: precio),
    );

    if (pedidoExistente.cantidad == 0) {
      _pedidos.add(Pedido(nombre: nombre, cantidad: cantidad, precio: precio));
    } else {
      pedidoExistente.cantidad += cantidad;
    }

    notifyListeners();
  }

  void eliminarPedido(Pedido pedido) {
    _pedidos.remove(pedido);
    notifyListeners();
  }

  void disminuirCantidad(Pedido pedido) {
    if (pedido.cantidad > 1) {
      pedido.cantidad--;
      notifyListeners();
    }
  }

  void aumentarCantidad(Pedido pedido) {
    pedido.cantidad++;
    notifyListeners();
  }

  double get total {
    return _pedidos.fold(0.0, (sum, pedido) => sum + pedido.importe);
  }
}

final estadoPedidos = EstadoPedidos();
