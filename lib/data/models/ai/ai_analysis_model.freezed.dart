// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_analysis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiAnalysisModel _$AiAnalysisModelFromJson(Map<String, dynamic> json) {
  return _AiAnalysisModel.fromJson(json);
}

/// @nodoc
mixin _$AiAnalysisModel {
  String get type => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this AiAnalysisModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiAnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiAnalysisModelCopyWith<AiAnalysisModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiAnalysisModelCopyWith<$Res> {
  factory $AiAnalysisModelCopyWith(
    AiAnalysisModel value,
    $Res Function(AiAnalysisModel) then,
  ) = _$AiAnalysisModelCopyWithImpl<$Res, AiAnalysisModel>;
  @useResult
  $Res call({
    String type,
    String? title,
    String? categoryId,
    bool isRecurring,
    String message,
  });
}

/// @nodoc
class _$AiAnalysisModelCopyWithImpl<$Res, $Val extends AiAnalysisModel>
    implements $AiAnalysisModelCopyWith<$Res> {
  _$AiAnalysisModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiAnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = freezed,
    Object? categoryId = freezed,
    Object? isRecurring = null,
    Object? message = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRecurring: null == isRecurring
                ? _value.isRecurring
                : isRecurring // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiAnalysisModelImplCopyWith<$Res>
    implements $AiAnalysisModelCopyWith<$Res> {
  factory _$$AiAnalysisModelImplCopyWith(
    _$AiAnalysisModelImpl value,
    $Res Function(_$AiAnalysisModelImpl) then,
  ) = __$$AiAnalysisModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String type,
    String? title,
    String? categoryId,
    bool isRecurring,
    String message,
  });
}

/// @nodoc
class __$$AiAnalysisModelImplCopyWithImpl<$Res>
    extends _$AiAnalysisModelCopyWithImpl<$Res, _$AiAnalysisModelImpl>
    implements _$$AiAnalysisModelImplCopyWith<$Res> {
  __$$AiAnalysisModelImplCopyWithImpl(
    _$AiAnalysisModelImpl _value,
    $Res Function(_$AiAnalysisModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiAnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = freezed,
    Object? categoryId = freezed,
    Object? isRecurring = null,
    Object? message = null,
  }) {
    return _then(
      _$AiAnalysisModelImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRecurring: null == isRecurring
            ? _value.isRecurring
            : isRecurring // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiAnalysisModelImpl extends _AiAnalysisModel {
  const _$AiAnalysisModelImpl({
    required this.type,
    this.title,
    this.categoryId,
    this.isRecurring = false,
    required this.message,
  }) : super._();

  factory _$AiAnalysisModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiAnalysisModelImplFromJson(json);

  @override
  final String type;
  @override
  final String? title;
  @override
  final String? categoryId;
  @override
  @JsonKey()
  final bool isRecurring;
  @override
  final String message;

  @override
  String toString() {
    return 'AiAnalysisModel(type: $type, title: $title, categoryId: $categoryId, isRecurring: $isRecurring, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiAnalysisModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, title, categoryId, isRecurring, message);

  /// Create a copy of AiAnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiAnalysisModelImplCopyWith<_$AiAnalysisModelImpl> get copyWith =>
      __$$AiAnalysisModelImplCopyWithImpl<_$AiAnalysisModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AiAnalysisModelImplToJson(this);
  }
}

abstract class _AiAnalysisModel extends AiAnalysisModel {
  const factory _AiAnalysisModel({
    required final String type,
    final String? title,
    final String? categoryId,
    final bool isRecurring,
    required final String message,
  }) = _$AiAnalysisModelImpl;
  const _AiAnalysisModel._() : super._();

  factory _AiAnalysisModel.fromJson(Map<String, dynamic> json) =
      _$AiAnalysisModelImpl.fromJson;

  @override
  String get type;
  @override
  String? get title;
  @override
  String? get categoryId;
  @override
  bool get isRecurring;
  @override
  String get message;

  /// Create a copy of AiAnalysisModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiAnalysisModelImplCopyWith<_$AiAnalysisModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
