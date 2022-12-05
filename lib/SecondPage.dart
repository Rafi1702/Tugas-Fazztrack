// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart%20';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
// import 'package:pattern_formatter/numeric_formatter.dart';

class SecondPage extends StatefulWidget {
  final String name; //menerima variabel dari HomePage untuk ditampilkan
  final String
      balance; //menampung amount untuk dibuat kondisi jika field tidak disubmit dan menekan tombol balik maka pada nominal tidak ada perubahan
  final String image; //menerima variabel dari HomePage untuk ditampilkan
  final String number; //menerima variabel dari HomePage untuk ditampilkan
  const SecondPage(
      {Key key, this.name, this.balance, this.image, this.number = ""})
      : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var amount = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFCFF),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                children: [
                  InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 16,
                        ),
                        child: Image.asset("lib/images/arrow-left.png"),
                      ),
                      onTap: () {
                        if (amount.isEmpty) {
                          amount = widget.balance;
                        }
                        Navigator.pop(context, amount);
                      }),
                  Text("Transfer",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4D4B57)))
                ],
              ),
            ),
            Container(
              height: 96,
              margin: EdgeInsets.only(top: 32, left: 16, right: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                Image.asset(widget.image),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.name,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4D4B57))),
                        Text(widget.number),
                      ]),
                ),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text("Rp.120.000 Available"),
            ),
            Container(
              margin: EdgeInsets.only(top: 32, left: 64, right: 64),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyTextInputFormatter(
                      decimalDigits: 0,
                      groupSeparator: '.',
                      decimalSeparator: ' ',
                      prefix: "Rp. ")
                ],
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "0.00",
                    hintStyle:
                        TextStyle(fontSize: 42, fontWeight: FontWeight.w700)),
                onFieldSubmitted: (control) {
                  amount = control;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 64,
                left: 16,
                right: 16,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Add some notes",
                    hintStyle:
                        TextStyle(color: Color(0xFFA9A9A9), fontSize: 16),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Image.asset("lib/images/edit-2.png"),
                    ),
                    prefixIconColor: Color(0xFFA9A9A9),
                    prefixIconConstraints:
                        BoxConstraints(maxHeight: 48, maxWidth: 48)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
