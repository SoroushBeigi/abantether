import 'package:abantether/core/utils/extensions/string_extensions.dart';
import 'package:abantether/features/home/domain/entities/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_constants.dart';

class CoinItem extends StatelessWidget {
  const CoinItem({
    required this.coin,
    required this.toggleLike,
    this.loadingId,
    super.key,
  });

  final Coin coin;
  final int? loadingId;
  final Function() toggleLike;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        borderOnForeground: true,
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Stack(
            children: [
              if(coin.iconAddress?.isNotEmpty??false)
              Center(
                child: Opacity(
                  opacity: 0.2,
                  child: SvgPicture.network(
                    height: 90,
                    width: 90,
                    coin.iconAddress!,
                    placeholderBuilder: (context) => const SizedBox(
                        height: 90,
                        width: 90,
                        child: Icon(Icons.currency_bitcoin_outlined,size: 65,)),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '(${coin.symbol ?? ''}) ${coin.name ?? unknownCoin}',
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
                      const SizedBox(width: 24),
                      Expanded(
                        child: Text(
                          (coin.price ?? 0)
                              .toStringAsFixed(3)
                              .splitPriceByComma()
                              .addPriceTag(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: Center(
                          child: loadingId == coin.id
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : GestureDetector(
                                  onTap:
                                      loadingId != null ? null : () => toggleLike(),
                                  child: Icon(
                                    coin.isFavorite == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 20,
                                    color: loadingId != null
                                        ? Colors.grey
                                        : Colors.red,
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
            ],
          ),
        ),
      ),
    );
  }
}
