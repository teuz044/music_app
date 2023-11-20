// auth_store.dart

import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String? token;

  @observable
  int? cdUser;

  @observable
  String? nmUser;

  @action
  void setUser(String token, int cdUser, String nmUser) {
    this.token = token;
    this.cdUser = cdUser;
    this.nmUser = nmUser;
  }
}
