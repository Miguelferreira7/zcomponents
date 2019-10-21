import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:z_components/components/z-nome-reduzido.dart';

class ZExpendableItemTile extends StatefulWidget {
  final String textoIconeUm;
  final String textoIconeDois;
  final String textoIconeTres;
  final String textoIconeQuatro;
  final Widget iconeUm;
  final String cargo;
  final String escala;
  final Color colorBatida;
  final Color colorTextExpandItens;
  final double fontSizeTextExpand;
  final String re;
  final String horario;
  final String nomeCC;
  final String tempoPausa;
  final String horaSaida;
  final String nomeColab;
  final Widget iconeDois;
  final String horaEntrada;
  final Widget iconeTres;
  final Widget iconeQuatro;
  final Function funcao;
  final Function image;
  final Function funcaoIconeUm;
  final Function funcaoIconeDois;
  final Function funcaoIconeTres;
  final Function funcaoIconeQuatro;
  final Widget imagemPerfil;
  final Function onTapVoltar;
  final Function onTapImage;
  final String idConta;
  final String token;
  final String cpf;
  final String jornada;
  final Function onPressedIconBatida;
  final String nomeCentroCusto;
  final String nome;
  final String inicioIntervalo;
  final String voltaIntervalo;
  final String status;
  final Color colorStatus;

  ZExpendableItemTile(
      {
        this.fontSizeTextExpand = 10.0,
        this.colorTextExpandItens = Colors.black,
        this.jornada,
        this.colorBatida,
        this.onPressedIconBatida,
        this.voltaIntervalo,
  this.tempoPausa,
        this.colorStatus = Colors.grey,
        this.horaEntrada,
        this.cargo,
        this.horario= "",
        this.re,
        this.inicioIntervalo,
        this.nomeCentroCusto,
        this.nome,
        this.escala,
        this.nomeCC,
      this.funcao,
        this.nomeColab,
      this.status = "",
      this.image,
      this.funcaoIconeDois,
      this.funcaoIconeQuatro,
      this.funcaoIconeTres,
        this.horaSaida,
      this.funcaoIconeUm,
      this.iconeDois,
      this.iconeQuatro,
      this.iconeTres,
      this.iconeUm,
      this.textoIconeDois: "",
      this.textoIconeQuatro: "",
      this.textoIconeTres: "",
      this.textoIconeUm: "",
      this.token,
      this.cpf,
      this.idConta,
      this.imagemPerfil,
      this.onTapImage,
      this.onTapVoltar,
      });

  @override
  _ZExpendableItemTileState createState() => _ZExpendableItemTileState();
}

class _ZExpendableItemTileState extends State<ZExpendableItemTile> {

