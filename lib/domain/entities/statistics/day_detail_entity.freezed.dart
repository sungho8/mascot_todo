// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DayDetailEntity {
  String get todoId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  String get categoryColor => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get linkedMascotId => throw _privateConstructorUsedError;

  /// Create a copy of DayDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayDetailEntityCopyWith<DayDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayDetailEntityCopyWith<$Res> {
  factory $DayDetailEntityCopyWith(
    DayDetailEntity value,
    $Res Function(DayDetailEntity) then,
  ) = _$DayDetailEntityCopyWithImpl<$Res, DayDetailEntity>;
  @useResult
  $Res call({
    String todoId,
    String title,
    String categoryName,
    String categoryColor,
    DateTime? completedAt,
    String? linkedMascotId,
  });
}

/// @nodoc
class _$DayDetailEntityCopyWithImpl<$Res, $Val extends DayDetailEntity>
    implements $DayDetailEntityCopyWith<$Res> {
  _$DayDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
    Object? title = null,
    Object? categoryName = null,
    Object? categoryColor = null,
    Object? completedAt = freezed,
    Object? linkedMascotId = freezed,
  }) {
    return _then(
      _value.copyWith(
            todoId: null == todoId
                ? _value.todoId
                : todoId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryName: null == categoryName
                ? _value.categoryName
                : categoryName // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryColor: null == categoryColor
                ? _value.categoryColor
                : categoryColor // ignore: cast_nullable_to_non_nullable
                      as String,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            linkedMascotId: freezed == linkedMascotId
                ? _value.linkedMascotId
                : linkedMascotId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DayDetailEntityImplCopyWith<$Res>
    implements $DayDetailEntityCopyWith<$Res> {
  factory _$$DayDetailEntityImplCopyWith(
    _$DayDetailEntityImpl value,
    $Res Function(_$DayDetailEntityImpl) then,
  ) = __$$DayDetailEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String todoId,
    String title,
    String categoryName,
    String categoryColor,
    DateTime? completedAt,
    String? linkedMascotId,
  });
}

/// @nodoc
class __$$DayDetailEntityImplCopyWithImpl<$Res>
    extends _$DayDetailEntityCopyWithImpl<$Res, _$DayDetailEntityImpl>
    implements _$$DayDetailEntityImplCopyWith<$Res> {
  __$$DayDetailEntityImplCopyWithImpl(
    _$DayDetailEntityImpl _value,
    $Res Function(_$DayDetailEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
    Object? title = null,
    Object? categoryName = null,
    Object? categoryColor = null,
    Object? completedAt = freezed,
    Object? linkedMascotId = freezed,
  }) {
    return _then(
      _$DayDetailEntityImpl(
        todoId: null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryName: null == categoryName
            ? _value.categoryName
            : categoryName // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryColor: null == categoryColor
            ? _value.categoryColor
            : categoryColor // ignore: cast_nullable_to_non_nullable
                  as String,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        linkedMascotId: freezed == linkedMascotId
            ? _value.linkedMascotId
            : linkedMascotId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DayDetailEntityImpl implements _DayDetailEntity {
  const _$DayDetailEntityImpl({
    required this.todoId,
    required this.title,
    required this.categoryName,
    required this.categoryColor,
    this.completedAt,
    this.linkedMascotId,
  });

  @override
  final String todoId;
  @override
  final String title;
  @override
  final String categoryName;
  @override
  final String categoryColor;
  @override
  final DateTime? completedAt;
  @override
  final String? linkedMascotId;

  @override
  String toString() {
    return 'DayDetailEntity(todoId: $todoId, title: $title, categoryName: $categoryName, categoryColor: $categoryColor, completedAt: $completedAt, linkedMascotId: $linkedMascotId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayDetailEntityImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.linkedMascotId, linkedMascotId) ||
                other.linkedMascotId == linkedMascotId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    todoId,
    title,
    categoryName,
    categoryColor,
    completedAt,
    linkedMascotId,
  );

  /// Create a copy of DayDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayDetailEntityImplCopyWith<_$DayDetailEntityImpl> get copyWith =>
      __$$DayDetailEntityImplCopyWithImpl<_$DayDetailEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _DayDetailEntity implements DayDetailEntity {
  const factory _DayDetailEntity({
    required final String todoId,
    required final String title,
    required final String categoryName,
    required final String categoryColor,
    final DateTime? completedAt,
    final String? linkedMascotId,
  }) = _$DayDetailEntityImpl;

  @override
  String get todoId;
  @override
  String get title;
  @override
  String get categoryName;
  @override
  String get categoryColor;
  @override
  DateTime? get completedAt;
  @override
  String? get linkedMascotId;

  /// Create a copy of DayDetailEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayDetailEntityImplCopyWith<_$DayDetailEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
