class QuotesModel{
  String quote;
  String length;
  String author;

  QuotesModel({
    this.quote,this.length,this.author,
  });

  static QuotesModel fromJson(Map<String,dynamic> json){
    return QuotesModel(
      quote: json['quote'],
      length: json['length'],
      author: json['author'],
    );
  }

  Map<String, dynamic> toJson() => {
    'quote': quote,
    'length': length,
    'author': author,
  };
}
    
                            