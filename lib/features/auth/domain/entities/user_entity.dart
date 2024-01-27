import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String bio;
  final int age;
  final String email;

  const UserEntity({
    required this.id,
    required this.name,
    required this.bio,
    required this.age,
    required this.email,
  });

  const UserEntity.toEmpty()
      : this(
          id: "empty_id",
          name: "empty_name",
          bio: "empty_avatar",
          age: 1,
          email: "empty_name",
        );

  @override
  List<Object?> get props => [id, name, bio, age, email];
}
