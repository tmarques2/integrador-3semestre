import 'package:flutter/material.dart';

class AlertasPage extends StatelessWidget {
  const AlertasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0), // Fundo cinza padrão
      body: Column(
        children: [
          // 1. Header Verde Arredondado
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
                  'Central de Alertas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // 2. Lista de Alertas
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildAlertCard(
                  "Crítico: Umidade do Solo",
                  "A umidade no Setor A caiu abaixo de 20%. Irrigação necessária!",
                  Icons.warning_amber_rounded,
                  Colors.red,
                  "Agora",
                ),
                _buildAlertCard(
                  "Atenção: Temperatura",
                  "Temperatura da estufa atingiu 32°C. Verifique a ventilação.",
                  Icons.thermostat,
                  Colors.orange,
                  "10 min atrás",
                ),
                _buildAlertCard(
                  "Sistema: Bateria Baixa",
                  "O sensor de luminosidade 02 está com 10% de bateria.",
                  Icons.battery_alert,
                  Colors.amber,
                  "1 hora atrás",
                ),
                _buildAlertCard(
                  "Informativo: Relatório Disponível",
                  "O relatório semanal da sua plantação já foi gerado.",
                  Icons.info_outline,
                  Colors.blue,
                  "Hoje, 08:00",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para criar os cards de alerta
  Widget _buildAlertCard(
    String title,
    String message,
    IconData icon,
    Color color,
    String time,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border(
          left: BorderSide(
            color: color,
            width: 5,
          ), // Barra lateral colorida para destaque
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  message,
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
