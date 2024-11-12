class Moment {
  String id;
  String creator;
  String location;
  DateTime momentDate;
  String caption;
  String imageUrl;
  int likesCount;
  int commentsCount;
  int bookmarksCount;

  Moment({
    required this.id,
    required this.creator,
    required this.location,
    required this.momentDate,
    required this.caption,
    required this.imageUrl,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.bookmarksCount = 0,
  });
}