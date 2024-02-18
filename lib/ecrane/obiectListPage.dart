// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'models/obiect.dart';
import 'ObiectDetailPage';

final List<Obiect> obiecte = [
  Obiect(
      name: 'banane',
      imageAsset: 'assets/banane.png',
      details:
          'Banana este un fruct alungit, comestibil. Din punct de vedere botanic o bacă. Produsă de anumite specii erbacee din genul Musa.\n\n'
          'IMPORTANTA:\n\n'
          '=> Bananele reprezintă a 4-a cea mai importantă cultură (după orez, grâu și porumb) din lumea în curs de dezvoltare.\n'
          '=> Banana este vitală pentru securitatea alimentară a multor țări tropicale și subtropicale și este cel mai popular fruct din țările industrializate. \n'
          '=> Bananele sunt în mod deosebit importante în Africa de Sud, unde constituie principalul aliment de bază pentru circa 50% din populație.\n'
          '=> 90% din producția de banane este realizată în mici ferme și este consumată local.',
      type: "fruct"),
  Obiect(
      name: 'rosii',
      imageAsset: 'assets/rosii.png',
      details:
          'Roșia (pătlăgica roșie sau mai rar tomata), numită științific Solanum lycopersicum, '
          'este o plantă din familia Solanaceae, apropiată pe linie genetică de următoarele plante, '
          'de asemenea originare din „Lumea Nouă”: tutun, ardei, cartof, vânătă și physalis alkekengi. ',
      type: "leguma"),
  Obiect(
      name: 'morcovi',
      imageAsset: 'assets/morcovi.png',
      details:
          'Morcovul (Daucus carota subsp. sativus ) este o plantă plantă bienală din familia Apiaceae '
          '(numită și Umbelliferae), cultivată pe scară largă pentru rădăcina sa cărnoasă, comestibilă, '
          'consumată ca legumă. Morcovul este, după cartof, principala legumă cultivată în lume pentru rădăcina '
          'sa.',
      type: "leguma"),
  Obiect(
      name: 'mere',
      imageAsset: 'assets/mere.png',
      details:
          'Mărul (Malus domestica) este o specie de plante din familia Rosaceae. Această specie cuprinde între '
          '44 și 55 de soiuri, care se prezintă ca pomi sau arbuști. Varietățile de măr cresc în zona '
          'temperată nordică din Europa, Asia și America de Nord, printre acestea existând un număr mare '
          'de hibrizi.',
      type: "fruct"),
  Obiect(
      name: 'pere',
      imageAsset: 'assets/pere.png',
      details:
          'Para este considerată sora mărului, deoarece fac parte din aceeași familie și ambele sunt numite'
          'poame. Au aproximativ aceeași perioadă de dezvoltare și conțin aceleași vitamine și minerale, dar '
          'în proporții diferite.',
      type: "fruct"),
  Obiect(
      name: 'lamai',
      imageAsset: 'assets/lamai.png',
      details:
          'Lămâiul (Citrus limon) este un arbust din familia Rutaceae, nativ din Asia, de la 5 la 10 m înălțime,'
          'considerat veșnic verde.',
      type: "fruct"),
  Obiect(
      name: 'ceapa',
      imageAsset: 'assets/ceapa.png',
      details:
          'Ceapa (Allium cepa L.), denumită și ceapă de bucătărie sau ceapă de grădină, este o legumă. '
          'Este cea mai cultivată specie din genul Allium, care conține câteva sute de specii, printre '
          'care prazul, șalota, ceapa perenă și usturoiul.',
      type: "leguma"),
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thobor',
      home: ObiectListPage(),
    );
  }
}

class ObiectListPage extends StatelessWidget {
  const ObiectListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Butonul de test THOBOR',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(Icons.filter_list)),
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        body: ListView.builder(
            itemCount: obiecte.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ObiectDetailPage(obiect: obiecte[index]),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Image.asset(
                                  obiecte[index].imageAsset,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(obiecte[index].name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ))
                        ]),
                  ),
                ),
              );
            }));
  }
}

class CustomFilterDelegate {
  List<String> filters = ['fruct', 'leguma'];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        ]),
        body: ListView.builder(
            itemCount: filters.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(obiecte[index].type,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ))
                        ]),
                  ),
                ),
              );
            }));
  }

  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {},
      ),
    ];
  }

  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {},
    );
  }

  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}

class CustomFilterDelegate {

    List<String> filters = ['fruct', 'leguma'];
    List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          
        },
      ),
    ];
  }

  Widget? buildLeading(BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      );
  }

  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  Widget buildSuggestions(BuildContext context) {
    List<Obiect> suggestions = obiecte.where((Obiect) {
      return Obiect.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          var result = suggestions[index];
          return ListTile(
            title: Text(result.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ObiectDetailPage(obiect: result),
                ),
              );
            },
          );
        });
  }
  }
}
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'banane',
    'ceapa',
    'lamai',
    'mere',
    'morcovi',
    'pere',
    'rosii',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> suggestions = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        suggestions.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          var result = suggestions[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Obiect> suggestions = obiecte.where((Obiect) {
      return Obiect.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          var result = suggestions[index];
          return ListTile(
            title: Text(result.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ObiectDetailPage(obiect: result),
                ),
              );
            },
          );
        });
  }
}
