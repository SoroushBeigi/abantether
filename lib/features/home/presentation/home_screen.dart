import 'package:abantether/core/constants/app_constants.dart';
import 'package:abantether/core/utils/extensions/string_extensions.dart';
import 'package:abantether/di/di.dart';
import 'package:abantether/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
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
                              ElevatedButton(onPressed: () => cubit.loadCoinsAndFavs(), child: const Text(retryStr))
                            ],
                          )
                        : ListView.builder(
                            itemCount: coins.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: Card(
                                  borderOnForeground: true,
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              SvgPicture.network(
                                                '${coins[index].iconAddress}',
                                                height: 24,
                                                width: 24,
                                                placeholderBuilder: (context) => const SizedBox(
                                                    height: 24, width: 24, child: Icon(Icons.currency_bitcoin)),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '(${coins[index].symbol ?? ''}) ${coins[index].name ?? unknownCoin}',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: Theme.of(context).textTheme.bodyLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                (coins[index].price ?? 0)
                                                    .toStringAsFixed(3)
                                                    .splitPriceByComma()
                                                    .addPriceTag(),
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.titleLarge,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                              width: 25,
                                              child: Center(
                                                child: loadingId == coins[index].id
                                                    ? const SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: CircularProgressIndicator(strokeWidth: 2),
                                                      )
                                                    : GestureDetector(
                                                        onTap: loadingId != null
                                                            ? null
                                                            : () => cubit.toggleLike(
                                                                  coinId: coins[index].id ?? -1,
                                                                  isLiked: coins[index].isFavorite ?? false,
                                                                ),
                                                        child: Icon(
                                                          coins[index].isFavorite==true
                                                              ? Icons.favorite
                                                              : Icons.favorite_border,
                                                          size: 20,
                                                          color: loadingId != null ? Colors.grey : Colors.red,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
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
