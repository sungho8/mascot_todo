// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'heatmap_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HeatmapDataEntity {
  DateTime get completionDate => throw _privateConstructorUsedError;
  int get completedCount => throw _privateConstructorUsedError;

  /// Create a copy of HeatmapDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeatmapDataEntityCopyWith<HeatmapDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeatmapDataEntityCopyWith<$Res> {
  factory $HeatmapDataEntityCopyWith(
    HeatmapDataEntity value,
    $Res Function(HeatmapDataEntity) then,
  ) = _$HeatmapDataEntityCopyWithImpl<$Res, HeatmapDataEntity>;
  @useResult
  $Res call({DateTime completionDate, int completedCount});
}

/// @nodoc
class _$HeatmapDataEntityCopyWithImpl<$Res, $Val extends HeatmapDataEntity>
    implements $HeatmapDataEntityCopyWith<$Res> {
  _$HeatmapDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HeatmapDataEntity
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
abstract class _$$HeatmapDataEntityImplCopyWith<$Res>
    implements $HeatmapDataEntityCopyWith<$Res> {
  factory _$$HeatmapDataEntityImplCopyWith(
    _$HeatmapDataEntityImpl value,
    $Res Function(_$HeatmapDataEntityImpl) then,
  ) = __$$HeatmapDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime completionDate, int completedCount});
}

/// @nodoc
class __$$HeatmapDataEntityImplCopyWithImpl<$Res>
    extends _$HeatmapDataEntityCopyWithImpl<$Res, _$HeatmapDataEntityImpl>
    implements _$$HeatmapDataEntityImplCopyWith<$Res> {
  __$$HeatmapDataEntityImplCopyWithImpl(
    _$HeatmapDataEntityImpl _value,
    $Res Function(_$HeatmapDataEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HeatmapDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? completionDate = null, Object? completedCount = null}) {
    return _then(
      _$HeatmapDataEntityImpl(
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

class _$HeatmapDataEntityImpl implements _HeatmapDataEntity {
  const _$HeatmapDataEntityImpl({
    required this.completionDate,
    required this.completedCount,
  });

  @override
  final DateTime completionDate;
  @override
  final int completedCount;

  @override
  String toString() {
    return 'HeatmapDataEntity(completionDate: $completionDate, completedCount: $completedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeatmapDataEntityImpl &&
            (identical(other.completionDate, completionDate) ||
                other.completionDate == completionDate) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completionDate, completedCount);

  /// Create a copy of HeatmapDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeatmapDataEntityImplCopyWith<_$HeatmapDataEntityImpl> get copyWith =>
      __$$HeatmapDataEntityImplCopyWithImpl<_$HeatmapDataEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _HeatmapDataEntity implements HeatmapDataEntity {
  const factory _HeatmapDataEntity({
    required final DateTime completionDate,
    required final int completedCount,
  }) = _$HeatmapDataEntityImpl;

  @override
  DateTime get completionDate;
  @override
  int get completedCount;

  /// Create a copy of HeatmapDataEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeatmapDataEntityImplCopyWith<_$HeatmapDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
