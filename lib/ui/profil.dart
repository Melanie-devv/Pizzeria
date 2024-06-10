import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/appbar_widget.dart';
import 'package:pizzeria/ui/share/bottom_navigation_bar_widget.dart';
import 'package:provider/provider.dart';

// Créez un modèle pour le profil
class ProfilModel with ChangeNotifier {
  String nom = '';
  String adresse = '';
  String email = '';

  void updateProfil(String newNom, String newAdresse, String newEmail) {
    nom = newNom;
    adresse = newAdresse;
    email = newEmail;
    notifyListeners(); // Notifie les auditeurs (les widgets) du changement de données
  }
}

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _adresseController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    var profil = context.watch<ProfilModel>(); // Récupère le modèle Profil

    _nomController.text = profil.nom;
    _adresseController.text = profil.adresse;
    _emailController.text = profil.email;

    return Scaffold(
      appBar: AppBarWidget('Profil', cart),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(
                  labelText: 'Nom',
                  hintText: 'Entrez votre nom',
                ),
              ),
              TextFormField(
                controller: _adresseController,
                decoration: InputDecoration(
                  labelText: 'Adresse',
                  hintText: 'Entrez votre adresse',
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'Entrez votre e-mail',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                    profil.updateProfil(
                      _nomController.text,
                      _adresseController.text,
                      _emailController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Profil enregistré avec succès!'),
                      ),
                    );
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(3), // Indice 3 pour "Profil"
    );
  }
}
