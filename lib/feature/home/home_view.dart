import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/product/model/news.dart';
import 'package:flutter_firebase_full_news_app/product/utility/exception/custom_exception.dart';

import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //future builder

  //2 datayi init oldugu anda çekip set state ile göster

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _HomeListView(),
    );
  }
}

class _HomeListView extends StatelessWidget {
  const _HomeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CollectionReference news = FirebaseFirestore.instance.collection('news');

    final response = news.withConverter(
      fromFirestore: (snapshot, options) {
        return const News().fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        if (value == null) throw FirebaseCustomException('$value not null ');

        return value.toJson();
      },
    ).get();
    return FutureBuilder(
      future: response,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          // TODO: Handle this case.

          case ConnectionState.none:
            return const Placeholder();
          // TODO: Handle this case.
          case ConnectionState.waiting:
            return const LinearProgressIndicator();

          // TODO: Handle this case.
          case ConnectionState.active:
            return const LinearProgressIndicator();
          // TODO: Handle this case.
          case ConnectionState.done:
            if (snapshot.hasData) {
              final values = snapshot.data!.docs.map((e) => e.data()).toList() ?? [];
              return ListView.builder(
                itemCount: values.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Image.network(
                          values[index]?.backgroundImage ?? ' ',
                          height: context.sized.dynamicHeight(0.1),
                        ),
                        Text(values[index]?.title ?? ' ', style: context.general.textTheme.labelLarge),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          // TODO: Handle this case.
        }
      },
    );
  }
}
