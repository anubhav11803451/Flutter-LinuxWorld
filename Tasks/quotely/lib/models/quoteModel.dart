class QuoteModel {
  final String quoteText;
  final String quoteDate;
  final String quoteAuthor;

  QuoteModel({this.quoteText, this.quoteDate, this.quoteAuthor});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      quoteDate: json['qotd_date'],
      quoteText: json['quote']['body'],
      quoteAuthor: json['quote']['author'],
    );
  }
}
