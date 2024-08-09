import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:popover/popover.dart';

class NavigationButton extends StatelessWidget {
  final String routeName;
  final SvgPicture icon;
  const NavigationButton(
      {required this.routeName, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // context.pushNamed(routeName);
        showPopover(
            context: context,
            bodyBuilder: (context) => Container(color: Colors.cyan),
            width: 200,
            height: 400,
            arrowWidth: 0,
            contentDyOffset: 5);
      },
      child: icon,
    );
  }
}

// ===========================================================================
//
// ===========================================================================

enum AnimationStyles { defaultStyle, custom, none }

const List<(AnimationStyles, String)> animationStyleSegments =
    <(AnimationStyles, String)>[
  (AnimationStyles.defaultStyle, 'Default'),
  (AnimationStyles.custom, 'Custom'),
  (AnimationStyles.none, 'None'),
];

enum Menu { preview, share, getLink, remove, download }

class PopupMenuExample extends StatefulWidget {
  const PopupMenuExample({super.key});

  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

class _PopupMenuExampleState extends State<PopupMenuExample> {
  Set<AnimationStyles> _animationStyleSelection = <AnimationStyles>{
    AnimationStyles.defaultStyle
  };
  AnimationStyle? _animationStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SegmentedButton<AnimationStyles>(
            selected: _animationStyleSelection,
            onSelectionChanged: (Set<AnimationStyles> styles) {
              setState(() {
                _animationStyleSelection = styles;
                switch (styles.first) {
                  case AnimationStyles.defaultStyle:
                    _animationStyle = null;
                  case AnimationStyles.custom:
                    _animationStyle = AnimationStyle(
                      curve: Easing.emphasizedDecelerate,
                      duration: const Duration(seconds: 3),
                    );
                  case AnimationStyles.none:
                    _animationStyle = AnimationStyle.noAnimation;
                }
              });
            },
            segments: animationStyleSegments
                .map<ButtonSegment<AnimationStyles>>(
                    ((AnimationStyles, String) shirt) {
              return ButtonSegment<AnimationStyles>(
                  value: shirt.$1, label: Text(shirt.$2));
            }).toList(),
          ),
          const SizedBox(height: 10),
          PopupMenuButton<Menu>(
            popUpAnimationStyle: _animationStyle,
            icon: const Icon(Icons.more_vert),
            onSelected: (Menu item) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.preview,
                child: ListTile(
                  leading: Icon(Icons.visibility_outlined),
                  title: Text('Preview'),
                ),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.share,
                child: ListTile(
                  leading: Icon(Icons.share_outlined),
                  title: Text('Share'),
                ),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.getLink,
                child: ListTile(
                  leading: Icon(Icons.link_outlined),
                  title: Text('Get link'),
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<Menu>(
                value: Menu.remove,
                child: ListTile(
                  leading: Icon(Icons.delete_outline),
                  title: Text('Remove'),
                ),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.download,
                child: ListTile(
                  leading: Icon(Icons.download_outlined),
                  title: Text('Download'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
