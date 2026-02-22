// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_stat_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HabitStatEntity {
  String get recurringSourceId => throw _privateConstructorUsedError;
  String get habitTitle => throw _privateConstructorUsedError;
  int get dayOfWeek => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Create a copy of HabitStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitStatEntityCopyWith<HabitStatEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitStatEntityCopyWith<$Res> {
  factory $HabitStatEntityCopyWith(
    HabitStatEntity value,
    $Res Function(HabitStatEntity) then,
  ) = _$HabitStatEntityCopyWithImpl<$Res, HabitStatEntity>;
  @useResult
  $Res call({
    String recurringSourceId,
    String habitTitle,
    int dayOfWeek,
    bool isCompleted,
  });
}

/// @nodoc
class _$HabitStatEntityCopyWithImpl<$Res, $Val extends HabitStatEntity>
    implements $HabitStatEntityCopyWith<$Res> {
  _$HabitStatEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitStatEntity
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
abstract class _$$HabitStatEntityImplCopyWith<$Res>
    implements $HabitStatEntityCopyWith<$Res> {
  factory _$$HabitStatEntityImplCopyWith(
    _$HabitStatEntityImpl value,
    $Res Function(_$HabitStatEntityImpl) then,
  ) = __$$HabitStatEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String recurringSourceId,
    String habitTitle,
    int dayOfWeek,
    bool isCompleted,
  });
}

/// @nodoc
class __$$HabitStatEntityImplCopyWithImpl<$Res>
    extends _$HabitStatEntityCopyWithImpl<$Res, _$HabitStatEntityImpl>
    implements _$$HabitStatEntityImplCopyWith<$Res> {
  __$$HabitStatEntityImplCopyWithImpl(
    _$HabitStatEntityImpl _value,
    $Res Function(_$HabitStatEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HabitStatEntity
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
      _$HabitStatEntityImpl(
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

class _$HabitStatEntityImpl implements _HabitStatEntity {
  const _$HabitStatEntityImpl({
    required this.recurringSourceId,
    required this.habitTitle,
    required this.dayOfWeek,
    required this.isCompleted,
  });

  @override
  final String recurringSourceId;
  @override
  final String habitTitle;
  @override
  final int dayOfWeek;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'HabitStatEntity(recurringSourceId: $recurringSourceId, habitTitle: $habitTitle, dayOfWeek: $dayOfWeek, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitStatEntityImpl &&
            (identical(other.recurringSourceId, recurringSourceId) ||
                other.recurringSourceId == recurringSourceId) &&
            (identical(other.habitTitle, habitTitle) ||
                other.habitTitle == habitTitle) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    recurringSourceId,
    habitTitle,
    dayOfWeek,
    isCompleted,
  );

  /// Create a copy of HabitStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitStatEntityImplCopyWith<_$HabitStatEntityImpl> get copyWith =>
      __$$HabitStatEntityImplCopyWithImpl<_$HabitStatEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _HabitStatEntity implements HabitStatEntity {
  const factory _HabitStatEntity({
    required final String recurringSourceId,
    required final String habitTitle,
    required final int dayOfWeek,
    required final bool isCompleted,
  }) = _$HabitStatEntityImpl;

  @override
  String get recurringSourceId;
  @override
  String get habitTitle;
  @override
  int get dayOfWeek;
  @override
  bool get isCompleted;

  /// Create a copy of HabitStatEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitStatEntityImplCopyWith<_$HabitStatEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
