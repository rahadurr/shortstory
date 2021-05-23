import 'package:flutter/material.dart';
import 'package:shortstory/models/story.dart';
import 'package:shortstory/screens/story_view_screen.dart';

class StoryTile extends StatelessWidget {
  final Story story;

  const StoryTile({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      dense: true,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoryViewScreen(story: story),
          ),
        );
      },
      title: Text(
        '${story.title}',
        style: TextStyle(
          fontFamily: 'Rubik',
          fontSize: 17.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
