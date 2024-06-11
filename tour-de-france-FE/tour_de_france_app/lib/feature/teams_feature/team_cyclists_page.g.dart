// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_cyclists_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchCyclistsByTeamHash() =>
    r'6b470d66936febfa4faac85f22ff2d99fe006d11';

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

/// See also [fetchCyclistsByTeam].
@ProviderFor(fetchCyclistsByTeam)
const fetchCyclistsByTeamProvider = FetchCyclistsByTeamFamily();

/// See also [fetchCyclistsByTeam].
class FetchCyclistsByTeamFamily
    extends Family<AsyncValue<List<CyclistResultDTO>>> {
  /// See also [fetchCyclistsByTeam].
  const FetchCyclistsByTeamFamily();

  /// See also [fetchCyclistsByTeam].
  FetchCyclistsByTeamProvider call(
    Dio dio,
    String teamName,
  ) {
    return FetchCyclistsByTeamProvider(
      dio,
      teamName,
    );
  }

  @override
  FetchCyclistsByTeamProvider getProviderOverride(
    covariant FetchCyclistsByTeamProvider provider,
  ) {
    return call(
      provider.dio,
      provider.teamName,
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
  String? get name => r'fetchCyclistsByTeamProvider';
}

/// See also [fetchCyclistsByTeam].
class FetchCyclistsByTeamProvider
    extends AutoDisposeFutureProvider<List<CyclistResultDTO>> {
  /// See also [fetchCyclistsByTeam].
  FetchCyclistsByTeamProvider(
    Dio dio,
    String teamName,
  ) : this._internal(
          (ref) => fetchCyclistsByTeam(
            ref as FetchCyclistsByTeamRef,
            dio,
            teamName,
          ),
          from: fetchCyclistsByTeamProvider,
          name: r'fetchCyclistsByTeamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCyclistsByTeamHash,
          dependencies: FetchCyclistsByTeamFamily._dependencies,
          allTransitiveDependencies:
              FetchCyclistsByTeamFamily._allTransitiveDependencies,
          dio: dio,
          teamName: teamName,
        );

  FetchCyclistsByTeamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dio,
    required this.teamName,
  }) : super.internal();

  final Dio dio;
  final String teamName;

  @override
  Override overrideWith(
    FutureOr<List<CyclistResultDTO>> Function(FetchCyclistsByTeamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCyclistsByTeamProvider._internal(
        (ref) => create(ref as FetchCyclistsByTeamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dio: dio,
        teamName: teamName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CyclistResultDTO>> createElement() {
    return _FetchCyclistsByTeamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCyclistsByTeamProvider &&
        other.dio == dio &&
        other.teamName == teamName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dio.hashCode);
    hash = _SystemHash.combine(hash, teamName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCyclistsByTeamRef
    on AutoDisposeFutureProviderRef<List<CyclistResultDTO>> {
  /// The parameter `dio` of this provider.
  Dio get dio;

  /// The parameter `teamName` of this provider.
  String get teamName;
}

class _FetchCyclistsByTeamProviderElement
    extends AutoDisposeFutureProviderElement<List<CyclistResultDTO>>
    with FetchCyclistsByTeamRef {
  _FetchCyclistsByTeamProviderElement(super.provider);

  @override
  Dio get dio => (origin as FetchCyclistsByTeamProvider).dio;
  @override
  String get teamName => (origin as FetchCyclistsByTeamProvider).teamName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
