import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sobat Temak',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobat Temak'),
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/google.jpeg'), // Add profile picture asset
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Today', style: TextStyle(color: Colors.purple)),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ItemCard();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Latest Product', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: Text('View All', style: TextStyle(color: Colors.purple)),
                  ),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return ProductCard();
              },
            ),
            UserProfileSection(),
            PostSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            IconButton(icon: Icon(Icons.calendar_today), onPressed: () {}),
            SizedBox(width: 40), // Space for the add button
            IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
            IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/google.jpeg', width: 60, height: 60), // Add item image asset
            Text('\$10', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.favorite_border, size: 16),
                Icon(Icons.comment, size: 16),
                Icon(Icons.share, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset('assets/google.jpeg', fit: BoxFit.cover), // Add product image asset
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Unique Product', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$20', style: TextStyle(color: Colors.purple)),
          ),
        ],
      ),
    );
  }
}

class UserProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/fb.jpeg'), // Add profile picture asset
        ),
        title: Text('Martin Paimer'),
        subtitle: Text('Just Now'),
      ),
    );
  }
}

class PostSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('New Post Added Lorem Ipsum is a Dummy Text.'),
          ),
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzeMj6wdNFoehc00rySvqLxLlxUNwc-sEexQ&s',width: 300 ,height: 120),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}