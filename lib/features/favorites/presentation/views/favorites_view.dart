import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/favorites/presentation/manager/cubit/get_fav_cubit.dart';
import 'package:grace_cycle/features/favorites/presentation/views/widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetFavCubit(sl())
              ..getFavFood(
                isInitial: true,
              ),
          ),
          BlocProvider(
            create: (context) => DiscoverCubit(sl())..getCategories(),
          ),
        ],
        child: const FavoritesViewBody(),
      ),
    );
  }
}
