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
  //FormState e o estado interno desse formulario, a a parte que sabe o que esta digitado e consegue
  //validor os campos
  final _chaveFormulario = GlobalKey<FormState>();
  //Controladores para pegar o texto digitado no campos
  final TextEditingController _controladorJogador1 = TextEditingController();
  final TextEditingController _controladorJogador2 = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuração dos jogadores"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16), //Espacamento Interno
        child: Form(
          key: _chaveFormulario, //Associando a chave GlobalKey ao formulario
          child: Column(
            children:[
              //Campo de texto para o jogador n1
              TextFormField(
                controller: _controladorJogador1, //liga o input ao controlador
                decoration: const InputDecoration(labelText: "Nome Jogador 1"),
                validator: (valor) => valor!.isEmpty ? "Digite um nome" : null,
                //condição ? valor_se_verdadeiro : valor_se_falso
                //Se o campo estiver vazio, mostre o texto Digite um nome.
              ),
              const SizedBox(height: 16),
              //Campo de texto para o jogador n2
              TextFormField(
                controller: _controladorJogador2, //liga o input ao controlador
                decoration: const InputDecoration(labelText: "Nome Jogador 2"),
                validator: (valor) => valor!.isEmpty ? "Digite um nome" : null,
                //condição ? valor_se_verdadeiro : valor_se_falso
                //Se o campo estiver vazio, mostre o texto Digite um nome.
              ),
              const Spacer(), //Ocupar o espaço vertical disponivel,empurrando o botão p/baixo 
              //Fazer um botão para iniciar o jogo
              ElevatedButton(
                onPressed:(){
                  //Checar se o formulario esta valido(se os campos foram preenchidos)
                  if (_chaveFormulario.currentState!.validate()){
                    //Navega para a próxima tela
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //Cria a tela do jogo, PASSANDO os nomes digitados como Paramêtros.
                        builder: (context) => TelaJogodeDados(
                          nomeJogador1: _controladorJogador1.text,
                          nomeJogador2: _controladorJogador2.text,
                        )
                      )
                    );
                  }
                },
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                //Botão de largura total
                child: const Text("Inicial Jogo"),
              )
            ] ,), 
        ),
         ),
    );
  }
}

// 3. TELA PRINCIPAL DO JOGO

//aqui eu vou receber os nomes como propiedades
class TelaJogodeDados extends StatefulWidget{
  //Variaveis finais que armazenam os nomes recebidos da tela anterior
  final String nomeJogador1;
  final String nomeJogador2;

  const TelaJogodeDados({
    super.key,
    //o required garante que esses valores devem ser passados.
    required this.nomeJogador1,
    required this.nomeJogador2,
  });

  @override
  State<TelaJogodeDados> createState() => _EstadoTelaJogoDeDados();
}