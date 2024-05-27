import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_pizzerialahuerta/ui/login/login.dart';
import 'package:app_pizzerialahuerta/ui/login/registro.dart';
import 'package:app_pizzerialahuerta/ui/pedidos/detalle_pedido.dart';
import 'package:app_pizzerialahuerta/ui/pedidos/registrar_pedido_chifa.dart';
import 'package:app_pizzerialahuerta/ui/pedidos/registrar_pedido_hamburguesa.dart';
import 'package:app_pizzerialahuerta/ui/pedidos/registrar_pedido_pizza.dart';
import 'package:app_pizzerialahuerta/ui/principal/home.dart';
import 'package:app_pizzerialahuerta/utils/estado_pedidos.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EstadoPedidos()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login': (BuildContext context) => Login(),
        'registro': (BuildContext context) => Registro(),
        'detalle_pedido': (BuildContext context) => DetallePedido(),
        'registrar_pedido_chaufa': (BuildContext context) => RegistrarPedidoChaufa(),
        'registrar_pedido_hamburguesa': (BuildContext context) => RegistrarPedidoHamburguesa(),
        'registrar_pedido_pizza': (BuildContext context) => RegistrarPedidoPizza(),
        'home': (BuildContext context) => Home(),
      },
      title: 'Pizzería La Huerta',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}
