import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
      ),
      title: const Text( 'Ghost View',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
      subtitle: const Text( 'Denpasar, Bali',
        style: TextStyle(
          color: Colors.white60,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon( Icons.more_vert,
          color: Colors.white70,
        ),
      ),
    );
  }
}
