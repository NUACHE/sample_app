import 'package:flutter/material.dart';
import 'package:sample_app/core/font_sizes.dart';
import 'package:sample_app/features/account/profile.dart';

class OptionsCard extends StatefulWidget {
  final List items;
  const OptionsCard({super.key, required this.items});

  @override
  State<OptionsCard> createState() => _OptionsCardState();
}

class _OptionsCardState extends State<OptionsCard> {
  final userFontStyles = CustomFontSizes();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Expanded(
        child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                onTap: () {
                  if( widget.items[index]['text'] == 'Update profile'){
                  Navigator.push(context, MaterialPageRoute(builder: (builder) {
                    return UpdateProfile();
                  }));
                  }
                },
                leading: widget.items[index]['icon'],
                title: Text(
                  widget.items[index]['text'],
                  style:  widget.items[index]['text'] == 'Logout'? userFontStyles.bodySmallRegularDanger: userFontStyles.bodySmallRegular ,
                ),
                trailing:
                widget.items[index]['text'] == 'Logout'?
                SizedBox.shrink():
                widget.items[index]['text'] == 'App version'?
                Text('1.0.0', style: userFontStyles.bodySmallRegular,):
                 Icon(Icons.chevron_right_outlined, size: 24,weight: 0.5, color: Color(0xffB8B8B8), ),
              );
            }),
      ),
    );
  }
}
