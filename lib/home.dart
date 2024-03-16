import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samagam_hack/auth.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({this.title = 'Demo'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var imagesVisible = true;

  var cardContent = [];

  @override
  void initState() {
    var ran = Random();

    for (var i = 0; i < 5; i++) {
      var heading = '\$${(ran.nextInt(20) + 15).toString()}00 per month';
      var subheading =
          '${(ran.nextInt(3) + 1).toString()} bed, ${(ran.nextInt(2) + 1).toString()} bath, ${(ran.nextInt(10) + 7).toString()}00 sqft';
      var cardImage = NetworkImage(
          'https://source.unsplash.com/random/800x600?house&' +
              ran.nextInt(100).toString());
      var supportingText =
          'Beautiful home, recently refurbished with modern appliances...';
      var cardData = {
        'heading': heading,
        'subheading': subheading,
        'cardImage': cardImage,
        'supportingText': supportingText,
      };
      cardContent.add(cardData);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        drawer: _buildDrawer(context));
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture:
                CircleAvatar(backgroundImage: AssetImage('assets/leo.jpeg')),
            accountEmail: Text('pramod.goyal@example.com'),
            accountName: Text(
              'Pramod Goyal',
              style: TextStyle(fontSize: 24.0),
            ),
            decoration: BoxDecoration(
              color: Colors.black87,
            ),
            // child: Text('Drawer Header'),
          ),
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text(
              'Houses',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MyHomePage(
                    title: 'Houses',
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.apartment),
            title: const Text(
              'Apartments',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MyHomePage(
                    title: 'Apartments',
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.house_outlined),
            title: const Text(
              'Townhomes',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MyHomePage(
                    title: 'Townhomes',
                  ),
                ),
              );
            },
          ),
          const Divider(
            height: 10,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text(
              'Favorites',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const MyHomePage(
                    title: 'Favorites',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.black45,
        title: Text(widget.title),

        actions: [
          TextButton(onPressed: (){
            AuthService().signOutTheUser();
            }, child: Text('Logout')),
          Switch(
            value: imagesVisible,
            activeColor: Colors.yellowAccent,
            onChanged: (bool switchState) {
              setState(() {
                imagesVisible = switchState;
              });
            },
          ),
        ]);
  }

  Container _buildBody() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children:
                cardContent.map((cardData) => _buildCard(cardData)).toList(),
          )),
    );
  }

  Card _buildCard(Map<String, dynamic> cardData) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(cardData['heading']!),
              subtitle: Text(cardData['subheading']!),
              trailing: const Icon(Icons.favorite_outline),
            ),
            Visibility(
              visible: imagesVisible,
              child: Container(
                height: 200.0,
                child: Ink.image(
                  image: cardData['cardImage']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(cardData['supportingText']!),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('CONTACT AGENT'),
                  onPressed: () {
                    /* ... */
                  },
                ),
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: () {
                    /* ... */
                  },
                )
              ],
            )
          ],
        ));
  }
}
