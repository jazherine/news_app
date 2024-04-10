// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home_view.dart';

class _ActiveChip extends StatelessWidget {
  const _ActiveChip(
    this.tag, {
    super.key,
  });
  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: context.padding.low,
      backgroundColor: ColorConstants.purplePrimary,
      label: Text(
        tag.name ?? ' ',
        style: context.general.textTheme.bodySmall?.copyWith(
          color: ColorConstants.white,
        ),
      ),
    );
  }
}

class _PassiveChip extends StatelessWidget {
  const _PassiveChip(
    this.tag, {
    super.key,
  });
  final Tag tag;
  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: context.padding.low,
      backgroundColor: ColorConstants.white,
      label: Text(
        tag.name ?? ' ',
        style: context.general.textTheme.bodySmall?.copyWith(
          color: ColorConstants.grayPrimary,
        ),
      ),
    );
  }
}
