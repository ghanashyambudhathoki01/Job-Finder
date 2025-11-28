import 'package:flutter/material.dart';
import '../../models/job.dart';
import '../../services/app_state.dart';
import '../../localization.dart';

class JobDetailPage extends StatelessWidget {
  final Job job;
  const JobDetailPage({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = AppStateProvider.of(context);
    final lang = state.language;
    final saved = state.savedJobIds.contains(job.id);
    return Scaffold(
      appBar: AppBar(title: Text(job.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${job.location} • ${job.salary}',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Text(job.description),
                    const SizedBox(height: 10),
                    if (job.requirements.isNotEmpty) ...[
                      Text(
                        'Requirements',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 6),
                      Text(job.requirements),
                    ],
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => _apply(context),
                      child: Text(L10n.t('apply', lang)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () => state.toggleSave(job.id),
                    child: Text(
                      saved ? L10n.t('save', lang) : L10n.t('save', lang),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _apply(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Application submitted')));
  }
}
