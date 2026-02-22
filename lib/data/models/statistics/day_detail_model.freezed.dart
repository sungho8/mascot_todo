// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DayDetailModel _$DayDetailModelFromJson(Map<String, dynamic> json) {
  return _DayDetailModel.fromJson(json);
}

/// @nodoc
mixin _$DayDetailModel {
  @JsonKey(name: 'todo_id')
  String get todoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_color')
  String get categoryColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'linked_mascot_id')
  String? get linkedMascotId => throw _privateConstructorUsedError;

  /// Serializes this DayDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayDetailModelCopyWith<DayDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayDetailModelCopyWith<$Res> {
  factory $DayDetailModelCopyWith(
    DayDetailModel value,
    $Res Function(DayDetailModel) then,
  ) = _$DayDetailModelCopyWithImpl<$Res, DayDetailModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'todo_id') String todoId,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'category_name') String categoryName,
    @JsonKey(name: 'category_color') String categoryColor,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'linked_mascot_id') String? linkedMascotId,
  });
}

/// @nodoc
class _$DayDetailModelCopyWithImpl<$Res, $Val extends DayDetailModel>
    implements $DayDetailModelCopyWith<$Res> {
  _$DayDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayDetailModel
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
abstract class _$$DayDetailModelImplCopyWith<$Res>
    implements $DayDetailModelCopyWith<$Res> {
  factory _$$DayDetailModelImplCopyWith(
    _$DayDetailModelImpl value,
    $Res Function(_$DayDetailModelImpl) then,
  ) = __$$DayDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'todo_id') String todoId,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'category_name') String categoryName,
    @JsonKey(name: 'category_color') String categoryColor,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'linked_mascot_id') String? linkedMascotId,
  });
}

/// @nodoc
class __$$DayDetailModelImplCopyWithImpl<$Res>
    extends _$DayDetailModelCopyWithImpl<$Res, _$DayDetailModelImpl>
    implements _$$DayDetailModelImplCopyWith<$Res> {
  __$$DayDetailModelImplCopyWithImpl(
    _$DayDetailModelImpl _value,
    $Res Function(_$DayDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DayDetailModel
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
      _$DayDetailModelImpl(
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
@JsonSerializable()
class _$DayDetailModelImpl implements _DayDetailModel {
  const _$DayDetailModelImpl({
    @JsonKey(name: 'todo_id') required this.todoId,
    @JsonKey(name: 'title') required this.title,
    @JsonKey(name: 'category_name') required this.categoryName,
    @JsonKey(name: 'category_color') required this.categoryColor,
    @JsonKey(name: 'completed_at') this.completedAt,
    @JsonKey(name: 'linked_mascot_id') this.linkedMascotId,
  });

  factory _$DayDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DayDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'todo_id')
  final String todoId;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'category_color')
  final String categoryColor;
  @override
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;
  @override
  @JsonKey(name: 'linked_mascot_id')
  final String? linkedMascotId;

  @override
  String toString() {
    return 'DayDetailModel(todoId: $todoId, title: $title, categoryName: $categoryName, categoryColor: $categoryColor, completedAt: $completedAt, linkedMascotId: $linkedMascotId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayDetailModelImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of DayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayDetailModelImplCopyWith<_$DayDetailModelImpl> get copyWith =>
      __$$DayDetailModelImplCopyWithImpl<_$DayDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DayDetailModelImplToJson(this);
  }
}

abstract class _DayDetailModel implements DayDetailModel {
  const factory _DayDetailModel({
    @JsonKey(name: 'todo_id') required final String todoId,
    @JsonKey(name: 'title') required final String title,
    @JsonKey(name: 'category_name') required final String categoryName,
    @JsonKey(name: 'category_color') required final String categoryColor,
    @JsonKey(name: 'completed_at') final DateTime? completedAt,
    @JsonKey(name: 'linked_mascot_id') final String? linkedMascotId,
  }) = _$DayDetailModelImpl;

  factory _DayDetailModel.fromJson(Map<String, dynamic> json) =
      _$DayDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'todo_id')
  String get todoId;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'category_color')
  String get categoryColor;
  @override
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt;
  @override
  @JsonKey(name: 'linked_mascot_id')
  String? get linkedMascotId;

  /// Create a copy of DayDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayDetailModelImplCopyWith<_$DayDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
