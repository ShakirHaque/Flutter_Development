import 'package:flutter/material.dart';
import 'Pages/Topic/NamazDetailsPage.dart'; // Import the NamazDetailsPage
import 'Pages/Topic/RozaDetailsPage.dart';
import 'Pages/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'তোমার প্রশ্ন',
      home: SearchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, String>> data = fetchData();

  List<Map<String, String>> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('জানতে চাও'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item selection
              if (value == 'about') {
                // Implement your logic for the 'About' menu item
                print('About selected');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'about',
                  child: Text('About'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(176, 168, 164, 164),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: TextField(
                cursorColor: Colors.blue,
                onChanged: (query) {
                  search(query);
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'ইসলামের কোন বিষয় জানতে চাও ',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index]['topic']!),
                  subtitle: Text(' ${searchResults[index]['content']}'),
                  onTap: () {
                    navigateToTopicDetailsPage(searchResults[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void search(String query) {
    setState(() {
      // Clear previous search results
      searchResults.clear();

      // If the search query is empty, display all items
      if (query.isEmpty) {
        searchResults.addAll(data);
      } else {
        // Filter data based on the query
        for (Map<String, String> item in data) {
          // Case-insensitive search for specific topic
          if (item['topic']!.toLowerCase().contains(query.toLowerCase()) ||
              item['content']!.toLowerCase().contains(query.toLowerCase())) {
            searchResults.add(item);
          }
        }
      }
    });
  }

  void navigateToTopicDetailsPage(Map<String, String> topic) {
    // Implement your navigation logic here
    // For example, use Navigator to push a new TopicDetailsPage
    if (topic['topic'] == 'নামাজ') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NamazDetailsPage(topic),
        ),
      );
    }
    if (topic['topic'] == 'রোজা') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NamazDetailsPage(topic),
        ),
      );
    }
    // Add similar checks for other topics and their respective details pages
  }
}

// ... (other imports and classes)
