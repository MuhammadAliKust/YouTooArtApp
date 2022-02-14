import 'package:booster/booster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/infrastrucuture/models/category.dart';
import 'package:you_2_art/infrastrucuture/services/category.dart';

class UserProfileContainer1 extends StatelessWidget {
  final String name;
  final List<String> skills;
  final String area;
  final String contactno;
  final String postsno;
  final String image;
  final VoidCallback onTap;

  UserProfileContainer1(
      {required this.onTap,
      required this.name,
      required this.skills,
      required this.area,
      required this.contactno,
      required this.postsno,
      required this.image});
  CategoryServices _categoryServices = CategoryServices();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(image),
        ),
        Booster.horizontalSpace(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Booster.dynamicFontSize(
                    label: name, fontSize: 18, fontWeight: FontWeight.w700),
                Booster.horizontalSpace(5),
                Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  color: Colors.blue,
                  size: 17,
                )
              ],
            ),
            Booster.verticalSpace(3),
            Row(
              children: [
                ...skills.map((e) {
                  return StreamProvider.value(
                    value: _categoryServices.streamCategoryByID(e),
                    initialData: CategoryModel(),
                    builder: (context, child) {
                      return Booster.dynamicFontSize(
                          label: " #" +
                              context
                                  .watch<CategoryModel>()
                                  .categoryName
                                  .toString(),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff989898));
                    },
                  );
                }).toList(),
              ],
            ),
            Booster.verticalSpace(7),
            Booster.dynamicFontSize(
                label: area,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Color(0xff7A8FA6)),
            Booster.verticalSpace(7),
            Row(
              children: [
                Booster.dynamicFontSize(
                    label: contactno,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
                Booster.dynamicFontSize(
                    label: 'Connects',
                    fontSize: 9,
                    fontWeight: FontWeight.w700),
                Booster.horizontalSpace(15),
                Booster.dynamicFontSize(
                    label: postsno, fontSize: 13, fontWeight: FontWeight.w700),
                Booster.dynamicFontSize(
                    label: 'Posts', fontSize: 9, fontWeight: FontWeight.w700),
              ],
            )
          ],
        )
      ],
    );
  }
}
