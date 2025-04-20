class Publication {
  final String brand;
  final String link;
  final int previousLikes;
  final int currentLikes;
  final int previousComments;
  final int currentComments;
  final int previousFollowers;
  final int currentFollowers;

  Publication({
    required this.brand,
    required this.link,
    required this.previousLikes,
    required this.currentLikes,
    required this.previousComments,
    required this.currentComments,
    required this.previousFollowers,
    required this.currentFollowers,
  });

  int get totalBoost =>
      (currentLikes - previousLikes) + (currentComments - previousComments);
}
