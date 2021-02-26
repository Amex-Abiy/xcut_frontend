import 'package:equatable/equatable.dart';
import 'package:xcut_frontend/src/models/user.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLoadSuccess extends UserState {
  final List<User> user;

  UserLoadSuccess([this.user = const []]);

  @override
  List<Object> get props => [User];
}

class CourseOperationFailure extends UserState {}
