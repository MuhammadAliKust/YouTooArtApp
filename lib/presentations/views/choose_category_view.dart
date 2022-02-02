import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/category.dart';
import 'package:you_2_art/infrastrucuture/services/category.dart';
import 'package:you_2_art/presentations/elements/app_button_short.dart';
import 'package:you_2_art/presentations/elements/choose_category_title.dart';
import 'package:you_2_art/presentations/views/create_profile.dart';

class ChooseCategory extends StatefulWidget {
  final String number;
  final String userID;

  ChooseCategory(this.number, this.userID);

  @override
  _ChooseCategoryState createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  CategoryServices _categoryServices = CategoryServices();

  List<String> _selectedCategories = [];

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
                StreamProvider.value(
                  value: _categoryServices.streamAllCategories(),
                  initialData: [CategoryModel()],
                  builder: (context, child) {
                    List<CategoryModel> categoryList =
                        context.watch<List<CategoryModel>>();
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: categoryList.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              ChooseCategoryTile(
                                  onTap: () {
                                    _selectedCategories
                                        .add(categoryList[i].docId.toString());
                                    setState(() {});
                                  },
                                  text:
                                      categoryList[i].categoryName.toString()),
                              Booster.verticalSpace(25),
                            ],
                          );
                        });
                  },
                ),
                // ChooseCategoryTile(onTap: () {}, text: 'Cameraperson'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Dance & Choreography'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Director'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Dubbing Artist '),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Editor'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Fashion Designer'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Film Promotion'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Hand Crafting'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Interior Design'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Locations'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Makeup Artist'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Meme Creator'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Movie Buff / Reviewer'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Music Director'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Painter'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Producer'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Singer'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Standup Comedy'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Story Tellling'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Technician'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'VFX'),
                // Booster.verticalSpace(25),
                // ChooseCategoryTile(onTap: () {}, text: 'Writer'),
                Booster.verticalSpace(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButtonShort(
                        onTap: () {
                          Get.to(() => CreateProfile(
                                categoryList: _selectedCategories,
                                number: widget.number,
                                userID: widget.userID,
                              ));
                        },
                        text: 'Next',
                        color: FrontEndConfigs.kPrimaryColor),
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
