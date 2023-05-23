import 'package:bitsnap/src/features/home/presentation/Widgets/search_bitsnap.dart';
import 'package:bitsnap/src/features/home/presentation/Widgets/search_results_bitsnap.dart';
import 'package:bitsnap/src/features/home/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const SingleChildScrollView(
        child: Column(
          children: [SearchBitsnap(), SearchResultsBitsnap()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () async {
          ref.refresh(fetchSingleBitsnapProvider);
        },
        child: const Icon(
          Icons.refresh_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
