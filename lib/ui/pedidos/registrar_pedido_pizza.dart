import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pizzerialahuerta/utils/estado_pedidos.dart';
import 'package:app_pizzerialahuerta/utils/encabezado.dart';
import 'package:app_pizzerialahuerta/ui/widgets/producto_card.dart';

class RegistrarPedidoPizza extends StatelessWidget {
  final List<Map<String, dynamic>> opcionesPizza = [
    {'tamaño': 'Personal', 'precio': 19.00},
    {'tamaño': 'Mediana', 'precio': 26.90},
    {'tamaño': 'Familiar', 'precio': 36.90},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Encabezado(titulo: 'Registrar Pedido de Pizza', mostrarRegresar: true),
      body: Consumer<EstadoPedidos>(
        builder: (context, estadoPedidos, child) {
          return Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: <Widget>[
                        ProductoCard(
                          nombre: 'Pizza Pollivora',
                          descripcion: 'Deliciosa pizza con pollo',
                          imagen: 'assets/imagenes/pedido_pizzapollivora.jpg',
                          precio: 19.00,
                          opciones: opcionesPizza,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Pizza Pollivora', 1, precio),
                        ),
                        ProductoCard(
                          nombre: 'Pizza Tropical',
                          descripcion: 'Pizza con piña y jamón',
                          imagen: 'assets/imagenes/pedido_pizzatropical.jpg',
                          precio: 19.00,
                          opciones: opcionesPizza,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Pizza Tropical', 1, precio),
                        ),
                        ProductoCard(
                          nombre: 'Pizza Margarita',
                          descripcion: 'Pizza con queso y tomate',
                          imagen: 'assets/imagenes/pedido_pizzamargarita.jpg',
                          precio: 21.00,
                          opciones: opcionesPizza,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Pizza Margarita', 1, precio),
                        ),
                        ProductoCard(
                          nombre: 'Pizza Americana',
                          descripcion: 'Pizza con salchicha y tocino',
                          imagen: 'assets/imagenes/pedido_pizzaamericana.jpg',
                          precio: 18.00,
                          opciones: opcionesPizza,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Pizza Americana', 1, precio),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (estadoPedidos.total > 0)
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushNamed(context, 'detalle_pedido');
                    },
                    label: Text('Ver Carrito de Compra S/ ${estadoPedidos.total.toStringAsFixed(2)}'),
                    icon: Icon(Icons.shopping_cart),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
