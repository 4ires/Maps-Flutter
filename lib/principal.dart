import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final MapController _mapController = MapController(); // Adicione um MapController

  // Método para mover o mapa para uma determinada posição
  void _moveToPosition(LatLng position, double zoom) {
    _mapController.move(position, zoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FLUTTER COM MAPS",
          style: TextStyle(
              color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade300,
        actions: [
          IconButton(
            icon: Icon(Icons.center_focus_strong),
            onPressed: () {
              // Função para recentralizar o mapa para a posição do marcador inicial
              _moveToPosition(LatLng(-23.589095, -48.0487846), 13.0);
            },
          ),
          IconButton(
            icon: Icon(Icons.place),
            onPressed: () {
              // Função para recentralizar o mapa para a posição do segundo marcador
              _moveToPosition(LatLng(-22.9064, -47.0616), 13.0);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController, // Passe o MapController para o FlutterMap
            options: MapOptions(center: LatLng(-23.589095, -48.0487846), zoom: 3),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.thunderforest.com/transport/{z}/{x}/{y}.png?apikey=0c45c92d95d7489c9d58afdc12780d4b',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(-23.589095, -48.0487846),
                    builder: (ctx) => Container(
                      child: Icon(Icons.location_on, color: Colors.purpleAccent),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(-22.9064, -47.0616),
                    builder: (ctx) => Container(
                      child: Icon(Icons.location_on, color: Colors.pink.shade200
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
