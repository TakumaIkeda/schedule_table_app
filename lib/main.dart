import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Choice> choices = [
    Choice('月', ['現代文', '化学', '', '英語', '']),
    Choice('火', ['', '古典', '日本史', '', '数学']),
    Choice('水', ['化学', '', '体育', '', '世界史']),
    Choice('木', ['', '数学', '物理', '', '現代文']),
    Choice('金', ['数学', '', '', '', '']),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('時間割'),
            bottom: TabBar(
              isScrollable: false,
              tabs: choices.map(
                (Choice choice) {
                  return Tab(
                    text: choice.day,
                  );
                },
              ).toList(),
            ),
          ),
          body: TabBarView(
            children: choices.map((Choice choice) {
              return Container(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text('${index + 1}限'),
                        subtitle: Text(choice.classes[index]),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  Choice(this.day, this.classes);

  final String day;
  final List<String> classes;
}
