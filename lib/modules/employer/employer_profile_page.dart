import 'package:flutter/material.dart';
import '../../services/app_state.dart';

class EmployerProfilePage extends StatefulWidget {
  const EmployerProfilePage({Key? key}) : super(key: key);

  @override
  State<EmployerProfilePage> createState() => _EmployerProfilePageState();
}

class _EmployerProfilePageState extends State<EmployerProfilePage> {
  late TextEditingController _nameCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _emailCtrl;

  @override
  void initState() {
    super.initState();
    final state = AppStateProvider.of(context);
    _nameCtrl = TextEditingController(
      text: state.employerProfile['name'] ?? '',
    );
    _phoneCtrl = TextEditingController(
      text: state.employerProfile['phone'] ?? '',
    );
    _emailCtrl = TextEditingController(
      text: state.employerProfile['email'] ?? '',
    );
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _phoneCtrl,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                state.updateEmployerProfile('name', _nameCtrl.text.trim());
                state.updateEmployerProfile('phone', _phoneCtrl.text.trim());
                state.updateEmployerProfile('email', _emailCtrl.text.trim());
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Profile saved')));
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
