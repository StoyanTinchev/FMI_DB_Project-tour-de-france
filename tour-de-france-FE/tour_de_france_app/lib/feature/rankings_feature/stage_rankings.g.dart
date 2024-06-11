// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_rankings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCyclistResultsForStageHash() =>
    r'576944fd6db26f1314939733bd3f71dca27eeaf7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchCyclistResultsForStage].
@ProviderFor(fetchCyclistResultsForStage)
const fetchCyclistResultsForStageProvider = FetchCyclistResultsForStageFamily();

/// See also [fetchCyclistResultsForStage].
class FetchCyclistResultsForStageFamily
    extends Family<AsyncValue<List<CyclistResultDTO>>> {
  /// See also [fetchCyclistResultsForStage].
  const FetchCyclistResultsForStageFamily();

  /// See also [fetchCyclistResultsForStage].
  FetchCyclistResultsForStageProvider call(
    Dio dio,
    int stageNumber,
  ) {
    return FetchCyclistResultsForStageProvider(
      dio,
      stageNumber,
    );
  }

  @override
  FetchCyclistResultsForStageProvider getProviderOverride(
    covariant FetchCyclistResultsForStageProvider provider,
  ) {
    return call(
      provider.dio,
      provider.stageNumber,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchCyclistResultsForStageProvider';
}

/// See also [fetchCyclistResultsForStage].
class FetchCyclistResultsForStageProvider
    extends AutoDisposeFutureProvider<List<CyclistResultDTO>> {
  /// See also [fetchCyclistResultsForStage].
  FetchCyclistResultsForStageProvider(
    Dio dio,
    int stageNumber,
  ) : this._internal(
          (ref) => fetchCyclistResultsForStage(
            ref as FetchCyclistResultsForStageRef,
            dio,
            stageNumber,
          ),
          from: fetchCyclistResultsForStageProvider,
          name: r'fetchCyclistResultsForStageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCyclistResultsForStageHash,
          dependencies: FetchCyclistResultsForStageFamily._dependencies,
          allTransitiveDependencies:
              FetchCyclistResultsForStageFamily._allTransitiveDependencies,
          dio: dio,
          stageNumber: stageNumber,
        );

  FetchCyclistResultsForStageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dio,
    required this.stageNumber,
  }) : super.internal();

  final Dio dio;
  final int stageNumber;

  @override
  Override overrideWith(
    FutureOr<List<CyclistResultDTO>> Function(
            FetchCyclistResultsForStageRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCyclistResultsForStageProvider._internal(
        (ref) => create(ref as FetchCyclistResultsForStageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dio: dio,
        stageNumber: stageNumber,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CyclistResultDTO>> createElement() {
    return _FetchCyclistResultsForStageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCyclistResultsForStageProvider &&
        other.dio == dio &&
        other.stageNumber == stageNumber;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dio.hashCode);
    hash = _SystemHash.combine(hash, stageNumber.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCyclistResultsForStageRef
    on AutoDisposeFutureProviderRef<List<CyclistResultDTO>> {
  /// The parameter `dio` of this provider.
  Dio get dio;

  /// The parameter `stageNumber` of this provider.
  int get stageNumber;
}

class _FetchCyclistResultsForStageProviderElement
    extends AutoDisposeFutureProviderElement<List<CyclistResultDTO>>
    with FetchCyclistResultsForStageRef {
  _FetchCyclistResultsForStageProviderElement(super.provider);

  @override
  Dio get dio => (origin as FetchCyclistResultsForStageProvider).dio;
  @override
  int get stageNumber =>
      (origin as FetchCyclistResultsForStageProvider).stageNumber;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
