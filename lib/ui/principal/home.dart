import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pizzerialahuerta/ui/pedidos/registrar_pedido_pizza.dart';
import 'package:app_pizzerialahuerta/ui/pedidos/registrar_pedido_hamburguesa.dart';
import 'package:app_pizzerialahuerta/ui/pedidos/registrar_pedido_chifa.dart';
import 'package:app_pizzerialahuerta/ui/pedidos/detalle_pedido.dart';
import 'package:app_pizzerialahuerta/utils/estado_pedidos.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizzería La Huerta'),
      ),
      body: ChangeNotifierProvider.value(
        value: estadoPedidos,
        child: Consumer<EstadoPedidos>(
          builder: (context, estadoPedidos, child) {
            return Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistrarPedidoPizza()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        child: Image.asset('assets/imagenes/menu_pizza.jpg', fit: BoxFit.cover, width: double.infinity, height: 200),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistrarPedidoHamburguesa()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        child: Image.asset('assets/imagenes/menu_hamburguesa.jpg', fit: BoxFit.cover, width: double.infinity, height: 200),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistrarPedidoChaufa()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        child: Image.asset('assets/imagenes/menu_chaufas.jpg', fit: BoxFit.cover, width: double.infinity, height: 200),
                      ),
                    ),
                  ],
                ),
                if (estadoPedidos.total > 0)
                  Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    right: 16.0,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetallePedido()),
                        );
                      },
                      label: Text('Ver Carrito de Compra S/ ${estadoPedidos.total.toStringAsFixed(2)}'),
                      icon: Icon(Icons.shopping_cart),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
