// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mascot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MascotModel _$MascotModelFromJson(Map<String, dynamic> json) {
  return _MascotModel.fromJson(json);
}

/// @nodoc
mixin _$MascotModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_path')
  String get imagePath => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_exp')
  double get currentExp => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_exp')
  double get maxExp => throw _privateConstructorUsedError;
  @JsonKey(name: 'unlock_condition_type')
  String get unlockConditionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'unlock_condition_value')
  int get unlockConditionValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'unlock_description')
  String get unlockDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_unlocked')
  bool get isUnlocked => throw _privateConstructorUsedError;

  /// Serializes this MascotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MascotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MascotModelCopyWith<MascotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MascotModelCopyWith<$Res> {
  factory $MascotModelCopyWith(
    MascotModel value,
    $Res Function(MascotModel) then,
  ) = _$MascotModelCopyWithImpl<$Res, MascotModel>;
  @useResult
  $Res call({
    String id,
    String name,
    @JsonKey(name: 'image_path') String imagePath,
    int level,
    @JsonKey(name: 'current_exp') double currentExp,
    @JsonKey(name: 'max_exp') double maxExp,
    @JsonKey(name: 'unlock_condition_type') String unlockConditionType,
    @JsonKey(name: 'unlock_condition_value') int unlockConditionValue,
    @JsonKey(name: 'unlock_description') String unlockDescription,
    @JsonKey(name: 'is_default') bool isDefault,
    @JsonKey(name: 'is_unlocked') bool isUnlocked,
  });
}

/// @nodoc
class _$MascotModelCopyWithImpl<$Res, $Val extends MascotModel>
    implements $MascotModelCopyWith<$Res> {
  _$MascotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MascotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imagePath = null,
    Object? level = null,
    Object? currentExp = null,
    Object? maxExp = null,
    Object? unlockConditionType = null,
    Object? unlockConditionValue = null,
    Object? unlockDescription = null,
    Object? isDefault = null,
    Object? isUnlocked = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            imagePath: null == imagePath
                ? _value.imagePath
                : imagePath // ignore: cast_nullable_to_non_nullable
                      as String,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int,
            currentExp: null == currentExp
                ? _value.currentExp
                : currentExp // ignore: cast_nullable_to_non_nullable
                      as double,
            maxExp: null == maxExp
                ? _value.maxExp
                : maxExp // ignore: cast_nullable_to_non_nullable
                      as double,
            unlockConditionType: null == unlockConditionType
                ? _value.unlockConditionType
                : unlockConditionType // ignore: cast_nullable_to_non_nullable
                      as String,
            unlockConditionValue: null == unlockConditionValue
                ? _value.unlockConditionValue
                : unlockConditionValue // ignore: cast_nullable_to_non_nullable
                      as int,
            unlockDescription: null == unlockDescription
                ? _value.unlockDescription
                : unlockDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$MascotModelImplCopyWith<$Res>
    implements $MascotModelCopyWith<$Res> {
  factory _$$MascotModelImplCopyWith(
    _$MascotModelImpl value,
    $Res Function(_$MascotModelImpl) then,
  ) = __$$MascotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    @JsonKey(name: 'image_path') String imagePath,
    int level,
    @JsonKey(name: 'current_exp') double currentExp,
    @JsonKey(name: 'max_exp') double maxExp,
    @JsonKey(name: 'unlock_condition_type') String unlockConditionType,
    @JsonKey(name: 'unlock_condition_value') int unlockConditionValue,
    @JsonKey(name: 'unlock_description') String unlockDescription,
    @JsonKey(name: 'is_default') bool isDefault,
    @JsonKey(name: 'is_unlocked') bool isUnlocked,
  });
}

