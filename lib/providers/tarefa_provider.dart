import 'package:flutter/foundation.dart';
import '../models/tarefa.dart';

class TarefaProvider extends ChangeNotifier {
  final List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => List.unmodifiable(_tarefas);

  void adicionarTarefa(String titulo, String descricao) {
    _tarefas.add(
      Tarefa(
        titulo: titulo,
        descricao: descricao,
      ),
    );
    notifyListeners();
  }

  void concluirTarefa(int index) {
    _tarefas[index].concluida = !_tarefas[index].concluida;
    notifyListeners();
  }

  void removerTarefa(int index) {
    _tarefas.removeAt(index);
    notifyListeners();
  }

  int get tarefasConcluidas =>
      _tarefas.where((tarefa) => tarefa.concluida).length;

  int get tarefasPendentes =>
      _tarefas.where((tarefa) => !tarefa.concluida).length;
}
