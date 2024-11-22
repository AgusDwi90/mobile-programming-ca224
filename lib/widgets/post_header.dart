import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/models/moment.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.momentItem,
    required this.onUpdate,
    required this.onDelete,
    required this.creator,
    required this.location, 
  });
  final Moment momentItem;
  final Function(Moment) onUpdate;
  final Function(Moment) onDelete;
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
      trailing: PopupMenuButton(
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 'Update',
              child: Text('Update'),
            ),
            const PopupMenuItem(
              value: 'Delete',
              child: Text('Delete'),
            ),
          ];
        },
        onSelected: (value) {
          if (value == 'Update') {
            onUpdate(momentItem);
          } else if (value == 'Delete') {
            onDelete(momentItem);
          }
        },
        child: const Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
