library db_package;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


onLoad(somevar) async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "asset.db");
    var database = await openDatabase(path);
    final Database db = database;
    final List<Map<String, dynamic>> maps = await db.query('items');
    somevar = maps
        .map((item) => DbItems(
              id: item['id'],
              category: item['category'],
              title: item['title'],
              text: item['text'],
              read: item['read'],
            ))
        .toList();
        print(somevar);
        return somevar;
  }

class RedText extends StatelessWidget {
  const RedText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'red text',
        style: TextStyle(
          color: Colors.blue
        ),
      
      )
    );
  }
}

class DbItems {
  final int id;
  final int category;
  final String title;
  final String text;
  final int read;

  DbItems({this.id, this.category, this.title, this.text, this.read});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'text': text,
      'read': read,
    };
  }
}