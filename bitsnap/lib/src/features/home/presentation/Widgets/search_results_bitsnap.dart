import 'package:bitsnap/src/constants/string_constants.dart';
import 'package:bitsnap/src/features/home/presentation/Widgets/view_order_book.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/utils.dart';
import 'column_data.dart';
import '../../providers/home_providers.dart';

class SearchResultsBitsnap extends HookConsumerWidget {
  const SearchResultsBitsnap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchkey = ref.watch(searchBitsnap);
    final singleBitsnaData = ref.watch(fetchSingleBitsnapProvider);

    final showBook = ref.watch(viewOrderBook);

    return searchkey != ''
        ? singleBitsnaData.when(
            data: (bitnsap) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        searchkey.toUpperCase(),
                        style: context.textThemes.displayMedium,
                      ),
                      Text(
                        DateTime.now().toString().substring(1, 16),
                        style: context.textThemes.bodyLarge,
                      ),
                    ],
                  ).paddingOnly(top: UIDimens.size18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ColumnData(
                          header: StringConstants.open.tr(context),
                          value: bitnsap.open.toString()),
                      ColumnData(
                          header: StringConstants.high.tr(context),
                          value: bitnsap.high.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ColumnData(
                          header: StringConstants.low.tr(context),
                          value: bitnsap.low.toString()),
                      ColumnData(
                          header: StringConstants.last.tr(context),
                          value: bitnsap.last.toString()),
                    ],
                  ),
                  const SizedBox(
                    height: UIDimens.size20,
                  ),
                  Text(
                    StringConstants.volume.tr(context),
                    style: context.textThemes.titleSmall,
                  ),
                  const SizedBox(
                    height: UIDimens.size3,
                  ),
                  Text(
                    bitnsap.volume.toString(),
                    style: context.textThemes.titleLarge,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(viewOrderBook.notifier).state = !showBook;
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        StringConstants.viewOrderBook.tr(context).toUpperCase(),
                        style: context.textThemes.titleMedium,
                      ),
                    ),
                  ),
                  const ViewBook()
                ],
              ).paddingSymmetric(
                horizontal: UIDimens.size12,
              );
            },
            error: (e, t) {
              return Text(StringConstants.noDataFound.tr(context));
            },
            loading: () => const CircularProgressIndicator())
        : Center(
            child: Text(StringConstants.noDataFound.tr(context)),
          );
  }
}
