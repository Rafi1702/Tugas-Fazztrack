// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart ';
import 'package:get/get.dart';

import '../viewModel/userViewmodel.dart';
import 'SecondPage.dart';

class MyHomePage extends StatefulWidget {
  final userName;
  const MyHomePage({
    Key key,
    this.userName,

    // this.viewModel,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserViewModel viewModel = Get.put(UserViewModel());
  @override
  void initState() {
    viewModel.getDataUser();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFCFF),
      body: GetBuilder<UserViewModel>(builder: (modelView) {
        return modelView.isBusy
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SafeArea(
                child: ListView(children: [
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
                              Text("Hello, ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF646464))),
                              Text(widget.userName.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFF3D3D3D))),
                            ]),
                        Spacer(),
                        Image.asset("lib/images/bell.png"),
                      ],
                    ),
                  ),
                  /* CARD MENAMPILKAN JUMLAH BALANCE DAN NUMBER */
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                    height: 141,
                    padding: EdgeInsets.only(
                        left: 32, right: 16, top: 16, bottom: 16),
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

                  /* BUTTON DAN ALIGN-NYA*/
                  Container(
                    margin: EdgeInsets.only(
                      top: 32,
                      left: 8,
                      right: 8,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 57,
                            width: 162,
                            child: ElevatedButton.icon(
                              icon: Image.asset("lib/images/arrow-up.png"),
                              label: Text("Transfer",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF514F5B),
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
                                      color: Color(0xFF514F5B),
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transaction History",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF514F5B)),
                          ),
                          Text("See all",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF6379F4)))
                        ]),
                  ),

                  /*MEMANGGIL CLASS TransactionHistoryCard UNTUK DITAMPILKAN*/
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: modelView.user.length,
                      itemBuilder: (context, index) {
                        return HistoryCard(
                            name: modelView.user[index].name,
                            id: modelView.user[index].id,
                            address: modelView.user[index].address.city,
                            onTap: () {
                              Get.to(SecondPage(
                                name: modelView.user[index].name,
                                id: modelView.user[index].id,
                                address: modelView.user[index].address.city,
                              ));
                            });
                      }),
                  SizedBox(height: 24)
                ]),
              );
      }),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String name;
  final int id;
  final String address;
  final Function onTap;
  const HistoryCard({
    Key key,
    this.name,
    this.id,
    this.address,
    this.onTap,
  }) : super(key: key);

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
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.05),
                    offset: Offset(0.0, 1.0),
                    blurRadius: 0.05)
              ]),
          child: Row(children: [
            // Container(
            //     margin: EdgeInsets.only(right: 16), child: Image.asset("")),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4D4B57)),
                  ),
                  Text(address,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7A7886)))
                ]),
            Spacer(),
            Text(id.toString()),
          ]),
        ),
        onTap: onTap,
      ),
    );
  }
}

// class TransactionHistoryCard extends StatefulWidget {
//   final String image; //untuk di-pass ke secondpage dan tampilan card
//   final String name; //untuk di-pass ke secondpage dan tampilan card
//   final String transaction;
//   final int amount;
//   final String prefix;
//   final String number; //untuk di-pass ke secondpage

//   TransactionHistoryCard({
//     Key key,
//     this.image,
//     this.name,
//     this.transaction,
//     this.amount,
//     this.prefix,
//     this.number,
//   }) : super(key: key);

//   @override
//   State<TransactionHistoryCard> createState() => _TransactionHistoryCardState();
// }

// class _TransactionHistoryCardState extends State<TransactionHistoryCard> {
//   var amountSave = 0;
//   final formatCurrency =
//       NumberFormat.currency(locale: "in_ID", symbol: "Rp. ", decimalDigits: 0);

//   @override
//   initState() {
//     amountSave = widget.amount;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 16),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(10),
//         child: Container(
//           padding: EdgeInsets.all(16),
//           height: 96,
//           width: 375,
//           decoration: BoxDecoration(
//               color: Color(0xFFFFFFFF),
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                     color: Color(0xFF000000).withOpacity(0.05),
//                     offset: Offset(0.0, 1.0),
//                     blurRadius: 0.05)
//               ]),
//           child: Row(children: [
//             Container(
//                 margin: EdgeInsets.only(right: 16),
//                 child: Image.asset(widget.image)),
//             Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "a",
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFF4D4B57)),
//                   ),
//                   Text(widget.transaction,
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xFF7A7886)))
//                 ]),
//             Spacer(),
//             widget.prefix == "+"
//                 ? Text("${widget.prefix}${formatCurrency.format(amountSave)}",
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFF1EC15F)))
//                 : Text("${widget.prefix}${formatCurrency.format(amountSave)}",
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFFFF5B37))),
//           ]),
//         ),
//         onTap: () async {
//           var pass = await Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => SecondPage(
//                     name: widget.name,
//                     amountSave: amountSave,
//                     image: widget.image,
//                     number: widget.number,
//                     transaction: widget.transaction)),
//           );
//           setState(() {
//             amountSave = pass;
//           });
//         },
//       ),
//     );
//   }
// }
