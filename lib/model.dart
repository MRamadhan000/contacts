class Blog {
  final String name;
  final String number;
  final String birthDate;
  final String id;

  const Blog({
    required this.name,
    required this.number,
    required this.birthDate,
    required this.id,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'number': String number,
        'birthDate': String birthDate,
        'id': String id,
      } =>
        Blog(
          name: name,
          number: number,
          birthDate: birthDate,
          id: id,
        ),
      _ => throw const FormatException('Failed to load data.'),
    };
  }
}
