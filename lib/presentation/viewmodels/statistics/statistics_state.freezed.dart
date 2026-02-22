// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StatisticsState {
  StatisticsStatus get status => throw _privateConstructorUsedError;
  List<HeatmapDataEntity> get heatmapData => throw _privateConstructorUsedError;
  List<HourlyStatEntity> get hourlyStats => throw _privateConstructorUsedError;
  List<HabitStatEntity> get habitStats => throw _privateConstructorUsedError;
  List<DayDetailEntity> get dayDetails => throw _privateConstructorUsedError;
  List<MascotGrowthStatEntity> get mascotGrowthStats =>
      throw _privateConstructorUsedError;
  WeeklyComparisonEntity? get weeklyComparison =>
      throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  int get selectedMonth => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticsStateCopyWith<StatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsStateCopyWith<$Res> {
  factory $StatisticsStateCopyWith(
    StatisticsState value,
    $Res Function(StatisticsState) then,
  ) = _$StatisticsStateCopyWithImpl<$Res, StatisticsState>;
  @useResult
  $Res call({
    StatisticsStatus status,
    List<HeatmapDataEntity> heatmapData,
    List<HourlyStatEntity> hourlyStats,
    List<HabitStatEntity> habitStats,
    List<DayDetailEntity> dayDetails,
    List<MascotGrowthStatEntity> mascotGrowthStats,
    WeeklyComparisonEntity? weeklyComparison,
    DateTime? selectedDate,
    int selectedMonth,
    String? errorMessage,
  });

  $WeeklyComparisonEntityCopyWith<$Res>? get weeklyComparison;
}

