import 'package:bloc_demo/apis/api_service.dart';
import 'package:bloc_demo/model/user.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';



class UserStore = _UserStore with _$UserStore;
abstract class _UserStore with Store{
  final ApiService httpClient = ApiService();
  @observable
  ObservableFuture<List<User>> userListFuture;

  @action
  Future fetchUsers() => userListFuture = 
  ObservableFuture(httpClient.getData('https://reqres.in/api/users?page=1')).then((users) =>  users);

  void getTheUsers() {
    fetchUsers();
  }


}