// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hourly_stat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HourlyStatEntity {
  int get hourOfDay => throw _privateConstructorUsedError;
  int get completedCount => throw _privateConstructorUsedError;

  /// Create a copy of HourlyStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyStatEntityCopyWith<HourlyStatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyStatEntityCopyWith<$Res> {
  factory $HourlyStatEntityCopyWith(
    HourlyStatEntity value,
    $Res Function(HourlyStatEntity) then,
  ) = _$HourlyStatEntityCopyWithImpl<$Res, HourlyStatEntity>;
  @useResult
  $Res call({int hourOfDay, int completedCount});
}

/// @nodoc
class _$HourlyStatEntityCopyWithImpl<$Res, $Val extends HourlyStatEntity>
    implements $HourlyStatEntityCopyWith<$Res> {
  _$HourlyStatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hourOfDay = null, Object? completedCount = null}) {
    return _then(
      _value.copyWith(
            hourOfDay: null == hourOfDay
                ? _value.hourOfDay
                : hourOfDay // ignore: cast_nullable_to_non_nullable
                      as int,
            completedCount: null == completedCount
                ? _value.completedCount
                : completedCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HourlyStatEntityImplCopyWith<$Res>
    implements $HourlyStatEntityCopyWith<$Res> {
  factory _$$HourlyStatEntityImplCopyWith(
    _$HourlyStatEntityImpl value,
    $Res Function(_$HourlyStatEntityImpl) then,
  ) = __$$HourlyStatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hourOfDay, int completedCount});
}

/// @nodoc
class __$$HourlyStatEntityImplCopyWithImpl<$Res>
    extends _$HourlyStatEntityCopyWithImpl<$Res, _$HourlyStatEntityImpl>
    implements _$$HourlyStatEntityImplCopyWith<$Res> {
  __$$HourlyStatEntityImplCopyWithImpl(
    _$HourlyStatEntityImpl _value,
    $Res Function(_$HourlyStatEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HourlyStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hourOfDay = null, Object? completedCount = null}) {
    return _then(
      _$HourlyStatEntityImpl(
        hourOfDay: null == hourOfDay
            ? _value.hourOfDay
            : hourOfDay // ignore: cast_nullable_to_non_nullable
                  as int,
        completedCount: null == completedCount
            ? _value.completedCount
            : completedCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$HourlyStatEntityImpl implements _HourlyStatEntity {
  const _$HourlyStatEntityImpl({
    required this.hourOfDay,
    required this.completedCount,
  });

  @override
  final int hourOfDay;
  @override
  final int completedCount;

  @override
  String toString() {
    return 'HourlyStatEntity(hourOfDay: $hourOfDay, completedCount: $completedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyStatEntityImpl &&
            (identical(other.hourOfDay, hourOfDay) ||
                other.hourOfDay == hourOfDay) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hourOfDay, completedCount);

  /// Create a copy of HourlyStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyStatEntityImplCopyWith<_$HourlyStatEntityImpl> get copyWith =>
      __$$HourlyStatEntityImplCopyWithImpl<_$HourlyStatEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _HourlyStatEntity implements HourlyStatEntity {
  const factory _HourlyStatEntity({
    required final int hourOfDay,
    required final int completedCount,
  }) = _$HourlyStatEntityImpl;

  @override
  int get hourOfDay;
  @override
  int get completedCount;

  /// Create a copy of HourlyStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyStatEntityImplCopyWith<_$HourlyStatEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
