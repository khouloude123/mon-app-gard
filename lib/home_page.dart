import 'package:flutter/material.dart';

import 'activite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Fonction pour afficher un message (Snackbar)
  void _showSnack(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5A9BD5),
        title: const Text('Ma Garderie', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF5A9BD5)),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
                _showSnack('Accueil sélectionné');
              },
            ),
            ListTile(
              leading: const Icon(Icons.toys),
              title: const Text('Activités'),
              onTap: () {
                Navigator.pop(context);
                _showSnack('Activités sélectionnées');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              onTap: () {
                Navigator.pop(context);
                _showSnack('À propos sélectionné');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSnack('Nouvelle activité'), // Interaction FAB
        backgroundColor: const Color(0xFF5A9BD5),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "BONJOUR !",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const Text(
              "Quelle activité aujourd'hui ?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: activites.length,
                itemBuilder: (context, index) {
                  final a = activites[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade50,
                        child: Text(
                          a['icone'],
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                      title: Text(
                        a['titre'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(a['description']),
                      trailing: const Icon(Icons.chevron_right),
                      // Interaction sur le clic d'une activité
                      onTap: () => _showSnack(a['titre']),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
