// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_comparison_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WeeklyComparisonModel _$WeeklyComparisonModelFromJson(
  Map<String, dynamic> json,
) {
  return _WeeklyComparisonModel.fromJson(json);
}

/// @nodoc
mixin _$WeeklyComparisonModel {
  @JsonKey(name: 'this_week_count')
  int get thisWeekCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_week_count')
  int get lastWeekCount => throw _privateConstructorUsedError; // JSON might return int or double for numeric, handle via conversion
  @JsonKey(name: 'change_percent')
  double get changePercent => throw _privateConstructorUsedError;

  /// Serializes this WeeklyComparisonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyComparisonModelCopyWith<WeeklyComparisonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyComparisonModelCopyWith<$Res> {
  factory $WeeklyComparisonModelCopyWith(
    WeeklyComparisonModel value,
    $Res Function(WeeklyComparisonModel) then,
  ) = _$WeeklyComparisonModelCopyWithImpl<$Res, WeeklyComparisonModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'this_week_count') int thisWeekCount,
    @JsonKey(name: 'last_week_count') int lastWeekCount,
    @JsonKey(name: 'change_percent') double changePercent,
  });
}

/// @nodoc
class _$WeeklyComparisonModelCopyWithImpl<
  $Res,
  $Val extends WeeklyComparisonModel
>
    implements $WeeklyComparisonModelCopyWith<$Res> {
  _$WeeklyComparisonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyComparisonModel
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
abstract class _$$WeeklyComparisonModelImplCopyWith<$Res>
    implements $WeeklyComparisonModelCopyWith<$Res> {
  factory _$$WeeklyComparisonModelImplCopyWith(
    _$WeeklyComparisonModelImpl value,
    $Res Function(_$WeeklyComparisonModelImpl) then,
  ) = __$$WeeklyComparisonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'this_week_count') int thisWeekCount,
    @JsonKey(name: 'last_week_count') int lastWeekCount,
    @JsonKey(name: 'change_percent') double changePercent,
  });
}

/// @nodoc
class __$$WeeklyComparisonModelImplCopyWithImpl<$Res>
    extends
        _$WeeklyComparisonModelCopyWithImpl<$Res, _$WeeklyComparisonModelImpl>
    implements _$$WeeklyComparisonModelImplCopyWith<$Res> {
  __$$WeeklyComparisonModelImplCopyWithImpl(
    _$WeeklyComparisonModelImpl _value,
    $Res Function(_$WeeklyComparisonModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thisWeekCount = null,
    Object? lastWeekCount = null,
    Object? changePercent = null,
  }) {
    return _then(
      _$WeeklyComparisonModelImpl(
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
@JsonSerializable()
class _$WeeklyComparisonModelImpl implements _WeeklyComparisonModel {
  const _$WeeklyComparisonModelImpl({
    @JsonKey(name: 'this_week_count') required this.thisWeekCount,
    @JsonKey(name: 'last_week_count') required this.lastWeekCount,
    @JsonKey(name: 'change_percent') required this.changePercent,
  });

  factory _$WeeklyComparisonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyComparisonModelImplFromJson(json);

  @override
  @JsonKey(name: 'this_week_count')
  final int thisWeekCount;
  @override
  @JsonKey(name: 'last_week_count')
  final int lastWeekCount;
  // JSON might return int or double for numeric, handle via conversion
  @override
  @JsonKey(name: 'change_percent')
  final double changePercent;

  @override
  String toString() {
    return 'WeeklyComparisonModel(thisWeekCount: $thisWeekCount, lastWeekCount: $lastWeekCount, changePercent: $changePercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyComparisonModelImpl &&
            (identical(other.thisWeekCount, thisWeekCount) ||
                other.thisWeekCount == thisWeekCount) &&
            (identical(other.lastWeekCount, lastWeekCount) ||
                other.lastWeekCount == lastWeekCount) &&
            (identical(other.changePercent, changePercent) ||
                other.changePercent == changePercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, thisWeekCount, lastWeekCount, changePercent);

  /// Create a copy of WeeklyComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyComparisonModelImplCopyWith<_$WeeklyComparisonModelImpl>
  get copyWith =>
      __$$WeeklyComparisonModelImplCopyWithImpl<_$WeeklyComparisonModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyComparisonModelImplToJson(this);
  }
}

abstract class _WeeklyComparisonModel implements WeeklyComparisonModel {
  const factory _WeeklyComparisonModel({
    @JsonKey(name: 'this_week_count') required final int thisWeekCount,
    @JsonKey(name: 'last_week_count') required final int lastWeekCount,
    @JsonKey(name: 'change_percent') required final double changePercent,
  }) = _$WeeklyComparisonModelImpl;

  factory _WeeklyComparisonModel.fromJson(Map<String, dynamic> json) =
      _$WeeklyComparisonModelImpl.fromJson;

  @override
  @JsonKey(name: 'this_week_count')
  int get thisWeekCount;
  @override
  @JsonKey(name: 'last_week_count')
  int get lastWeekCount; // JSON might return int or double for numeric, handle via conversion
  @override
  @JsonKey(name: 'change_percent')
  double get changePercent;

  /// Create a copy of WeeklyComparisonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyComparisonModelImplCopyWith<_$WeeklyComparisonModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
