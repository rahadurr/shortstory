import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:shortstory/models/story.dart';

class DataService {
  DataService();

  factory DataService.instance() {
    return DataService();
  }

  Future<List<StorySchema>> _loadData() async {
    final json = await rootBundle.loadString('assets/data.json');
    List list = jsonDecode(json) as List;
    List<StorySchema> _storiesData =
        list.map((e) => StorySchema.fromJson(e)).toList();
    return Future.value(_storiesData);
  }

  Future<List<StorySchema>> getCategories() async {
    final categories = await _loadData();
    return Future.value(categories);
  }

  Future<StorySchema> getCategory(int index) async {
    final categories = await _loadData();
    return Future.value(categories.elementAt(index));
  }

  Future<List<Story>> getStories(int categoryIndex) async {
    final categories = await _loadData();
    final list = categories.elementAt(categoryIndex).stories as List;
    List<Story> stories = list.map((e) => Story.fromJson(e)).toList();
    return Future.value(stories);
  }
}
