import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //TODO: Modificar o tema do App
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, accentColor: Colors.blue.shade200),
      home: MyHomePage(),
    );
  }
}

class X extends StatelessWidget {
  const X({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Body')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  final imageUrl =
      'https://images.pexels.com/photos/14189051/pexels-photo-14189051.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                accountName: Text('Gabriel Venesian'),
                accountEmail: Text('venesia@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('E-mail comercial'),
                subtitle: Text('venesian@gmail.com'),
                trailing: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'Gabriel Venesian',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(),
              Text('Flutter Developer'),
            ],
          ),
          const Divider(
            indent: 32,
            endIndent: 32,
            height: 24,
            thickness: 3,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              lorem,
              style: const TextStyle(height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ),
          const Spacer(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Follow Me'),
        icon: Icon(Icons.favorite),
      ),
    );
  }
}
