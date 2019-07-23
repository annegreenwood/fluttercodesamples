class Quote {
    final String quote;
    final String title;
    String imageURL;

    Quote(this.title, this.quote, {this.imageURL});
}

List<Quote> quotes = [
    new Quote("Lorem ipsum","Commodo ipsum laboris nulla consectetur mollit excepteur ipsum elit mollit ea.", imageURL: "assets/bg_fundo.jpg"),
    new Quote("Lorem ipsum","Commodo ipsum laboris nulla consectetur mollit excepteur ipsum elit mollit ea.", imageURL: "assets/bg_fundo.jpg"),
    new Quote("Lorem ipsum","Commodo ipsum laboris nulla consectetur mollit excepteur ipsum elit mollit ea.", imageURL: "assets/bg_fundo.jpg"),
    new Quote("Lorem ipsum","Commodo ipsum laboris nulla consectetur mollit excepteur ipsum elit mollit ea.", imageURL: "assets/bg_fundo.jpg")
];