import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pizzerialahuerta/ui/widgets/producto_card.dart';
import 'package:app_pizzerialahuerta/utils/estado_pedidos.dart';
import 'package:app_pizzerialahuerta/utils/encabezado.dart';

class RegistrarPedidoHamburguesa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Encabezado(titulo: 'Registrar Pedido de Hamburguesa', mostrarRegresar: true),
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
                          nombre: 'Hamburguesa Clasica',
                          descripcion: 'Hamburguesa con ingredientes clásicos',
                          imagen: 'assets/imagenes/pedido_hclasica.jpg',
                          precio: 5.00,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Hamburguesa Clasica', 1, precio),
                        ),
                        ProductoCard(
                          nombre: 'Hamburguesa Rusa',
                          descripcion: 'Hamburguesa con ingredientes rusos',
                          imagen: 'assets/imagenes/pedido_hrusa.jpg',
                          precio: 6.00,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Hamburguesa Rusa', 1, precio),
                        ),
                        ProductoCard(
                          nombre: 'Hamburguesa Royal',
                          descripcion: 'Hamburguesa con ingredientes royal',
                          imagen: 'assets/imagenes/pedido_royal.jpg',
                          precio: 6.00,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Hamburguesa Royal', 1, precio),
                        ),
                        ProductoCard(
                          nombre: 'Hamburguesa Royal Cheese',
                          descripcion: 'Hamburguesa con queso royal',
                          imagen: 'assets/imagenes/pedido_royalcheese.jpg',
                          precio: 6.00,
                          onAgregar: (precio) => estadoPedidos.agregarPedido('Hamburguesa Royal Cheese', 1, precio),
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
