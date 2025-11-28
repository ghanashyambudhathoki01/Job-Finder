import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../models/job.dart';

class AppState extends ChangeNotifier {
  final List<Job> _jobs = [];
  final Set<int> _savedJobIds = {};
  final Map<String, String> _employerProfile = {'name': 'Employer Name'};
  final Map<String, String> _employeeProfile = {'name': 'Employee Name'};

  bool _isDark = false;
  String _language = 'en'; // 'en' or 'ne'

  int _nextId = 1;

  List<Job> get jobs => List.unmodifiable(_jobs.reversed);
  Set<int> get savedJobIds => _savedJobIds;
  bool get isDark => _isDark;
  String get language => _language;
  Map<String, String> get employerProfile => _employerProfile;
  Map<String, String> get employeeProfile => _employeeProfile;

  void addJob({
    required String title,
    required String description,
    required String salary,
    required String requirements,
    required String location,
    required int employerId,
  }) {
    final job = Job(
      id: _nextId++,
      title: title,
      description: description,
      salary: salary,
      requirements: requirements,
      location: location,
      createdAt: DateTime.now(),
      employerId: employerId,
    );
    _jobs.add(job);
    notifyListeners();
  }

  void toggleSave(int jobId) {
    if (_savedJobIds.contains(jobId))
      _savedJobIds.remove(jobId);
    else
      _savedJobIds.add(jobId);
    notifyListeners();
  }

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void setLanguage(String lang) {
    if (lang != _language) {
      _language = lang;
      notifyListeners();
    }
  }

  void updateEmployerProfile(String key, String value) {
    _employerProfile[key] = value;
    notifyListeners();
  }

  void updateEmployeeProfile(String key, String value) {
    _employeeProfile[key] = value;
    notifyListeners();
  }
}

class AppStateProvider extends InheritedNotifier<AppState> {
  const AppStateProvider({
    Key? key,
    required AppState notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static AppState of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<AppStateProvider>();
    assert(provider != null, 'No AppStateProvider found in context');
    return provider!.notifier!;
  }

  @override
  bool updateShouldNotify(covariant InheritedNotifier<AppState> oldWidget) =>
      true;
}
