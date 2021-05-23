class Story {
  final int? id;
  final String? title;
  final String? story;

  Story({this.id, this.title, this.story});

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(id: json['id'], title: json['title'], story: json['story']);
  }
}

class StorySchema {
  final int? id;
  final String? category;
  final String? image;
  final List? stories;

  StorySchema({
    this.id,
    this.category,
    this.image,
    this.stories,
  });

  factory StorySchema.fromJson(Map<String, dynamic> json) {
    return StorySchema(
      id: json['id'],
      category: json['category'],
      image: json['image'],
      stories: json['stories'],
    );
  }
}
