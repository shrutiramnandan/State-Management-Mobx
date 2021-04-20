import 'package:bloc_demo/mobi/store/network/post_store.dart';
import 'package:bloc_demo/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class PostListPage extends StatelessWidget {
  PostStore store = PostStore();

  PostListPage() {
    store.getThePosts();
  }
  @override
  Widget build(BuildContext context) {
     final future = store.postListFuture;
     
    return Observer(
      builder:(_) {
        
        switch (future.status) {
          

          
          case FutureStatus.pending:
          return Center(
              child: CircularProgressIndicator(),
            );

            // break;
          case FutureStatus.rejected:
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Failed to load items.',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    child: const Text('Tap to retry'),
                    onPressed: _refresh,
                  )
                ],
              ),
            );
            // break;
          case FutureStatus.fulfilled:
          final List<Post> posts = future.result;
            print(posts);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return ExpansionTile(
                    title: Text(post.title, style: TextStyle(fontWeight: FontWeight.w600),),
                    children: <Widget>[
                      Text(post.body)
                    ],
                  );
                },
              ),
            );
            break;
        }

      }
    );
  }
  Future _refresh() => store.fetchPosts();
}