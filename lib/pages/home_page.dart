import 'package:flutter/material.dart';
import 'package:myapp/widgets/post_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final listPostItems = List.generate(15, (index) => const PostItem());

    return SingleChildScrollView(
      child: Column(
        children: listPostItems,
      ),
    );
  }
}
