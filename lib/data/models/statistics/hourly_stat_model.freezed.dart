// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hourly_stat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HourlyStatModel _$HourlyStatModelFromJson(Map<String, dynamic> json) {
  return _HourlyStatModel.fromJson(json);
}

/// @nodoc
mixin _$HourlyStatModel {
  @JsonKey(name: 'hour_of_day')
  int get hourOfDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_count')
  int get completedCount => throw _privateConstructorUsedError;

  /// Serializes this HourlyStatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlyStatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyStatModelCopyWith<HourlyStatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyStatModelCopyWith<$Res> {
  factory $HourlyStatModelCopyWith(
    HourlyStatModel value,
    $Res Function(HourlyStatModel) then,
  ) = _$HourlyStatModelCopyWithImpl<$Res, HourlyStatModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'hour_of_day') int hourOfDay,
    @JsonKey(name: 'completed_count') int completedCount,
  });
}

/// @nodoc
class _$HourlyStatModelCopyWithImpl<$Res, $Val extends HourlyStatModel>
    implements $HourlyStatModelCopyWith<$Res> {
  _$HourlyStatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyStatModel
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
abstract class _$$HourlyStatModelImplCopyWith<$Res>
    implements $HourlyStatModelCopyWith<$Res> {
  factory _$$HourlyStatModelImplCopyWith(
    _$HourlyStatModelImpl value,
    $Res Function(_$HourlyStatModelImpl) then,
  ) = __$$HourlyStatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'hour_of_day') int hourOfDay,
    @JsonKey(name: 'completed_count') int completedCount,
  });
}

/// @nodoc
class __$$HourlyStatModelImplCopyWithImpl<$Res>
    extends _$HourlyStatModelCopyWithImpl<$Res, _$HourlyStatModelImpl>
    implements _$$HourlyStatModelImplCopyWith<$Res> {
  __$$HourlyStatModelImplCopyWithImpl(
    _$HourlyStatModelImpl _value,
    $Res Function(_$HourlyStatModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HourlyStatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? hourOfDay = null, Object? completedCount = null}) {
    return _then(
      _$HourlyStatModelImpl(
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
@JsonSerializable()
class _$HourlyStatModelImpl implements _HourlyStatModel {
  const _$HourlyStatModelImpl({
    @JsonKey(name: 'hour_of_day') required this.hourOfDay,
    @JsonKey(name: 'completed_count') required this.completedCount,
  });

  factory _$HourlyStatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyStatModelImplFromJson(json);

  @override
  @JsonKey(name: 'hour_of_day')
  final int hourOfDay;
  @override
  @JsonKey(name: 'completed_count')
  final int completedCount;

  @override
  String toString() {
    return 'HourlyStatModel(hourOfDay: $hourOfDay, completedCount: $completedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyStatModelImpl &&
            (identical(other.hourOfDay, hourOfDay) ||
                other.hourOfDay == hourOfDay) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hourOfDay, completedCount);

  /// Create a copy of HourlyStatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyStatModelImplCopyWith<_$HourlyStatModelImpl> get copyWith =>
      __$$HourlyStatModelImplCopyWithImpl<_$HourlyStatModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyStatModelImplToJson(this);
  }
}

abstract class _HourlyStatModel implements HourlyStatModel {
  const factory _HourlyStatModel({
    @JsonKey(name: 'hour_of_day') required final int hourOfDay,
    @JsonKey(name: 'completed_count') required final int completedCount,
  }) = _$HourlyStatModelImpl;

  factory _HourlyStatModel.fromJson(Map<String, dynamic> json) =
      _$HourlyStatModelImpl.fromJson;

  @override
  @JsonKey(name: 'hour_of_day')
  int get hourOfDay;
  @override
  @JsonKey(name: 'completed_count')
  int get completedCount;

  /// Create a copy of HourlyStatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyStatModelImplCopyWith<_$HourlyStatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
