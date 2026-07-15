import 'package:equatable/equatable.dart';
import '../../models/user_model.dart';

/// All possible states for the Home screen.
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any data is fetched.
class HomeInitial extends HomeState {}

/// Shown while the API call is in progress.
class HomeLoading extends HomeState {}

/// Shown when users are successfully fetched.
class HomeLoaded extends HomeState {
  final List<UserModel> users;

  const HomeLoaded({required this.users});

  @override
  List<Object?> get props => [users];
}

/// Shown when the API call fails.
class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}
