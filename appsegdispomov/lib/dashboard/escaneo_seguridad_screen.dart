import 'package:flutter/material.dart';

class EscaneoSeguridadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Tipo de Escaneo',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Escaneo Rápido'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF268bd2),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Escaneo Completo'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF268bd2),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Escaneo Personalizado'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF268bd2),
            ),
          ),
        ],
      ),
    );
  }
}
