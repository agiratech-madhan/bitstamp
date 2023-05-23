import 'package:bitsnap/src/constants/string_constants.dart';
import 'package:bitsnap/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../providers/home_providers.dart';
import 'data_table.dart';

class ViewBook extends HookConsumerWidget {
  const ViewBook({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showBook = ref.watch(viewOrderBook);
    return Visibility(
      visible: showBook,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.orderBook.tr(context).toUpperCase(),
            style: context.textThemes.titleSmall?.copyWith(color: Colors.grey),
          ),
          const Card(
            child: DataTableExample(),
          ),
        ],
      ),
    );
  }
}
