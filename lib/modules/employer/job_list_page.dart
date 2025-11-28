import 'package:flutter/material.dart';
import '../../services/app_state.dart';
import '../../widgets/job_card.dart';
import '../../localization.dart';

class EmployerJobListPage extends StatelessWidget {
  final int employerId;
  const EmployerJobListPage({Key? key, required this.employerId})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final lang = state.language;
    final jobs = state.jobs.where((j) => j.employerId == employerId).toList();
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('posted_jobs', lang))),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: jobs.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text('No jobs yet'),
                ),
              )
            : ListView(
                children: jobs
                    .map(
                      (j) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: JobCard(job: j),
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}
