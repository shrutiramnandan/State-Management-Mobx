import 'dart:ui';

import 'package:bloc_demo/apis/api_service.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';

class CustomColor extends Color {
  CustomColor(int value) : super(value);
}

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  final FormErrorState error = FormErrorState();
  ApiService apiService   = ApiService();

  @observable
  CustomColor color;
  @observable
  String noncee = '';

  @observable
  String name = '';
  

 @observable
  String displayName = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  dynamic registerVal = '';

  @observable
  ObservableFuture<bool> usernameCheck = ObservableFuture.value(true);
  @observable
  ObservableFuture<bool> displayNameCheck = ObservableFuture.value(true);

  @computed
  bool get isUserCheckPending => usernameCheck.status == FutureStatus.pending;
  @computed
  bool get isDisplayNameCheckPending => displayNameCheck.status == FutureStatus.pending;

  @computed
  bool get canLogin => !error.hasErrors;

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateUsername),
      reaction((_) => displayName, checkValidDisplayName),
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  @action
  // ignore: avoid_void_async
  Future validateUsername(String value) async {
    if (isNull(value) || value.isEmpty) {
      error.username = 'Cannot be blank';
      return;
    }

    try {
      usernameCheck = ObservableFuture(checkValidUsername(value));

      error.username = null;

      final isValid = await usernameCheck;
      if (!isValid) {
        error.username = 'Username cannot be "admin"';
        return;
      }
    } on Object catch (_) {
      error.username = null;
    }

    error.username = null;
  }

  @action
  // ignore: avoid_void_async
  Future validateDisplayName(String value) async {
    if (isNull(value) || value.isEmpty) {
      error.displayname = 'Cannot be blank';
      return;
    }

    try {
      displayNameCheck = ObservableFuture(checkValidDisplayName(value));

      error.displayname = null;

      final isValid = await displayNameCheck;
      if (!isValid) {
        error.displayname = 'display name cannot be';
        return;
      }
    } on Object catch (_) {
      error.displayname = null;
    }

    error.displayname = null;
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Not a valid email';
  }

  // @action
  // void validateDisplayName(String value) {
  //   error.displayname = isNull(value) ? null : 'display name cannot be';
  // }


  @action
  void nonce()async {
   noncee = await apiService.nonce();
  }


  

  Future<bool> checkValidUsername(String value) async {
    await Future.delayed(const Duration(seconds: 1));

    return value != 'admin';
  }

  Future<bool> checkValidDisplayName(String value) async {
    await Future.delayed(const Duration(seconds: 1));

    return value != 'displayName';
  }

  

   

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateEmail(email);
    validateUsername(name);
    validateDisplayName(displayName);
    register( );
  }
  
  // @action
  // Future register() => registerVal = 
  // ObservableFuture(apiService.registration(
  //     username: name,
  //     userpass: password,
  //     displayName: displayName,
  //     email: email,
  //     nonce: noncee
  //   )).then((res) =>  res);

  // void registering(){
  //   register();
  // }

  void register(){
    apiService.registration(
      username: name,
      userpass: password,
      displayName: displayName,
      email: email,
      nonce: noncee
    );
  }

  @action
  void authentication(){
    apiService.authentication(
      name, password,
    );
  }
  
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String username;

  @observable
  String displayname;

  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors => username != null ||  displayname != null || email != null || password != null;
}