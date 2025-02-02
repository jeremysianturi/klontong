import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String name;
  final String description;

  const PostItem(this.name, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 200,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.amber),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Text(
                description,
                style: const TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
