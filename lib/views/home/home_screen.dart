import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/home/home_bloc.dart';
import '../../controllers/home/home_event.dart';
import '../../controllers/home/home_state.dart';
import '../../core/widgets/app_header.dart';
import '../../services/user_api_service.dart';
import '../compliment/compliment_bottom_sheet.dart';
import '../profile/profile_details_screen.dart';
import 'widgets/home_error_view.dart';
import 'widgets/home_loading_view.dart';
import 'widgets/profile_card.dart';

/// Home screen: fetches users from the API and displays them
/// in a horizontal PageView of profile cards.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        userApiService: UserApiService(),
      )..add(const FetchUsersEvent()),
      child: const _HomeScreenBody(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial) {
            return const HomeLoadingView();
          }

          if (state is HomeError) {
            return HomeErrorView(
              onRetry: () {
                context.read<HomeBloc>().add(const FetchUsersEvent());
              },
            );
          }

          if (state is HomeLoaded) {
            if (state.users.isEmpty) {
              return const Center(child: Text("No users found"));
            }

            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeBloc>().add(const RefreshUsersEvent());
                // Small delay so the refresh indicator feels natural.
                await Future.delayed(const Duration(milliseconds: 500));
              },
              child: PageView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ProfileCard(
                    user: user,
                    onCardTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProfileDetailsScreen(user: user),
                        ),
                      );
                    },
                    onRoseTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const ComplimentBottomSheet(),
                      );
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
