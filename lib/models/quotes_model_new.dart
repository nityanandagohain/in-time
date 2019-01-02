class Q {
  Success success;
  Contents contents;

  Q({this.success, this.contents});

  static Q fromJson(Map<String, dynamic> json) {
    Success successX =
        json['success'] != null ? new Success.fromJson(json['success']) : null;
    Contents contentsX = json['contents'] != null
        ? new Contents.fromJson(json['contents'])
        : null;
    return Q(success: successX, contents: contentsX);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success.toJson();
    }
    if (this.contents != null) {
      data['contents'] = this.contents.toJson();
    }
    return data;
  }
}

class Success {
  int total;

  Success({this.total});

  Success.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}

class Contents {
  List<Quotes> quotes;
  String copyright;

  Contents({this.quotes, this.copyright});

  Contents.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = new List<Quotes>();
      json['quotes'].forEach((v) {
        quotes.add(new Quotes.fromJson(v));
      });
    }
    copyright = json['copyright'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotes != null) {
      data['quotes'] = this.quotes.map((v) => v.toJson()).toList();
    }
    data['copyright'] = this.copyright;
    return data;
  }
}

class Quotes {
  String quote;
  Null length;
  String author;
  List<String> tags;
  String category;
  String date;
  String permalink;
  String title;
  String background;
  String id;

  Quotes(
      {this.quote,
      this.length,
      this.author,
      this.tags,
      this.category,
      this.date,
      this.permalink,
      this.title,
      this.background,
      this.id});

  Quotes.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
    length = json['length'];
    author = json['author'];
    tags = json['tags'].cast<String>();
    category = json['category'];
    date = json['date'];
    permalink = json['permalink'];
    title = json['title'];
    background = json['background'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quote'] = this.quote;
    data['length'] = this.length;
    data['author'] = this.author;
    data['tags'] = this.tags;
    data['category'] = this.category;
    data['date'] = this.date;
    data['permalink'] = this.permalink;
    data['title'] = this.title;
    data['background'] = this.background;
    data['id'] = this.id;
    return data;
  }
}
