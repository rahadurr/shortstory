import 'package:flutter/material.dart';
import 'package:shortstory/models/story.dart';
import 'package:shortstory/widgets/story_tile.dart';

class StoriesScreen extends StatefulWidget {
  final StorySchema category;
  const StoriesScreen({Key? key, required this.category}) : super(key: key);

  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  List<Story> _stories() {
    final stories = widget.category.stories;
    return stories!.map((e) => Story.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final stories = this._stories();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category.category}',
          style: TextStyle(
            fontFamily: 'Rubik',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (BuildContext context, int index) {
          if (index.isOdd) {
            return Divider();
          }
          return StoryTile(story: stories[index]);
        },
      ),
    );
  }
}
