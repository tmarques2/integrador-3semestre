import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFE0E0E0,
      ), // Fundo cinza claro conforme imagem
      body: Column(
        children: [
          // 1. Header Verde Arredondado
          Container(
            width: double.infinity,
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFF7DCC5C), // Verde da sua splash
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const SafeArea(
              child: Center(
                child: Text(
                  'ChatBot',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // 2. Área de Mensagens com Marca d'água
          Expanded(
            child: Stack(
              children: [
                // Marca d'água (Logo no fundo)
                Center(
                  child: Opacity(
                    opacity: 0.1, // Bem clarinho como na imagem
                    child: Image.asset(
                      'images/logo.png', // Verifique se o caminho está certo
                      width: 250,
                    ),
                  ),
                ),

                // Lista de Mensagens (Exemplo estático igual ao frame)
                ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    _buildChatBubble(
                      "Olá! Como posso ajudar sua plantação hoje?",
                      false,
                    ),
                    _buildChatBubble(
                      "Como economizar água na irrigação?",
                      true,
                    ),
                    _buildChatBubble(
                      "Para economizar água, recomendo utilizar a irrigação por gotejamento e monitorar a umidade do solo em tempo real pelo dashboard.",
                      false,
                    ),
                    _buildChatBubble("Entendido, obrigado!", true),
                    _buildChatBubble(
                      "Sempre que precisar de dicas sobre manejo agrícola, estarei aqui!",
                      false,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 3. Campo de Entrada de Texto
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10,
                ), // Retangular levemente arredondado
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Escreva uma mensagem',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ),
                  Icon(Icons.send_rounded, color: Colors.black, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para criar os balões de conversa
  Widget _buildChatBubble(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? const Color(0xFF2E7D32)
              : Colors.white, // Verde escuro para usuário, Branco para bot
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
