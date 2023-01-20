import 'package:flutter/material.dart';
import '../models/CardContent.dart';
import 'DescriptionScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const List<CardContent> cardContents = [
    CardContent(
      title: 'Apple',
      imageAssets: 'wide_thumbnail_normal.jpg',
      description: 'This is a fruit.',
    ),
    CardContent(
      title: 'Cherry',
      imageAssets: '03-08_img01.jpg',
      description: 'This is a fruit.',
    ),
    CardContent(
      title: 'Orange',
      imageAssets: 'cf2a89e0-162a-4dd2-8d10-3b04470027bc.jpg',
      description: 'This is a fruiti.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hero Demo'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: cardContents.length,
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            CardContent cardContent = cardContents[index];
            return Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DescriptionScreen(cardContent: cardContent),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Hero(
                      tag: cardContent.imageAssets,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(cardContent.imageAssets).image,
                            )),
                      ),
                    ),
                    ListTile(
                      title: Hero(
                        tag: cardContent.title,
                        child: Text(
                          cardContent.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}