import 'package:flutter/material.dart';
import '../../data/model/post.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.name,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 10),
            Text(post.description),
            const SizedBox(height: 10),
            Image.network(post.image),
            const SizedBox(height: 10),
            Text('Price: ${post.price}'),
          ],
        ),
      ),
    );
  }
}
