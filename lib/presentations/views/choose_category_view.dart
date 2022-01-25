import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/presentations/elements/app_button_short.dart';
import 'package:you_2_art/presentations/elements/choose_category_title.dart';

class ChooseCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Booster.verticalSpace(20),
                Booster.dynamicFontSize(
                    label: 'Choose Category',
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
                Booster.verticalSpace(10),
                Booster.dynamicFontSize(
                    label: 'Select one ore more options',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Actor'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Cameraperson'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Dance & Choreography'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Director'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Dubbing Artist '),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Editor'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Fashion Designer'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Film Promotion'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Hand Crafting'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Interior Design'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Locations'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Makeup Artist'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Meme Creator'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Movie Buff / Reviewer'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Music Director'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Painter'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Producer'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Singer'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Standup Comedy'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Story Tellling'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Technician'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'VFX'),
                Booster.verticalSpace(25),
                ChooseCategoryTile(onTap: (){}, text: 'Writer'),
                Booster.verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButtonShort(onTap: (){}, text: 'Next', color: FrontEndConfigs.kPrimaryColor),
                  ],
                ),
                Booster.verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
