import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(home: HomePage(), theme: ThemeData(hintColor: Colors.white)));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int groupValue;
  int vertices = 2;
  int arestas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Gerador de grafos e dígrafos'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (int e) => _chagenGroupValue(e)
                ),
                Text(
                  'Grafo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),
                ),
                Radio(
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (int e) => _chagenGroupValue(e),
                ),
                Text(
                  'Dígrafo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            child: Column(
              children: <Widget>[
                Text('Vértices: $vertices', style: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Icon(Icons.remove),
                        onPressed: (){
                          _changeVerticeValue(-1);
                        },
                      ),
                      FlatButton(
                        child: Icon(Icons.add),
                        onPressed: (){
                          _changeVerticeValue(1);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Container(
            child: Column(
              children: <Widget>[
                Text('Arestas: $arestas', style: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Icon(Icons.remove),
                        onPressed: (){
                          _changeArestaValue(-1);
                        },
                      ),
                      FlatButton(
                        child: Icon(Icons.add),
                        onPressed: (){
                          _changeArestaValue(1);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment(-0.9, 0.0),
                child: Icon(Icons.delete, color: Colors.white),
              )
          ),
        ],
      ),
    );
  }

  void _changeVerticeValue(val){
    setState(() {
      if (vertices <= 2 && val == -1)
        return;

      vertices += val;
    });
  }

  void _changeArestaValue(val){
    setState(() {
      if (arestas <= 0 && val == -1)
        return;

      arestas += val;
    });
  }

  void _chagenGroupValue(val){
    setState(() {
      if (val == 1)
        groupValue = 1;
      else
        groupValue = 2;
    });
  }
}
