# Pizzeria

Une application complète pour commander des pizzas, développée avec Flutter pour Android et le web. Les utilisateurs peuvent personnaliser leur pizza, gérer leur panier, passer commande et mettre à jour leur profil.

## Fonctionnalités

- Sélection de la sauce, taille, type de pâte et autres options pour personnaliser sa pizza
- Affichage du panier avec le total de la commande
- Ajout et suppression de pizzas dans le panier
- Passage de commande
- Page de profil modifiable avec enregistrement des informations
- Données des pizzas récupérées depuis un fichier JSON sur un serveur local

## Prérequis

- Flutter SDK installé
- Android Studio (pour l'application Android) ou un navigateur web moderne

## Installation

1. Clonez ce dépôt sur votre machine locale :

```
git clone https://github.com/Melanie-devv/Pizzeria
```

2. Naviguez vers le répertoire du projet :

```
cd Pizzeria
```

3. Récupérez les dépendances du projet :

```
flutter pub get
```

4. Assurez-vous d'avoir un serveur web local (comme WAMP) en cours d'exécution pour servir le fichier JSON des données des pizzas.

## Exécution

### Application Android

1. Connectez un appareil Android en mode développeur ou démarrez un émulateur Android.

2. Exécutez l'application avec la commande :

```
flutter run
```

### Web App

1. Exécutez la commande pour démarrer un serveur web avec l'application :

```
flutter run -d chrome
```

2. L'application s'ouvrira dans votre navigateur web par défaut.

## Structure du projet

- `lib/main.dart` : Point d'entrée de l'application
- `lib/pages/` : Contient les différentes pages de l'application (accueil, personnalisation de pizza, panier, profil, etc.)
- `lib/models/` : Modèles de données pour les pizzas, les commandes, etc.
- `lib/services/` : Services pour récupérer les données des pizzas depuis le fichier JSON
- `lib/widgets/` : Widgets réutilisables pour l'interface utilisateur
- `assets/data/pizzas.json` : Fichier JSON contenant les données des pizzas


## Versions recommandées

### Flutter

- Version stable la plus récente de Flutter (minimum 3.7.3)

### Dart  

- Version 3.x (dernière version)
