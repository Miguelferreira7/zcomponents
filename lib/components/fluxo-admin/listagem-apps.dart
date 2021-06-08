import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:z_components/components/modulo/detalhe-modulo.dart';
import 'package:z_components/components/z-item-tile-modulo-adm.dart';
import 'package:z_components/view-model/app-usuario-conta-viewmodel.dart';
import 'package:z_components/view-model/usuario-conta-viewmodel.dart';

import '../z-item-tile-usuario-adm.dart';
import 'listagem-apps-view.dart';

class ListagemApps extends StatefulWidget {
  List<AppUsuarioContaViewModel> listaApps;
  UsuarioContaViewModel usuario;

  ListagemApps({this.listaApps, this.usuario});

  @override
  _ListagemAppsState createState() => _ListagemAppsState();
}

class _ListagemAppsState extends State<ListagemApps> {
  ListagemAppsView _view;

  @override
  void initState() {
    _view = ListagemAppsView(this);
    _view.initView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("USUÁRIO"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return new Column(
      children: [
        new Material(
            elevation: 4,
            child: new Container(
              margin: EdgeInsets.only(top: 10.0),
              child: new ZItemTileUsuarioAdm(
                visibilidade: true,
                nomeUsuario: widget.usuario.usuario.nome,
                email: widget.usuario.usuario.email,
                quantidadeApps: widget.usuario.appLista.length.toString(),
                status: widget.usuario.status,
                telefone: widget.usuario.usuario.telefone,
                appsVinculados:
                    _view.listarAppsVinculados(widget.usuario.appLista),
              ),
            )),
        new Expanded(
          child: _ListarModulos(),
        )
      ],
    );
  }

  Widget _ListarModulos() {
    return new ListView.builder(
        padding: EdgeInsets.only(top: 20.0),
        shrinkWrap: true,
        itemCount: widget.listaApps.length,
        itemBuilder: (builder, index) =>
            _montarCardUsuario(widget.listaApps[index]));
  }

  Widget _montarCardUsuario(AppUsuarioContaViewModel app) {
    return new Container(
      child: new ZItemTileModuloAdm(
        dataExpiracao: (app.dataInativacao != null)
            ? UtilData.obterDataDDMMAAAA(DateTime.parse(app.dataInativacao))
            : "Nunca",
        dataVinculo: (app.dataVinculo != null)
            ? UtilData.obterDataDDMMAAAA(DateTime.parse(app.dataVinculo))
            : "Nunca",
        nomeModulo: app.app.nome,
        perfilAcesso: "Não contém perfil",
        statusVinculo: app.status,
        onTap: () {
          print(widget.usuario.toString());
          print(app.toMap());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetalheModulo(
                        cliqueEditar: false,
                        editarDados: false,
                        appUsuarioContaViewModel: app,
                      )));
        },
      ),
    );
  }
}
