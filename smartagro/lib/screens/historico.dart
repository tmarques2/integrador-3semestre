import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Histórico de Dados")),
      body: Center(child: Text("Lista de logs do banco de dados Cloud")),
    );
  }
}
