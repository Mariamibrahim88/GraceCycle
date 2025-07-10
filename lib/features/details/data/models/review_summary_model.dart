class ReviewSummaryModel {
  final int foodId;
  final double averageRating;
  final int totalReviews;
  final int oneStar;
  final int twoStars;
  final int threeStars;
  final int fourStars;
  final int fiveStars;
  final String starRating;

  ReviewSummaryModel({
    required this.foodId,
    required this.averageRating,
    required this.totalReviews,
    required this.oneStar,
    required this.twoStars,
    required this.threeStars,
    required this.fourStars,
    required this.fiveStars,
    required this.starRating,
  });

  factory ReviewSummaryModel.fromJson(Map<String, dynamic> json) {
    return ReviewSummaryModel(
      foodId: json['foodId'] ?? 0,
      averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0.0,
      totalReviews: json['totalReviews'] ?? 0,
      oneStar: json['oneStar'] ?? 0,
      twoStars: json['twoStars'] ?? 0,
      threeStars: json['threeStars'] ?? 0,
      fourStars: json['fourStars'] ?? 0,
      fiveStars: json['fiveStars'] ?? 0,
      starRating: json['starRating'] ?? '',
    );
  }
}

class Review {
  final int rating;
  final String date;
  final String comment;
  final String customerName;

  Review({
    required this.rating,
    required this.date,
    required this.comment,
    required this.customerName,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      date: json['date'],
      comment: json['comment'],
      customerName: json['customerName'],
    );
  }
}
