class Recipe {
  final String title;
  final String description;
  final String imgUrl;
  final List ingredients;
  final List directions;

  Recipe(
      {required this.title,
      required this.description,
      required this.imgUrl,
      required this.directions,
      required this.ingredients});
}
