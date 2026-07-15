import 'package:equatable/equatable.dart';

/// Events that can be triggered on the Home screen.
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Triggered when the Home screen first loads.
class FetchUsersEvent extends HomeEvent {
  const FetchUsersEvent();
}

/// Triggered when the user pulls down to refresh.
class RefreshUsersEvent extends HomeEvent {
  const RefreshUsersEvent();
}
