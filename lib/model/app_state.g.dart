// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$AppState extends AppState {
  @override
  final bool isLoggingIn;
  @override
  final bool isLoading;
  @override
  final bool isInternetConnected;
  @override
  final AppUser currentUser;
  @override
  final String errMsg;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.isLoggingIn,
      this.isLoading,
      this.isInternetConnected,
      this.currentUser,
      this.errMsg})
      : super._() {
    if (isLoggingIn == null)
      throw new BuiltValueNullFieldError('AppState', 'isLoggingIn');
    if (isLoading == null)
      throw new BuiltValueNullFieldError('AppState', 'isLoading');
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! AppState) return false;
    return isLoggingIn == other.isLoggingIn &&
        isLoading == other.isLoading &&
        isInternetConnected == other.isInternetConnected &&
        currentUser == other.currentUser &&
        errMsg == other.errMsg;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, isLoggingIn.hashCode), isLoading.hashCode),
                isInternetConnected.hashCode),
            currentUser.hashCode),
        errMsg.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('isLoggingIn', isLoggingIn)
          ..add('isLoading', isLoading)
          ..add('isInternetConnected', isInternetConnected)
          ..add('currentUser', currentUser)
          ..add('errMsg', errMsg))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  bool _isLoggingIn;
  bool get isLoggingIn => _$this._isLoggingIn;
  set isLoggingIn(bool isLoggingIn) => _$this._isLoggingIn = isLoggingIn;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _isInternetConnected;
  bool get isInternetConnected => _$this._isInternetConnected;
  set isInternetConnected(bool isInternetConnected) =>
      _$this._isInternetConnected = isInternetConnected;

  AppUserBuilder _currentUser;
  AppUserBuilder get currentUser =>
      _$this._currentUser ??= new AppUserBuilder();
  set currentUser(AppUserBuilder currentUser) =>
      _$this._currentUser = currentUser;

  String _errMsg;
  String get errMsg => _$this._errMsg;
  set errMsg(String errMsg) => _$this._errMsg = errMsg;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _isLoggingIn = _$v.isLoggingIn;
      _isLoading = _$v.isLoading;
      _isInternetConnected = _$v.isInternetConnected;
      _currentUser = _$v.currentUser?.toBuilder();
      _errMsg = _$v.errMsg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              isLoggingIn: isLoggingIn,
              isLoading: isLoading,
              isInternetConnected: isInternetConnected,
              currentUser: _currentUser?.build(),
              errMsg: errMsg);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'currentUser';
        _currentUser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
