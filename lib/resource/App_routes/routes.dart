
import 'package:ai_muspal/view/All_conversations_view/all_chat_list_view.dart';
import 'package:ai_muspal/view/Authentication/Welcome_view/welcome_view.dart';
import 'package:ai_muspal/view/Delete_Account/delete_account_view.dart';
import 'package:ai_muspal/view/ManageSubscription/Manage_Subscription_view.dart';
import 'package:ai_muspal/view/Payment_view/payment_view.dart';
import 'package:ai_muspal/view/Piano_Analysis_view/piano_analysis_chat_view.dart';
import 'package:ai_muspal/view/Piano_Analysis_view/piano_analysis_view.dart';
import 'package:ai_muspal/view/Privacy/Privacy_View.dart';
import 'package:ai_muspal/view/SingOut/Sing_Out.dart';
import 'package:ai_muspal/view/UpgrateMemberShift/upgarte_member_shift_view.dart';
import 'package:ai_muspal/view/about/about_view.dart';
import 'package:ai_muspal/view/chatReport_view/chat_report_view.dart';
import 'package:ai_muspal/view/contact/contact_view.dart';
import 'package:ai_muspal/view/music_chat/music_chat.dart';
import 'package:ai_muspal/view/tarms_of_services/terms_of_service_view.dart';
import 'package:ai_muspal/view/violin_Analysis/violin_analysis.dart';
import 'package:ai_muspal/view/violin_Analysis/violin_analysis_chat_view/violin_analysis_chat_view.dart';
import 'package:get/get.dart';
import '../../bindings/chat_report_binding.dart';
import '../../bindings/music_chat_binding.dart';
import '../../view/Authentication/Email/email_view.dart';
import '../../view/Authentication/Otp/otp_view.dart';
import '../../view/Authentication/register/register_view.dart';
import '../../view/Splash_view.dart';
import '../../view/home/home_view.dart';

import '../../view/paid_member_view/paid_member_view.dart';
import '../../view/premium_member_view/premium_member_view.dart';
import '../../view/profile/profile.dart';
import 'routes_name.dart';


class AppRouts {

  static approutes ()=>[
    GetPage(
        name: RouteName.splashScreen,
        page: ()=> SplashView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.registerView,
        page: ()=> RegisterView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.emailView,
        page: ()=> EmailView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.otpView,
        page: ()=> OtpView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
        name: RouteName.welcomeView,
        page: ()=> WelcomeView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.homeView,
        page: ()=> HomeView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
        name: RouteName.profileView,
        page: ()=> ProfileView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.upgratemembershiftView,
        page: ()=> UpgarteMemberShiftView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.aboutView,
        page: ()=> AboutView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.contactView,
        page: ()=> ContactView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.termsofServices,
        page: ()=> TermsOfServiceView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.privacyView,
        page: ()=> PrivacyView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
        name: RouteName.singoutView,
        page: ()=> SingOutView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.deleteAccountView,
        page: ()=> DeleteAccountView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.paymentView,
        page: ()=> PaymentView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.premiumMemberView,
        page: ()=> PremiumMemberView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.paidMemberView,
        page: ()=> PaidMemberView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.manageSubscriptionView,
        page: ()=> ManageSubscriptionView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
        name: RouteName.music_chatView,
        page: ()=> MusicChatView(),binding: MusicChatBinding(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
        name: RouteName.violinAnalysisview,
        page: ()=> ViolinAnalysisView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.violinAnalysisChatView,
        page: ()=> ViolinAnalysisChatView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
        name: RouteName.pianoAnalysisView,
        page: ()=> PianoAnalysisView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.pianoAnalysisChatView,
        page: ()=> PianoAnalysisChatView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.chatReportView,
        page: ()=> ChatReportView() , binding: ReportBinding(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
        name: RouteName.allChatListView,
        page: ()=> AllChatListView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(microseconds: 250),
    ),
  ];
}