/// @nodoc
class _$StatisticsStateCopyWithImpl<$Res, $Val extends StatisticsState>
    implements $StatisticsStateCopyWith<$Res> {
  _$StatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? heatmapData = null,
    Object? hourlyStats = null,
    Object? habitStats = null,
    Object? dayDetails = null,
    Object? mascotGrowthStats = null,
    Object? weeklyComparison = freezed,
    Object? selectedDate = freezed,
    Object? selectedMonth = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as StatisticsStatus,
            heatmapData: null == heatmapData
                ? _value.heatmapData
                : heatmapData // ignore: cast_nullable_to_non_nullable
                      as List<HeatmapDataEntity>,
            hourlyStats: null == hourlyStats
                ? _value.hourlyStats
                : hourlyStats // ignore: cast_nullable_to_non_nullable
                      as List<HourlyStatEntity>,
            habitStats: null == habitStats
                ? _value.habitStats
                : habitStats // ignore: cast_nullable_to_non_nullable
                      as List<HabitStatEntity>,
            dayDetails: null == dayDetails
                ? _value.dayDetails
                : dayDetails // ignore: cast_nullable_to_non_nullable
                      as List<DayDetailEntity>,
            mascotGrowthStats: null == mascotGrowthStats
                ? _value.mascotGrowthStats
                : mascotGrowthStats // ignore: cast_nullable_to_non_nullable
                      as List<MascotGrowthStatEntity>,
            weeklyComparison: freezed == weeklyComparison
                ? _value.weeklyComparison
                : weeklyComparison // ignore: cast_nullable_to_non_nullable
                      as WeeklyComparisonEntity?,
            selectedDate: freezed == selectedDate
                ? _value.selectedDate
                : selectedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            selectedMonth: null == selectedMonth
                ? _value.selectedMonth
                : selectedMonth // ignore: cast_nullable_to_non_nullable
                      as int,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeeklyComparisonEntityCopyWith<$Res>? get weeklyComparison {
    if (_value.weeklyComparison == null) {
      return null;
    }

    return $WeeklyComparisonEntityCopyWith<$Res>(_value.weeklyComparison!, (
      value,
    ) {
      return _then(_value.copyWith(weeklyComparison: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatisticsStateImplCopyWith<$Res>
    implements $StatisticsStateCopyWith<$Res> {
  factory _$$StatisticsStateImplCopyWith(
    _$StatisticsStateImpl value,
    $Res Function(_$StatisticsStateImpl) then,
  ) = __$$StatisticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    StatisticsStatus status,
    List<HeatmapDataEntity> heatmapData,
    List<HourlyStatEntity> hourlyStats,
    List<HabitStatEntity> habitStats,
    List<DayDetailEntity> dayDetails,
    List<MascotGrowthStatEntity> mascotGrowthStats,
    WeeklyComparisonEntity? weeklyComparison,
    DateTime? selectedDate,
    int selectedMonth,
    String? errorMessage,
  });

  @override
  $WeeklyComparisonEntityCopyWith<$Res>? get weeklyComparison;
}

/// @nodoc
class __$$StatisticsStateImplCopyWithImpl<$Res>
    extends _$StatisticsStateCopyWithImpl<$Res, _$StatisticsStateImpl>
    implements _$$StatisticsStateImplCopyWith<$Res> {
  __$$StatisticsStateImplCopyWithImpl(
    _$StatisticsStateImpl _value,
    $Res Function(_$StatisticsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? heatmapData = null,
    Object? hourlyStats = null,
    Object? habitStats = null,
    Object? dayDetails = null,
    Object? mascotGrowthStats = null,
    Object? weeklyComparison = freezed,
    Object? selectedDate = freezed,
    Object? selectedMonth = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$StatisticsStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as StatisticsStatus,
        heatmapData: null == heatmapData
            ? _value._heatmapData
            : heatmapData // ignore: cast_nullable_to_non_nullable
                  as List<HeatmapDataEntity>,
        hourlyStats: null == hourlyStats
            ? _value._hourlyStats
            : hourlyStats // ignore: cast_nullable_to_non_nullable
                  as List<HourlyStatEntity>,
        habitStats: null == habitStats
            ? _value._habitStats
            : habitStats // ignore: cast_nullable_to_non_nullable
                  as List<HabitStatEntity>,
        dayDetails: null == dayDetails
            ? _value._dayDetails
            : dayDetails // ignore: cast_nullable_to_non_nullable
                  as List<DayDetailEntity>,
        mascotGrowthStats: null == mascotGrowthStats
            ? _value._mascotGrowthStats
            : mascotGrowthStats // ignore: cast_nullable_to_non_nullable
                  as List<MascotGrowthStatEntity>,
        weeklyComparison: freezed == weeklyComparison
            ? _value.weeklyComparison
            : weeklyComparison // ignore: cast_nullable_to_non_nullable
                  as WeeklyComparisonEntity?,
        selectedDate: freezed == selectedDate
            ? _value.selectedDate
            : selectedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        selectedMonth: null == selectedMonth
            ? _value.selectedMonth
            : selectedMonth // ignore: cast_nullable_to_non_nullable
                  as int,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$StatisticsStateImpl implements _StatisticsState {
  const _$StatisticsStateImpl({
    this.status = StatisticsStatus.initial,
    final List<HeatmapDataEntity> heatmapData = const [],
    final List<HourlyStatEntity> hourlyStats = const [],
    final List<HabitStatEntity> habitStats = const [],
    final List<DayDetailEntity> dayDetails = const [],
    final List<MascotGrowthStatEntity> mascotGrowthStats = const [],
    this.weeklyComparison,
    this.selectedDate,
    this.selectedMonth = 0,
    this.errorMessage,
  }) : _heatmapData = heatmapData,
       _hourlyStats = hourlyStats,
       _habitStats = habitStats,
       _dayDetails = dayDetails,
       _mascotGrowthStats = mascotGrowthStats;

  @override
  @JsonKey()
  final StatisticsStatus status;
  final List<HeatmapDataEntity> _heatmapData;
  @override
  @JsonKey()
  List<HeatmapDataEntity> get heatmapData {
    if (_heatmapData is EqualUnmodifiableListView) return _heatmapData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_heatmapData);
  }

  final List<HourlyStatEntity> _hourlyStats;
  @override
  @JsonKey()
  List<HourlyStatEntity> get hourlyStats {
    if (_hourlyStats is EqualUnmodifiableListView) return _hourlyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourlyStats);
  }

  final List<HabitStatEntity> _habitStats;
  @override
  @JsonKey()
  List<HabitStatEntity> get habitStats {
    if (_habitStats is EqualUnmodifiableListView) return _habitStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habitStats);
  }

  final List<DayDetailEntity> _dayDetails;
  @override
  @JsonKey()
  List<DayDetailEntity> get dayDetails {
    if (_dayDetails is EqualUnmodifiableListView) return _dayDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dayDetails);
  }

  final List<MascotGrowthStatEntity> _mascotGrowthStats;
  @override
  @JsonKey()
  List<MascotGrowthStatEntity> get mascotGrowthStats {
    if (_mascotGrowthStats is EqualUnmodifiableListView)
      return _mascotGrowthStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mascotGrowthStats);
  }

  @override
  final WeeklyComparisonEntity? weeklyComparison;
  @override
  final DateTime? selectedDate;
  @override
  @JsonKey()
  final int selectedMonth;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'StatisticsState(status: $status, heatmapData: $heatmapData, hourlyStats: $hourlyStats, habitStats: $habitStats, dayDetails: $dayDetails, mascotGrowthStats: $mascotGrowthStats, weeklyComparison: $weeklyComparison, selectedDate: $selectedDate, selectedMonth: $selectedMonth, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._heatmapData,
              _heatmapData,
            ) &&
            const DeepCollectionEquality().equals(
              other._hourlyStats,
              _hourlyStats,
            ) &&
            const DeepCollectionEquality().equals(
              other._habitStats,
              _habitStats,
            ) &&
            const DeepCollectionEquality().equals(
              other._dayDetails,
              _dayDetails,
            ) &&
            const DeepCollectionEquality().equals(
              other._mascotGrowthStats,
              _mascotGrowthStats,
            ) &&
            (identical(other.weeklyComparison, weeklyComparison) ||
                other.weeklyComparison == weeklyComparison) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.selectedMonth, selectedMonth) ||
                other.selectedMonth == selectedMonth) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_heatmapData),
    const DeepCollectionEquality().hash(_hourlyStats),
    const DeepCollectionEquality().hash(_habitStats),
    const DeepCollectionEquality().hash(_dayDetails),
    const DeepCollectionEquality().hash(_mascotGrowthStats),
    weeklyComparison,
    selectedDate,
    selectedMonth,
    errorMessage,
  );

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsStateImplCopyWith<_$StatisticsStateImpl> get copyWith =>
      __$$StatisticsStateImplCopyWithImpl<_$StatisticsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _StatisticsState implements StatisticsState {
  const factory _StatisticsState({
    final StatisticsStatus status,
    final List<HeatmapDataEntity> heatmapData,
    final List<HourlyStatEntity> hourlyStats,
    final List<HabitStatEntity> habitStats,
    final List<DayDetailEntity> dayDetails,
    final List<MascotGrowthStatEntity> mascotGrowthStats,
    final WeeklyComparisonEntity? weeklyComparison,
    final DateTime? selectedDate,
    final int selectedMonth,
    final String? errorMessage,
  }) = _$StatisticsStateImpl;

  @override
  StatisticsStatus get status;
  @override
  List<HeatmapDataEntity> get heatmapData;
  @override
  List<HourlyStatEntity> get hourlyStats;
  @override
  List<HabitStatEntity> get habitStats;
  @override
  List<DayDetailEntity> get dayDetails;
  @override
  List<MascotGrowthStatEntity> get mascotGrowthStats;
  @override
  WeeklyComparisonEntity? get weeklyComparison;
  @override
  DateTime? get selectedDate;
  @override
  int get selectedMonth;
  @override
  String? get errorMessage;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticsStateImplCopyWith<_$StatisticsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
