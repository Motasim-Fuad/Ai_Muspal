
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  Map<String,Map<String,String>> get keys =>{

    'en_US' :{
      "btm":"By continuing you automatically agree to AI Muspal's Terms of Use and Privacy Policy.",
      'internet_Exception':"We're unable to show results ,\n please chack your data connection",
      'GeneralExceptation':"We're unable to proces your request,\nplease try again",
      'login_title' :'login',
      'emailhint':'Enter Email',
      'passhint':"Enter Password",
    },

    'zh_CN' :{
      "btm":"繼續操作即表示您自動同意 AI Muspal 的使用條款和隱私權政策。",
      'internetException':"আমরা ফলাফল দেখাতে অক্ষম।\n অনুগ্রহ করে আপনার ডেটা সংযোগ পরীক্ষা করুন",
      'GeneralExceptation':"আমরা আপনার অনুরোধ প্রক্রিয়া করতে অক্ষম,\nঅনুগ্রহ করে আবার try করুন",
      "login_title":'login',
    },

  };
}