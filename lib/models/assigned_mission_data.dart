class AssignedMissionData {
  final String description;
  final String role;
  final String category;
  final String time;

  AssignedMissionData({this.description, this.role, this.category, this.time});

  factory AssignedMissionData.fromJson(Map<String, dynamic> data) =>
      AssignedMissionData(
        description: data["description"],
        role: data["role"],
        category: data["category"],
        time: data["time"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "role": role,
        "category": category,
        "time": time.toString(),
      };
}