  double _largura;
  @override
  Widget build(BuildContext context) {
    _largura = MediaQuery.of(context).size.width;
    return new Container(
      margin: const EdgeInsets.only(left: 16,right: 16,bottom: 8),
      child: new Material(
        elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(6.0) ),

      child: ConfigurableExpansionTile(
        animatedWidgetFollowingHeader: new Container(
          padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
          child: new Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
        ),
        header: new Expanded(
            child:  IntrinsicHeight(
                child: new Container(
                  margin: EdgeInsets.only(left: 1.0, right: 1.0, bottom: 0.0, top: 0.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  alignment: Alignment.centerLeft,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Expanded(
                          flex: 20,
                          child: new GestureDetector(
                            onTap: widget.onTapImage,
                            child: new Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xFF808080),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.0),
                                    bottomLeft: Radius.circular(6.0),
                                  )),
                              child: (widget.imagemPerfil == null)
                                  ? new Icon(
                                Icons.insert_photo,
                                color: Color(0xFFffffff),
                              )
                                  : new Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0)),
                                  color: Colors.transparent,
                                ),
                                child: widget.imagemPerfil,
                              ),
                            ),
                          )),
                      new Expanded(
                          flex: 100,
                          child: new InkWell(
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Container(
                                      margin: EdgeInsets.only(left: 6.0, bottom: 6.0, top: 6.0),
                                      child: (widget.nome == null)
                                          ? new Text('')
                                          : new ZNomeReduzido(
                                        text: widget.nome,
                                        textStyle: TextStyle(
                                            fontSize: 14.0,
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    new Container(
                                      //width: (MediaQuery.of(context).size.width / 2.4),
                                        margin: EdgeInsets.only(right:6),
                                        child: new Text(widget.re ?? "",style: new TextStyle(color: Color(0xFF000000),fontSize: 12, fontWeight: FontWeight.w700),)
                                    ),
                                  ],
                                ),
                                new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Row(
                                      children: <Widget>[
                                        new Container(
                                          margin: EdgeInsets.only(
                                              left: 6.0, right: 0.0, bottom: 2.0, top: 0.0),
                                          child: new Icon(
                                            Icons.my_location,
                                            color: Color(0xFFA3A3A3),
                                            size: 16.0,
                                          ),
                                        ),
                                        new Container(
                                          width: (MediaQuery.of(context).size.width / 2.4),
                                          margin: EdgeInsets.only(
                                              left: 6.0, bottom: 2.0),
                                          child: (widget.nomeCentroCusto == null)
                                              ? new Text('')
                                              : new Text(
                                            widget.nomeCentroCusto,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xFF808080),
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                    new Row(
                                      children: <Widget>[
                                        new Container(
                                          height: 10.0,
                                          width: 10.0,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: widget.colorStatus),
                                        ),
                                        new Container(
                                          margin:
                                          EdgeInsets.only(right: 6.0, left: 4.0),
                                          child: new Text(
                                            widget.status,
                                            style: TextStyle(fontWeight: FontWeight.w700,
                                              fontSize: 12.0,),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                new Row(
                                  children: <Widget>[
                                    new Expanded(
                                      flex: 5,
                                      child: new Container(
                                        width: _largura / 2.9,
                                        child: new Row(
                                          children: <Widget>[
                                            new Container(
                                              margin: EdgeInsets.only(
                                                  left: 6.0, right: 0.0, bottom: 2.0, top: 0.0),
                                              child: new Icon(
                                                Icons.work,
                                                size: 16,
                                                color: Color(0xFFA3A3A3),
                                              ),
                                            ),
                                            new Container(
                                              width: (_largura<=450)?_largura /4:_largura /3.2,
                                              margin: EdgeInsets.only(
                                                  left: 6.0, right: 0.0, bottom: 2.0, top: 0.0),
                                              child: new Text(
                                                widget.cargo ?? "",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xFF808080),
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    new Expanded(
                                      flex: 5,
                                      child:  new Row(
                                        children: <Widget>[
                                          new Container(
                                            margin: EdgeInsets.only(right: 0.0, bottom: 4.0, top: 0.0),
                                            child: new Icon(
                                              Icons.date_range,
                                              size: 16,
                                              color: Color(0xFFA3A3A3),
                                            ),
                                          ),
                                          new Container(
                                            width: _largura/5,
                                            margin: EdgeInsets.only(
                                                left: 6.0, right: 0.0, bottom: 4.0, top: 0.0),
                                            child: new Text(
                                              widget.escala ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      ) ,)
                                  ],
                                ),
                                new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    new Expanded(
                                      flex: 5,
                                      child: new Container(
                                        width:(_largura<360)? _largura / 2.9:_largura / 2.9,                                      child:  new Row(
                                        children: <Widget>[
                                          new Container(
                                            padding: EdgeInsets.only(
                                                left: 6.0, right: 0.0, bottom: 6.0, top: 0.0),
                                            child: new Icon(
                                              Icons.access_time,
                                              size:(_largura<360)?14:16,
                                              color: Color(0xFFA3A3A3),
                                            ),
                                          ),
                                          new Container(
                                            padding: EdgeInsets.only(
                                                left: 6.0, right: 0.0, bottom: 6.0, top: 2.0),
                                            child: new Text(
                                              widget.horario,
                                              style: TextStyle(
                                                  color: Color(0xFF808080),
                                                  fontSize: (_largura<360)?8.0:10,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      ),
                                      ),
                                    ),
                                    new Expanded(
                                      flex: 5,
                                      child: new Container(
                                        child:  new Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Row(
                                              children: <Widget>[
                                                new Container(
                                                  padding: EdgeInsets.only(
                                                      left: 0.0, right: 0.0, bottom: 6.0, top: 0.0),
                                                  child: new Icon(
                                                    Icons.restaurant_menu,
                                                    color: Color(0xFFA3A3A3),
                                                    size: (_largura<360)?14:16,
                                                  ),
                                                ),
                                                new Container(
                                                  padding: EdgeInsets.only(
                                                      left: 2.0, right: 0.0, bottom: 6.0, top: 0.0),
                                                  child:
                                                  (widget.tempoPausa ==
                                                      null ||
                                                      widget.tempoPausa ==
                                                          "")?
                                                      new Text(""):
                                                  new Text(
                                                    "${widget.tempoPausa}" ?? "",
                                                    style: TextStyle(
                                                        color: Color(0xFF808080),
                                                        fontSize: (_largura<=360)?8.0:10,
                                                        fontWeight: FontWeight.w700),
                                                  ),
                                                ),
                                                new Container(
                                                  padding: EdgeInsets.only(
                                                      left: 2.0, right: 0.0, bottom: 6.0, top: 0.0),
                                                  child:  (widget.inicioIntervalo ==
                                                      null ||
                                                      widget.inicioIntervalo ==
                                                          "")?new Text(""):new Text(
                                                    widget.inicioIntervalo ?? "",
                                                    style: TextStyle(
                                                        color: Color(0xFF808080),
                                                        fontSize: (_largura<360)?8.0:10,
                                                        fontWeight: FontWeight.w700),
                                                  ),
                                                ),
                                                new Container(
                                                  padding: EdgeInsets.only(
                                                      left: 2.0, right: 0.0, bottom: 6.0, top: 0.0),
                                                  child: (widget.voltaIntervalo ==
                                                      null ||
                                                      widget.voltaIntervalo ==
                                                          "")?new Text(""):new Text(
                                                      "-${widget.voltaIntervalo}" ??
                                                          "",
                                                    style: TextStyle(
                                                        color: Color(0xFF808080),
                                                        fontSize: (_largura<360)?8.0:10,
                                                        fontWeight: FontWeight.w700),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            new Container(
                                              margin: EdgeInsets.only(right: (_largura<=360)?2:6,bottom: 8),
                                              alignment: Alignment.topCenter,
                                              //margin:  EdgeInsets.only(left: _largura/40,bottom: 6),
                                              child: new InkWell(
                                                onTap: widget.onPressedIconBatida,
                                                child:
                                                new Icon(Icons.alarm_on,color: widget.colorBatida,size:(_largura<360)?14:18,),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            onTap: widget.funcao,
                          )),
                      new Container(
                        color: Colors.grey,
                        height: 90.0,
                        width: 0.2,
                      ),
                    ],
                  ),
                ))
        ),
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey.withOpacity(0.2)))),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new GestureDetector(
                      child: new Container(
                        padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: Colors.grey.withOpacity(0.2)))),
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: widget.iconeUm,
                            ),
                            new Text("${widget.textoIconeUm}",
                                style: TextStyle(
                                  fontSize: widget.fontSizeTextExpand, color: widget.colorTextExpandItens,))
                          ],
                        ),
                      ),
                      onTap: widget.funcaoIconeUm,
                    )),
                new Expanded(
                    child: new GestureDetector(
                      child: new Container(
                        padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: Colors.grey.withOpacity(0.2)))),
                        child: new Column(
                          children: <Widget>[
                            new Container(child: widget.iconeDois),
                            new Text(widget.textoIconeDois,
                                style: TextStyle(
                                    fontSize: widget.fontSizeTextExpand, color: widget.colorTextExpandItens))
                          ],
                        ),
                      ),
                      onTap: widget.funcaoIconeDois,
                    )),
                new Expanded(
                    child: new GestureDetector(
                      onTap: widget.funcaoIconeTres,
                      child: new Container(
                        padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: Colors.grey.withOpacity(0.2)))),
                        child: new Column(
                          children: <Widget>[
                            new Container(child: widget.iconeTres),
                            new Text(widget.textoIconeTres,
                                style: TextStyle(
                                    fontSize: widget.fontSizeTextExpand, color: widget.colorTextExpandItens))
                          ],
                        ),
                      ),
                    )),
                new Expanded(
                    child: new GestureDetector(
                      onTap: widget.funcaoIconeQuatro,
                      child: new Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                        child: new Column(
                          children: <Widget>[
                            new Container(child: widget.iconeQuatro),
                            new Text(
                              widget.textoIconeQuatro,
                              style: TextStyle(
                                  fontSize: widget.fontSizeTextExpand, color: widget.colorTextExpandItens),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    ),);
  }
}
