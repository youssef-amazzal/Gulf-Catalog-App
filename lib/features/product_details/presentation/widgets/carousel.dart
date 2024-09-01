import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late GroupButtonController controller;
  late AssetImage selectedImage;
  late List<AssetImage> images;

  @override
  void initState() {
    super.initState();
    images = _getImage();
    controller = GroupButtonController();
    controller.selectIndex(0);
    selectedImage = images[0];
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
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(14)),
                child: Image(image: selectedImage, fit: BoxFit.cover),
              )),
              const Gap(10),
              SizedBox(
                height: 66.5,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GroupButton<AssetImage>(
                    controller: controller,
                    buttons: images,
                    onSelected: (value, index, isSelected) => setState(() {
                      selectedImage = images[index];
                    }),
                    buttonBuilder: (selected, value, context) {
                      return Container(
                        clipBehavior: Clip.antiAlias,
                        height: 66.5,
                        width: 66.5,
                        decoration: BoxDecoration(
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
                          child: Image(
                            image: value,
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

  List<AssetImage> _getImage() {
    return const [
      AssetImage('assets/images/products/CF-112/CF-112_0.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_1.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_2.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_3.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_4.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_5.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_6.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_7.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_8.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_9.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_10.webp'),
      AssetImage('assets/images/products/CF-112/CF-112_11.webp'),
    ];
  }
}
