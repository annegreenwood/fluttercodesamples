import 'package:flutter/material.dart';
import 'package:gleebem/src/ui/pages/categorias.dart';
import 'package:gleebem/src/ui/pages/carrinho.dart';
import 'package:gleebem/src/ui/pages/ofertas.dart';
import 'package:gleebem/src/ui/pages/ondepontuar.dart';
import 'package:gleebem/src/ui/pages/sorteios.dart';
import 'package:gleebem/src/ui/pages/doarPontos.dart';
import 'package:gleebem/src/ui/pages/comoPontuar.dart';
import 'package:gleebem/src/ui/pages/extratoPontos.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Inicio extends StatefulWidget{
    Inicio({Key key}) : super(key: key);

    @override
    _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
    TextStyle styleButton = TextStyle(fontSize: 12.0, color: Colors.grey);

    SharedPreferences prefs = null;
    String _nomeUsuario = "";

    Future<String> getPrefs() async {
        this.prefs = await SharedPreferences.getInstance();
        setState(() {
            _nomeUsuario = this.prefs.getString("nomeUsuario");
        });

        if(_nomeUsuario != ""){
            // _getUser();
        }else{
            // usuario nao logado. matar sessão
        }
    }

    initState() {
        super.initState();
        getPrefs();
    }

    Widget build(BuildContext context){
        return new Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/4.7),
                child: AppBar(
                    actions: <Widget>[
                        IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Carrinho()));
                            },
                        ),
                    ],
                    backgroundColor: Color.fromRGBO(9, 19, 77, 0.9),
                    flexibleSpace: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0.1, 0.4, 0.7, 0.9],
                                colors: [
                                    Colors.purple[700],
                                    Colors.purple[600],
                                    Colors.purple[500],
                                    Colors.purple[400],
                                ],
                            ),
                        ),
                        height: MediaQuery.of(context).size.height/4,
                        padding: EdgeInsets.only(top: 45.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                Text(
                                    _nomeUsuario,
                                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height/35),
                                Text(
                                    "Seu saldo",
                                    style: TextStyle(fontSize: 20.0, color: Colors.yellow),
                                ),
                                SizedBox(height: 17.0),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                        Text(
                                            "0",
                                            style: TextStyle(fontSize: 26.0, color: Color.fromRGBO(246, 255, 0, 1)),
                                            textAlign: TextAlign.center,
                                        ),
                                        SizedBox(width: 10.0),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5.0),
                                            child: Text(
                                                "PTS",
                                                style: TextStyle(fontSize: 16.0, color: Color.fromRGBO(246, 255, 0, 1)),
                                                textAlign: TextAlign.center,
                                            )
                                        )
                                    ],
                                )
                            ],
                        ),
                    ),
                    leading: new IconButton(
                        icon: new Icon(
                            Icons.menu,
                            color: Colors.white,
                        ),
                        onPressed:() => {
                            Scaffold.of(context).openDrawer()
                        }
                    ),
                ),
            ),
            body: Column(
                children: <Widget>[
                    Container(
                        color: Color.fromRGBO(236, 236, 236, 0.8),
                        height: MediaQuery.of(context).size.height/17.5,
                        width: MediaQuery.of(context).size.width,
                        child: 
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                    Container(
                                        width: 180.0,
                                        child: Row(
                                            children: <Widget>[
                                                Icon(
                                                    Icons.refresh,
                                                    color: Color.fromRGBO(120, 69, 146, 1)
                                                ),
                                                SizedBox(width: 10.0),
                                                Text(
                                                    "Última atualização",
                                                    textAlign: TextAlign.left,
                                                ),
                                            ],
                                        )
                                    ),
                                    Container(
                                        width: 150.0,
                                        child: Text(
                                            "22/05/2019 às 14:15",
                                            textAlign: TextAlign.right,
                                        ),
                                    )
                                ],
                            )
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/5.4,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                ButtonTheme(
                                    minWidth: 100.0,
                                    child: OutlineButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)                                            
                                        ),
                                        onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Categorias()));
                                        },
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Column(
                                            children: <Widget>[
                                                SizedBox(
                                                    height: MediaQuery.of(context).size.height/11.5,
                                                    child: Image.asset("assets/inicio_1.png")                                                    
                                                ),
                                                Text(
                                                    "Troque seus\nPontos",
                                                    textAlign: TextAlign.center,
                                                    style: styleButton,
                                                )
                                            ],
                                        ),
                                    )
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    child: OutlineButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)                                            
                                        ),
                                         onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Ofertas()));
                                        },
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Column(
                                            children: <Widget>[
                                                SizedBox(
                                                    height: MediaQuery.of(context).size.height/11.5,
                                                    child: Image.asset("assets/inicio_2.png")                                                    
                                                ),
                                                Text(
                                                    "Ofertas",
                                                    textAlign: TextAlign.center,
                                                    style: styleButton,
                                                )
                                            ],
                                        ),
                                    )
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    child: OutlineButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)                                            
                                        ),
                                        onPressed: () => {},
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Column(
                                            children: <Widget>[
                                                SizedBox(
                                                    height: MediaQuery.of(context).size.height/11.5,
                                                    child: Image.asset("assets/inicio_3.png")                                                    
                                                ),
                                                Text(
                                                    "Compre e ganhe\nPontos",
                                                    textAlign: TextAlign.center,
                                                    style: styleButton,
                                                )
                                            ],
                                        ),
                                    )
                                )
                            ],
                        ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/5.4,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                ButtonTheme(
                                    minWidth: 100.0,
                                    child: OutlineButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)                                            
                                        ),
                                        onPressed: () => {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => DoarPontos()))
                                        },
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Column(
                                            children: <Widget>[
                                                SizedBox(
                                                    height: MediaQuery.of(context).size.height/11.5,
                                                    child: Image.asset("assets/inicio_4.png")
                                                ),
                                                Text(
                                                    "Doar Pontos",
                                                    textAlign: TextAlign.center,
                                                    style: styleButton,
                                                )
                                            ],
                                        ),
                                    )
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    child: OutlineButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)                                            
                                        ),
                                        onPressed: () => {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => OndePontuar()))
                                        },
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Column(
                                            children: <Widget>[
                                                SizedBox(
                                                    height: MediaQuery.of(context).size.height/11.5,
                                                    child: Image.asset("assets/inicio_5.png")
                                                ),
                                                Text(
                                                    "Onde Pontuar",
                                                    textAlign: TextAlign.center,
                                                    style: styleButton,
                                                )
                                            ],
                                        ),
                                    )
                                ),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    child: OutlineButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)                                            
                                        ),
                                        onPressed: () => {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ComoPontuar()))
                                        },
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Column(
                                            children: <Widget>[
                                                SizedBox(
                                                    height: MediaQuery.of(context).size.height/11.5,
                                                    child: Image.asset("assets/inicio_6.png")                                                    
                                                ),
                                                Text(
                                                    "Como Pontuar",
                                                    textAlign: TextAlign.center,
                                                    style: styleButton,
                                                )
                                            ],
                                        ),
                                    )
                                )
                            ],
                        ),
                    ),Container(
                        padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/5.4,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                                ButtonTheme(
                                    minWidth: 100.0,
                                    child: OutlineButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)                                            
                                        ),
                                        onPressed: () => {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => Sorteios()))
                                        },
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Column(
                                            children: <Widget>[
                                                SizedBox(
                                                    height: MediaQuery.of(context).size.height/11.5,
                                                    child: Image.asset("assets/inicio_4.png")
                                                ),
                                                Text(
                                                    "Sorteios",
                                                    textAlign: TextAlign.center,
                                                    style: styleButton,
                                                )
                                            ],
                                        ),
                                    )
                                ),
                                SizedBox(width: 10.0),
                                ButtonTheme(
                                    minWidth: 100.0,
                                    child: OutlineButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0)                                            
                                        ),
                                        onPressed: () => {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => ExtratoPontos()))
                                        },
                                        padding: EdgeInsets.only(top: 5.0),
                                        child: Column(
                                            children: <Widget>[
                                                SizedBox(
                                                    height: MediaQuery.of(context).size.height/11.5,
                                                    child: Image.asset("assets/inicio_5.png")
                                                ),
                                                Text(
                                                    "Extrato de Pontos",
                                                    textAlign: TextAlign.center,
                                                    style: styleButton,
                                                )
                                            ],
                                        ),
                                    )
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width/3.5)
                            ],
                        ),
                    )
                ],
            )
        );
    }
}