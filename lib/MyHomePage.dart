// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart ';

import 'SecondPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFCFF),
      body: ListView(children: [
        Container(
          height: 55,
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Image.asset('lib/images/profile.png')),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Hello, ", style: TextStyle(fontSize: 18)),
                    Text("Robert Chandler",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  ]),
              Spacer(),
              Container(child: Image.asset("lib/images/bell.png")),
            ],
          ),
        ),
        /* CUSTOM CARD */
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          height: 141,
          padding: EdgeInsets.only(left: 32, right: 16, top: 16, bottom: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF6379F4)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Balance",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                Text("Rp.120.000",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )),
                Text(
                  "+62 813-9387-7946",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ]),
        ),

        /* ALIGN UNTUK BUTTON*/
        Container(
          margin: EdgeInsets.only(
            top: 32,
            left: 8,
            right: 8,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              height: 57,
              width: 162,
              child: ElevatedButton.icon(
                icon: Image.asset("lib/images/arrow-up.png"),
                label: Text("Transfer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    )),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color(0xFFEAEDFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: () {},
              ),
            ),
            Container(
                height: 57,
                width: 162,
                child: ElevatedButton.icon(
                  icon: Image.asset('lib/images/plus.png'),
                  label: Text("Top Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      )),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Color(0xFFEAEDFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {},
                ))
          ]),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 32,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Transaction History",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Text("See all",
                style: TextStyle(fontSize: 14, color: Color(0xFF6379F4)))
          ]),
        ),

        /*Memanggil Class Widget untuk menampilkan history card*/
        TransactionHistoryCard(
            image: "lib/images/profile-history.png",
            name: 'Samuel Suhi',
            transaction: "Transfer",
            prefix: "+",
            amount: "Rp. 50.000",
            textColor: Color(0xFF1EC15F),
            number: "+62 813-8492-9994"),
        TransactionHistoryCard(
            image: "lib/images/netflix.png",
            name: 'Netflix',
            transaction: "Subscription",
            prefix: "-",
            amount: "Rp. 60.000",
            textColor: Color(0xFFFF5B37),
            number: ""),
      ]),
    );
  }
}

class TransactionHistoryCard extends StatefulWidget {
  final String image; //untuk di-pass ke secondpage dan tampilan card
  final String name; //untuk di-pass ke secondpage dan tampilan card
  final String transaction;
  final String amount;
  final String prefix;
  final Color textColor;
  final String number; //untuk di-pass ke secondpage

  TransactionHistoryCard({
    Key key,
    this.image,
    this.name,
    this.transaction,
    this.amount,
    this.prefix,
    this.textColor,
    this.number,
  }) : super(key: key);

  @override
  State<TransactionHistoryCard> createState() => _TransactionHistoryCardState();
}

class _TransactionHistoryCardState extends State<TransactionHistoryCard> {
  var amountSave = "";

  @override
  initState() {
    amountSave = widget.amount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(16),
          height: 96,
          width: 375,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Container(
                margin: EdgeInsets.only(right: 16),
                child: Image.asset(widget.image)),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(widget.transaction)
                ]),
            Spacer(),
            Text(widget.prefix + amountSave,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: widget.textColor)),
          ]),
        ),
        onTap: () async {
          var test = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondPage(
                    name: widget.name,
                    balance: amountSave,
                    image: widget.image,
                    number: widget.number)),
          );
          setState(() {
            amountSave = test;
          });
        },
      ),
    );
  }
}
