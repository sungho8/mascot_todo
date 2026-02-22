// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_stat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HabitStatModel _$HabitStatModelFromJson(Map<String, dynamic> json) {
  return _HabitStatModel.fromJson(json);
}

/// @nodoc
mixin _$HabitStatModel {
  @JsonKey(name: 'recurring_source_id')
  String get recurringSourceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'habit_title')
  String get habitTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_completed')
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this HabitStatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitStatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitStatModelCopyWith<HabitStatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitStatModelCopyWith<$Res> {
  factory $HabitStatModelCopyWith(
    HabitStatModel value,
    $Res Function(HabitStatModel) then,
  ) = _$HabitStatModelCopyWithImpl<$Res, HabitStatModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'recurring_source_id') String recurringSourceId,
    @JsonKey(name: 'habit_title') String habitTitle,
    @JsonKey(name: 'day_of_week') int dayOfWeek,
    @JsonKey(name: 'is_completed') bool isCompleted,
  });
}

/// @nodoc
class _$HabitStatModelCopyWithImpl<$Res, $Val extends HabitStatModel>
    implements $HabitStatModelCopyWith<$Res> {
  _$HabitStatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitStatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recurringSourceId = null,
    Object? habitTitle = null,
    Object? dayOfWeek = null,
    Object? isCompleted = null,
  }) {
    return _then(
      _value.copyWith(
            recurringSourceId: null == recurringSourceId
                ? _value.recurringSourceId
                : recurringSourceId // ignore: cast_nullable_to_non_nullable
                      as String,
            habitTitle: null == habitTitle
                ? _value.habitTitle
                : habitTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            dayOfWeek: null == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as int,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HabitStatModelImplCopyWith<$Res>
    implements $HabitStatModelCopyWith<$Res> {
  factory _$$HabitStatModelImplCopyWith(
    _$HabitStatModelImpl value,
    $Res Function(_$HabitStatModelImpl) then,
  ) = __$$HabitStatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'recurring_source_id') String recurringSourceId,
    @JsonKey(name: 'habit_title') String habitTitle,
    @JsonKey(name: 'day_of_week') int dayOfWeek,
    @JsonKey(name: 'is_completed') bool isCompleted,
  });
}

/// @nodoc
class __$$HabitStatModelImplCopyWithImpl<$Res>
    extends _$HabitStatModelCopyWithImpl<$Res, _$HabitStatModelImpl>
    implements _$$HabitStatModelImplCopyWith<$Res> {
  __$$HabitStatModelImplCopyWithImpl(
    _$HabitStatModelImpl _value,
    $Res Function(_$HabitStatModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HabitStatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recurringSourceId = null,
    Object? habitTitle = null,
    Object? dayOfWeek = null,
    Object? isCompleted = null,
  }) {
    return _then(
      _$HabitStatModelImpl(
        recurringSourceId: null == recurringSourceId
            ? _value.recurringSourceId
            : recurringSourceId // ignore: cast_nullable_to_non_nullable
                  as String,
        habitTitle: null == habitTitle
            ? _value.habitTitle
            : habitTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        dayOfWeek: null == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as int,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitStatModelImpl implements _HabitStatModel {
  const _$HabitStatModelImpl({
    @JsonKey(name: 'recurring_source_id') required this.recurringSourceId,
    @JsonKey(name: 'habit_title') required this.habitTitle,
    @JsonKey(name: 'day_of_week') required this.dayOfWeek,
    @JsonKey(name: 'is_completed') required this.isCompleted,
  });

  factory _$HabitStatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitStatModelImplFromJson(json);

  @override
  @JsonKey(name: 'recurring_source_id')
  final String recurringSourceId;
  @override
  @JsonKey(name: 'habit_title')
  final String habitTitle;
  @override
  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;
  @override
  @JsonKey(name: 'is_completed')
  final bool isCompleted;

  @override
  String toString() {
    return 'HabitStatModel(recurringSourceId: $recurringSourceId, habitTitle: $habitTitle, dayOfWeek: $dayOfWeek, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitStatModelImpl &&
            (identical(other.recurringSourceId, recurringSourceId) ||
                other.recurringSourceId == recurringSourceId) &&
            (identical(other.habitTitle, habitTitle) ||
                other.habitTitle == habitTitle) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    recurringSourceId,
    habitTitle,
    dayOfWeek,
    isCompleted,
  );

  /// Create a copy of HabitStatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitStatModelImplCopyWith<_$HabitStatModelImpl> get copyWith =>
      __$$HabitStatModelImplCopyWithImpl<_$HabitStatModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitStatModelImplToJson(this);
  }
}

abstract class _HabitStatModel implements HabitStatModel {
  const factory _HabitStatModel({
    @JsonKey(name: 'recurring_source_id')
    required final String recurringSourceId,
    @JsonKey(name: 'habit_title') required final String habitTitle,
    @JsonKey(name: 'day_of_week') required final int dayOfWeek,
    @JsonKey(name: 'is_completed') required final bool isCompleted,
  }) = _$HabitStatModelImpl;

  factory _HabitStatModel.fromJson(Map<String, dynamic> json) =
      _$HabitStatModelImpl.fromJson;

  @override
  @JsonKey(name: 'recurring_source_id')
  String get recurringSourceId;
  @override
  @JsonKey(name: 'habit_title')
  String get habitTitle;
  @override
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek;
  @override
  @JsonKey(name: 'is_completed')
  bool get isCompleted;

  /// Create a copy of HabitStatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitStatModelImplCopyWith<_$HabitStatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
