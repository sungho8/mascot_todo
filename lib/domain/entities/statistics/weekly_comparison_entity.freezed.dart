// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_comparison_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$WeeklyComparisonEntity {
  int get thisWeekCount => throw _privateConstructorUsedError;
  int get lastWeekCount => throw _privateConstructorUsedError;
  double get changePercent => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyComparisonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyComparisonEntityCopyWith<WeeklyComparisonEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyComparisonEntityCopyWith<$Res> {
  factory $WeeklyComparisonEntityCopyWith(
    WeeklyComparisonEntity value,
    $Res Function(WeeklyComparisonEntity) then,
  ) = _$WeeklyComparisonEntityCopyWithImpl<$Res, WeeklyComparisonEntity>;
  @useResult
  $Res call({int thisWeekCount, int lastWeekCount, double changePercent});
}

/// @nodoc
class _$WeeklyComparisonEntityCopyWithImpl<
  $Res,
  $Val extends WeeklyComparisonEntity
>
    implements $WeeklyComparisonEntityCopyWith<$Res> {
  _$WeeklyComparisonEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyComparisonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thisWeekCount = null,
    Object? lastWeekCount = null,
    Object? changePercent = null,
  }) {
    return _then(
      _value.copyWith(
            thisWeekCount: null == thisWeekCount
                ? _value.thisWeekCount
                : thisWeekCount // ignore: cast_nullable_to_non_nullable
                      as int,
            lastWeekCount: null == lastWeekCount
                ? _value.lastWeekCount
                : lastWeekCount // ignore: cast_nullable_to_non_nullable
                      as int,
            changePercent: null == changePercent
                ? _value.changePercent
                : changePercent // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeeklyComparisonEntityImplCopyWith<$Res>
    implements $WeeklyComparisonEntityCopyWith<$Res> {
  factory _$$WeeklyComparisonEntityImplCopyWith(
    _$WeeklyComparisonEntityImpl value,
    $Res Function(_$WeeklyComparisonEntityImpl) then,
  ) = __$$WeeklyComparisonEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int thisWeekCount, int lastWeekCount, double changePercent});
}

/// @nodoc
class __$$WeeklyComparisonEntityImplCopyWithImpl<$Res>
    extends
        _$WeeklyComparisonEntityCopyWithImpl<$Res, _$WeeklyComparisonEntityImpl>
    implements _$$WeeklyComparisonEntityImplCopyWith<$Res> {
  __$$WeeklyComparisonEntityImplCopyWithImpl(
    _$WeeklyComparisonEntityImpl _value,
    $Res Function(_$WeeklyComparisonEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyComparisonEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thisWeekCount = null,
    Object? lastWeekCount = null,
    Object? changePercent = null,
  }) {
    return _then(
      _$WeeklyComparisonEntityImpl(
        thisWeekCount: null == thisWeekCount
            ? _value.thisWeekCount
            : thisWeekCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lastWeekCount: null == lastWeekCount
            ? _value.lastWeekCount
            : lastWeekCount // ignore: cast_nullable_to_non_nullable
                  as int,
        changePercent: null == changePercent
            ? _value.changePercent
            : changePercent // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$WeeklyComparisonEntityImpl implements _WeeklyComparisonEntity {
  const _$WeeklyComparisonEntityImpl({
    required this.thisWeekCount,
    required this.lastWeekCount,
    required this.changePercent,
  });

  @override
  final int thisWeekCount;
  @override
  final int lastWeekCount;
  @override
  final double changePercent;

  @override
  String toString() {
    return 'WeeklyComparisonEntity(thisWeekCount: $thisWeekCount, lastWeekCount: $lastWeekCount, changePercent: $changePercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyComparisonEntityImpl &&
            (identical(other.thisWeekCount, thisWeekCount) ||
                other.thisWeekCount == thisWeekCount) &&
            (identical(other.lastWeekCount, lastWeekCount) ||
                other.lastWeekCount == lastWeekCount) &&
            (identical(other.changePercent, changePercent) ||
                other.changePercent == changePercent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, thisWeekCount, lastWeekCount, changePercent);

  /// Create a copy of WeeklyComparisonEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyComparisonEntityImplCopyWith<_$WeeklyComparisonEntityImpl>
  get copyWith =>
      __$$WeeklyComparisonEntityImplCopyWithImpl<_$WeeklyComparisonEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _WeeklyComparisonEntity implements WeeklyComparisonEntity {
  const factory _WeeklyComparisonEntity({
    required final int thisWeekCount,
    required final int lastWeekCount,
    required final double changePercent,
  }) = _$WeeklyComparisonEntityImpl;

  @override
  int get thisWeekCount;
  @override
  int get lastWeekCount;
  @override
  double get changePercent;

  /// Create a copy of WeeklyComparisonEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyComparisonEntityImplCopyWith<_$WeeklyComparisonEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
