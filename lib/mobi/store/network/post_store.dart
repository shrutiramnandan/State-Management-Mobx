import 'package:bloc_demo/apis/api_service.dart';
import 'package:bloc_demo/model/post.dart';
import 'package:mobx/mobx.dart';
part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;
abstract class _PostStore with Store{
  final ApiService httpClient = ApiService();
  @observable
  ObservableFuture<List<Post>> postListFuture;

  @action
  Future fetchPosts() => postListFuture = 
  ObservableFuture(httpClient.getPosts('https://jsonplaceholder.typicode.com/posts')).then((users) =>  users);

  void getThePosts() {
    fetchPosts();
  }


}