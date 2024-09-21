import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:group_button/group_button.dart';
import 'package:gulf_catalog_app/common/widgets/svg_icon.dart';
import 'package:gulf_catalog_app/core/configs/assets/app_vectors.dart';
import 'package:gulf_catalog_app/core/configs/routes/app_routes.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/navbar_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';
import 'package:gulf_catalog_app/features/navigation/presentation/i18n/navigation.i18n.dart';

class NavigationLayout extends StatelessWidget {
  final Widget child;
  const NavigationLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: context.responsive<Widget>(
          VerticalLayout(child: child),
          lg: HorizontalLayout(child: child),
        ),
      ),
    );
  }
}

class HorizontalLayout extends StatelessWidget {
  final Widget child;
  const HorizontalLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.responsive<double>(45, xl: 50),
          child: Row(
            children: [
              SvgIcon(
                icon: AppVectors.lightLogo,
                height: context.responsive<double>(45, xl: 50),
              ),
              const Spacer(),
              const NavBar(),
              const Spacer(),
              const ActionBar(),
            ],
          ),
        ),
        const Gap(20),
        Expanded(child: child),
      ],
    );
  }
}

class VerticalLayout extends StatelessWidget {
  final Widget child;
  const VerticalLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  SvgIcon(
                    icon: AppVectors.lightLogo,
                    height: context.responsive<double>(40, sm: 40, md: 50),
                  ),
                  const Spacer(),
                  const ActionBar(),
                ],
              ),
            ),
            Expanded(child: child)
          ],
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [NavBar(), Gap(15)],
          ),
        ),
      ],
    );
  }
}

class ActionBar extends StatelessWidget {
  const ActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return Flex(
      direction: Axis.horizontal,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: MAppTheme.kRadius,
            color: colorScheme.inverseSurface,
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgIcon(
              icon: AppVectors.solidBell,
              height: context.responsive(20, sm: 25, md: 30, lg: 20, xl: 25),
              color: colorScheme.onInverseSurface,
            ),
          ),
        ),
        const Gap(10),
        Container(
          decoration: BoxDecoration(
            borderRadius: MAppTheme.kRadius,
            color: colorScheme.inverseSurface,
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgIcon(
              icon: AppVectors.solidSettings,
              height: context.responsive(20, sm: 25, md: 30, lg: 20, xl: 25),
              color: colorScheme.onInverseSurface,
            ),
          ),
        )
      ],

      // child: GroupButton<String>(
      //   buttons: const [
      //     AppVectors.bell,
      //     AppVectors.settings,
      //   ],
      //   options: const GroupButtonOptions(direction: Axis.horizontal),
      //   buttonBuilder: (selected, value, context) {
      //     return IconButton(
      //       onPressed: () {},
      //       icon: SvgIcon(
      //         icon: value,
      //         height: context.responsive<double>(
      //           20,
      //           sm: 25,
      //           md: 30,
      //           lg: 25,
      //           xl: 30,
      //         ),
      //         color: selected
      //             ? Theme.of(context).colorScheme.onPrimary
      //             : Theme.of(context).colorScheme.onSurface,
      //       ),
      //     );
      //   },
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final widgetTheme = Theme.of(context).extension<ButtonbarTheme>()!;
    return Container(
      padding: widgetTheme.padding,
      decoration: widgetTheme.panelDecoration,
      child: GroupButton<MRouteData>(
        buttons: const [
          AppRoutes.catalog,
          AppRoutes.categories,
          AppRoutes.orders,
          AppRoutes.clients,
        ],
        options: GroupButtonOptions(
          direction: widgetTheme.direction,
          spacing: widgetTheme.spacing,
        ),
        buttonBuilder: (selected, route, context) {
          return Container(
            padding: widgetTheme.buttonPadding,
            decoration: widgetTheme.buttonDecoration.copyWith(
              color: context.responsive(Colors.transparent,
                  lg: selected
                      ? context.theme.colorScheme.inverseSurface
                      : Colors.transparent),
            ),
            child: context.responsive(
                SvgIcon(
                  icon: selected ? route.selectedIcon : route.idleIcon,
                  height: widgetTheme.buttonHeight,
                  color: selected
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onInverseSurface,
                ),
                lg: Row(
                  children: [
                    SvgIcon(
                      icon: selected ? route.selectedIcon : route.idleIcon,
                      height: widgetTheme.buttonHeight,
                      color: selected
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                    const Gap(10),
                    Text(
                      route.name.i18n,
                      style: widgetTheme.textStyle.copyWith(
                        color: selected
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
