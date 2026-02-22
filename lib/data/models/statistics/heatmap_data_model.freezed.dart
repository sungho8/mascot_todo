// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heatmap_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HeatmapDataModel _$HeatmapDataModelFromJson(Map<String, dynamic> json) {
  return _HeatmapDataModel.fromJson(json);
}

/// @nodoc
mixin _$HeatmapDataModel {
  @JsonKey(name: 'completion_date')
  DateTime get completionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_count')
  int get completedCount => throw _privateConstructorUsedError;

  /// Serializes this HeatmapDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HeatmapDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeatmapDataModelCopyWith<HeatmapDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeatmapDataModelCopyWith<$Res> {
  factory $HeatmapDataModelCopyWith(
    HeatmapDataModel value,
    $Res Function(HeatmapDataModel) then,
  ) = _$HeatmapDataModelCopyWithImpl<$Res, HeatmapDataModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'completion_date') DateTime completionDate,
    @JsonKey(name: 'completed_count') int completedCount,
  });
}

/// @nodoc
class _$HeatmapDataModelCopyWithImpl<$Res, $Val extends HeatmapDataModel>
    implements $HeatmapDataModelCopyWith<$Res> {
  _$HeatmapDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeatmapDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? completionDate = null, Object? completedCount = null}) {
    return _then(
      _value.copyWith(
            completionDate: null == completionDate
                ? _value.completionDate
                : completionDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedCount: null == completedCount
                ? _value.completedCount
                : completedCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HeatmapDataModelImplCopyWith<$Res>
    implements $HeatmapDataModelCopyWith<$Res> {
  factory _$$HeatmapDataModelImplCopyWith(
    _$HeatmapDataModelImpl value,
    $Res Function(_$HeatmapDataModelImpl) then,
  ) = __$$HeatmapDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'completion_date') DateTime completionDate,
    @JsonKey(name: 'completed_count') int completedCount,
  });
}

/// @nodoc
class __$$HeatmapDataModelImplCopyWithImpl<$Res>
    extends _$HeatmapDataModelCopyWithImpl<$Res, _$HeatmapDataModelImpl>
    implements _$$HeatmapDataModelImplCopyWith<$Res> {
  __$$HeatmapDataModelImplCopyWithImpl(
    _$HeatmapDataModelImpl _value,
    $Res Function(_$HeatmapDataModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeatmapDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? completionDate = null, Object? completedCount = null}) {
    return _then(
      _$HeatmapDataModelImpl(
        completionDate: null == completionDate
            ? _value.completionDate
            : completionDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedCount: null == completedCount
            ? _value.completedCount
            : completedCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HeatmapDataModelImpl implements _HeatmapDataModel {
  const _$HeatmapDataModelImpl({
    @JsonKey(name: 'completion_date') required this.completionDate,
    @JsonKey(name: 'completed_count') required this.completedCount,
  });

  factory _$HeatmapDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeatmapDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'completion_date')
  final DateTime completionDate;
  @override
  @JsonKey(name: 'completed_count')
  final int completedCount;

  @override
  String toString() {
    return 'HeatmapDataModel(completionDate: $completionDate, completedCount: $completedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeatmapDataModelImpl &&
            (identical(other.completionDate, completionDate) ||
                other.completionDate == completionDate) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, completionDate, completedCount);

  /// Create a copy of HeatmapDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeatmapDataModelImplCopyWith<_$HeatmapDataModelImpl> get copyWith =>
      __$$HeatmapDataModelImplCopyWithImpl<_$HeatmapDataModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HeatmapDataModelImplToJson(this);
  }
}

abstract class _HeatmapDataModel implements HeatmapDataModel {
  const factory _HeatmapDataModel({
    @JsonKey(name: 'completion_date') required final DateTime completionDate,
    @JsonKey(name: 'completed_count') required final int completedCount,
  }) = _$HeatmapDataModelImpl;

  factory _HeatmapDataModel.fromJson(Map<String, dynamic> json) =
      _$HeatmapDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'completion_date')
  DateTime get completionDate;
  @override
  @JsonKey(name: 'completed_count')
  int get completedCount;

  /// Create a copy of HeatmapDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeatmapDataModelImplCopyWith<_$HeatmapDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
