import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/user_api_service.dart';
import 'home_event.dart';
import 'home_state.dart';

/// Bloc that handles fetching and refreshing the Home screen user list.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserApiService userApiService;

  HomeBloc({required this.userApiService}) : super(HomeInitial()) {
    on<FetchUsersEvent>(_onFetchUsers);
    on<RefreshUsersEvent>(_onRefreshUsers);
  }

  Future<void> _onFetchUsers(
    FetchUsersEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    try {
      final users = await userApiService.fetchUsers();
      emit(HomeLoaded(users: users));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> _onRefreshUsers(
    RefreshUsersEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final users = await userApiService.fetchUsers();
      emit(HomeLoaded(users: users));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
