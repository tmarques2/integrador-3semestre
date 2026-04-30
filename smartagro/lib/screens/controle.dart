import 'package:flutter/material.dart';

class ControlePage extends StatefulWidget {
  const ControlePage({super.key});

  @override
  State<ControlePage> createState() => _ControlePageState();
}

class _ControlePageState extends State<ControlePage> {
  // Estados dos botões (ligado/desligado)
  bool irrigacao = false;
  bool iluminacao = true;
  bool ventilacao = false;
  bool nutrientes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFE0E0E0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFF7DCC5C),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const SafeArea(
              child: Center(
                child: Text(
                  'Controle de Atuadores',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // 2. Lista de Cards de Controle
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildControlCard(
                  "Bomba de Irrigação",
                  "Status: ${irrigacao ? 'Ligada' : 'Desligada'}",
                  Icons.water_drop,
                  irrigacao,
                  (val) => setState(() => irrigacao = val),
                ),
                _buildControlCard(
                  "Iluminação Estufa",
                  "Status: ${iluminacao ? 'Ligada' : 'Desligada'}",
                  Icons.lightbulb,
                  iluminacao,
                  (val) => setState(() => iluminacao = val),
                ),
                _buildControlCard(
                  "Ventilação",
                  "Status: ${ventilacao ? 'Ligada' : 'Desligada'}",
                  Icons.air,
                  ventilacao,
                  (val) => setState(() => ventilacao = val),
                ),
                _buildControlCard(
                  "Dosador de Nutrientes",
                  "Status: ${nutrientes ? 'Ligada' : 'Desligada'}",
                  Icons.health_and_safety,
                  nutrientes,
                  (val) => setState(() => nutrientes = val),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para criar os cards de controle
  Widget _buildControlCard(
    String title,
    String subtitle,
    IconData icon,
    bool status,
    Function(bool) onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Ícone com fundo colorido suave
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: status
                  ? const Color(0xFF7DCC5C).withOpacity(0.2)
                  : Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: status ? const Color(0xFF2E7D32) : Colors.grey,
              size: 28,
            ),
          ),
          const SizedBox(width: 20),
          // Textos
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
              ],
            ),
          ),
          // Botão Switch (Ligar/Desligar)
          Switch(
            value: status,
            onChanged: onChanged,
            activeColor: const Color(0xFF7DCC5C),
            activeTrackColor: const Color(0xFF7DCC5C).withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
