import 'package:flutter/material.dart';
import 'package:sample_app/core/colors.dart';
import 'package:sample_app/core/font_sizes.dart';

class BrandInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String placeholder;
  const BrandInput({super.key, required this.controller, required this.label, required this.placeholder});

  @override
  State<BrandInput> createState() => _BrandInputState();
}

class _BrandInputState extends State<BrandInput> {

  final userCustomFont = CustomFontSizes();
  final userCustomColors = CustomColors();

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0),
          child: Row(
            children: [
              Text(widget.label,style: userCustomFont.bodySmallMedium,),
              SizedBox(width: 4),
              Text("*",style: userCustomFont.bodySmallRegularDanger,),
            ],
          ),
        ),
        TextFormField(
          validator: (value){
            if(value!.isEmpty ){
              return 'Enter ${widget.label}';
            }
            return null;
          },
          controller: widget.controller,
          
          decoration: InputDecoration(
            hintText: widget.placeholder,
          fillColor: userCustomColors.surfaceFill,
          filled: true,
            isDense: true,
            // labelText: widget.label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), 
            borderSide: BorderSide(color: CustomColors().borderNeutral),
            
            )
          ),
          
        ),
      ],
    );
  }
}