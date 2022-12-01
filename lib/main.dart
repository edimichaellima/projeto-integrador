import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Navigation());
  }
}

class Navigation extends StatefulWidget {
  const Navigation({key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class Artigo extends StatelessWidget {
  final String artigoNome;
  final String imagem;

  const Artigo({required this.artigoNome, required this.imagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24, left: 60, bottom: 8, top: 8),
      width: 250,
      height: 250,
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          child: GridTile(
            child: Image.network(
              imagem,
              fit: BoxFit.cover,
            ),
            footer: Container(
              padding: EdgeInsets.all(16),
              color: Colors.blue.withOpacity(.5),
              child: Text(
                artigoNome,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Campos extends StatelessWidget {
  final TextEditingController controlador;
  final String label;

  Campos({
    required this.controlador,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.justify,
      controller: controlador,
      decoration: InputDecoration(
        hintText: label,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Preencha esse campo';
        }
        return null;
      },
    );
  }
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerDoador = TextEditingController();
  final TextEditingController _controllerReceptor = TextEditingController();
  final TextEditingController _controllerArvore = TextEditingController();
  final TextEditingController _controllerQtd = TextEditingController();
  final TextEditingController _controllerEnd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.post_add),
            label: 'Postar',
          ),
          NavigationDestination(
            icon: Icon(Icons.wysiwyg_outlined),
            label: 'Blog',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.task),
            icon: Icon(Icons.task_outlined),
            label: 'Perguntas',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.info),
            icon: Icon(Icons.info_outline),
            label: 'Sobre',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.green,
          alignment: Alignment.centerRight,
          child: Center(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.only(top: 32, bottom: 4),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: const SizedBox(
                    width: 350,
                    height: 100,
                    child: Center(
                        child: ListTile(
                      title: Text('Saiba mais:'),
                      subtitle: Text('S.O.S Mata Atlântica'),
                    )),
                  ),
                ),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: const SizedBox(
                    width: 350,
                    height: 100,
                    child: Center(
                        child: ListTile(
                      title: Text('Saiba mais:'),
                      subtitle: Text('WWF'),
                    )),
                  ),
                ),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: const SizedBox(
                    width: 350,
                    height: 100,
                    child: Center(
                        child: ListTile(
                      title: Text('Saiba mais:'),
                      subtitle:
                          Text('Secretaria do meio ambiente São Paulo/SP'),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(24.0),
          color: Colors.green,
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Campos(controlador: _controllerDoador, label: 'Nome doador'),
                Campos(
                    controlador: _controllerReceptor, label: 'Nome receptor'),
                Campos(controlador: _controllerArvore, label: 'Tipo de árvore'),
                Campos(controlador: _controllerQtd, label: 'Quantidade'),
                Campos(controlador: _controllerEnd, label: 'Endereço'),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 82.0, top: 24.0, right: 0, bottom: 0),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 48.0, top: 8.0, right: 48.0, bottom: 8.0),
                        child: const Text('Postar'),
                      )),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Column(
            children: [
              Artigo(
                  artigoNome: 'Artigo A',
                  imagem: 'https://picsum.photos/200/300'),
              Artigo(
                  artigoNome: 'Artigo B',
                  imagem: 'https://picsum.photos/seed/picsum/200/300'),
            ],
          ),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Center(
                    child: ListTile(
                  title: Text('Como doar?'),
                  subtitle: Text(
                      'Para fazer uma doação, basta preencher o formulario com os dados que retiramos sua doação'),
                )),

                //const Center(child: Text('Pergunta 1')),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Center(
                    child: ListTile(
                  title: Text('Consigo agendar uma doação futura?'),
                  subtitle: Text(
                      'Ainda não. Se você ainda tiver com a plantação no inicio, '
                      'sem as mudas ou árvores prontas para retiradas, '
                      'pedimos para que não preencha o formulario ainda'),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Center(
                    child: ListTile(
                  title: Text('Como obter mais informações sobre arborização?'),
                  subtitle: Text(
                      'Para obter mais informações e orientações sobre arborização na cidade'
                      'deixamos um link com o site da prefeitura para esclarecer as dúvidas'),
                )),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.centerRight,
          child: Center(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.only(top: 32, bottom: 4),
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: const SizedBox(
                    width: 350,
                    height: 100,
                    child: Center(
                        child: ListTile(
                      title: Text('Sobre'),
                      subtitle: Text('Conteúdo da página sobre'),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ][currentPageIndex],
    );
  }
}
