import 'package:flutter/material.dart';
import 'package:gleebem/src/ui/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';

class FaleConosco extends StatelessWidget{
    FaleConosco({Key key}) : super(key: key);

_telCapitais() async {
  launch("tel:/3004-5269");
}

_telRegioes() async {
  launch("tel:/0800-254-9658");
}

_launchFacebook() async {
  const url = 'https://pt-br.facebook.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
    throw 'Não foi possível abrir esta página';
    }
}

_launchTwitter() async {
  const url = 'https://twitter.com/login?lang=pt';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
    throw 'Não foi possível abrir esta página';
    }
}

_openWhatsapp() async {
    const url = 'https://wa.me/5579991208279';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
    throw 'Não foi possível abrir esta página';
    }
}

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
                        height: MediaQuery.of(context).size.height/2.4,
                        padding: EdgeInsets.only(top: 45.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                                Text(
                                    "Fale Conosco",
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
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height/23,
                        ),
                        Text(
                            'Consulte nossos telefones', 
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.deepPurple, fontSize: 24.0),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/23,
                        ),
                        GestureDetector(
                          child: Container(
                            child: Text(
                              '3004-5269',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.deepPurple, fontSize: 24.0),
                            ), 
                          ),
                          onTap: (_telCapitais) 
                        ),
                        Text(
                            'Capitais e regiões metropolitanas',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.deepPurple, fontSize: 12.0),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/23,
                        ),
                        GestureDetector(
                          child: Container(
                            child: Text(
                              '0800-254-9658',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.deepPurple, fontSize: 24.0),
                            ), 
                          ),
                          onTap: (_telRegioes) 
                        ),
                        Text(
                            'Demais Regiões',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.deepPurple, fontSize: 12.0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom:MediaQuery.of(context).size.height/2.3),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                child: Image.asset('assets/inicio_6.png', height: MediaQuery.of(context).size.height/17.5),
                              ),
                              onTap: (_launchFacebook),
                            ),
                            GestureDetector(
                              child: Container(
                                child: Image.asset('assets/inicio_6.png', height: MediaQuery.of(context).size.height/17.5),
                              ),
                              onTap: _launchTwitter,
                            ),
                            GestureDetector(
                              child: Container(
                                child: Image.asset('assets/inicio_6.png', height: MediaQuery.of(context).size.height/17.5),
                              ),
                              onTap: _openWhatsapp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/70,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Facebook', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                            Text('Twitter', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
                            Text('WhatsApp', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),

                          ],
                        ),
                    ],
                )
            )
        );
    }
}