import 'package:flutter/material.dart';
import 'package:beach_volleyball/models/tournament.dart';
import 'package:beach_volleyball/widgets/tournament_form.dart';

class CreateTournamentScreen extends StatelessWidget {
  const CreateTournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Tournament'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: TournamentForm(
          onSubmit: (Tournament tournament) {
            // TODO: Implement tournament creation logic
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}