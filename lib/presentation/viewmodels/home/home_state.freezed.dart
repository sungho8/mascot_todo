// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  HomeStatus get status => throw _privateConstructorUsedError;
  UserEntity? get user => throw _privateConstructorUsedError;
  List<TodoEntity> get todos => throw _privateConstructorUsedError;
  TodoEntity? get focusTodo => throw _privateConstructorUsedError;
  MascotEntity? get mainMascot => throw _privateConstructorUsedError;
  List<CategoryEntity> get categories => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    HomeStatus status,
    UserEntity? user,
    List<TodoEntity> todos,
    TodoEntity? focusTodo,
    MascotEntity? mainMascot,
    List<CategoryEntity> categories,
    String? errorMessage,
  });

  $UserEntityCopyWith<$Res>? get user;
  $TodoEntityCopyWith<$Res>? get focusTodo;
  $MascotEntityCopyWith<$Res>? get mainMascot;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? todos = null,
    Object? focusTodo = freezed,
    Object? mainMascot = freezed,
    Object? categories = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as HomeStatus,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as UserEntity?,
            todos: null == todos
                ? _value.todos
                : todos // ignore: cast_nullable_to_non_nullable
                      as List<TodoEntity>,
            focusTodo: freezed == focusTodo
                ? _value.focusTodo
                : focusTodo // ignore: cast_nullable_to_non_nullable
                      as TodoEntity?,
            mainMascot: freezed == mainMascot
                ? _value.mainMascot
                : mainMascot // ignore: cast_nullable_to_non_nullable
                      as MascotEntity?,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<CategoryEntity>,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodoEntityCopyWith<$Res>? get focusTodo {
    if (_value.focusTodo == null) {
      return null;
    }

    return $TodoEntityCopyWith<$Res>(_value.focusTodo!, (value) {
      return _then(_value.copyWith(focusTodo: value) as $Val);
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MascotEntityCopyWith<$Res>? get mainMascot {
    if (_value.mainMascot == null) {
      return null;
    }

    return $MascotEntityCopyWith<$Res>(_value.mainMascot!, (value) {
      return _then(_value.copyWith(mainMascot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    HomeStatus status,
    UserEntity? user,
    List<TodoEntity> todos,
    TodoEntity? focusTodo,
    MascotEntity? mainMascot,
    List<CategoryEntity> categories,
    String? errorMessage,
  });

  @override
  $UserEntityCopyWith<$Res>? get user;
  @override
  $TodoEntityCopyWith<$Res>? get focusTodo;
  @override
  $MascotEntityCopyWith<$Res>? get mainMascot;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? todos = null,
    Object? focusTodo = freezed,
    Object? mainMascot = freezed,
    Object? categories = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as HomeStatus,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserEntity?,
        todos: null == todos
            ? _value._todos
            : todos // ignore: cast_nullable_to_non_nullable
                  as List<TodoEntity>,
        focusTodo: freezed == focusTodo
            ? _value.focusTodo
            : focusTodo // ignore: cast_nullable_to_non_nullable
                  as TodoEntity?,
        mainMascot: freezed == mainMascot
            ? _value.mainMascot
            : mainMascot // ignore: cast_nullable_to_non_nullable
                  as MascotEntity?,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<CategoryEntity>,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    this.status = HomeStatus.initial,
    this.user,
    final List<TodoEntity> todos = const [],
    this.focusTodo,
    this.mainMascot,
    final List<CategoryEntity> categories = const [],
    this.errorMessage,
  }) : _todos = todos,
       _categories = categories;

  @override
  @JsonKey()
  final HomeStatus status;
  @override
  final UserEntity? user;
  final List<TodoEntity> _todos;
  @override
  @JsonKey()
  List<TodoEntity> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  final TodoEntity? focusTodo;
  @override
  final MascotEntity? mainMascot;
  final List<CategoryEntity> _categories;
  @override
  @JsonKey()
  List<CategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HomeState(status: $status, user: $user, todos: $todos, focusTodo: $focusTodo, mainMascot: $mainMascot, categories: $categories, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.focusTodo, focusTodo) ||
                other.focusTodo == focusTodo) &&
            (identical(other.mainMascot, mainMascot) ||
                other.mainMascot == mainMascot) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    user,
    const DeepCollectionEquality().hash(_todos),
    focusTodo,
    mainMascot,
    const DeepCollectionEquality().hash(_categories),
    errorMessage,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final HomeStatus status,
    final UserEntity? user,
    final List<TodoEntity> todos,
    final TodoEntity? focusTodo,
    final MascotEntity? mainMascot,
    final List<CategoryEntity> categories,
    final String? errorMessage,
  }) = _$HomeStateImpl;

  @override
  HomeStatus get status;
  @override
  UserEntity? get user;
  @override
  List<TodoEntity> get todos;
  @override
  TodoEntity? get focusTodo;
  @override
  MascotEntity? get mainMascot;
  @override
  List<CategoryEntity> get categories;
  @override
  String? get errorMessage;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
