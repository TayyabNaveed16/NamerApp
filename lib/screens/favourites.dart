import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    if (favorites.isEmpty) {
      return Container(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Center(
          child: Text(
            'No favorites yet!',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      );
    }

    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Text(
                "You have ${favorites.length} favorites",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          for (var pair in favorites)
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.favorite),
                color: theme.colorScheme.tertiary,
                onPressed: () {
                  appState.unfavorite(pair);
                },
              ),
              title: Text(pair.asPascalCase),
              textColor: theme.colorScheme.tertiary,
            ),
        ],
      ),
    );
  }
}
