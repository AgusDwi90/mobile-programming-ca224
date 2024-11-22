import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/models/moment.dart';

class CreateCommentPage extends StatelessWidget {
  const CreateCommentPage({super.key, required List<Moment> moments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Create Comment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Creator Text Field
            TextField(
              decoration: const InputDecoration(
                labelText: "Creator",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              controller: TextEditingController(text: "Moment creator"),
            ),
            const SizedBox(height: 16),
            // Comment Text Field
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Comment",
                prefixIcon: Icon(Icons.insert_drive_file),
                hintText: "Comment description",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            // Send and Cancel Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Send button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Cancel button action
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      side: const BorderSide(color: Colors.brown),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
