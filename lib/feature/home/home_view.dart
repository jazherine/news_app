import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_full_news_app/feature/home/home_provider.dart';
import 'package:flutter_firebase_full_news_app/product/constants/color_constants.dart';
import 'package:flutter_firebase_full_news_app/product/constants/string_constants.dart';
import 'package:flutter_firebase_full_news_app/product/enums/index.dart';
import 'package:flutter_firebase_full_news_app/product/model/tag.dart';
import 'package:flutter_firebase_full_news_app/product/widget/card/home_news_card.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/sub_titleText.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/title_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

part './sub_view/home_chips.dart';

final _homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      ref.read(_homeProvider.notifier).fetchAndLoad();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: context.padding.normal,
              children: const [
                _topHeader(),
                _CustomField(),
                _TagListView(),
                _BrowseHorizontalListView(),
                _RecommendedHeader(),
                _RecommendedListView(),
              ],
            ),
            if (ref.watch(_homeProvider).isLoading ?? false)
              const Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}

class _CustomField extends StatelessWidget {
  const _CustomField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.mic_outlined),
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: ColorConstants.grayLighter,
        hintText: StringConstants.homeSearchHint,
      ),
    );
  }
}

class _TagListView extends ConsumerWidget {
  const _TagListView({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsItems = ref.watch(_homeProvider).tags ?? [];
    return SizedBox(
      height: context.sized.dynamicHeight(0.1),
      child: ListView.builder(
        itemCount: newsItems.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final tagItem = newsItems[index];
          if (tagItem.active ?? false) {
            return _ActiveChip(tagItem);
          }

          return _PassiveChip(tagItem);
        },
      ),
    );
  }
}

class _BrowseHorizontalListView extends ConsumerWidget {
  const _BrowseHorizontalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsItems = ref.watch(_homeProvider).news ?? [];

    return SizedBox(
      height: context.sized.dynamicHeight(.3),
      child: ListView.builder(
        itemCount: newsItems.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => HomeNewsCard(
          newsItem: newsItems[index],
        ),
      ),
    );
  }
}

class _RecommendedHeader extends StatelessWidget {
  const _RecommendedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Row(
        children: [
          const Expanded(child: TitleText(text: StringConstants.homeTitle)),
          TextButton(
            onPressed: () {},
            child: const SubTitleText(text: StringConstants.seeAll),
          ),
        ],
      ),
    );
  }
}

class _RecommendedListView extends StatelessWidget {
  const _RecommendedListView({
    super.key,
  });
  static const dummyImage =
      'https://firebasestorage.googleapis.com/v0/b/flutter-full-newss.appspot.com/o/uxDesign.png?alt=media&token=4a9af3fd-1171-4067-87ba-f786b2ad67e1';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return const _RecommendedCard(dummyImage: dummyImage);
      },
    );
  }
}

class _RecommendedCard extends StatelessWidget {
  const _RecommendedCard({
    required this.dummyImage,
    super.key,
  });

  final String dummyImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Row(
        children: [
          Image.network(
            dummyImage,
            height: ImageSizes.normal.value,
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
          ),
          const Expanded(
            child: ListTile(
              title: Text('UI/UX DESİGN'),
              subtitle: Text('A simple Trick For Creating Color Palettes Quickly'),
            ),
          ),
        ],
      ),
    );
  }
}

class _topHeader extends StatelessWidget {
  const _topHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(
          text: StringConstants.homeBrowse,
        ),
        Padding(
          padding: context.padding.onlyTopLow,
          child: const SubTitleText(
            text: StringConstants.homeMessage,
          ),
        ),
      ],
    );
  }
}
