import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:z_components/api/contas/contas-service.dart';
import 'package:z_components/api/contas/i-contas-service.dart';
import 'package:z_components/components/filtro/filter-expression.dart';
import 'package:z_components/components/filtro/z-searchbar.dart';
import 'package:z_components/components/fluxo-admin/usuarios.dart';
import 'package:z_components/view-model/usuario-conta-viewmodel.dart';

import '../../i-view.dart';

class UsuariosView extends IView<Usuarios> {
  UsuariosView(State<Usuarios> state) : super(state);

  IContasService contasService;
  List<UsuarioContaViewModel> listaUsuarios = [];
  GlobalKey<ZSearchBarState> keySearchBar = new GlobalKey();
  SearchOptions searchOptions = new SearchOptions();
  PaginationMetaData paginationMetaData = new PaginationMetaData();
  ScrollController scrollController;

  @override
  Future<void> afterBuild() {
    // TODO: implement afterBuild
    throw UnimplementedError();
  }

  @override
  Future<void> initView() async {
    contasService = new ContasService(
        "eyJhbGciOiJSUzI1NiIsImtpZCI6IjUwNzRhNmFhYWMyOTRmYTAzNDZjNzM3MWViYjI5ZGIzIiwidHlwIjoiSldUIn0.eyJuYmYiOjE2MjI0NjkyMjMsImV4cCI6MTYyMjQ3MjgyMywiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS1zZXJ2ZXItZGV2LnplbGxhci5jb20uYnIiLCJhdWQiOlsiaHR0cHM6Ly9pZGVudGl0eS1zZXJ2ZXItZGV2LnplbGxhci5jb20uYnIvcmVzb3VyY2VzIiwibW9sdHJlcy5hY2Vzc28uYXBpIl0sImNsaWVudF9pZCI6IlpHZXN0b3IiLCJzdWIiOiIwMjFmOTE4Mi0zZjQxLTRmMGEtYWFkYy00MDc3NmU2MGQwNGMiLCJhdXRoX3RpbWUiOjE2MjIyMTE0OTUsImlkcCI6ImxvY2FsIiwiQXNwTmV0LklkZW50aXR5LlNlY3VyaXR5U3RhbXAiOiIzS0U2RUNEUlRIR0dYQURBTUNXR1pHQUVEWDJEM1lPTCIsImFjY291bnQiOiJaZWxsYXIyIiwiaWRBY2NvdW50IjoiM2YyYmRjYmItNzY0Zi00OGM3LTBjMzMtMDhkN2NmNjNlNDViIiwiaWRDb2xhYm9yYWRvciI6IjE1ODQyQzJFLUM3RDctNERENS04RkE5LUZFMzNDQkQ2NENFQyIsInByZWZlcnJlZF91c2VybmFtZSI6IjQyNi45MTAuMjU4LTYxIiwiZW1haWwiOiJsdWl6Lmx1Y2lhQHplbGxhci5jb20uYnIiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsInBob25lX251bWJlcl92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiJMdWl6IEx1Y2lhIE5ldG8iLCJwaG9uZV9udW1iZXIiOiIxMTk0ODQ4NDEyMCIsInNjb3BlIjpbIm9wZW5pZCIsInByb2ZpbGUiLCJlbWFpbCIsIm1vbHRyZXMuYWNlc3NvLmFwaS5mdWxsIiwib2ZmbGluZV9hY2Nlc3MiXSwiYW1yIjpbInB3ZCJdfQ.GUHPSRaIAHNMts30vyneItAJcfZ-5ELuH_hb2inU-ab66Qf1RQ17t6RlpIIQTFeVadWjPX4CJjzva_wPukDRvyG6Z74_ieJbfGPqypK1-bj4HFvgzvHaOf5kFV0_VSfxAs58KA--A10d4OFRePjgUKBCLXkl-8stCHVyWTkWPuskbfSzwSAC0-gkDyX9mFmCp39OMtcys1kNQ-XzC_JLhtDLGD4gaOwU54yGPRORMG9mJwWEgvru6Z0sfv-xgoVjuWOd8WVeFazaOE-QXKCAVJAp_S8tka-zkI7udkRca12a5o80ivJRfNVTGArbluR5Qa92taDsXKJjFKQweNt06w");
    await buscarListaUsuarios(searchOptions);
    scrollController = new ScrollController();
    scrollController.addListener(onScroll);
  }

  Future<void> buscarListaUsuarios(SearchOptions searchOptions,
      {bool scrollPage}) async {
    var res = await contasService.listarUsuariosConta(searchOptions);

    if (res != null) {
      if (scrollPage != null) {
        listaUsuarios = listaUsuarios + res.body;
      } else {
        listaUsuarios = res.body;
      }
      if (state.mounted) {
        state.setState(() {
          paginationMetaData = res.paginationMetaData;
          this.searchOptions = searchOptions;
        });
      }
    }
  }

  Future<void> onScroll() async {
    if (scrollController.position.maxScrollExtent == scrollController.offset) {
      if (this.paginationMetaData.hasNext) {
        this.searchOptions.pagination.pageNumber++;

        await buscarListaUsuarios(this.searchOptions, scrollPage: true);
      }
    }
  }
}
