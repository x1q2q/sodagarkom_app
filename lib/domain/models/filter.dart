class Filter {
  final String id;
  final String name;
  Filter({
    required this.id,
    required this.name,
  });
  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(id: json['id'], name: json['name']);
  }
}
