import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
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
      widget.images
          .add(ImageModel(url: "", isDown: true, updatedAt: DateTime.now()));
    }
    selectedImage = widget.images[0];
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
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
                  borderRadius: BorderRadius.circular(14),
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
              )),
              const Gap(10),
              SizedBox(
                height: 66.5,
                child: SingleChildScrollView(
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
                        height: 66.5,
                        width: 66.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: selected
                              ? Border.all(
                                  color: context.theme.appColors.accent,
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
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
