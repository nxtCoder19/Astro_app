import 'package:astro_app/Dashboard/CardSection/CardSectionAlignment.dart';
import 'package:astro_app/Dashboard/CardSection/CardsDetailsPage.dart';
import 'package:astro_app/Dashboard/Profile/ProfilePage.dart';
import 'package:astro_app/Dashboard/tinderCard/page/home_page.dart';
import 'package:astro_app/Login/login_screen.dart';
import 'package:astro_app/Otp/index.dart';
import 'package:astro_app/Signup/SignUpDetails.dart';
import 'package:astro_app/Signup/components/PlaceOfBirthScreen.dart';
import 'package:astro_app/Signup/components/RelationshipStatusScreen.dart';
import 'package:astro_app/Signup/components/DateOfBirthScreen.dart';
import 'package:astro_app/Signup/components/select_gender_screen.dart';
import 'package:astro_app/Signup/index.dart';
import 'package:astro_app/animations/SlideRight.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/screens/SettingPage.dart';
import 'package:astro_app/screens/editprofile/EditProfilePage.dart';
import 'package:astro_app/screens/splash/index.dart';
import 'package:flutter/material.dart';

import 'NotFound/NotFoundPage.dart';

class Routes {
  static PageRouteBuilder routes(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case SIGNUP:
        page = SignUpScreen();
        break;
      // case HOME_PAGE:
      //   page = HomePage();
      //   break;
      case LOGIN:
        page = LoginScreen();
        break;
      case SPLASH_SCREEN:
        page = AnimatedSplashScreen();
        break;
      case SELECT_GENDER_SCREEN:
        page = SelectGenderScreen();
        break;
      // case RELATIONSHIP_STATUS_SCREEN:
      //   page = RelationshipStatusScreen();
      //   break;
      // case TIME_OF_BIRTH_SCREEN:
      //   page = TimeOfBirthScreen();
      //   break;
      // case PLACE_OF_BIRTH_SCREEN:
      //   page = PlaceOfBirthScreen();
      //   break;
      // case ADD_MORE_INFO_SCREEN:
      //   page = SignUpDetailsScreen();
      //   break;
      // case MATCHES_DETAILS_SCREEN:
      //   page = DetailsPage();
      //   break;
      // case PROFILE_SCREEN:
      //   page = ProfilePage();
      //   break;
      case SETTING_SCREEN:
        page = SettingPage();
        break;
      case EDIT_INFO_SCREEN:
        page = EditProfile();
        break;
      case OTP_SCREEN:
        page = OtpVerificationScreen();
        break;
      default:
        page = NotFoundPage();
        break;
    }

    return SlideRightRoute(page: page);
  }
}