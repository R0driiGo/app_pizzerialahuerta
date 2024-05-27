import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pizzerialahuerta/utils/estado_pedidos.dart';
import 'package:app_pizzerialahuerta/utils/encabezado.dart';

class DetallePedido extends StatelessWidget {
  void _confirmarEliminacion(BuildContext context, Pedido pedido) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿Retirar de la canasta?'),
          content: Text('¿Estás seguro de que quieres eliminar ${pedido.nombre} de tu canasta?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.delete, color: Colors.red),
              label: Text('¡Sí, Eliminar!', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Provider.of<EstadoPedidos>(context, listen: false).eliminarPedido(pedido);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Encabezado(titulo: 'Detalle de Pedido', mostrarRegresar: true),
      body: Consumer<EstadoPedidos>(
        builder: (context, estadoPedidos, child) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: estadoPedidos.pedidos.length,
                  itemBuilder: (context, index) {
                    final pedido = estadoPedidos.pedidos[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: ListTile(
                        title: Text(pedido.nombre, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Cantidad: ${pedido.cantidad} - Precio Unitario: S/ ${pedido.precio.toStringAsFixed(2)} - Importe: S/ ${pedido.importe.toStringAsFixed(2)}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        if (pedido.cantidad > 1) {
                                          Provider.of<EstadoPedidos>(context, listen: false).disminuirCantidad(pedido);
                                        }
                                      },
                                    ),
                                    Text('${pedido.cantidad}'),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        Provider.of<EstadoPedidos>(context, listen: false).aumentarCantidad(pedido);
                                      },
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    _confirmarEliminacion(context, pedido);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text('S/ ${estadoPedidos.total.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
