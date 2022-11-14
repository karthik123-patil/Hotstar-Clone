import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotstar_clone/utils/strings.dart';

import '../../utils/colors.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: (){
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.txtContinueWithNo,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 10,),
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9]")),
                              LengthLimitingTextInputFormatter(10),
                            ],
                            autofillHints: const [
                              AutofillHints.telephoneNumber,
                            ],
                            autofocus: true,
                            onChanged: (value) {
                            },
                            style: Theme.of(context).textTheme.headline2,
                            decoration: InputDecoration(
                                prefixText: AppStrings.nineOneText,
                                prefixStyle:const TextStyle(color: Colors.white38, fontWeight: FontWeight.w500, fontSize: 14),
                                hintText: AppStrings.hintMobileNumber,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 16.0),
                                enabledBorder:const UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.darkBlueColor),
                                ),
                                focusedBorder:const UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.darkBlueColor),
                                ),
                                errorBorder:const UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.darkBlueColor),
                                )
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.darkBlueColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: AppColors.blueColor))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.btnContinue,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 RichText(text: TextSpan(
                   children: [
                     TextSpan(
                       text: AppStrings.txtByClicking,
                       style: Theme.of(context).textTheme.headline3
                     ),
                     TextSpan(
                       text: AppStrings.txtTermsOfUse,
                       style: const TextStyle(
                         color: AppColors.darkBlueColor,
                           fontSize: 10,
                           fontWeight: FontWeight.w500,
                           letterSpacing: 0.2,
                           fontFamily: "RobotoSlabMedium",
                           fontStyle: FontStyle.normal
                       )
                     ),
                   ]
                 ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(
                            text: AppStrings.txtAcknowledge,
                            style: Theme.of(context).textTheme.headline3
                        ),
                        TextSpan(
                            text: AppStrings.txtPrivacyPolicy,
                            style: const TextStyle(
                                color: AppColors.darkBlueColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                fontFamily: "RobotoSlabMedium",
                                fontStyle: FontStyle.normal
                            )
                        ),
                      ]
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
