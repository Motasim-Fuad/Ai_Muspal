import 'package:flutter/material.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("聯絡我們",style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("如有任何問題或需要協助,歡迎隨時透過電郵與我們聯繫。我們將盡快回覆您。"),
            SizedBox(height: 30,),

            Text("電郵地址",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("support@gmail.com"),
          ],
        ),
      )
    );
  }
}
