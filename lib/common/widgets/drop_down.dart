import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gulf_catalog_app/core/configs/theme/app_theme.dart';

class DropDown<T> extends StatefulWidget {
  final List<T>? items;
  final DropdownMenuItem<T> Function(T item) itemBuilder;
  final IconData hintIcon;
  final String hintText;
  final String? disabledHintText;
  final bool Function(DropdownMenuItem<T> item, String value)? onSearch;

  const DropDown(
      {super.key,
      this.items,
      required this.itemBuilder,
      required this.hintIcon,
      required this.hintText,
      this.disabledHintText,
      this.onSearch});

  @override
  State<DropDown> createState() => _DropDownState<T>();
}

class _DropDownState<T> extends State<DropDown<T>> {
  T? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        isExpanded: true,
        hint: Row(
          children: [
            Icon(
              widget.hintIcon,
              size: 20,
              color: theme.appColors.onSurfaceSecondary1,
            ),
            const Gap(10),
            Expanded(
              child: Text(
                widget.hintText,
                style: theme.appTextStyles.body1.copyWith(fontSize: 13.5),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        disabledHint: Row(
          children: [
            Icon(
              widget.hintIcon,
              size: 20,
              color: theme.appColors.onSurfaceSecondary1,
            ),
            const Gap(10),
            Expanded(
              child: Text(
                widget.disabledHintText ?? widget.hintText,
                style: theme.appTextStyles.bodyAlt1.copyWith(fontSize: 13.5),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.items?.map(widget.itemBuilder).toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.only(right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.appColors.surface2,
          ),
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: theme.appColors.onSurfaceSecondary1,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          elevation: 0,
          maxHeight: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: theme.appColors.surface2,
              border: Border.all(color: theme.appColors.border, width: 2)),
          offset: const Offset(0, -10),
          scrollbarTheme: const ScrollbarThemeData(
            radius: Radius.circular(8),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 14),
        ),
        dropdownSearchData: widget.onSearch == null
            ? null
            : DropdownSearchData(
                searchController: textEditingController,
                searchInnerWidgetHeight: 60,
                searchInnerWidget: Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 8,
                  ),
                  child: TextFormField(
                    expands: true,
                    maxLines: null,
                    controller: textEditingController,
                    cursorColor: theme.appColors.accent,
                    decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: theme.appColors.onAccent,
                        hintText: 'Search...',
                        hintStyle:
                            theme.appTextStyles.bodyAlt1.copyWith(fontSize: 13),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: theme.appColors.border)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: theme.appColors.border),
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
                searchMatchFn: widget.onSearch ??
                    (item, searchValue) {
                      return true;
                    },
              ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}

enum DropDownItemType { header, data }
