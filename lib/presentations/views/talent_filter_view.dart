import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:booster/booster.dart';
import 'package:you_2_art/configs/front_end_configs.dart';
import 'package:you_2_art/presentations/elements/app_button_short.dart';
import 'package:you_2_art/presentations/elements/auth_text_field_simple.dart';
import 'package:you_2_art/presentations/elements/grid_view_widget_talent.dart';

class TalentFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFF6E0),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.bell_fill,
                          size: 17,
                          color: Color(0xffFEB400),
                        ),
                        Booster.dynamicFontSize(
                            label: '9+',
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ],
                    ),
                  ),
                ),
                Booster.horizontalSpace(7),
                Icon(Icons.menu, size: 22, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: AuthTextFieldSimple(
                          label: 'Actor,Hyderabad', number: 1)),
                  Booster.horizontalSpace(10),
                  Booster.dynamicFontSize(
                      label: 'Fliter',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Booster.dynamicFontSize(
                      label: 'Back',
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  Booster.horizontalSpace(10),
                  Booster.dynamicFontSize(
                      label: 'Clear All',
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  Booster.horizontalSpace(10),
                  Booster.dynamicFontSize(
                      label: 'Save',
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ],
              ),
              Booster.verticalSpace(20),
              Booster.dynamicFontSize(
                  label: 'Enter City Name',
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              Booster.verticalSpace(10),
              AuthTextFieldSimple(label: 'Hyderabad', number: 1),
              Booster.verticalSpace(10),
              Booster.dynamicFontSize(
                  label: 'Enter Talent',
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              Booster.verticalSpace(10),
              AuthTextFieldSimple(label: 'Search here', number: 1),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        color: Color(0xffFEB400),
                      ),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Actor',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Cameraperson',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Dance & Choreography ',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Director ',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Dubbing Artist ',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Editor',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Fashion Designer',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Film Promotion',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Hand Crafting',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Interior Design',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Locations',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Makeup Artist',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Meme Creator',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Movie Buff / Reviewer',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Music Director',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Painter',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Producer',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Singer',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Standup Comedy',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Story Tellling',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Technician',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'VFX',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(20),
              Row(
                children: [
                  Container(
                    height: 22,
                    width: 24,
                    decoration: BoxDecoration(
                      boxShadow: FrontEndConfigs.boxShadow,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Booster.horizontalSpace(15),
                  Booster.dynamicFontSize(
                      label: 'Writer',
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Booster.verticalSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppButtonShort(onTap: (){}, text: 'Next', color: Color(0xffFEB400)),
                ],
              ),
              Booster.verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
