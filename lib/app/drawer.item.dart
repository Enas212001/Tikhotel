import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });
  final String title, image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(image),
      title: Text(title, style: TextStyles.text14RegularGrey),
      onTap: onTap,
    );
  }
}
