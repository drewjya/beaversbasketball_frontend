import 'package:beaverbasketball/src/features/content/providers/content_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(youtubeDataProvider).when(data: (data) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return Text(data?[index] ?? "");
        },
        itemCount: (data ?? []).length,
      );
    }, error: (error, _) {
      return Center(child: Text("data"));
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
