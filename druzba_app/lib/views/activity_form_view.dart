import 'package:flutter/material.dart';
import 'package:test/api/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/views/home_view.dart';
import 'dart:async';

class ActivityFormView extends StatefulWidget {
  ActivityFormView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ActivityFormViewState createState() => _ActivityFormViewState();
}

class _ActivityFormViewState extends State<ActivityFormView> {
  final naslovAktivnostiKontroler = TextEditingController();
  final firstNameTextController = TextEditingController();
  final trajanjeAktivnostiKontroler = TextEditingController();
  final mestoAktivnostiKontroler = TextEditingController();
  final minAktivnostiKontroler = TextEditingController();
  final passTextController2 = TextEditingController();
  final descNameTextController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  String dropdownvalue = 'Sport';

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title,
      {bool isPassword = false, required TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Future<void> postActivity() async {
    print('implementiraj');
  }

  Widget _submitButton() {
    return TextButton(
        onPressed: postActivity,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xfffbb448), Color(0xfff7892b)])),
          child: Text(
            'ActivityForm',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Dodaj aktivnost',
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: Color(0xffe46b10)),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  var items = [
    'Sport',
    'Koncert',
    'Ucenje',
    'Izlazak',
    'Kulturno desavanje',
    'Izlet',
    'Takmicenja',
    'Drustvene igre',
    'Ostalo'
  ];

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Naslov Aktivnosti", controller: naslovAktivnostiKontroler),
        _entryField("Mesto", controller: mestoAktivnostiKontroler),
        _entryField("Tip", controller: firstNameTextController),
        _entryField("Opis aktivnosti", controller: descNameTextController),
        _entryField("Trajanje", controller: trajanjeAktivnostiKontroler),
        _entryField("Minimalan broj ljudi", controller: minAktivnostiKontroler),
        _entryField("Maksimalan broj ljudi", controller: passTextController2),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xfffbb448), Color(0xfff7892b)])),
          child: DropdownButton(
            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items,
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 0, 0, 0))),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset(2, 4),
                          blurRadius: 5,
                          spreadRadius: 2)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                child: Text(
                  'Izaberite datum',
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(), //OVO SE RAZLIKUJE
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
