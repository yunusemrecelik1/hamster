import 'package:flutter/material.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';
import 'package:hamster/view/home/profile/viewmodel/profile_view_model.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../product/components/list_tile/switch_list_tile.dart';

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
            child: Padding(
              padding: context.paddingMedium,
              child: buildUserCard(context),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: context.paddingMediumHorizontal +
                  context.paddingNormalHorizontal,
              child: buildPageBody(context, value),
            ),
          )
        ],
      ),
    );
  }

  Card buildUserCard(BuildContext context) {
    return Card(
              color: ColorPalette.instance.profileCardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.normalValue),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: context.paddingMid,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(context.lowValue),
                      child: const Image(
                        image: NetworkImage(
                            "https://picsum.photos/id/1/200/200"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: context.paddingMid + context.paddingLowLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Emre",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Emre",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Emre",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
  }

  Column buildPageBody(BuildContext context, ProfileViewModel value) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Arkadaşlar",
                  style: context.textTheme.headline5
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 30),
                Card(
                  color: ColorPalette.instance.cardGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.normalValue),
                  ),
                  child: SizedBox(
                    height: context.height * 0.15,
                    width: context.height * 0.15,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        context.lowValue),
                                    child: const Image(
                                      image: NetworkImage(
                                          "https://picsum.photos/id/1/200/200"),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        context.lowValue),
                                    child: const Image(
                                      image: NetworkImage(
                                          "https://picsum.photos/id/1/200/200"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        context.lowValue),
                                    child: const Image(
                                      image: NetworkImage(
                                          "https://picsum.photos/id/1/200/200"),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        context.lowValue),
                                    child: const Image(
                                      image: NetworkImage(
                                          "https://picsum.photos/id/1/200/200"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Ayarlar",
                  style: context.textTheme.headline5
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                CustomSwitchListTile(
                  title: 'Bildirimler', boolValue: value.switchNotification,
                ),
                CustomSwitchListTile(
                  title: 'Konum', boolValue:value.switchLocation,
                ),
              ],
            );
  }
}
