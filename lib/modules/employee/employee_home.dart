import 'package:flutter/material.dart';
import '../../services/app_state.dart';
import '../../widgets/job_card.dart';
import '../../localization.dart';
import 'job_detail_page.dart';
import 'saved_jobs_page.dart';
import 'employee_profile_page.dart';

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({Key? key}) : super(key: key);

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final lang = state.language;
    final items = [
      L10n.t('dashboard', lang),
      L10n.t('jobs', lang),
      L10n.t('saved_jobs', lang),
      L10n.t('profile', lang),
    ];

    final pages = [
      _DashboardTab(),
      _JobsTab(),
      const SavedJobsPage(),
      const EmployeeProfilePage(),
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (i) => setState(() => _index = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: items[0]),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: items[1],
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: items[2]),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: items[3]),
        ],
      ),
    );
  }
}

class _DashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final lang = state.language;
    final jobs = state.jobs;
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('dashboard', lang))),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView(
          children: jobs
              .map(
                (j) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: JobCard(
                    job: j,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => JobDetailPage(job: j)),
                    ),
                    onSave: () => state.toggleSave(j.id),
                    saved: state.savedJobIds.contains(j.id),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

// profile is now a separate page: EmployeeProfilePage
class _JobsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final lang = state.language;
    final jobs = state.jobs;
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('jobs', lang))),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView(
          children: jobs
              .map(
                (j) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: JobCard(
                    job: j,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => JobDetailPage(job: j)),
                    ),
                    onSave: () => state.toggleSave(j.id),
                    saved: state.savedJobIds.contains(j.id),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
