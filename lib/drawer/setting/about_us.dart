import 'package:flutter/material.dart';
import 'package:untitled1newone/drawer/drawer.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';
class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: DrawerWidget(),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'images/baby.jpg',
                width: double.infinity,
                height: (MediaQuery.of(context).size.height)-450,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.all(10,),
            child: Column(
              children: [
                Align(
                  alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                  child: Text(
                     LocalizationCubit.get(context).localization ? ' حول التطبيق' : 'about au',
                    // S.of(context).pageAboutau,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                  child: Text(
                    LocalizationCubit.get(context).localization ? ' حول' : 'sdfkjdkjfffhff',
                    // 'sdfkjdkjfffhff',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
