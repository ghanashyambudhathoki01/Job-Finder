import 'package:flutter/material.dart';
import '../../services/app_state.dart';
import '../../widgets/job_card.dart';
import '../../localization.dart';

class SavedJobsPage extends StatelessWidget {
  const SavedJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final lang = state.language;
    final saved = state.jobs
        .where((j) => state.savedJobIds.contains(j.id))
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('saved_jobs', lang))),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: saved.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text('No saved jobs'),
                ),
              )
            : ListView(
                children: saved
                    .map(
                      (j) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: JobCard(
                          job: j,
                          saved: true,
                          onSave: () => state.toggleSave(j.id),
                        ),
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }
}
