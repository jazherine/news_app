// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase_full_news_app/product/utility/firebase/firebase_utility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_firebase_full_news_app/product/model/news.dart';
import 'package:flutter_firebase_full_news_app/product/model/tag.dart';
import 'package:flutter_firebase_full_news_app/product/utility/exception/custom_exception.dart';
import 'package:flutter_firebase_full_news_app/product/utility/firebase/firebase_collections.dart';

class HomeNotifier extends StateNotifier<HomeState> with FirebaseUtility {
  HomeNotifier() : super(const HomeState());

  Future<void> fetchNews() async {
    final items = await fetchList<News, News>(News(), FirebaseCollections.news);
    state = state.copyWith(news: items);
    // final newsCollectionReference = FirebaseCollections.news.reference;

    // final response = await newsCollectionReference.withConverter(
    //   fromFirestore: (snapshot, options) {
    //     return News().fromFirebase(snapshot);
    //   },
    //   toFirestore: (value, options) {
    //     return value.toJson();
    //   },
    // ).get();
    // if (response.docs.isNotEmpty) {
    //   final values = response.docs.map((e) => e.data()).toList();
    //   state = state.copyWith(news: values);
    // }
  }

  Future<void> fetchTags() async {
    final items = await fetchList<Tag, Tag>(const Tag(), FirebaseCollections.tag);
    state = state.copyWith(tags: items);

    // final newsCollectionReference = FirebaseCollections.tag.reference;

    // final response = await newsCollectionReference.withConverter<Tag>(
    //   fromFirestore: (snapshot, options) {
    //     return const Tag().fromFirebase(snapshot);
    //   },
    //   toFirestore: (value, options) {
    //     return value.toJson();
    //   },
    // ).get();
    // if (response.docs.isNotEmpty) {
    //   final values = response.docs.map((e) => e.data()).toList();
    //   state = state.copyWith(tags: values);
    // }
  }

  Future<void> fetchAndLoad() async {
    state = state.copyWith(isLoading: true);
    await fetchNews();
    await fetchTags();
    state = state.copyWith(isLoading: false);
  }
}

class HomeState extends Equatable {
  const HomeState({
    this.isLoading,
    this.news,
    this.tags,
  });

  //paging
  final bool? isLoading;

  final List<News>? news;
  final List<Tag>? tags;
  @override
  List<Object?> get props => [isLoading, news, tags];

  HomeState copyWith({
    bool? isLoading,
    List<News>? news,
    List<Tag>? tags,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      news: news ?? this.news,
      tags: tags ?? this.tags,
    );
  }
}
