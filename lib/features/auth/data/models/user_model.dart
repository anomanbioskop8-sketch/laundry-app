class UserModel {
  final String id;
  final String name;
  final String email;
  final String companyId;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.companyId,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      companyId: map['companyId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'companyId': companyId, 'name': name, 'email': email};
  }
}
