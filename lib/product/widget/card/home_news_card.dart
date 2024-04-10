import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_full_news_app/product/constants/color_constants.dart';
import 'package:flutter_firebase_full_news_app/product/enums/index.dart';
import 'package:flutter_firebase_full_news_app/product/model/news.dart';
import 'package:flutter_firebase_full_news_app/product/widget/text/sub_titleText.dart';
import 'package:kartal/kartal.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({
    required this.newsItem,
    super.key,
  });

  final News? newsItem;

  @override
  Widget build(BuildContext context) {
    if (newsItem == null) return const Placeholder();
    return Stack(
      children: [
        Padding(
          padding: context.padding.onlyRightNormal,
          child: Image.network(
            newsItem!.backgroundImage ?? 'https://picsum.photos/200/300',
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: context.padding.low,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_add_outlined,
                    color: ColorConstants.white,
                    size: WidgetSize.iconNormal.value,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: context.padding.low,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubTitleText(
                        text: newsItem?.category ?? '',
                        color: ColorConstants.grayLighter,
                      ),
                      Text(
                        newsItem?.title ?? ' ',
                        style: context.general.textTheme.titleSmall?.copyWith(color: ColorConstants.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
