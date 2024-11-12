
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.creator,
    required this.location,
  });
  final String creator;
  final String location;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
      ),
      title: Text(
        creator,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
      subtitle: Text(
        location,
        style: const TextStyle(
          color: Colors.white60,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white70,
        ),
      ),
    );
  }
}
