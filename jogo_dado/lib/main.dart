// importa a biblioteca para trabalhar com numeros aleatorios (para o dado)
import 'dart:math';
//importa o pacote principal do flutter (widgets, design...etc)
import 'package:flutter/material.dart';

//1. Estrutura base do app
//a funcao principal que inicia o app

void main() => (const AplicativoJogodeDados(),);

//Raiz (base) do app. Definir o tema e o fluxo inicial
class AplicativoJogodeDados extends StatelessWidget {
  const AplicativoJogodeDados({super.key});

  @override
  Widget build(BuildContext context) {
    //fazer um return do MaterialApp, que da o visual ao projeto
    return MaterialApp(
      title: 'Jogo de dados', //titulo que aparece no gerenciador
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TelaConfiguracaoJogadores(),
    );
  }
}
// 2.  TELA DO CONFIGURAÇÃO DE JOGADORES
  //Primeira tela do app. Coletar os nomes dos jogadores
  class TelaConfiguracaoJogadores extends StatefulWidget{
    const TelaConfiguracaoJogadores({super.key});
    @override 
    //cria o objeto de Estado que vai gerenciar o formulario do jogador
    State<TelaConfiguracaoJogadores> createState () =>_EstadoTelafConfiguracoesJogadores();
  }

class _EstadoTelafConfiguracoesJogadores extends State<TelaConfiguracaoJogadores>{
  //Chave Global para identificar e validar o widget
  //final e uma pavra dp dart para criar para uma variavel que so recebe valor uma vez
  final _chaveFormulario = GlobalKey<FormState>();
}