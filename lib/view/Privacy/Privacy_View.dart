import 'package:flutter/material.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("隱私",style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 30,),
                Text("假亭幼才朱字往燈只告裝南，喜澡米開兌象虎前寸福。買個鼻過亮「進冬音跟昔種飽重言家」丁哥百送平化干今色彩收、貫冒植今喝事兩化紅十立過因課飽乞買幫「弟抄主晚目貝那」。"),
                SizedBox(height: 30,),
                Text("口昔教或十你會光早洋愛左現爸進口吹肖反太！昔鼻空南欠遠巴氣眼日。父自朵常。它聲下吃對怎年即音因蝴不誰，一兆外日叫買衣見？外把以相毛林。"),
                SizedBox(height: 30,),
                Text("杯好告快高波買她甲。夕風話只愛姐綠老。呢助邊吹，進扒吹老。世因候。更祖哪明條北書荷太院遠飯後喝幫怕尼氣門很，話用白瓜根秋夏。子金胡由游少送彩七且你平語新語美呢。"),
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
