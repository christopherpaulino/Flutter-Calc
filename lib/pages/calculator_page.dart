
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget{

  @override
  State createState() => CalculatorPageState();
}
class CalculatorPageState extends State<CalculatorPage>{

String _operacion = "";
String _resultado = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        bottom: false,
        child:body(context) ,
      )
    );
  }

  Widget body(BuildContext context){
    Color primaryDark = Theme.of(context).primaryColorDark;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Container(
            color: Theme.of(context).primaryColor,
            height: MediaQuery.of(context).size.height *0.40,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                  Text(_operacion,style: TextStyle(fontSize: 25,color: primaryDark,fontWeight: FontWeight.bold),maxLines: 2,)
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                  Text(_resultado,style: TextStyle(fontSize: 40,color: primaryDark,fontWeight: FontWeight.bold),)
                ],)
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [Theme.of(context).accentColor.withOpacity(0.5)  , Theme.of(context).accentColor.withOpacity(1.0)],
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0))

              ),
              child: _botones(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _botones(BuildContext context){
    Color primary = Theme.of(context).primaryColor;
    Color primaryDark = Theme.of(context).primaryColorDark;
    Color accent = Theme.of(context).accentColor;
    Color transparent = Colors.transparent;
    ButtonStyle signosStyle = ButtonStyle(background: primary, textColor: accent);
    ButtonStyle numStyle = ButtonStyle(background: transparent, textColor: primaryDark);
    ButtonStyle equalStyle = ButtonStyle(background: primaryDark, textColor: accent);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Table(
            children: [
              TableRow(
                children: [
                  _btn(style: signosStyle,text: "C"),
                  _btn(style: signosStyle,text: "+/-"),
                  _btn(style: signosStyle,text: "%"),
                  _btn(style: signosStyle,text: "/"),
                ]
              ),TableRow(
                  children: [
                    _btn(style: numStyle,text: "7"),
                    _btn(style: numStyle,text: "8"),
                    _btn(style: numStyle,text: "9"),
                    _btn(style: signosStyle,text: "X"),
                  ]
              ),TableRow(
                  children: [
                    _btn(style: numStyle,text: "4"),
                    _btn(style: numStyle,text: "5"),
                    _btn(style: numStyle,text: "6"),
                    _btn(style: signosStyle,text: "-"),
                  ]
              ),TableRow(
                  children: [
                    _btn(style: numStyle,text: "1"),
                    _btn(style: numStyle,text: "2"),
                    _btn(style: numStyle,text: "3"),
                    _btn(style: signosStyle,text: "+"),
                  ]
              )
            ],
          ),
          Table(
            columnWidths: {0:FractionColumnWidth(.5)},
            children:[
            TableRow(
              children: [
                _btn(style: numStyle,text: "0"),
                _btn(style: numStyle,text: "."),
                _btn(style: equalStyle,text: "="),

              ]
          ),
            ]
          )
        ],
      ),
    );
  }

  Widget _btn({ButtonStyle style,String text}){
    return Container(
      margin: EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FlatButton(
          color: style.background,
                    onPressed: (){
                      onPress(text);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Text(text, style: TextStyle( fontSize: 30.0, color: style.textColor),),
                    ),
        ),
      ),
    );
  }

  void onPress(String value){
    switch(value){
      case "C":{
        setState(() {
          _operacion = "";
        });
        break;
      }
      case "+/-":{
        setState(() {
          _operacion = "-${_operacion}";
        });
          break;
      }
      default: {
        if(_operacion.length <10){
          setState(() {
            _operacion = "$_operacion$value";
          });
        }
      }
    }


  }

}

class ButtonStyle{
  Color background,textColor;
  ButtonStyle({@required this.background,@required this.textColor});
}