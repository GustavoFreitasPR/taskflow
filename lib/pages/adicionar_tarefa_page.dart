import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tarefa_provider.dart';

class AdicionarTarefaPage extends StatefulWidget {
  const AdicionarTarefaPage({super.key});

  @override
  State<AdicionarTarefaPage> createState() => _AdicionarTarefaPageState();
}

class _AdicionarTarefaPageState extends State<AdicionarTarefaPage> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvarTarefa() {
    final titulo = _tituloController.text.trim();
    final descricao = _descricaoController.text.trim();

    if (titulo.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Digite o título da tarefa.'),
        ),
      );
      return;
    }

    context.read<TarefaProvider>().adicionarTarefa(
          titulo,
          descricao,
        );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nova Tarefa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Título da tarefa',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(
                hintText: 'Ex: Fazer trabalho de Flutter',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Descrição',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _descricaoController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Digite uma descrição...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _salvarTarefa,
                icon: const Icon(Icons.save),
                label: const Text(
                  'Salvar tarefa',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
