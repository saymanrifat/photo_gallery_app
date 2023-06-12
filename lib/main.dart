import 'package:flutter/material.dart';

void main() {
  runApp(BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl =
      'https://i5.walmartimages.com/asr/0e334714-a331-42d4-9d26-26246186c52f_1.410d9a032a7e0486eebf6fd5d13e1b6b.jpeg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                imageButton(),
                imageButton(),
                imageButton(),
                imageButton(),
                imageButton(),
                imageButton(),
              ],
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Sample Photo ${index + 1}'),
                    subtitle: Text('Category ${index + 1}'),
                    leading: const Icon(Icons.image),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: IconButton(
          color: Colors.white,
          icon: const Icon(
            Icons.cloud_upload,
          ),
          onPressed: () {
            showSnackBar(context, 'Photos Uploaded Successfully!');
          },
        ),
      ),
    );
  }

  showSnackBar(context, message) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));

  ElevatedButton imageButton() {
    return ElevatedButton(
      onPressed: () {
        showSnackBar(context, 'Clicked on photo!');
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(6),
          elevation: 0,
          backgroundColor: Colors.transparent),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            imageUrl,
            height: 110,
            width: 110,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            padding: const EdgeInsets.all(7),
            child: const Text(
              'Caption',
            ),
          ),
        ],
      ),
    );
  }
}
