import 'package:booster/booster.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:you_2_art/application/date_formatter.dart';
import 'package:you_2_art/infrastrucuture/models/category.dart';
import 'package:you_2_art/infrastrucuture/models/comment.dart';
import 'package:you_2_art/infrastrucuture/models/talent.dart';
import 'package:you_2_art/infrastrucuture/services/category.dart';

class CommentTile extends StatelessWidget {
  final TalentModel talentModel;
  final CommentModel commentModel;

  CommentTile({required this.talentModel, required this.commentModel});

  CategoryServices _categoryServices = CategoryServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        border: Border(
          top: BorderSide(width: 1, color: Color(0x4DD4D4D4)),
          bottom: BorderSide(width: 1, color: Color(0x4DD4D4D4)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(talentModel.image.toString()),
            ),
            Booster.horizontalSpace(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Booster.dynamicFontSize(
                        label: talentModel.firstName.toString() +
                            " " +
                            talentModel.lastName.toString(),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    Booster.horizontalSpace(20),
                    Booster.dynamicFontSize(
                        label: DateFormatter.dateFormatter(
                            commentModel.time!.toDate()),
                        fontSize: 11,
                        color: Color(0xffACACAC),
                        fontWeight: FontWeight.w400),
                  ],
                ),
                Booster.verticalSpace(3),
                Row(
                  children: [
                    ...talentModel.categories!.map((e) {
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
                Booster.verticalSpace(5),
                Container(
                  width: 250,
                  child: Booster.dynamicFontSize(
                      label: commentModel.comment.toString(),
                      fontSize: 11,
                      isAlignCenter: false,
                      lineHeight: 1.3,
                      color: Color(0xff7A8FA6),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
