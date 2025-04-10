import 'package:flutter/material.dart';
import 'package:sample_app/core/colors.dart';
import 'package:sample_app/core/font_sizes.dart';
import 'package:sample_app/core/values/options.dart';
import 'package:sample_app/core/widgets/options_card.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  final userCustomColors = CustomColors();
  final userCustomFont = CustomFontSizes();
   

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: userCustomColors.whiteColor, width: 2),
                      borderRadius: BorderRadius.circular(48)
                    ),
                    child: CircleAvatar(
                      
                      radius: 48,
                      backgroundColor: Color(0xffE0E0E0),
                      child: Text('JL', style: TextStyle(color: userCustomColors.greyColor, fontSize: 32), ),
                    ),
                  ),
                  SizedBox(height: 24,),
                 
                  Text('Jonathan Mensah', style: userCustomFont.heading5,),
                  SizedBox(height: 12,),
                 
                  Text('0244123456', style: userCustomFont.bodySmall,),
                  SizedBox(height: 24,),
                  OptionsCard(
                    items: upperValues,
                  ),
                   SizedBox(height: 24,),
                  OptionsCard(
                    items: lowerValues,
                  )
              ],
            ),
          ),
        ),
      );
  }
}