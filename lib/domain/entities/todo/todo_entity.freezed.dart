// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TodoEntity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  String? get linkedMascotId => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  DateTime get targetDate => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  bool get isFocusTask => throw _privateConstructorUsedError;

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoEntityCopyWith<TodoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoEntityCopyWith<$Res> {
  factory $TodoEntityCopyWith(
    TodoEntity value,
    $Res Function(TodoEntity) then,
  ) = _$TodoEntityCopyWithImpl<$Res, TodoEntity>;
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    bool isCompleted,
    String? linkedMascotId,
    String? categoryId,
    DateTime targetDate,
    DateTime createdAt,
    DateTime? completedAt,
    bool isFocusTask,
  });
}

/// @nodoc
class _$TodoEntityCopyWithImpl<$Res, $Val extends TodoEntity>
    implements $TodoEntityCopyWith<$Res> {
  _$TodoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? isCompleted = null,
    Object? linkedMascotId = freezed,
    Object? categoryId = freezed,
    Object? targetDate = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? isFocusTask = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            linkedMascotId: freezed == linkedMascotId
                ? _value.linkedMascotId
                : linkedMascotId // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            targetDate: null == targetDate
                ? _value.targetDate
                : targetDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isFocusTask: null == isFocusTask
                ? _value.isFocusTask
                : isFocusTask // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodoEntityImplCopyWith<$Res>
    implements $TodoEntityCopyWith<$Res> {
  factory _$$TodoEntityImplCopyWith(
    _$TodoEntityImpl value,
    $Res Function(_$TodoEntityImpl) then,
  ) = __$$TodoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    bool isCompleted,
    String? linkedMascotId,
    String? categoryId,
    DateTime targetDate,
    DateTime createdAt,
    DateTime? completedAt,
    bool isFocusTask,
  });
}

/// @nodoc
class __$$TodoEntityImplCopyWithImpl<$Res>
    extends _$TodoEntityCopyWithImpl<$Res, _$TodoEntityImpl>
    implements _$$TodoEntityImplCopyWith<$Res> {
  __$$TodoEntityImplCopyWithImpl(
    _$TodoEntityImpl _value,
    $Res Function(_$TodoEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? isCompleted = null,
    Object? linkedMascotId = freezed,
    Object? categoryId = freezed,
    Object? targetDate = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? isFocusTask = null,
  }) {
    return _then(
      _$TodoEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        linkedMascotId: freezed == linkedMascotId
            ? _value.linkedMascotId
            : linkedMascotId // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        targetDate: null == targetDate
            ? _value.targetDate
            : targetDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isFocusTask: null == isFocusTask
            ? _value.isFocusTask
            : isFocusTask // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$TodoEntityImpl implements _TodoEntity {
  const _$TodoEntityImpl({
    required this.id,
    required this.title,
    this.description,
    required this.isCompleted,
    this.linkedMascotId,
    this.categoryId,
    required this.targetDate,
    required this.createdAt,
    this.completedAt,
    required this.isFocusTask,
  });

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final bool isCompleted;
  @override
  final String? linkedMascotId;
  @override
  final String? categoryId;
  @override
  final DateTime targetDate;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;
  @override
  final bool isFocusTask;

  @override
  String toString() {
    return 'TodoEntity(id: $id, title: $title, description: $description, isCompleted: $isCompleted, linkedMascotId: $linkedMascotId, categoryId: $categoryId, targetDate: $targetDate, createdAt: $createdAt, completedAt: $completedAt, isFocusTask: $isFocusTask)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.linkedMascotId, linkedMascotId) ||
                other.linkedMascotId == linkedMascotId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.isFocusTask, isFocusTask) ||
                other.isFocusTask == isFocusTask));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    isCompleted,
    linkedMascotId,
    categoryId,
    targetDate,
    createdAt,
    completedAt,
    isFocusTask,
  );

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoEntityImplCopyWith<_$TodoEntityImpl> get copyWith =>
      __$$TodoEntityImplCopyWithImpl<_$TodoEntityImpl>(this, _$identity);
}

abstract class _TodoEntity implements TodoEntity {
  const factory _TodoEntity({
    required final String id,
    required final String title,
    final String? description,
    required final bool isCompleted,
    final String? linkedMascotId,
    final String? categoryId,
    required final DateTime targetDate,
    required final DateTime createdAt,
    final DateTime? completedAt,
    required final bool isFocusTask,
  }) = _$TodoEntityImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  bool get isCompleted;
  @override
  String? get linkedMascotId;
  @override
  String? get categoryId;
  @override
  DateTime get targetDate;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;
  @override
  bool get isFocusTask;

  /// Create a copy of TodoEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoEntityImplCopyWith<_$TodoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
