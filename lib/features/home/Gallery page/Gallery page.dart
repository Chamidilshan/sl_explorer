import 'package:flutter/material.dart';

void main() {
  runApp(GalleryPage());
}

class Post {
  final String username;
  // final String content;
  final int likes;
  final List<String> comments;
  final String imageUrl; // Add image URL or path

  Post({
    required this.username,
    // required this.content,
    required this.likes,
    required this.comments,
    required this.imageUrl,
  });
}

class GalleryPage extends StatelessWidget {
  final List<Post> posts = [
    Post(
      username: 'John Doe',
      imageUrl: 'https://example.com/image1.jpg', // Replace with your image URL
      likes: 10,
      comments: ['Great!', 'Awesome!'],

    ),
    Post(
      username: 'Jane Smith',
      imageUrl: 'https://example.com/image2.jpg', // Replace with your image URL
      likes: 20,
      comments: ['Congratulations!', 'Well done!'],

    ),
    Post(
      username: 'Vitz rea',
      imageUrl: 'https://example.com/image2.jpg', // Replace with your image URL
      likes: 12,
      comments: ['Wow', 'Nice'],

    ),
    // Add more posts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Travellsmania'),
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return buildPostCard(posts[index]);
          },
        ),
      ),
    );
  }

  Widget buildPostCard(Post post) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information
            Text(
              post.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),

            // Post Content
            SizedBox(height: 8.0),
            Text(
              '',
              style: TextStyle(fontSize: 16.0),
            ),

            // Image
            SizedBox(height: 8.0),
            Image.network(
              post.imageUrl,
              height: 200.0, // Set the desired height
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Likes and Comments
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${post.likes} Likes'),
                Text('${post.comments.length} Comments'),
              ],
            ),

            // Comments
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: post.comments
                  .map((comment) => Text(comment))
                  .toList(),
            ),

            // Like and Comment Buttons
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle like button press
                  },
                  child: Text('Like'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle comment button press
                  },
                  child: Text('Comment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
