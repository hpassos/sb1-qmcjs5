import 'package:flutter/material.dart';
import 'package:beach_volleyball/models/tournament.dart';
import 'package:beach_volleyball/widgets/tournament_list_item.dart';

class ActiveTournamentsScreen extends StatelessWidget {
  const ActiveTournamentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Tournaments'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 0, // TODO: Replace with actual tournament list
        itemBuilder: (context, index) {
          return const Placeholder(); // TODO: Replace with TournamentListItem
        },
      ),
    );
  }
}