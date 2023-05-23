import 'package:bitsnap/src/features/home/domainModels/bitsnap_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repository/bitsnap_repo.dart';

final bitSnapRepoProvider = Provider((ref) => BitSnapRepository());
final searchBitsnap = StateProvider<String>((ref) => '');
final viewOrderBook = StateProvider<bool>((ref) => false);
final fetchSingleBitsnapProvider =
    FutureProvider.autoDispose<SingleBitsnapResponse>((ref) {
  final value = ref.watch(searchBitsnap);
  final provider = ref.watch(bitSnapRepoProvider);
  return provider.getSingleBitsnap(searchValue: value);
});
