import 'package:flutter/material.dart';
import 'package:gleebem/src/ui/dashboard.dart';

class Carrinho extends StatelessWidget{
    Carrinho({Key key}) : super(key: key);

    Widget build(BuildContext context){
        return new Scaffold(
            appBar: AppBar(
                    backgroundColor: Color.fromRGBO(9, 19, 77, 0.9),
                    centerTitle: true,
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
                                    "Carrinho",
                                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                                )
                            ],
                        )
                    ),
                    leading: new IconButton(
                        icon: new Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                        ),
						onPressed: (){
							Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
						},
                    )
            ),
            body: Container(
                width: MediaQuery.of(context).size.height/1.75,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text(
                            'Carrinho', 
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.purple, fontSize: 24.0),
                        )
                    ],
                )
            )
        );
    }
}