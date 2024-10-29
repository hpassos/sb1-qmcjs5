import 'package:flutter/material.dart';
import 'package:beach_volleyball/screens/create_tournament_screen.dart';
import 'package:beach_volleyball/screens/active_tournaments_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tournament Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildOptionCard(
              context,
              'Create Tournament',
              Icons.add_circle_outline,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateTournamentScreen(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildOptionCard(
              context,
              'Active Tournaments',
              Icons.sports_volleyball,
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ActiveTournamentsScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Icon(icon, size: 48, color: Theme.of(context).primaryColor),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}