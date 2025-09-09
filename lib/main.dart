import 'package:practica/pages/pagina02.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Página principal'),
        '/tabs': (context) => const Pagina02(), // cambiamos TabsScreen por Pagina02
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// crearcion de la pagina principal y dirrecionamiento a la pagina 2
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Bienvenido a mi Tienda Catálogo'),
            ElevatedButton(
              child: const Text('Ingresar'),
              onPressed: () {
                Navigator.pushNamed(context, '/tabs');
              },
            ),
          ],
        ),
      ),
    );
  }
}
