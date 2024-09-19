import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_theme.dart';
import 'package:gulf_catalog_app/features/catalog/data/models/image_model.dart';
import 'package:gulf_catalog_app/features/catalog/domain/entities/image.dart'
    as gulf;

class Carousel extends StatefulWidget {
  final List<gulf.Image> images;

  const Carousel({
    super.key,
    required this.images,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late GroupButtonController controller;
  late gulf.Image selectedImage;

  @override
  void initState() {
    super.initState();
    controller = GroupButtonController();
    controller.selectIndex(0);
    if (widget.images.isEmpty) {
      widget.images.add(
        ImageModel(
          url: "",
          isDown: true,
          updatedAt: DateTime.now(),
        ),
      );
    }
    selectedImage = widget.images[0];
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: MAppTheme.kRadius,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: MAppTheme.kRadius,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: selectedImage.url,
                    memCacheWidth: 500,
                    fadeInDuration: const Duration(milliseconds: 0),
                    fadeOutDuration: const Duration(milliseconds: 0),
                    placeholderFadeInDuration: const Duration(milliseconds: 0),
                    httpHeaders: const {"Connection": "Keep-Alive"},
                    placeholder: (context, url) =>
                        Image.asset('assets/images/placeholder.png'),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/placeholder.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Gap(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: GroupButton<gulf.Image>(
                  controller: controller,
                  buttons: widget.images,
                  onSelected: (value, index, isSelected) => setState(() {
                    selectedImage = widget.images[index];
                  }),
                  buttonBuilder: (selected, value, context) {
                    return Container(
                      clipBehavior: Clip.antiAlias,
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: MAppTheme.kRadius,
                        border: selected
                            ? Border.all(
                                color: colorScheme.primary,
                                width: 2,
                              )
                            : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        clipBehavior: Clip.antiAlias,
                        child: CachedNetworkImage(
                          imageUrl: value.url,
                          memCacheWidth: 70,
                          fadeInDuration: const Duration(milliseconds: 0),
                          fadeOutDuration: const Duration(milliseconds: 0),
                          placeholderFadeInDuration:
                              const Duration(milliseconds: 0),
                          httpHeaders: const {"Connection": "Keep-Alive"},
                          placeholder: (context, url) =>
                              Image.asset('assets/images/placeholder.png'),
                          errorWidget: (context, url, error) =>
                              Image.asset('assets/images/placeholder.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
      ),
    );
  }
}
