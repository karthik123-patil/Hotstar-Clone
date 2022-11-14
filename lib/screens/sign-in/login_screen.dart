import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotstar_clone/screens/dashboard/home_screen.dart';
import 'package:hotstar_clone/screens/sign-in/mobile_number_screen.dart';
import 'package:hotstar_clone/utils/strings.dart';

import '../../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    Get.to(()=> const HomeScreen());
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
                    AppStrings.txtLogin,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
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
                child: Text(
                  AppStrings.txtFacebookOrEmail,
                  style: Theme.of(context).textTheme.headline2,
                ),
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
                            onTap: (){
                              Get.to(()=> const MobileNumberScreen());
                            },
                            style: Theme.of(context).textTheme.headline2,
                            decoration: InputDecoration(
                                prefixText: AppStrings.nineOneText,
                                prefixStyle:const TextStyle(color: Colors.white38, fontWeight: FontWeight.w500, fontSize: 14),
                                hintText: AppStrings.hintMobileNumber,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 16.0),
                                enabledBorder:const UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.whiteColor),
                                ),
                                focusedBorder:const UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.whiteColor),
                                ),
                                errorBorder:const UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.whiteColor),
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
          ],
        ),
      ),
    );
  }
}
