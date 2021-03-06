
import 'package:bloc_demo/mobi/store/network/user_store.dart';
import 'package:bloc_demo/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class UserListPage extends StatelessWidget {
  UserStore store = UserStore();

  UserListPage() {
    store.getTheUsers();
  }

  @override
  Widget build(BuildContext context) {
     final future = store.userListFuture;
    return Observer(
         builder: (_) {
           switch (future.status) {
             
             case FutureStatus.pending:
             return Center(
                child: CircularProgressIndicator(),
              );
                break;
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
                break;
              case FutureStatus.fulfilled:
                final List<User> users = future.result;
                print(users);
                return RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                          radius: 25,
                        ),
                        title: Text(
                          "${user.firstName} ${user.lastName} " ,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          user.email,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                        // trailing: Text(
                        //   user.,
                        //   style:
                        //       TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                        // ),
                      );
                    },
                  ),
                );
                break;
           }
              
            
         }
    );
  }
  Future _refresh() => store.fetchUsers();
}