// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mascot_growth_stat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MascotGrowthStatModel _$MascotGrowthStatModelFromJson(
  Map<String, dynamic> json,
) {
  return _MascotGrowthStatModel.fromJson(json);
}

/// @nodoc
mixin _$MascotGrowthStatModel {
  @JsonKey(name: 'mascot_id')
  String get mascotId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mascot_name')
  String get mascotName => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_level')
  int get currentLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_exp')
  double get currentExp => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_exp')
  int get maxExp => throw _privateConstructorUsedError;
  @JsonKey(name: 'linked_todo_count')
  int get linkedTodoCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_unlocked')
  bool get isUnlocked => throw _privateConstructorUsedError;

  /// Serializes this MascotGrowthStatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MascotGrowthStatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MascotGrowthStatModelCopyWith<MascotGrowthStatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MascotGrowthStatModelCopyWith<$Res> {
  factory $MascotGrowthStatModelCopyWith(
    MascotGrowthStatModel value,
    $Res Function(MascotGrowthStatModel) then,
  ) = _$MascotGrowthStatModelCopyWithImpl<$Res, MascotGrowthStatModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'mascot_id') String mascotId,
    @JsonKey(name: 'mascot_name') String mascotName,
    @JsonKey(name: 'current_level') int currentLevel,
    @JsonKey(name: 'current_exp') double currentExp,
    @JsonKey(name: 'max_exp') int maxExp,
    @JsonKey(name: 'linked_todo_count') int linkedTodoCount,
    @JsonKey(name: 'is_unlocked') bool isUnlocked,
  });
}

/// @nodoc
class _$MascotGrowthStatModelCopyWithImpl<
  $Res,
  $Val extends MascotGrowthStatModel
>
    implements $MascotGrowthStatModelCopyWith<$Res> {
  _$MascotGrowthStatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MascotGrowthStatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mascotId = null,
    Object? mascotName = null,
    Object? currentLevel = null,
    Object? currentExp = null,
    Object? maxExp = null,
    Object? linkedTodoCount = null,
    Object? isUnlocked = null,
  }) {
    return _then(
      _value.copyWith(
            mascotId: null == mascotId
                ? _value.mascotId
                : mascotId // ignore: cast_nullable_to_non_nullable
                      as String,
            mascotName: null == mascotName
                ? _value.mascotName
                : mascotName // ignore: cast_nullable_to_non_nullable
                      as String,
            currentLevel: null == currentLevel
                ? _value.currentLevel
                : currentLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            currentExp: null == currentExp
                ? _value.currentExp
                : currentExp // ignore: cast_nullable_to_non_nullable
                      as double,
            maxExp: null == maxExp
                ? _value.maxExp
                : maxExp // ignore: cast_nullable_to_non_nullable
                      as int,
            linkedTodoCount: null == linkedTodoCount
                ? _value.linkedTodoCount
                : linkedTodoCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isUnlocked: null == isUnlocked
                ? _value.isUnlocked
                : isUnlocked // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MascotGrowthStatModelImplCopyWith<$Res>
    implements $MascotGrowthStatModelCopyWith<$Res> {
  factory _$$MascotGrowthStatModelImplCopyWith(
    _$MascotGrowthStatModelImpl value,
    $Res Function(_$MascotGrowthStatModelImpl) then,
  ) = __$$MascotGrowthStatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'mascot_id') String mascotId,
    @JsonKey(name: 'mascot_name') String mascotName,
    @JsonKey(name: 'current_level') int currentLevel,
    @JsonKey(name: 'current_exp') double currentExp,
    @JsonKey(name: 'max_exp') int maxExp,
    @JsonKey(name: 'linked_todo_count') int linkedTodoCount,
    @JsonKey(name: 'is_unlocked') bool isUnlocked,
  });
}

