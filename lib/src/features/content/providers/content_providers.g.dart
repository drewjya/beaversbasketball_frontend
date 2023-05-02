// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aboutPotitionHash() => r'cb15b3a0c03d2724158441b987c2a207a4d433be';

/// See also [AboutPotition].
@ProviderFor(AboutPotition)
final aboutPotitionProvider =
    NotifierProvider<AboutPotition, Map<String, double>>.internal(
  AboutPotition.new,
  name: r'aboutPotitionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aboutPotitionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AboutPotition = Notifier<Map<String, double>>;
String _$currentIndexAboutHash() => r'122b6457e9cfe4f08d3727cb7179537ce5a495d4';

/// See also [CurrentIndexAbout].
@ProviderFor(CurrentIndexAbout)
final currentIndexAboutProvider =
    AutoDisposeNotifierProvider<CurrentIndexAbout, int>.internal(
  CurrentIndexAbout.new,
  name: r'currentIndexAboutProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentIndexAboutHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentIndexAbout = AutoDisposeNotifier<int>;
String _$youtubeDataHash() => r'964c957625f1966ff968f690984f5b1c35f656b3';

/// See also [YoutubeData].
@ProviderFor(YoutubeData)
final youtubeDataProvider =
    AsyncNotifierProvider<YoutubeData, List<YoutubeModel>>.internal(
  YoutubeData.new,
  name: r'youtubeDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$youtubeDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$YoutubeData = AsyncNotifier<List<YoutubeModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
