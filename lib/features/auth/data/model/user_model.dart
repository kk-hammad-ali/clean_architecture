import 'dart:convert';

import 'package:clean_architecture/core/utils/typedef.dart';
import 'package:clean_architecture/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.bio,
    required super.age,
    required super.email,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? bio,
    int? age,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }

  const UserModel.toEmpty()
      : this(
          id: "empty_id",
          name: "empty_name",
          bio: "empty_bio",
          age: 1,
          email: "empty_email",
        );
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        bio: json['bio'],
        age: json['age'],
        email: json['email'],
      );

  DataMap toMap() => {
        "id": id,
        "name": name,
        "bio": bio,
        "age": age,
        "email": email,
      };

  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        bio: bio,
        age: age,
        email: email,
      );
  String toJson() => json.encode(toMap());
}
