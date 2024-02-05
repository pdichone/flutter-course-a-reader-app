import 'package:flutter/material.dart';
import 'package:reader_tracker/db/database_helper.dart';
import 'package:reader_tracker/models/book.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
      ),
      body: FutureBuilder(
          future: DatabaseHelper.instance.readAllBooks(),
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Book book = snapshot.data![index];
                    return Card(
                      child: ListTile(
                        title: Text(book.title),
                        trailing: const Icon(Icons.delete),
                        leading: Image.network(
                          book.imageLinks['thumbnail'] ?? '',
                          fit: BoxFit.cover,
                        ),
                        subtitle: Column(
                          children: [
                            Text(book.authors.join(', ')),
                            ElevatedButton.icon(
                                onPressed: () async {
                                  // toggle the favorite flag
                                },
                                icon: const Icon(Icons.favorite),
                                label: const Text('Add to Favorites'))
                          ],
                        ),
                      ),
                    );
                  })
              : const Center(child: CircularProgressIndicator())),
    );
  }
}
