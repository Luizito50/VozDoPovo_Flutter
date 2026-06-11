// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedStreamHash() => r'974ee4b82692ab15753412671f43f28fb9b4dbb5';

/// See also [feedStream].
@ProviderFor(feedStream)
final feedStreamProvider = AutoDisposeStreamProvider<List<Report>>.internal(
  feedStream,
  name: r'feedStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$feedStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FeedStreamRef = AutoDisposeStreamProviderRef<List<Report>>;
String _$nearbyStreamHash() => r'80519223261be1e009ea46548792367c153ec201';

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

/// See also [nearbyStream].
@ProviderFor(nearbyStream)
const nearbyStreamProvider = NearbyStreamFamily();

/// See also [nearbyStream].
class NearbyStreamFamily extends Family<AsyncValue<List<Report>>> {
  /// See also [nearbyStream].
  const NearbyStreamFamily();

  /// See also [nearbyStream].
  NearbyStreamProvider call(
    LatLng center,
  ) {
    return NearbyStreamProvider(
      center,
    );
  }

  @override
  NearbyStreamProvider getProviderOverride(
    covariant NearbyStreamProvider provider,
  ) {
    return call(
      provider.center,
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
  String? get name => r'nearbyStreamProvider';
}

/// See also [nearbyStream].
class NearbyStreamProvider extends AutoDisposeStreamProvider<List<Report>> {
  /// See also [nearbyStream].
  NearbyStreamProvider(
    LatLng center,
  ) : this._internal(
          (ref) => nearbyStream(
            ref as NearbyStreamRef,
            center,
          ),
          from: nearbyStreamProvider,
          name: r'nearbyStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$nearbyStreamHash,
          dependencies: NearbyStreamFamily._dependencies,
          allTransitiveDependencies:
              NearbyStreamFamily._allTransitiveDependencies,
          center: center,
        );

  NearbyStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.center,
  }) : super.internal();

  final LatLng center;

  @override
  Override overrideWith(
    Stream<List<Report>> Function(NearbyStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NearbyStreamProvider._internal(
        (ref) => create(ref as NearbyStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        center: center,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Report>> createElement() {
    return _NearbyStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NearbyStreamProvider && other.center == center;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, center.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NearbyStreamRef on AutoDisposeStreamProviderRef<List<Report>> {
  /// The parameter `center` of this provider.
  LatLng get center;
}

class _NearbyStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<Report>>
    with NearbyStreamRef {
  _NearbyStreamProviderElement(super.provider);

  @override
  LatLng get center => (origin as NearbyStreamProvider).center;
}

String _$reportDetailHash() => r'437a78a54715005dc6c0df0627a4cbdfe2730553';

/// See also [reportDetail].
@ProviderFor(reportDetail)
const reportDetailProvider = ReportDetailFamily();

/// See also [reportDetail].
class ReportDetailFamily extends Family<AsyncValue<Report?>> {
  /// See also [reportDetail].
  const ReportDetailFamily();

  /// See also [reportDetail].
  ReportDetailProvider call(
    String id,
  ) {
    return ReportDetailProvider(
      id,
    );
  }

  @override
  ReportDetailProvider getProviderOverride(
    covariant ReportDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'reportDetailProvider';
}

/// See also [reportDetail].
class ReportDetailProvider extends AutoDisposeFutureProvider<Report?> {
  /// See also [reportDetail].
  ReportDetailProvider(
    String id,
  ) : this._internal(
          (ref) => reportDetail(
            ref as ReportDetailRef,
            id,
          ),
          from: reportDetailProvider,
          name: r'reportDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportDetailHash,
          dependencies: ReportDetailFamily._dependencies,
          allTransitiveDependencies:
              ReportDetailFamily._allTransitiveDependencies,
          id: id,
        );

  ReportDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Report?> Function(ReportDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ReportDetailProvider._internal(
        (ref) => create(ref as ReportDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Report?> createElement() {
    return _ReportDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ReportDetailRef on AutoDisposeFutureProviderRef<Report?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ReportDetailProviderElement
    extends AutoDisposeFutureProviderElement<Report?> with ReportDetailRef {
  _ReportDetailProviderElement(super.provider);

  @override
  String get id => (origin as ReportDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
