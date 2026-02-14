// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$UserEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get profileImagePath => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  double get currentExp => throw _privateConstructorUsedError;
  double get maxExp => throw _privateConstructorUsedError;
  int get totalCompleted => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
    UserEntity value,
    $Res Function(UserEntity) then,
  ) = _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String? profileImagePath,
    int level,
    double currentExp,
    double maxExp,
    int totalCompleted,
    int currentStreak,
  });
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImagePath = freezed,
    Object? level = null,
    Object? currentExp = null,
    Object? maxExp = null,
    Object? totalCompleted = null,
    Object? currentStreak = null,
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
            profileImagePath: freezed == profileImagePath
                ? _value.profileImagePath
                : profileImagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            totalCompleted: null == totalCompleted
                ? _value.totalCompleted
                : totalCompleted // ignore: cast_nullable_to_non_nullable
                      as int,
            currentStreak: null == currentStreak
                ? _value.currentStreak
                : currentStreak // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
    _$UserEntityImpl value,
    $Res Function(_$UserEntityImpl) then,
  ) = __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? profileImagePath,
    int level,
    double currentExp,
    double maxExp,
    int totalCompleted,
    int currentStreak,
  });
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
    _$UserEntityImpl _value,
    $Res Function(_$UserEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? profileImagePath = freezed,
    Object? level = null,
    Object? currentExp = null,
    Object? maxExp = null,
    Object? totalCompleted = null,
    Object? currentStreak = null,
  }) {
    return _then(
      _$UserEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        profileImagePath: freezed == profileImagePath
            ? _value.profileImagePath
            : profileImagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        totalCompleted: null == totalCompleted
            ? _value.totalCompleted
            : totalCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        currentStreak: null == currentStreak
            ? _value.currentStreak
            : currentStreak // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl({
    required this.id,
    required this.name,
    this.profileImagePath,
    required this.level,
    required this.currentExp,
    required this.maxExp,
    required this.totalCompleted,
    required this.currentStreak,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String? profileImagePath;
  @override
  final int level;
  @override
  final double currentExp;
  @override
  final double maxExp;
  @override
  final int totalCompleted;
  @override
  final int currentStreak;

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, profileImagePath: $profileImagePath, level: $level, currentExp: $currentExp, maxExp: $maxExp, totalCompleted: $totalCompleted, currentStreak: $currentStreak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profileImagePath, profileImagePath) ||
                other.profileImagePath == profileImagePath) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.currentExp, currentExp) ||
                other.currentExp == currentExp) &&
            (identical(other.maxExp, maxExp) || other.maxExp == maxExp) &&
            (identical(other.totalCompleted, totalCompleted) ||
                other.totalCompleted == totalCompleted) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    profileImagePath,
    level,
    currentExp,
    maxExp,
    totalCompleted,
    currentStreak,
  );

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity({
    required final String id,
    required final String name,
    final String? profileImagePath,
    required final int level,
    required final double currentExp,
    required final double maxExp,
    required final int totalCompleted,
    required final int currentStreak,
  }) = _$UserEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get profileImagePath;
  @override
  int get level;
  @override
  double get currentExp;
  @override
  double get maxExp;
  @override
  int get totalCompleted;
  @override
  int get currentStreak;

  /// Create a copy of UserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
