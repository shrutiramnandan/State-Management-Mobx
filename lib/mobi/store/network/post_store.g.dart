// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostStore on _PostStore, Store {
  final _$postListFutureAtom = Atom(name: '_PostStore.postListFuture');

  @override
  ObservableFuture<List<Post>> get postListFuture {
    _$postListFutureAtom.reportRead();
    return super.postListFuture;
  }

  @override
  set postListFuture(ObservableFuture<List<Post>> value) {
    _$postListFutureAtom.reportWrite(value, super.postListFuture, () {
      super.postListFuture = value;
    });
  }

  final _$_PostStoreActionController = ActionController(name: '_PostStore');

  @override
  Future<dynamic> fetchPosts() {
    final _$actionInfo =
        _$_PostStoreActionController.startAction(name: '_PostStore.fetchPosts');
    try {
      return super.fetchPosts();
    } finally {
      _$_PostStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postListFuture: ${postListFuture}
    ''';
  }
}
