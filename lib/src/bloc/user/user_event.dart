import 'package:equatable/equatable.dart';
import 'package:xcut_frontend/src/models/User.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoad extends UserEvent {
  const UserLoad();

  @override
  List<Object> get props => [];
}

class UserCreate extends UserEvent {
  final User user;

  const UserCreate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {User: $user}';
}

class UserUpdate extends UserEvent {
  final User user;

  const UserUpdate(this.user);

  @override
  List<Object> get props => [User];

  @override
  String toString() => 'User Updated {User: $user}';
}

class UserDelete extends UserEvent {
  final User user;

  const UserDelete(this.user);

  @override
  List<Object> get props => [user];

  @override
  toString() => 'User Deleted {User: $user}';
}
