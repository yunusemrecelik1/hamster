// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';

class CustomSwitchListTile extends StatefulWidget {
  const CustomSwitchListTile({Key? key, this.title, required this.boolValue})
      : super(key: key);
  final String? title;
  final bool boolValue;

  @override
  _CustomSwitchListTileState createState() =>
      _CustomSwitchListTileState(boolValue);
}

class _CustomSwitchListTileState extends State<CustomSwitchListTile> {
  bool visibility = false;
  _CustomSwitchListTileState(bool value) {
    visibility = value;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        widget.title ?? "",
        style: context.textTheme.titleMedium
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
      ),
      value: visibility,
      onChanged: (bool newValue) {
        visibility = !visibility;
        setState(() {});
      },
      activeColor: ColorPalette.instance.switchTileActiveColor,
      activeTrackColor: ColorPalette.instance.appBlack,
      inactiveThumbColor: ColorPalette.instance.switchTileActiveColor,
      inactiveTrackColor: ColorPalette.instance.appBlack,
      contentPadding: EdgeInsets.zero,
    );
  }
}
