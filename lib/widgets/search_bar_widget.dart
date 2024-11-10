import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quadb/providers/providers.dart';
import 'package:quadb/screens/main_screen.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () {
          ref.watch(searchFocusNodeProvider).requestFocus();
          ref.read(selectedIndexProvider.notifier).state = 1;
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Text('Search movies', style: TextStyle(color: Colors.grey))
            ],
          ),
        ));
  }
}
