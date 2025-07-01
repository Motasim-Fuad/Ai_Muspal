import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsOfServiceView extends StatefulWidget {
  const TermsOfServiceView({super.key});

  @override
  State<TermsOfServiceView> createState() => _TermsOfServiceViewState();
}

class _TermsOfServiceViewState extends State<TermsOfServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("TermsOfServiceView_1st".tr,style: TextStyle(fontWeight: FontWeight.bold),),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text("TermsOfServiceView_2nd".tr),
              SizedBox(height: 30,),
              Text("TermsOfServiceView_3rd".tr),
              SizedBox(height: 30,),
              Text("TermsOfServiceView_4th".tr),
              SizedBox(height: 30,),
              Text("勿兩菜「春青火開」從下停回古更開帽問夕乍福己黃。裏七壯歌旁十，亭路五蝴千河貝，松申開。牛壯秋貓它天上雨訴多蝴食裝石。"),
              SizedBox(height: 30,),
              Text("采回送兩神扒苦怎雲事。還青穿肉交花聲陽壯；往六問爬合聲寸人植幼訴夕行兩山？戶借往貫陽晚荷昌兄，爸青人步共室也朱什回忍能園苦！左外丟尾？做貝自，天次亭泉我。戶尺畫。"),
              SizedBox(height: 30,),
              Text("晚國急平英央手蛋升旦吃又飛風會朱！尤送寺正跳喝自今羽急尾飽太條欠，即示怪即馬寺，食國几彩房學細年門夏根。"),
              SizedBox(height: 30,),
              Text("尾我童几您現具西的都斤扒課右訴欠。她帶而北語女肉筆拍貫蝶亮乞刃助，抓課雨家了地尼，吉由乙校，朱歌地樹躲兩祖。"),
              SizedBox(height: 30,),
              Text("貝原也像。一元支奶門耳風錯語會陽奶借色買昔且夏氣想到。"),
            ],
          ),
        ),
      )
    );
  }
}
