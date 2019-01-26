import 'package:flutter/material.dart'; // importa widgets do material design

void main() {
  // comando para rodar o app (Material app é um widget)
  runApp(MaterialApp(title: 'Contador de pessoas', home: Home()
//    home: Container(color: Colors.white) // Container - local para colocar outros widgets
      ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // o _ possibilita que a variável não seja acessada de fora;
  int _people = 0;
  String _infoText = '';

  void _changePeople(int delta) {
    // setState executa o código e logo em seguida manda atualizar(redesenhar) a tela; Apenas as partes que foram modificadas
    setState(() {
      _people += delta;

      if (_people < 1) {
        _infoText = 'Mundo invertido?';
      } else if (_people < 10) {
        _infoText = 'Poucos participantes cadastrados!';
      } else {
        _infoText = 'Vagas limitadas! Faça já sua inscrição';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/corrida.jpg',
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pessoas: $_people',
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text('-1',
                          style:
                              TextStyle(fontSize: 40.0, color: Colors.redAccent)),
                      onPressed: () {
                        _changePeople(-1);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text('+1',
                          style:
                              TextStyle(fontSize: 40.0, color: Colors.redAccent)),
                      onPressed: () {
                        _changePeople(1);
                      }),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.redAccent,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0))
          ],
        )
      ],
    );
  }
}
