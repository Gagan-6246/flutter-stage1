import 'dart:io';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stage1/pages/second.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:email_validator/email_validator.dart';

// contacts, calendar, validators,photos, tabs, backbutton handler, country and states,loading screen
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: First_tab(),
    ));

class First_tab extends StatefulWidget {
  const First_tab({super.key});

  @override
  State<First_tab> createState() => _First_tabState();
}

class _First_tabState extends State<First_tab> {
//
//form validation
//
  final formkey = GlobalKey<FormState>();
  // DateTime _dateTime;
  //
  //Image Picker
  //
  File? image;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    // final imageTemporary = File(image.path);
    final imagePermanent = await saveImagePermanently(image.path);
    setState(() {
      this.image = imagePermanent;
    });
  }

  //
  //To save image permanently
  //
  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  //
  //Data for Forms
  //
  String username1 = 'first screen content',
      email1 = 'first screen',
      date1 = '',
      city1 = '';
  String city = '', state = '', country = '';

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Row(
                children: [
                  Text(
                    'Enter your Details',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              ClipOval(
                child: image != null
                    ? Image.file(
                        image!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : Image(
                        image: AssetImage('assets/toxic.jpg'),
                        width: 100,
                        height: 100,
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.image_outlined,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Import From Gallery'),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () {
                        pickImage(ImageSource.camera);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.camera_alt_outlined,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Import From Camera'),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      )),
                ],
              ),

              Divider(
                height: 40,
              ),

              Form(
                key: formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _username,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.supervised_user_circle),
                        label: Text('Username'),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value != null && value.length < 4) {
                          return "Name should contain atleast 4 alphabets";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _email,
                      autofillHints: {AutofillHints.email},
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        label: Text('Email'),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value != null && !EmailValidator.validate(value)) {
                          return "Enter valid Email ID";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _date,
                      // keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today_rounded),
                        label: Text('DOB (dd/mm/yyyy)'),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value != null && value.length < 2) {
                          return "Please select your Date Of Birth";
                        } else {
                          return null;
                        }
                      },
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.utc(1998, 2, 25),
                            firstDate: DateTime(1970),
                            lastDate: DateTime(2023));
                        if (pickeddate != null) {
                          setState(() {
                            _date.text =
                                DateFormat('dd/MM/yyyy').format(pickeddate);
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Select Your Location Below'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),

              CSCPicker(
                layout: Layout.vertical,
                defaultCountry: DefaultCountry.India,
                onCountryChanged: (Country) {
                  setState(() {
                    country = Country.toString();
                  });
                },
                onStateChanged: (State) {
                  setState(() {
                    state = State.toString();
                  });
                },
                onCityChanged: (City) {
                  setState(() {
                    city = City.toString();
                    // if (city.length <2 && city == 'City') {
                    //   return "please select your city";
                    // } else {
                    //   return null;
                    // }
                  });
                },
              ),
              // TextFormField(
              //   controller: _city,
              //   keyboardType: TextInputType.name,
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.house),
              //     label: Text('Home Town'),
              //     border: OutlineInputBorder(),
              //   ),
              //   onTap: () {
              //     CSCPicker();
              //   },
              // ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: (() {
                  final isValidForm = formkey.currentState!.validate();
                  // final validCity = city.characters
                  if (isValidForm) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => Second(
                              username2: username1,
                              email2: email1,
                              date2: date1,
                              city2: city,
                              state: state,
                            ))));
                  }
                  username1 = _username.text;
                  email1 = _email.text;
                  date1 = _date.text;
                  city1 = _city.text;
                  print(username1);
                  print(email1);
                  print(city);
                  print(state);
                  //
                  //
                  // getweather(); ////to print weather details test
                  //
                  //
                }),
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 20, color: Colors.grey[300]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