/// @nodoc
class __$$MascotModelImplCopyWithImpl<$Res>
    extends _$MascotModelCopyWithImpl<$Res, _$MascotModelImpl>
    implements _$$MascotModelImplCopyWith<$Res> {
  __$$MascotModelImplCopyWithImpl(
    _$MascotModelImpl _value,
    $Res Function(_$MascotModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MascotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imagePath = null,
    Object? level = null,
    Object? currentExp = null,
    Object? maxExp = null,
    Object? unlockConditionType = null,
    Object? unlockConditionValue = null,
    Object? unlockDescription = null,
    Object? isDefault = null,
    Object? isUnlocked = null,
  }) {
    return _then(
      _$MascotModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        imagePath: null == imagePath
            ? _value.imagePath
            : imagePath // ignore: cast_nullable_to_non_nullable
                  as String,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int,
        currentExp: null == currentExp
            ? _value.currentExp
            : currentExp // ignore: cast_nullable_to_non_nullable
                  as double,
        maxExp: null == maxExp
            ? _value.maxExp
            : maxExp // ignore: cast_nullable_to_non_nullable
                  as double,
        unlockConditionType: null == unlockConditionType
            ? _value.unlockConditionType
            : unlockConditionType // ignore: cast_nullable_to_non_nullable
                  as String,
        unlockConditionValue: null == unlockConditionValue
            ? _value.unlockConditionValue
            : unlockConditionValue // ignore: cast_nullable_to_non_nullable
                  as int,
        unlockDescription: null == unlockDescription
            ? _value.unlockDescription
            : unlockDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$MascotModelImpl extends _MascotModel {
  const _$MascotModelImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'image_path') required this.imagePath,
    this.level = 1,
    @JsonKey(name: 'current_exp') this.currentExp = 0.0,
    @JsonKey(name: 'max_exp') this.maxExp = 100.0,
    @JsonKey(name: 'unlock_condition_type') required this.unlockConditionType,
    @JsonKey(name: 'unlock_condition_value') required this.unlockConditionValue,
    @JsonKey(name: 'unlock_description') required this.unlockDescription,
    @JsonKey(name: 'is_default') required this.isDefault,
    @JsonKey(name: 'is_unlocked') this.isUnlocked = false,
  }) : super._();

  factory _$MascotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MascotModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'image_path')
  final String imagePath;
  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey(name: 'current_exp')
  final double currentExp;
  @override
  @JsonKey(name: 'max_exp')
  final double maxExp;
  @override
  @JsonKey(name: 'unlock_condition_type')
  final String unlockConditionType;
  @override
  @JsonKey(name: 'unlock_condition_value')
  final int unlockConditionValue;
  @override
  @JsonKey(name: 'unlock_description')
  final String unlockDescription;
  @override
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  @JsonKey(name: 'is_unlocked')
  final bool isUnlocked;

  @override
  String toString() {
    return 'MascotModel(id: $id, name: $name, imagePath: $imagePath, level: $level, currentExp: $currentExp, maxExp: $maxExp, unlockConditionType: $unlockConditionType, unlockConditionValue: $unlockConditionValue, unlockDescription: $unlockDescription, isDefault: $isDefault, isUnlocked: $isUnlocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MascotModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.currentExp, currentExp) ||
                other.currentExp == currentExp) &&
            (identical(other.maxExp, maxExp) || other.maxExp == maxExp) &&
            (identical(other.unlockConditionType, unlockConditionType) ||
                other.unlockConditionType == unlockConditionType) &&
            (identical(other.unlockConditionValue, unlockConditionValue) ||
                other.unlockConditionValue == unlockConditionValue) &&
            (identical(other.unlockDescription, unlockDescription) ||
                other.unlockDescription == unlockDescription) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.isUnlocked, isUnlocked) ||
                other.isUnlocked == isUnlocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    imagePath,
    level,
    currentExp,
    maxExp,
    unlockConditionType,
    unlockConditionValue,
    unlockDescription,
    isDefault,
    isUnlocked,
  );

  /// Create a copy of MascotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MascotModelImplCopyWith<_$MascotModelImpl> get copyWith =>
      __$$MascotModelImplCopyWithImpl<_$MascotModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MascotModelImplToJson(this);
  }
}

abstract class _MascotModel extends MascotModel {
  const factory _MascotModel({
    required final String id,
    required final String name,
    @JsonKey(name: 'image_path') required final String imagePath,
    final int level,
    @JsonKey(name: 'current_exp') final double currentExp,
    @JsonKey(name: 'max_exp') final double maxExp,
    @JsonKey(name: 'unlock_condition_type')
    required final String unlockConditionType,
    @JsonKey(name: 'unlock_condition_value')
    required final int unlockConditionValue,
    @JsonKey(name: 'unlock_description')
    required final String unlockDescription,
    @JsonKey(name: 'is_default') required final bool isDefault,
    @JsonKey(name: 'is_unlocked') final bool isUnlocked,
  }) = _$MascotModelImpl;
  const _MascotModel._() : super._();

  factory _MascotModel.fromJson(Map<String, dynamic> json) =
      _$MascotModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'image_path')
  String get imagePath;
  @override
  int get level;
  @override
  @JsonKey(name: 'current_exp')
  double get currentExp;
  @override
  @JsonKey(name: 'max_exp')
  double get maxExp;
  @override
  @JsonKey(name: 'unlock_condition_type')
  String get unlockConditionType;
  @override
  @JsonKey(name: 'unlock_condition_value')
  int get unlockConditionValue;
  @override
  @JsonKey(name: 'unlock_description')
  String get unlockDescription;
  @override
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @override
  @JsonKey(name: 'is_unlocked')
  bool get isUnlocked;

  /// Create a copy of MascotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MascotModelImplCopyWith<_$MascotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
