import 'package:flutter/material.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';
import 'package:hamster/view/home/profile/viewmodel/profile_view_model.dart';

import '../../../../core/base/view/base_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, ProfileViewModel value) => Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: ColorPalette.instance.darkGreen,
              child: Padding(
                padding: context.paddingMedium,
                child: Card(
                  child: ListTile(
                    leading: Text("sa"),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
