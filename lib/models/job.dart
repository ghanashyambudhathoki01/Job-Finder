class Job {
  final int id;
  final String title;
  final String description;
  final String salary;
  final String requirements;
  final String location;
  final DateTime createdAt;
  final int employerId;

  Job({
    required this.id,
    required this.title,
    required this.description,
    required this.salary,
    required this.requirements,
    required this.location,
    required this.createdAt,
    required this.employerId,
  });

  Job copyWith({
    int? id,
    String? title,
    String? description,
    String? salary,
    String? requirements,
    String? location,
    DateTime? createdAt,
    int? employerId,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      salary: salary ?? this.salary,
      requirements: requirements ?? this.requirements,
      location: location ?? this.location,
      createdAt: createdAt ?? this.createdAt,
      employerId: employerId ?? this.employerId,
    );
  }
}
