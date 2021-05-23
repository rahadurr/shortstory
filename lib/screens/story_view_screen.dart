import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shortstory/models/story.dart';

class StoryViewScreen extends StatefulWidget {
  final Story story;

  const StoryViewScreen({Key? key, required this.story}) : super(key: key);

  @override
  _StoryViewScreenState createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.story.title}',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Html(
            data: widget.story.story,
            style: {
              "p": Style(
                fontFamily: 'Lora',
                fontWeight: FontWeight.w500,
                fontSize: FontSize.rem(1.25),
                lineHeight: LineHeight.rem(1.75),
              ),
            },
          ),
        ),
      ),
    );
  }
}
