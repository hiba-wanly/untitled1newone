import 'package:flutter/material.dart';
import 'package:untitled1newone/drawer/drawer.dart';
import 'package:untitled1newone/drawer/setting/callus.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
          child: Text(
            LocalizationCubit.get(context).localization ? ' تواصل معنا ' : 'contact us',
            // S.of(context).pageContactus,
          ),
        ),
        leading: DrawerWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,right: 10,left: 15,bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.call,
                  size: 25,
                  color: Theme.of(context).bottomAppBarColor,
                ),
                SizedBox(width: 10,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20,),
                      child: Text(
                        LocalizationCubit.get(context).localization ? ' اتصل بنا' : 'call us',
                        // S.of(context).pageCallus,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,),
                      child: Text(
                        LocalizationCubit.get(context).localization ? ' نحن هنا' : 'we are here  ',
                        // S.of(context).pageWeAre,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150,),
                  child: IconButton(
                    onPressed: (){
                      Navigator.push(
                        context ,
                        MaterialPageRoute(
                          builder: (context) => Numbers(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: Theme.of(context).bottomAppBarColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


