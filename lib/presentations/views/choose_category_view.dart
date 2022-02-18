import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/infrastrucuture/models/category.dart';
import 'package:you_2_art/infrastrucuture/services/category.dart';
import 'package:you_2_art/presentations/elements/app_button_short.dart';
import 'package:you_2_art/presentations/elements/choose_category_title.dart';
import 'package:you_2_art/presentations/elements/flush_bar.dart';
import 'package:you_2_art/presentations/elements/loading_widgets/loading_category.dart';
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
                    return categoryList[0].docId == null
                        ? LoadingReview()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: categoryList.length,
                            itemBuilder: (context, i) {
                              return Column(
                                children: [
                                  ChooseCategoryTile(
                                    onTap: () {
                                      if (_selectedCategories.contains(
                                          categoryList[i].docId.toString())) {
                                        _selectedCategories.remove(
                                            categoryList[i].docId.toString());
                                      } else {
                                        _selectedCategories.add(
                                            categoryList[i].docId.toString());
                                      }

                                      setState(() {});
                                    },
                                    text:
                                        categoryList[i].categoryName.toString(),
                                    isSelected: _selectedCategories.contains(
                                        categoryList[i].docId.toString()),
                                  ),
                                  Booster.verticalSpace(25),
                                ],
                              );
                            });
                  },
                ),
                Booster.verticalSpace(25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppButtonShort(
                        onTap: () {
                          if (_selectedCategories.isEmpty) {
                            getFlushBar(context,
                                title: 'Kindly select at least one category.');
                            return;
                          }
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
