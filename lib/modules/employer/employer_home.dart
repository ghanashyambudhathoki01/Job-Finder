import 'package:flutter/material.dart';
import '../../services/app_state.dart';
import 'create_job_page.dart';
import 'job_list_page.dart';
import 'employer_profile_page.dart';
import '../../localization.dart';

class EmployerHome extends StatefulWidget {
  final int employerId;
  const EmployerHome({Key? key, this.employerId = 1}) : super(key: key);

  @override
  State<EmployerHome> createState() => _EmployerHomeState();
}

class _EmployerHomeState extends State<EmployerHome> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final lang = state.language;
    final items = [
      L10n.t('dashboard', lang),
      L10n.t('jobs', lang),
      L10n.t('profile', lang),
    ];

    final pages = [
      _DashboardTab(),
      _JobsTab(employerId: widget.employerId),
      EmployerProfilePage(),
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: items[0],
          ),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: items[1]),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: items[2]),
        ],
      ),
    );
  }
}

class _JobsTab extends StatelessWidget {
  final int employerId;
  const _JobsTab({Key? key, required this.employerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final lang = state.language;
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('jobs', lang))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CreateJobPage(employerId: employerId),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: Text(L10n.t('create_job', lang)),
            ),
            const SizedBox(height: 12),
            Expanded(child: EmployerJobListPage(employerId: employerId)),
          ],
        ),
      ),
    );
  }
}

class _DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final lang = state.language;
    final posted = state.jobs.length;
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('dashboard', lang))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              L10n.t('employer_stats', lang),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text('${L10n.t('posted_jobs', lang)}: $posted'),
          ],
        ),
      ),
    );
  }
}

// Employer profile is handled by `EmployerProfilePage`.
