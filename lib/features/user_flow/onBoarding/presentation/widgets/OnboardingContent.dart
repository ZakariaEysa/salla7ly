import 'package:flutter/cupertino.dart';
import '../../../../../generated/l10n.dart';

class OnBoardingContent {
  String image;
  String title;
  String description;

  OnBoardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnBoardingContent> getOnBoardingContents(BuildContext context) {
  var lang = S.of(context); // Now you can use 'lang' with BuildContext

  return [
    OnBoardingContent(
      title: lang.welcomeToSalla7ly, // Use localized string here
      image: "assets/images/on1.png",
      description: lang.on1Content,
    ),
    OnBoardingContent(
      title: lang.on2Title, // Use localized string here
      image: "assets/images/on2.png",
      description: lang.on2Content,
    ),
    OnBoardingContent(
      title: lang.on3Title, // Use localized string here
      image: "assets/images/on3.png",
      description: lang.on3Content,
    ),
  ];
}
