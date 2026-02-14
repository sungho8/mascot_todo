// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return _TodoModel.fromJson(json);
}

/// @nodoc
mixin _$TodoModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  String? get linkedMascotId => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String get targetDate => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get completedAt => throw _privateConstructorUsedError;
  bool get isFocusTask => throw _privateConstructorUsedError;

  /// Serializes this TodoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoModelCopyWith<TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) then) =
      _$TodoModelCopyWithImpl<$Res, TodoModel>;
  @useResult
  $Res call({
    String id,
    String title,
    bool isCompleted,
    String? linkedMascotId,
    String? categoryId,
    String targetDate,
    String createdAt,
    String? completedAt,
    bool isFocusTask,
  });
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res, $Val extends TodoModel>
    implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
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
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$TodoModelImplCopyWith<$Res>
    implements $TodoModelCopyWith<$Res> {
  factory _$$TodoModelImplCopyWith(
    _$TodoModelImpl value,
    $Res Function(_$TodoModelImpl) then,
  ) = __$$TodoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    bool isCompleted,
    String? linkedMascotId,
    String? categoryId,
    String targetDate,
    String createdAt,
    String? completedAt,
    bool isFocusTask,
  });
}

/// @nodoc
class __$$TodoModelImplCopyWithImpl<$Res>
    extends _$TodoModelCopyWithImpl<$Res, _$TodoModelImpl>
    implements _$$TodoModelImplCopyWith<$Res> {
  __$$TodoModelImplCopyWithImpl(
    _$TodoModelImpl _value,
    $Res Function(_$TodoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompleted = null,
    Object? linkedMascotId = freezed,
    Object? categoryId = freezed,
    Object? targetDate = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? isFocusTask = null,
  }) {
    return _then(
      _$TodoModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        isFocusTask: null == isFocusTask
            ? _value.isFocusTask
            : isFocusTask // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoModelImpl extends _TodoModel {
  const _$TodoModelImpl({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.linkedMascotId,
    this.categoryId,
    required this.targetDate,
    required this.createdAt,
    this.completedAt,
    this.isFocusTask = false,
  }) : super._();

  factory _$TodoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final bool isCompleted;
  @override
  final String? linkedMascotId;
  @override
  final String? categoryId;
  @override
  final String targetDate;
  @override
  final String createdAt;
  @override
  final String? completedAt;
  @override
  @JsonKey()
  final bool isFocusTask;

  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, isCompleted: $isCompleted, linkedMascotId: $linkedMascotId, categoryId: $categoryId, targetDate: $targetDate, createdAt: $createdAt, completedAt: $completedAt, isFocusTask: $isFocusTask)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    isCompleted,
    linkedMascotId,
    categoryId,
    targetDate,
    createdAt,
    completedAt,
    isFocusTask,
  );

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoModelImplCopyWith<_$TodoModelImpl> get copyWith =>
      __$$TodoModelImplCopyWithImpl<_$TodoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoModelImplToJson(this);
  }
}

abstract class _TodoModel extends TodoModel {
  const factory _TodoModel({
    required final String id,
    required final String title,
    required final bool isCompleted,
    final String? linkedMascotId,
    final String? categoryId,
    required final String targetDate,
    required final String createdAt,
    final String? completedAt,
    final bool isFocusTask,
  }) = _$TodoModelImpl;
  const _TodoModel._() : super._();

  factory _TodoModel.fromJson(Map<String, dynamic> json) =
      _$TodoModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  bool get isCompleted;
  @override
  String? get linkedMascotId;
  @override
  String? get categoryId;
  @override
  String get targetDate;
  @override
  String get createdAt;
  @override
  String? get completedAt;
  @override
  bool get isFocusTask;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoModelImplCopyWith<_$TodoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
