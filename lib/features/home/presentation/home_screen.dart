import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/core/utils/extensions/string_extensions.dart';
import 'package:abantether/di/di.dart';
import 'package:abantether/features/home/presentation/cubit/home_cubit.dart';
import 'package:abantether/features/home/presentation/widgets/coin_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.sizeOf(context).width < 600;
    final cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () => context.push(profilePath),
                icon: const Icon(Icons.person)),
          )
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.all(isSmallScreen ? 16 : 32),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              final cubit = context.read<HomeCubit>();

              return state.whenOrNull(
                    success: (coins, loadingId) => coins.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                noCoinsFound,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                  onPressed: () => cubit.loadCoinsAndFavs(),
                                  child: const Text(retryStr))
                            ],
                          )
                        : ListView.builder(
                            itemCount: coins.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CoinItem(
                                coin: coins[index],
                                toggleLike: () => cubit.toggleLike(
                                  coinId: coins[index].id ?? -1,
                                  isLiked: coins[index].isFavorite ?? false,
                                ),
                                loadingId: loadingId,
                              );
                            },
                          ),
                  ) ??
                  const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
