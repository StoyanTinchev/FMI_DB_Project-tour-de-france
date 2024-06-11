// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_rankings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCyclistGeneralResultsHash() =>
    r'1c8089ebef21b141e9268ad3c9723b70d65ab53a';

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

/// See also [fetchCyclistGeneralResults].
@ProviderFor(fetchCyclistGeneralResults)
const fetchCyclistGeneralResultsProvider = FetchCyclistGeneralResultsFamily();

/// See also [fetchCyclistGeneralResults].
class FetchCyclistGeneralResultsFamily
    extends Family<AsyncValue<List<CyclistResultDTO>>> {
  /// See also [fetchCyclistGeneralResults].
  const FetchCyclistGeneralResultsFamily();

  /// See also [fetchCyclistGeneralResults].
  FetchCyclistGeneralResultsProvider call(
    Dio dio,
  ) {
    return FetchCyclistGeneralResultsProvider(
      dio,
    );
  }

  @override
  FetchCyclistGeneralResultsProvider getProviderOverride(
    covariant FetchCyclistGeneralResultsProvider provider,
  ) {
    return call(
      provider.dio,
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
  String? get name => r'fetchCyclistGeneralResultsProvider';
}

/// See also [fetchCyclistGeneralResults].
class FetchCyclistGeneralResultsProvider
    extends AutoDisposeFutureProvider<List<CyclistResultDTO>> {
  /// See also [fetchCyclistGeneralResults].
  FetchCyclistGeneralResultsProvider(
    Dio dio,
  ) : this._internal(
          (ref) => fetchCyclistGeneralResults(
            ref as FetchCyclistGeneralResultsRef,
            dio,
          ),
          from: fetchCyclistGeneralResultsProvider,
          name: r'fetchCyclistGeneralResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCyclistGeneralResultsHash,
          dependencies: FetchCyclistGeneralResultsFamily._dependencies,
          allTransitiveDependencies:
              FetchCyclistGeneralResultsFamily._allTransitiveDependencies,
          dio: dio,
        );

  FetchCyclistGeneralResultsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dio,
  }) : super.internal();

  final Dio dio;

  @override
  Override overrideWith(
    FutureOr<List<CyclistResultDTO>> Function(
            FetchCyclistGeneralResultsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCyclistGeneralResultsProvider._internal(
        (ref) => create(ref as FetchCyclistGeneralResultsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dio: dio,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CyclistResultDTO>> createElement() {
    return _FetchCyclistGeneralResultsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCyclistGeneralResultsProvider && other.dio == dio;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dio.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCyclistGeneralResultsRef
    on AutoDisposeFutureProviderRef<List<CyclistResultDTO>> {
  /// The parameter `dio` of this provider.
  Dio get dio;
}

class _FetchCyclistGeneralResultsProviderElement
    extends AutoDisposeFutureProviderElement<List<CyclistResultDTO>>
    with FetchCyclistGeneralResultsRef {
  _FetchCyclistGeneralResultsProviderElement(super.provider);

  @override
  Dio get dio => (origin as FetchCyclistGeneralResultsProvider).dio;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
