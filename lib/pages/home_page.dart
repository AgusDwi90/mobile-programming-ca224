import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/models/moment.dart';
import 'package:mobile_programming_ca224/widgets/post_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.moments,
    required this.onUpdate,
    required this.onDelete,
    });
  final List<Moment> moments;
  final Function(Moment) onUpdate;
  final Function(Moment) onDelete;

  @override
  Widget build(BuildContext context) {
    final listPostItems = moments
        .map(
          (momentItem) => PostItem(
            moment: momentItem,
            onUpdate: onUpdate,
            onDelete: onDelete,
          ),
        )
        .toList();

    return SingleChildScrollView(
      child: Column(
        children: listPostItems,
      ),
    );
  }
}
