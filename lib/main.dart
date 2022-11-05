import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Me',
      //TODO: Modificar o tema do App
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.blueAccent)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  final imageUrl =
      'https://images.pexels.com/photos/14189051/pexels-photo-14189051.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
  final imageUrl2 =
      "https://images.pexels.com/photos/6827381/pexels-photo-6827381.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  final imageUrl3 =
      "https://images.pexels.com/photos/9944899/pexels-photo-9944899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( // 1. Envolva o Scaffold com o DefaultTabController, selecione o Scaffoldo e utilize a opção wrap with Widget
      length: 2, // 2. Adicione a propriedade obrigatória lenght; uma para cada função criada
      child: Scaffold(
        appBar: AppBar(
          title: const Text('About Me'),
          bottom: const TabBar( //3. Adicione a propriedade botton e as Abas a serem visualizadas
            tabs: [
              Tab(
                text: 'Pessoal',
              ),
              Tab(
                text: 'Profissional',
              )
            ],
          ),
        ),
        drawer: SafeArea(
          child: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  accountName: const Text('Gabriel Venesian'),
                  accountEmail: const Text('venesia@gmail.com'),
                ),
                const ListTile(
                  leading: Icon(Icons.email),
                  title: Text('E-mail comercial'),
                  subtitle: Text('venesian@gmail.com'),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [ // 4. Substitua a função atual por um TabBarView
          _buildPersonalContent(),
          _buildProfessionalContent(),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Follow Me'),
          icon: const Icon(Icons.favorite),
        ),
      ),
    );
  }

  _buildProfessionalContent() {
    const lorem =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac pretium diam, sit amet placerat turpis. Nam vitae lacus erat. Maecenas sit amet sodales purus. Donec consectetur sollicitudin faucibus. Aenean malesuada euismod quam, at cursus sapien porttitor nec. Suspendisse a sapien massa. Duis fermentum dolor nisi, at sodales dolor semper sed. Duis venenatis, nibh sit amet sodales rutrum, metus diam auctor sapien, sit amet lacinia orci nulla sit amet eros. ';
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            'Meus Projetos',
            style: GoogleFonts.rubik(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            lorem,
            style: GoogleFonts.robotoMono(fontSize: 18),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            'Minhas Redes',
            style: GoogleFonts.rubik(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const ListTile(
          leading: Icon(FontAwesomeIcons.github),
          title: Text('GitHub'),
          subtitle: Text('https://www.github.com/meugit'),
        ),
        const ListTile(
          leading: Icon(FontAwesomeIcons.linkedin),
          title: Text('LinkedIn'),
          subtitle: Text('https://www.linkedin.com/meuli'),
        ),
        const ListTile(
          leading: Icon(FontAwesomeIcons.facebook),
          title: Text('Facebook'),
          subtitle: Text('https://www.facebook.com/meuface'),
        ),
      ],
    );
  }

  _buildPersonalContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 250,
          child: PageView(
            children: [
              Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Image.network(
                imageUrl2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Image.network(
                imageUrl3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
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
    );
  }
}
