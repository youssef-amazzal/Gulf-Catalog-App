import 'package:flutter/material.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class ReferenceText extends StatelessWidget {
  final String reference;
  const ReferenceText({
    super.key,
    required this.reference,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return SizedBox(
      height: 10,
      child: Text('- $reference',
          style: theme.appTextStyles.body1
              .copyWith(fontSize: 14.5, fontWeight: FontWeight.w400)),
    );
  }
}
