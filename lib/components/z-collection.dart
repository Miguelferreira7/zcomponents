import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:z_components/components/z-collection-item.dart';
import 'package:z_components/components/z-collection-list.dart';

class ZCollection extends StatefulWidget {
  final String titulo;
  final List<ZCollectionItem> lista;
  final ValueChanged<ZCollectionItem> onChange;

  ZCollection({this.titulo: "Z Collection", this.lista, this.onChange});

  @override
  State<StatefulWidget> createState() => _ZCollectioState();
}

class _ZCollectioState extends State<ZCollection> {
  ZCollectionItem _itemSelecionado;

  @override
  void initState() {
    _itemSelecionado = new ZCollectionItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey))),
        padding: EdgeInsets.only(left: 16.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              width: 130,
              child: new Text(
                widget.titulo,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            new Expanded(
                child: ListTile(
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text(
                    "${_itemSelecionado?.valor ?? ""}",
                    style: new TextStyle(color: Colors.grey),
                  )
                ],
              ),
              trailing: new Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ))
          ],
        ),
      ),
      onTap: _irParaSelecaoDeItem,
    );
  }

  void _irParaSelecaoDeItem() async {
    _itemSelecionado = await Navigator.push<ZCollectionItem>(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => ZCollectionList(
                  lista: widget.lista,
                  titulo: widget.titulo,
                )));
    if(widget.onChange != null)
      widget.onChange(_itemSelecionado);

    setState(() {});
  }
}
