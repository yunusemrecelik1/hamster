import 'package:flutter/material.dart';
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
      onPageBuilder: (context, ProfileViewModel value) => Container(child: Text("Profile Page"),)
    );
  }
}
