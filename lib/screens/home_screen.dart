import 'package:flutter/material.dart';
import 'package:shortstory/env_config.dart';
import 'package:shortstory/models/story.dart';
import 'package:shortstory/services/data_service.dart';
import 'package:shortstory/widgets/category_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<StorySchema>> categories;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    DataService _dataService = DataService.instance();
    categories = _dataService.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          EnvConfig.APP_TITLE,
          style: TextStyle(
            fontFamily: 'Rubik',
          ),
        ),
      ),
      body: FutureBuilder<List<StorySchema>>(
          future: categories,
          builder: (BuildContext context,
              AsyncSnapshot<List<StorySchema>> snapshot) {
            if (snapshot.hasData) {
              final list = snapshot.data as List<StorySchema>;
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return CategoryTile(list[index]);
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error.toString()}'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
