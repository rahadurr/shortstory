import 'package:flutter/material.dart';
import 'package:shortstory/models/story.dart';
import 'package:shortstory/screens/stories_screen.dart';

class CategoryTile extends StatelessWidget {
  final StorySchema category;

  const CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoriesScreen(
              category: category,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 140.0,
        margin: const EdgeInsets.only(
          top: 13.0,
          left: 15.0,
          right: 15.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: AssetImage('${category.image}'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.70),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Center(
          child: Text(
            '${category.category}',
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 23.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
