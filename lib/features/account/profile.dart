import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sample_app/core/colors.dart';
import 'package:sample_app/core/font_sizes.dart';
import 'package:sample_app/core/widgets/brand_input.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final userCustomColors = CustomColors();
  final userCustomFont = CustomFontSizes();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  sendData({firstName, lastName, address}) async {
    try {
      var url = Uri.parse(
          'https://fixit-testing.tuulbox.app/api/accounts/6d475484-c5d6-492d-98c7-27b0733806b1/');
      final token =
          'Bearer aeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ0ODEwODQ3LCJpYXQiOjE3NDQyMDYwNDcsImp0aSI6ImMwOTdiMjQxOWFiYTRhOWNhZmI3NThlODE5MzUwNWE1IiwidXNlcl9pZCI6IjZkNDc1NDg0LWM1ZDYtNDkyZC05OGM3LTI3YjA3MzM4MDZiMSJ9.5rbz-kYzy3HiSs-VizQd38L21oIbxyNWJM0NXgkgYKE';
      final res = await http.patch(url,
          headers: {'Authorization': token, 'Content-type': 'application/json'},
          body: jsonEncode({
            "firstName": firstName,
            "lastName": lastName,
            "address": address,
          }));

      log('this is res ${res.body}');
      if (res.statusCode == 200) {
        var results = jsonDecode(res.body);
         if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(results['status'])),
        );
         }
      } else {
        throw res.body;
      }
    } catch (e) {
      if(mounted){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update your profile')),
      );
      }
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: userCustomColors.backGroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Update profile'),
        backgroundColor: userCustomColors.whiteColor,
        elevation: 0,
        titleTextStyle: userCustomFont.heading5Medium,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: (){Navigator.pop(context);},
            child: CircleAvatar(
              radius: 10,
                backgroundColor: userCustomColors.backGroundColor,
                child: Icon(Icons.arrow_back, size: 20, color: userCustomColors.neutralStronger,)),
          ),
        ),
        iconTheme: IconThemeData(color: Color(0xff3d3d3d)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: userCustomColors.backGroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Container(
              
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: userCustomColors.whiteColor,
                borderRadius: BorderRadius.circular(16)
                
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  BrandInput(
                      controller: firstNameController,
                      label: 'First name',
                      placeholder: 'First name'),
                  BrandInput(
                      controller: lastNameController,
                      label: 'Last name',
                      placeholder: 'Last name'),
                  BrandInput(
                      controller: addressController,
                      label: 'Address',
                      placeholder: 'Address'),
                  // ElevatedButton(
                  //     onPressed: () {
                        
                  //     },
                  //     child: Text('Submit'))
                ],
              ),
            ),
          ),
        ),
      ),
       bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: userCustomColors.whiteColor,
          
        ),
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: userCustomColors.primaryColor,
                      fixedSize: Size(353, 44),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                    ),
                    
                    onPressed: (){
                      if (formKey.currentState!.validate()) {
                        // Submit to api
                        sendData(
                          firstName: firstNameController.text.trim(),
                          lastName: lastNameController.text.trim(),
                          address: addressController.text.trim(),
                        );
                      }
                    }, child: Text('Save changes')),
                ),
               
              ],
            )),
      ),
    );
  }
}
