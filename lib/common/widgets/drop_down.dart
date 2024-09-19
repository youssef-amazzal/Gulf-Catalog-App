import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';
import 'package:gulf_catalog_app/core/configs/theme/new/app_theme.dart';
import 'package:gulf_catalog_app/core/extensions/responsive/responsive.dart';

class DropDown<T> extends StatefulWidget {
  final List<T>? items;
  final DropdownMenuItem<T> Function(T item) itemBuilder;
  final IconData hintIcon;
  final String hintText;
  final String? disabledHintText;
  final void Function(T?)? onChanged;
  final DropDownController<T> controller;

  const DropDown({
    super.key,
    this.items,
    required this.itemBuilder,
    required this.hintIcon,
    required this.hintText,
    this.disabledHintText,
    this.onChanged,
    required this.controller,
  });

  @override
  State<DropDown> createState() => _DropDownState<T>();
}

class _DropDownState<T> extends State<DropDown<T>> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ListenableBuilder(
        listenable: widget.controller,
        builder: (BuildContext context, Widget? child) {
          return DropdownButtonHideUnderline(
            child: DropdownButton2<T>(
              isExpanded: true,
              hint: Row(
                children: [
                  Icon(
                    widget.hintIcon,
                    size: context.responsive(14, xl: 20),
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const Gap(10),
                  Expanded(
                    child: Text(
                      widget.hintText,
                      style: context.responsive(
                        textTheme.labelMedium!
                            .copyWith(color: colorScheme.onSurfaceVariant),
                        xl: textTheme.labelLarge!
                            .copyWith(color: colorScheme.onSurfaceVariant),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              disabledHint: Row(
                children: [
                  Icon(
                    widget.hintIcon,
                    size: context.responsive(14, xl: 20),
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const Gap(10),
                  Expanded(
                    child: Text(
                      widget.disabledHintText ?? widget.hintText,
                      style: textTheme.labelLarge!
                          .copyWith(color: colorScheme.onSurfaceVariant),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: widget.items?.map(widget.itemBuilder).toList(),
              value: widget.controller.selectedValue,
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
                widget.controller.setSelectedValue(value);
              },
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colorScheme.surfaceDim,
                ),
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                ),
                iconSize: context.responsive(12, xl: 14),
                iconEnabledColor: colorScheme.onSurfaceVariant,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                elevation: 0,
                maxHeight: context.responsive(300, xl: 500),
                decoration: BoxDecoration(
                  borderRadius: MAppTheme.kRadius,
                  color: colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.onSurfaceVariant.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 20,
                    )
                  ],
                ),
                offset: const Offset(0, -10),
                scrollbarTheme: const ScrollbarThemeData(
                  radius: Radius.circular(8),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: context.responsive(35, xl: 40),
                padding: const EdgeInsets.symmetric(horizontal: 14),
              ),
              //This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  widget.controller.textEditingController.clear();
                }
              },
            ),
          );
        });
  }
}

enum DropDownItemType { header, data }

class DropDownController<T> extends ChangeNotifier {
  T? _selectedValue;
  T? get selectedValue => _selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  void setSelectedValue(T? value) {
    _selectedValue = value;
    notifyListeners();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
