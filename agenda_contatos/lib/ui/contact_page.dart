import 'dart:io';

import 'package:flutter/material.dart';
import 'package:agenda_contatos/helpers/contact_helper.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;

  ContactPage({this.contact}); // entre chavers = parametro opcional

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  Contact _editedContact;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null)
      _editedContact = Contact();
    else
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(_editedContact.name ?? 'Novo Contato'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              if (_editedContact.name != null && _editedContact.name.isNotEmpty) {
                Navigator.pop(context, _editedContact);           // remove a tela e volta pra anterior
              } else {
                FocusScope.of(context).requestFocus(_nameFocus);  // da o foco no campo não preenchido
              }
            },
            child: Icon(Icons.save),
            backgroundColor: Colors.red,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: _editedContact.img != null
                                ? FileImage(File(_editedContact.img))
                                : AssetImage('images/catra.png'))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: TextField(
                    controller: _nameController,
                    focusNode: _nameFocus,
                    decoration: InputDecoration(labelText: 'Nome', errorText: 'Campo obrigatório *'),
                    onChanged: (text) {
                      _userEdited = true;
                      setState(() {
                        _editedContact.name = text;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (text) {
                      _userEdited = true;
                      _editedContact.email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Phone'),
                    onChanged: (text) {
                      _userEdited = true;
                      _editedContact.phone = text;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                )
              ],
            ),
          )),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Descartar alterações?'),
              content: Text('Se sair as alterações serão perdidadas.'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text('Sim'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            );
          }
      );
      return Future.value(false);
    } else {
      return Future.value(true); // retorna automaticamente, sem verificar se existe dados não salvos
    }
  }
}