/// @nodoc
class __$$MascotGrowthStatModelImplCopyWithImpl<$Res>
    extends
        _$MascotGrowthStatModelCopyWithImpl<$Res, _$MascotGrowthStatModelImpl>
    implements _$$MascotGrowthStatModelImplCopyWith<$Res> {
  __$$MascotGrowthStatModelImplCopyWithImpl(
    _$MascotGrowthStatModelImpl _value,
    $Res Function(_$MascotGrowthStatModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MascotGrowthStatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mascotId = null,
    Object? mascotName = null,
    Object? currentLevel = null,
    Object? currentExp = null,
    Object? maxExp = null,
    Object? linkedTodoCount = null,
    Object? isUnlocked = null,
  }) {
    return _then(
      _$MascotGrowthStatModelImpl(
        mascotId: null == mascotId
            ? _value.mascotId
            : mascotId // ignore: cast_nullable_to_non_nullable
                  as String,
        mascotName: null == mascotName
            ? _value.mascotName
            : mascotName // ignore: cast_nullable_to_non_nullable
                  as String,
        currentLevel: null == currentLevel
            ? _value.currentLevel
            : currentLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        currentExp: null == currentExp
            ? _value.currentExp
            : currentExp // ignore: cast_nullable_to_non_nullable
                  as double,
        maxExp: null == maxExp
            ? _value.maxExp
            : maxExp // ignore: cast_nullable_to_non_nullable
                  as int,
        linkedTodoCount: null == linkedTodoCount
            ? _value.linkedTodoCount
            : linkedTodoCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isUnlocked: null == isUnlocked
            ? _value.isUnlocked
            : isUnlocked // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MascotGrowthStatModelImpl implements _MascotGrowthStatModel {
  const _$MascotGrowthStatModelImpl({
    @JsonKey(name: 'mascot_id') required this.mascotId,
    @JsonKey(name: 'mascot_name') required this.mascotName,
    @JsonKey(name: 'current_level') required this.currentLevel,
    @JsonKey(name: 'current_exp') required this.currentExp,
    @JsonKey(name: 'max_exp') required this.maxExp,
    @JsonKey(name: 'linked_todo_count') required this.linkedTodoCount,
    @JsonKey(name: 'is_unlocked') required this.isUnlocked,
  });

  factory _$MascotGrowthStatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MascotGrowthStatModelImplFromJson(json);

  @override
  @JsonKey(name: 'mascot_id')
  final String mascotId;
  @override
  @JsonKey(name: 'mascot_name')
  final String mascotName;
  @override
  @JsonKey(name: 'current_level')
  final int currentLevel;
  @override
  @JsonKey(name: 'current_exp')
  final double currentExp;
  @override
  @JsonKey(name: 'max_exp')
  final int maxExp;
  @override
  @JsonKey(name: 'linked_todo_count')
  final int linkedTodoCount;
  @override
  @JsonKey(name: 'is_unlocked')
  final bool isUnlocked;

  @override
  String toString() {
    return 'MascotGrowthStatModel(mascotId: $mascotId, mascotName: $mascotName, currentLevel: $currentLevel, currentExp: $currentExp, maxExp: $maxExp, linkedTodoCount: $linkedTodoCount, isUnlocked: $isUnlocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MascotGrowthStatModelImpl &&
            (identical(other.mascotId, mascotId) ||
                other.mascotId == mascotId) &&
            (identical(other.mascotName, mascotName) ||
                other.mascotName == mascotName) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            (identical(other.currentExp, currentExp) ||
                other.currentExp == currentExp) &&
            (identical(other.maxExp, maxExp) || other.maxExp == maxExp) &&
            (identical(other.linkedTodoCount, linkedTodoCount) ||
                other.linkedTodoCount == linkedTodoCount) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    mascotId,
    mascotName,
    currentLevel,
    currentExp,
    maxExp,
    linkedTodoCount,
    isUnlocked,
  );

  /// Create a copy of MascotGrowthStatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MascotGrowthStatModelImplCopyWith<_$MascotGrowthStatModelImpl>
  get copyWith =>
      __$$MascotGrowthStatModelImplCopyWithImpl<_$MascotGrowthStatModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MascotGrowthStatModelImplToJson(this);
  }
}

abstract class _MascotGrowthStatModel implements MascotGrowthStatModel {
  const factory _MascotGrowthStatModel({
    @JsonKey(name: 'mascot_id') required final String mascotId,
    @JsonKey(name: 'mascot_name') required final String mascotName,
    @JsonKey(name: 'current_level') required final int currentLevel,
    @JsonKey(name: 'current_exp') required final double currentExp,
    @JsonKey(name: 'max_exp') required final int maxExp,
    @JsonKey(name: 'linked_todo_count') required final int linkedTodoCount,
    @JsonKey(name: 'is_unlocked') required final bool isUnlocked,
  }) = _$MascotGrowthStatModelImpl;

  factory _MascotGrowthStatModel.fromJson(Map<String, dynamic> json) =
      _$MascotGrowthStatModelImpl.fromJson;

  @override
  @JsonKey(name: 'mascot_id')
  String get mascotId;
  @override
  @JsonKey(name: 'mascot_name')
  String get mascotName;
  @override
  @JsonKey(name: 'current_level')
  int get currentLevel;
  @override
  @JsonKey(name: 'current_exp')
  double get currentExp;
  @override
  @JsonKey(name: 'max_exp')
  int get maxExp;
  @override
  @JsonKey(name: 'linked_todo_count')
  int get linkedTodoCount;
  @override
  @JsonKey(name: 'is_unlocked')
  bool get isUnlocked;

  /// Create a copy of MascotGrowthStatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MascotGrowthStatModelImplCopyWith<_$MascotGrowthStatModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
