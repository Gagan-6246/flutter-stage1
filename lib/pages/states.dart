import 'package:flutter/material.dart';
import 'package:stage1/pages/kar.dart';

class States extends StatelessWidget {
  const States({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('There are 28 Sates and \n    8 Union Territories:'),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/map.jpg'))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'States :',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                ListTile(
                  leading:
                      Text('1.', style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text(
                    'Karnataka',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: Image(image: AssetImage('assets/kar.png')),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(title: Text('My Page')),
                          body: Center(
                            child: Image(
                              image: AssetImage('assets/kar.png'),
                            ),
                          ),
                        );
                      },
                    ));
                  },
                  hoverColor: Colors.blue,
                ),
                ListTile(
                  leading:
                      Text('2.', style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Andhra Pradesh',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading:
                      Text('3.', style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Arunachal Pradesh',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading:
                      Text('4.', style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Assam',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading:
                      Text('5.', style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Bihar',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading:
                      Text('6.', style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Chattisgarh',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading:
                      Text('7.', style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Goa',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading:
                      Text('8.', style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Gujarat',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading:
                      Text('9.', style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Haryana',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('10.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Himachal Pradesh',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('11.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Jharkhand',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('12.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Kerala',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('13.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Madhya Pradesh',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('14.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Maharashtra',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('15.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Manipur',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('16.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Meghalaya',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('17.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Mizoram',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('18.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Nagaland',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('19.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Odisha',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('20.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Punjab',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('21.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Rajasthan',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('22.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Sikkim',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('23.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Tamilnadu',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('24.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Telangana',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('25.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Tripura',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('26.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Uttar Pradesh',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('27.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('Uttarakhand',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  leading: Text('28.',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  title: Text('West Bengal',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                ListTile(
                  title: Text(
                    'Union Territories :',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                ListTile(
                  leading: Text('1.'),
                  title: Text('Andaman and Nicobar Island'),
                ),
                ListTile(
                  leading: Text('2.'),
                  title: Text('Chandigarh'),
                ),
                ListTile(
                  leading: Text('3.'),
                  title: Text('Dadra and Nagar Haveli and Daman and Diu'),
                ),
                ListTile(
                  leading: Text('4.'),
                  title: Text('Delhi'),
                ),
                ListTile(
                  leading: Text('5.'),
                  title: Text('Ladakh'),
                ),
                ListTile(
                  leading: Text('6.'),
                  title: Text('Lakshadweep'),
                ),
                ListTile(
                  leading: Text('7.'),
                  title: Text('Jammu and Kashmir'),
                ),
                ListTile(
                  leading: Text('8.'),
                  title: Text('Puducherry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
