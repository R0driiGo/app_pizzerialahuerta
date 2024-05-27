import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pizzerialahuerta/utils/estado_pedidos.dart';
import 'package:app_pizzerialahuerta/utils/encabezado.dart';
import 'package:app_pizzerialahuerta/ui/widgets/producto_card.dart';

class RegistrarPedidoChaufa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Encabezado(titulo: 'Registrar Pedido de Chaufa', mostrarRegresar: true),
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
                          nombre: 'Chaufa con Pollo (salado)',
                          descripcion: 'Chaufa delicioso con pollo',
                          imagen: 'assets/imagenes/pedido_chaufaconpollo.jpg',
                          precio: 11.00,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Chaufa con Pollo (salado)', 1, precio),
                        ),
                        ProductoCard(
                          nombre: 'Chaufa con Chancho (salado)',
                          descripcion: 'Chaufa delicioso con chancho',
                          imagen: 'assets/imagenes/pedido_chaufaconchancho.jpg',
                          precio: 14.00,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Chaufa con Chancho (salado)', 1, precio),
                        ),
                        ProductoCard(
                          nombre: 'Aeropuert (salado)',
                          descripcion: 'Chaufa aeropuert',
                          imagen: 'assets/imagenes/pedido_aeropuerto.jpg',
                          precio: 13.00,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Aeropuert (salado)', 1, precio),
                        ),
                        ProductoCard(
                          nombre: 'Aeropuert Especial (salado)',
                          descripcion: 'Chaufa aeropuert especial',
                          imagen: 'assets/imagenes/pedido_aeropuertoespecial.jpg',
                          precio: 16.00,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Aeropuert Especial (salado)', 1, precio),
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
