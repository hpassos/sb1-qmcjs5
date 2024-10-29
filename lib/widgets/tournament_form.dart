import 'package:flutter/material.dart';
import 'package:beach_volleyball/models/tournament.dart';

class TournamentForm extends StatefulWidget {
  final Function(Tournament) onSubmit;

  const TournamentForm({super.key, required this.onSubmit});

  @override
  State<TournamentForm> createState() => _TournamentFormState();
}

class _TournamentFormState extends State<TournamentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  TournamentType _selectedType = TournamentType.singleElimination;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Tournament Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a tournament name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<TournamentType>(
            value: _selectedType,
            decoration: const InputDecoration(
              labelText: 'Tournament Type',
              border: OutlineInputBorder(),
            ),
            items: TournamentType.values.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(type.toString().split('.').last),
              );
            }).toList(),
            onChanged: (TournamentType? value) {
              if (value != null) {
                setState(() {
                  _selectedType = value;
                });
              }
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _startDate,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (picked != null) {
                setState(() {
                  _startDate = picked;
                });
              }
            },
            child: Text('Start Date: ${_startDate.toString().split(' ')[0]}'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _endDate,
                firstDate: _startDate,
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (picked != null) {
                setState(() {
                  _endDate = picked;
                });
              }
            },
            child: Text('End Date: ${_endDate.toString().split(' ')[0]}'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: Create and submit tournament
              }
            },
            child: const Text('Create Tournament'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}