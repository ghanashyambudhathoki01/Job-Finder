import 'package:flutter/material.dart';
import '../../services/app_state.dart';
import '../../localization.dart';
import 'job_list_page.dart';

class CreateJobPage extends StatefulWidget {
  final int employerId;
  const CreateJobPage({Key? key, required this.employerId}) : super(key: key);

  @override
  State<CreateJobPage> createState() => _CreateJobPageState();
}

class _CreateJobPageState extends State<CreateJobPage> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _salary = TextEditingController();
  final _requirements = TextEditingController();
  final _location = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _salary.dispose();
    _requirements.dispose();
    _location.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final state = AppStateProvider.of(context);
      state.addJob(
        title: _title.text.trim(),
        description: _description.text.trim(),
        salary: _salary.text.trim(),
        requirements: _requirements.text.trim(),
        location: _location.text.trim(),
        employerId: widget.employerId,
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => EmployerJobListPage(employerId: widget.employerId),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppStateProvider.of(context).language;
    return Scaffold(
      appBar: AppBar(title: Text(L10n.t('create_job', lang))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _title,
                        decoration: InputDecoration(
                          labelText: L10n.t('title', lang),
                        ),
                        validator: (v) =>
                            (v == null || v.isEmpty) ? 'Required' : null,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _description,
                        decoration: InputDecoration(
                          labelText: L10n.t('description', lang),
                        ),
                        minLines: 3,
                        maxLines: 6,
                        validator: (v) =>
                            (v == null || v.isEmpty) ? 'Required' : null,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _requirements,
                        decoration: InputDecoration(labelText: 'Requirements'),
                        minLines: 2,
                        maxLines: 4,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _salary,
                              decoration: InputDecoration(
                                labelText: L10n.t('salary', lang),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _location,
                              decoration: InputDecoration(
                                labelText: L10n.t('location', lang),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text(L10n.t('post', lang)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
