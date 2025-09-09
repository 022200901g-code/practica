import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class Pagina02 extends StatelessWidget {
  const Pagina02({super.key});

  Future<String> cargarDescripcion(String archivo) async {
    return await rootBundle.loadString('archivo_texto/$archivo.txt');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Hombre y Mujer
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Catálogo"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Hombre", icon: Icon(Icons.man)),
              Tab(text: "Mujer", icon: Icon(Icons.woman)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //TAB HOMBRE 
            FutureBuilder(
              future: cargarDescripcion("hombre"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Image.asset("assets/images/hombre.jpg", height: 250),
                    const SizedBox(height: 20),
                    Text(snapshot.data ?? "Sin descripción",
                        style: const TextStyle(fontSize: 16)),
                  ],
                );
              },
            ),

            // -TAB MUJER 
            FutureBuilder(
              future: cargarDescripcion("mujer"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Image.asset("assets/images/images.jpg", height: 250),
                    const SizedBox(height: 20),
                    Text(snapshot.data ?? "Sin descripción",
                        style: const TextStyle(fontSize: 16)),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
