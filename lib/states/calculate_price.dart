import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdvp/utility/app_controller.dart';
import 'package:tdvp/utility/app_service.dart';
import 'package:tdvp/utility/style.dart';

class CalculatePrice extends StatefulWidget {
  const CalculatePrice({super.key});

  @override
  State<CalculatePrice> createState() => _CalculatePriceState();
}

class _CalculatePriceState extends State<CalculatePrice> {
  @override
  void initState() {
    super.initState();
    AppService().readSizePapter();
    AppService().readFormatPapter();
    AppService().readAmountPrint();
    AppService().readAmountBook();
    AppService().readBindingBook();
    AppService().readTypePrint();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: GetX(
          init: AppController(),
          builder: (AppController appController) {
            print(
                '## amountPrintModel ---> ${appController.amountPrintModels.length}');
            return ((appController.sizePaperModels.isEmpty) ||
                    (appController.formatPaperModels.isEmpty))
                ? const SizedBox()
                // : ListView(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 16, vertical: 24),
                //     children: [
                //       // displayItem(
                //       //   head: 'ขนาดกระดาษ',
                //       //   widget: dropdownSizePaper(appController: appController),
                //       // ),
                //       // displayItem(
                //       //   head: 'รูปแบบกระดาษ',
                //       //   widget:
                //       //       dropdownFormatPaper(appController: appController),
                //       // ),
                //       displayItem(
                //         head: 'รูปแบบการพิมพ์',
                //         widget: dropdownTypePrint(appController: appController),
                //       ),
                //       displayItem(
                //         head: 'จำนวนหน้าทั้งหมด',
                //         widget:
                //             dropdownAmountPrint(appController: appController),
                //       ),
                //       displayItem(
                //         head: 'วิธีการเข้าเล่ม',
                //         widget:
                //             dropdownBindingBook(appController: appController),
                //       ),
                //       displayItem(
                //         head: 'จำนวนเล่มที่ต้องการ',
                //         widget:
                //             dropdownAmountBook(appController: appController),
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           ElevatedButton(
                //               onPressed: () {
                //                 if (appController
                //                         .chooseTypePrintModels.length ==
                //                     1) {
                //                   Get.snackbar('รูปแบบการพิมพ์ ?',
                //                       'กรุณาเลือกรูปแบบการพิมพ์ ด้วยคะ');
                //                 } else if (appController
                //                         .chooseAmountPrintModels.length ==
                //                     1) {
                //                   Get.snackbar('จำนวนหน้า ?',
                //                       'กรุณาเลือกจำนวนหน้า ด้วยคะ');
                //                 } else if (appController
                //                         .chooseBindingBookModels.length ==
                //                     1) {
                //                   Get.snackbar('วิธีการเข้าเล่ม ?',
                //                       'กรุณาเลือกวิธีการเข้าเล่ม ด้วยคะ');
                //                 } else if (appController
                //                         .chooseAmountBookModels.length ==
                //                     1) {
                //                   Get.snackbar('จำนวนเล่ม ?',
                //                       'กรุณาเลือกจำนวนเล่ม ด้วยคะ');
                //                 } else {
                //                   // double factorSizePaperDou = double.parse(
                //                   //     appController
                //                   //         .chooseSizePaperModels.last.factor);
                //                   double amountDou = double.parse(appController
                //                       .chooseAmountPrintModels.last.amount
                //                       .toString());
                //                   double factorTypePrintDou = double.parse(
                //                       appController
                //                           .chooseTypePrintModels.last.factor);
                //                   double factorBindingBookDou = double.parse(
                //                       appController
                //                           .chooseBindingBookModels.last.factor);
                //                   double amountBookDou = double.parse(
                //                       appController
                //                           .chooseAmountBookModels.last.amount
                //                           .toString());
                //                   double price =
                //                       //factorSizePaperDou *
                //                       factorTypePrintDou * amountDou +
                //                           factorBindingBookDou * amountBookDou;
                //                   print('## price ---> $price');
                //                   appController.price.value = price;
                //                 }
                //               },
                //               child: Text('Calculate')),
                //           Text(appController.price.value.toString())
                //         ],
                //       ),
                //       appController.price.value == 0.0
                //           ? const SizedBox()
                //           : ElevatedButton(
                //               onPressed: () async {
                //                 var datas = <String>[];
                //                 // datas.add(appController
                //                 //     .chooseSizePaperModels.last.size);
                //                 // datas.add(appController
                //                 //     .chooseSizePaperModels.last.factor);

                //                 datas.add(appController
                //                     .chooseTypePrintModels.last.typeprint);

                //                 datas.add(appController
                //                     .chooseAmountPrintModels.last.amount
                //                     .toString());
                //                 datas.add(appController
                //                     .chooseBindingBookModels.last.bindingbook);
                //                 datas.add(appController
                //                     .chooseAmountBookModels.last.amount
                //                     .toString());
                //                 datas.add(appController.price.toString());

                //                 print('datas ---> $datas');

                //                 SharedPreferences preferences =
                //                     await SharedPreferences.getInstance();
                //                 preferences
                //                     .setStringList('price', datas)
                //                     .then((value) {
                //                   Get.snackbar('Save Success', 'Save Success');
                //                   appController.chooseSizePaperModels.clear();
                //                   appController.chooseSizePaperModels.add(null);

                //                   appController.chooseTypePrintModels.clear();
                //                   appController.chooseTypePrintModels.add(null);

                //                   appController.chooseAmountPrintModels.clear();
                //                   appController.chooseAmountPrintModels
                //                       .add(null);

                //                   appController.chooseBindingBookModels.clear();
                //                   appController.chooseBindingBookModels
                //                       .add(null);

                //                   appController.chooseAmountBookModels.clear();
                //                   appController.chooseAmountBookModels
                //                       .add(null);

                //                   appController.price.value = 0.0;
                //                 });
                //               },
                //               child: const Text('Save'),
                //             ),

                //     ],
                //   );

                : Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/p13.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      children: [
                        // displayItem(
                        //   head: 'ขนาดกระดาษ',
                        //   widget: dropdownSizePaper(appController: appController),
                        // ),
                        // displayItem(
                        //   head: 'รูปแบบกระดาษ',
                        //   widget:
                        //       dropdownFormatPaper(appController: appController),
                        // ),

                        //out contrainer

                        // displayItem(
                        //   head: 'รูปแบบการพิมพ์',
                        //   widget:
                        //       dropdownTypePrint(appController: appController),
                        // ),
                        // displayItem(
                        //   head: 'จำนวนหน้าทั้งหมด',
                        //   widget:
                        //       dropdownAmountPrint(appController: appController),
                        // ),
                        // displayItem(
                        //   head: 'วิธีการเข้าเล่ม',
                        //   widget:
                        //       dropdownBindingBook(appController: appController),
                        // ),
                        // displayItem(
                        //   head: 'จำนวนเล่มที่ต้องการ',
                        //   widget:
                        //       dropdownAmountBook(appController: appController),
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     ElevatedButton(
                        //         onPressed: () {
                        //           if (appController
                        //                   .chooseTypePrintModels.length ==
                        //               1) {
                        //             Get.snackbar('รูปแบบการพิมพ์ ?',
                        //                 'กรุณาเลือกรูปแบบการพิมพ์ ด้วยคะ');
                        //           } else if (appController
                        //                   .chooseAmountPrintModels.length ==
                        //               1) {
                        //             Get.snackbar('จำนวนหน้า ?',
                        //                 'กรุณาเลือกจำนวนหน้า ด้วยคะ');
                        //           } else if (appController
                        //                   .chooseBindingBookModels.length ==
                        //               1) {
                        //             Get.snackbar('วิธีการเข้าเล่ม ?',
                        //                 'กรุณาเลือกวิธีการเข้าเล่ม ด้วยคะ');
                        //           } else if (appController
                        //                   .chooseAmountBookModels.length ==
                        //               1) {
                        //             Get.snackbar('จำนวนเล่ม ?',
                        //                 'กรุณาเลือกจำนวนเล่ม ด้วยคะ');
                        //           } else {
                        //             // double factorSizePaperDou = double.parse(
                        //             //     appController
                        //             //         .chooseSizePaperModels.last.factor);
                        //             double amountDou = double.parse(
                        //                 appController
                        //                     .chooseAmountPrintModels.last.amount
                        //                     .toString());
                        //             double factorTypePrintDou = double.parse(
                        //                 appController
                        //                     .chooseTypePrintModels.last.factor);
                        //             double factorBindingBookDou = double.parse(
                        //                 appController.chooseBindingBookModels
                        //                     .last.factor);
                        //             double amountBookDou = double.parse(
                        //                 appController
                        //                     .chooseAmountBookModels.last.amount
                        //                     .toString());
                        //             double price =
                        //                 //factorSizePaperDou *
                        //                 factorTypePrintDou * amountDou +
                        //                     factorBindingBookDou *
                        //                         amountBookDou;
                        //             print('## price ---> $price');
                        //             appController.price.value = price;
                        //           }
                        //         },
                        //         child: Text('Calculate')),
                        //     Text(appController.price.value.toString())
                        //   ],
                        // ),
                        // appController.price.value == 0.0
                        //     ? const SizedBox()
                        //     : ElevatedButton(
                        //         style: ElevatedButton.styleFrom(
                        //           backgroundColor: Colors.green,
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(10),
                        //           ),
                        //         ),
                        //         onPressed: () async {
                        //           var datas = <String>[];
                        //           // datas.add(appController
                        //           //     .chooseSizePaperModels.last.size);
                        //           // datas.add(appController
                        //           //     .chooseSizePaperModels.last.factor);

                        //           datas.add(appController
                        //               .chooseTypePrintModels.last.typeprint);

                        //           datas.add(appController
                        //               .chooseAmountPrintModels.last.amount
                        //               .toString());
                        //           datas.add(appController
                        //               .chooseBindingBookModels
                        //               .last
                        //               .bindingbook);
                        //           datas.add(appController
                        //               .chooseAmountBookModels.last.amount
                        //               .toString());
                        //           datas.add(appController.price.toString());

                        //           print('datas ---> $datas');

                        //           SharedPreferences preferences =
                        //               await SharedPreferences.getInstance();
                        //           preferences
                        //               .setStringList('price', datas)
                        //               .then((value) {
                        //             Get.snackbar(
                        //                 'Save Success', 'Save Success');
                        //             appController.chooseSizePaperModels.clear();
                        //             appController.chooseSizePaperModels
                        //                 .add(null);

                        //             appController.chooseTypePrintModels.clear();
                        //             appController.chooseTypePrintModels
                        //                 .add(null);

                        //             appController.chooseAmountPrintModels
                        //                 .clear();
                        //             appController.chooseAmountPrintModels
                        //                 .add(null);

                        //             appController.chooseBindingBookModels
                        //                 .clear();
                        //             appController.chooseBindingBookModels
                        //                 .add(null);

                        //             appController.chooseAmountBookModels
                        //                 .clear();
                        //             appController.chooseAmountBookModels
                        //                 .add(null);

                        //             appController.price.value = 0.0;
                        //           });
                        //         },
                        //         child: const Text('บันทึก'),
                        //       ),

                        StyleProjects().boxTop2,
                        blockbackButton(),

                        StyleProjects().boxTop2,

                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xfffffdf9),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // StyleProjects().boxTop2,
                              // StyleProjects().header2(),

                              StyleProjects().boxTop2,
                              blockheader(),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    displayItem(
                                      head: 'รูปแบบการพิมพ์',
                                      widget: dropdownTypePrint(
                                          appController: appController),
                                    ),
                                    displayItem(
                                      head: 'จำนวนหน้าทั้งหมด',
                                      widget: dropdownAmountPrint(
                                          appController: appController),
                                    ),
                                    displayItem(
                                      head: 'วิธีการเข้าเล่ม',
                                      widget: dropdownBindingBook(
                                          appController: appController),
                                    ),
                                    displayItem(
                                      head: 'จำนวนเล่มที่ต้องการ',
                                      widget: dropdownAmountBook(
                                          appController: appController),
                                    ),

                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceAround,
                                    //   children: [
                                    //     ElevatedButton(
                                    //         style: ElevatedButton.styleFrom(
                                    //           backgroundColor: Colors.green,
                                    //           shape: RoundedRectangleBorder(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(5),
                                    //           ),
                                    //         ),
                                    //         onPressed: () {
                                    //           if (appController
                                    //                   .chooseTypePrintModels
                                    //                   .length ==
                                    //               1) {
                                    //             Get.snackbar('รูปแบบการพิมพ์ ?',
                                    //                 'กรุณาเลือกรูปแบบการพิมพ์ ด้วยคะ');
                                    //           } else if (appController
                                    //                   .chooseAmountPrintModels
                                    //                   .length ==
                                    //               1) {
                                    //             Get.snackbar('จำนวนหน้า ?',
                                    //                 'กรุณาเลือกจำนวนหน้า ด้วยคะ');
                                    //           } else if (appController
                                    //                   .chooseBindingBookModels
                                    //                   .length ==
                                    //               1) {
                                    //             Get.snackbar(
                                    //                 'วิธีการเข้าเล่ม ?',
                                    //                 'กรุณาเลือกวิธีการเข้าเล่ม ด้วยคะ');
                                    //           } else if (appController
                                    //                   .chooseAmountBookModels
                                    //                   .length ==
                                    //               1) {
                                    //             Get.snackbar('จำนวนเล่ม ?',
                                    //                 'กรุณาเลือกจำนวนเล่ม ด้วยคะ');
                                    //           } else {
                                    //             // double factorSizePaperDou = double.parse(
                                    //             //     appController
                                    //             //         .chooseSizePaperModels.last.factor);
                                    //             double amountDou = double.parse(
                                    //                 appController
                                    //                     .chooseAmountPrintModels
                                    //                     .last
                                    //                     .amount
                                    //                     .toString());
                                    //             double factorTypePrintDou =
                                    //                 double.parse(appController
                                    //                     .chooseTypePrintModels
                                    //                     .last
                                    //                     .factor);
                                    //             double factorBindingBookDou =
                                    //                 double.parse(appController
                                    //                     .chooseBindingBookModels
                                    //                     .last
                                    //                     .factor);
                                    //             double amountBookDou =
                                    //                 double.parse(appController
                                    //                     .chooseAmountBookModels
                                    //                     .last
                                    //                     .amount
                                    //                     .toString());
                                    //             double price =
                                    //                 //factorSizePaperDou *
                                    //                 factorTypePrintDou *
                                    //                         amountDou +
                                    //                     factorBindingBookDou *
                                    //                         amountBookDou;
                                    //             print('## price ---> $price');
                                    //             appController.price.value =
                                    //                 price;
                                    //           }
                                    //         },
                                    //         child: Text(
                                    //           'คำนวณ',
                                    //           style:
                                    //               StyleProjects().contentstyle1,
                                    //         )),
                                    //     Text(appController.price.value
                                    //         .toString())
                                    //   ],
                                    // ),
                                    // appController.price.value == 0.0
                                    //     ? const SizedBox()
                                    //     : ElevatedButton(
                                    //         style: ElevatedButton.styleFrom(
                                    //           backgroundColor: Colors.green,
                                    //           shape: RoundedRectangleBorder(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(5),
                                    //           ),
                                    //         ),
                                    //         onPressed: () async {
                                    //           var datas = <String>[];
                                    //           // datas.add(appController
                                    //           //     .chooseSizePaperModels.last.size);
                                    //           // datas.add(appController
                                    //           //     .chooseSizePaperModels.last.factor);

                                    //           datas.add(appController
                                    //               .chooseTypePrintModels
                                    //               .last
                                    //               .typeprint);

                                    //           datas.add(appController
                                    //               .chooseAmountPrintModels
                                    //               .last
                                    //               .amount
                                    //               .toString());
                                    //           datas.add(appController
                                    //               .chooseBindingBookModels
                                    //               .last
                                    //               .bindingbook);
                                    //           datas.add(appController
                                    //               .chooseAmountBookModels
                                    //               .last
                                    //               .amount
                                    //               .toString());
                                    //           datas.add(appController.price
                                    //               .toString());

                                    //           print('datas ---> $datas');

                                    //           SharedPreferences preferences =
                                    //               await SharedPreferences
                                    //                   .getInstance();
                                    //           preferences
                                    //               .setStringList('price', datas)
                                    //               .then((value) {
                                    //             Get.snackbar('Save Success',
                                    //                 'Save Success');
                                    //             appController
                                    //                 .chooseSizePaperModels
                                    //                 .clear();
                                    //             appController
                                    //                 .chooseSizePaperModels
                                    //                 .add(null);

                                    //             appController
                                    //                 .chooseTypePrintModels
                                    //                 .clear();
                                    //             appController
                                    //                 .chooseTypePrintModels
                                    //                 .add(null);

                                    //             appController
                                    //                 .chooseAmountPrintModels
                                    //                 .clear();
                                    //             appController
                                    //                 .chooseAmountPrintModels
                                    //                 .add(null);

                                    //             appController
                                    //                 .chooseBindingBookModels
                                    //                 .clear();
                                    //             appController
                                    //                 .chooseBindingBookModels
                                    //                 .add(null);

                                    //             appController
                                    //                 .chooseAmountBookModels
                                    //                 .clear();
                                    //             appController
                                    //                 .chooseAmountBookModels
                                    //                 .add(null);

                                    //             appController.price.value = 0.0;
                                    //           });
                                    //         },
                                    //         child: const Text('บันทึก'),
                                    //       ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "ราคาประเมิน",
                                    style: StyleProjects().topicstyle2,
                                  ),
                                  StyleProjects().boxwidth1,
                                  Text(
                                    appController.price.value.toString(),
                                    style: StyleProjects().topicstyle2,
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // ElevatedButton(
                                  //     style: ElevatedButton.styleFrom(
                                  //       backgroundColor: Colors.green,
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(5),
                                  //       ),
                                  //     ),
                                  //     onPressed: () {
                                  //       if (appController
                                  //               .chooseTypePrintModels.length ==
                                  //           1) {
                                  //         Get.snackbar('รูปแบบการพิมพ์ ?',
                                  //             'กรุณาเลือกรูปแบบการพิมพ์ ด้วยคะ');
                                  //       } else if (appController
                                  //               .chooseAmountPrintModels
                                  //               .length ==
                                  //           1) {
                                  //         Get.snackbar('จำนวนหน้า ?',
                                  //             'กรุณาเลือกจำนวนหน้า ด้วยคะ');
                                  //       } else if (appController
                                  //               .chooseBindingBookModels
                                  //               .length ==
                                  //           1) {
                                  //         Get.snackbar('วิธีการเข้าเล่ม ?',
                                  //             'กรุณาเลือกวิธีการเข้าเล่ม ด้วยคะ');
                                  //       } else if (appController
                                  //               .chooseAmountBookModels
                                  //               .length ==
                                  //           1) {
                                  //         Get.snackbar('จำนวนเล่ม ?',
                                  //             'กรุณาเลือกจำนวนเล่ม ด้วยคะ');
                                  //       } else {
                                  //         // double factorSizePaperDou = double.parse(
                                  //         //     appController
                                  //         //         .chooseSizePaperModels.last.factor);
                                  //         double amountDou = double.parse(
                                  //             appController
                                  //                 .chooseAmountPrintModels
                                  //                 .last
                                  //                 .amount
                                  //                 .toString());
                                  //         double factorTypePrintDou =
                                  //             double.parse(appController
                                  //                 .chooseTypePrintModels
                                  //                 .last
                                  //                 .factor);
                                  //         double factorBindingBookDou =
                                  //             double.parse(appController
                                  //                 .chooseBindingBookModels
                                  //                 .last
                                  //                 .factor);
                                  //         double amountBookDou = double.parse(
                                  //             appController
                                  //                 .chooseAmountBookModels
                                  //                 .last
                                  //                 .amount
                                  //                 .toString());
                                  //         double price =
                                  //             //factorSizePaperDou *
                                  //             factorTypePrintDou * amountDou +
                                  //                 factorBindingBookDou *
                                  //                     amountBookDou;
                                  //         print('## price ---> $price');
                                  //         appController.price.value = price;
                                  //       }
                                  //     },
                                  //     child: Text(
                                  //       'คำนวณ',
                                  //       style: StyleProjects().contentstyle1,
                                  //     )),
                                  // Text(appController.price.value.toString())

                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child:
                                        // ElevatedButton(
                                        //     style: ElevatedButton.styleFrom(
                                        //       backgroundColor: Colors.green,
                                        //       shape: RoundedRectangleBorder(
                                        //         borderRadius:
                                        //             BorderRadius.circular(5),
                                        //       ),
                                        //     ),
                                        //     onPressed: () {
                                        //       if (appController
                                        //               .chooseTypePrintModels
                                        //               .length ==
                                        //           1) {
                                        //         Get.snackbar('รูปแบบการพิมพ์ ?',
                                        //             'กรุณาเลือกรูปแบบการพิมพ์ ด้วยคะ');
                                        //       } else if (appController
                                        //               .chooseAmountPrintModels
                                        //               .length ==
                                        //           1) {
                                        //         Get.snackbar('จำนวนหน้า ?',
                                        //             'กรุณาเลือกจำนวนหน้า ด้วยคะ');
                                        //       } else if (appController
                                        //               .chooseBindingBookModels
                                        //               .length ==
                                        //           1) {
                                        //         Get.snackbar('วิธีการเข้าเล่ม ?',
                                        //             'กรุณาเลือกวิธีการเข้าเล่ม ด้วยคะ');
                                        //       } else if (appController
                                        //               .chooseAmountBookModels
                                        //               .length ==
                                        //           1) {
                                        //         Get.snackbar('จำนวนเล่ม ?',
                                        //             'กรุณาเลือกจำนวนเล่ม ด้วยคะ');
                                        //       } else {
                                        //         // double factorSizePaperDou = double.parse(
                                        //         //     appController
                                        //         //         .chooseSizePaperModels.last.factor);
                                        //         double amountDou = double.parse(
                                        //             appController
                                        //                 .chooseAmountPrintModels
                                        //                 .last
                                        //                 .amount
                                        //                 .toString());
                                        //         double factorTypePrintDou =
                                        //             double.parse(appController
                                        //                 .chooseTypePrintModels
                                        //                 .last
                                        //                 .factor);
                                        //         double factorBindingBookDou =
                                        //             double.parse(appController
                                        //                 .chooseBindingBookModels
                                        //                 .last
                                        //                 .factor);
                                        //         double amountBookDou = double.parse(
                                        //             appController
                                        //                 .chooseAmountBookModels
                                        //                 .last
                                        //                 .amount
                                        //                 .toString());
                                        //         double price =
                                        //             //factorSizePaperDou *
                                        //             factorTypePrintDou * amountDou +
                                        //                 factorBindingBookDou *
                                        //                     amountBookDou;
                                        //         print('## price ---> $price');
                                        //         appController.price.value = price;
                                        //       }
                                        //     },
                                        //     child: Text(
                                        //       'คำนวณ',
                                        //       style: StyleProjects().contentstyle1,
                                        //     )),

                                        Row(
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            onPressed: () {
                                              if (appController
                                                      .chooseTypePrintModels
                                                      .length ==
                                                  1) {
                                                Get.snackbar('รูปแบบการพิมพ์ ?',
                                                    'กรุณาเลือกรูปแบบการพิมพ์ ด้วยคะ');
                                              } else if (appController
                                                      .chooseAmountPrintModels
                                                      .length ==
                                                  1) {
                                                Get.snackbar('จำนวนหน้า ?',
                                                    'กรุณาเลือกจำนวนหน้า ด้วยคะ');
                                              } else if (appController
                                                      .chooseBindingBookModels
                                                      .length ==
                                                  1) {
                                                Get.snackbar(
                                                    'วิธีการเข้าเล่ม ?',
                                                    'กรุณาเลือกวิธีการเข้าเล่ม ด้วยคะ');
                                              } else if (appController
                                                      .chooseAmountBookModels
                                                      .length ==
                                                  1) {
                                                Get.snackbar('จำนวนเล่ม ?',
                                                    'กรุณาเลือกจำนวนเล่ม ด้วยคะ');
                                              } else {
                                                // double factorSizePaperDou = double.parse(
                                                //     appController
                                                //         .chooseSizePaperModels.last.factor);
                                                double amountDou = double.parse(
                                                    appController
                                                        .chooseAmountPrintModels
                                                        .last
                                                        .amount
                                                        .toString());
                                                double factorTypePrintDou =
                                                    double.parse(appController
                                                        .chooseTypePrintModels
                                                        .last
                                                        .factor);
                                                double factorBindingBookDou =
                                                    double.parse(appController
                                                        .chooseBindingBookModels
                                                        .last
                                                        .factor);
                                                double amountBookDou =
                                                    double.parse(appController
                                                        .chooseAmountBookModels
                                                        .last
                                                        .amount
                                                        .toString());
                                                double price =
                                                    //factorSizePaperDou *
                                                    factorTypePrintDou *
                                                            amountDou +
                                                        factorBindingBookDou *
                                                            amountBookDou;
                                                print('## price ---> $price');
                                                appController.price.value =
                                                    price;
                                              }
                                            },
                                            child: Text(
                                              'คำนวณ',
                                              style:
                                                  StyleProjects().contentstyle1,
                                            )),
                                        StyleProjects().boxwidth1,
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromRGBO(
                                                    245, 76, 76, 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          onPressed: () async {
                                            SharedPreferences preferences =
                                                await SharedPreferences
                                                    .getInstance();
                                            appController.chooseSizePaperModels
                                                .clear();
                                            appController.chooseSizePaperModels
                                                .add(null);

                                            appController.chooseTypePrintModels
                                                .clear();
                                            appController.chooseTypePrintModels
                                                .add(null);

                                            appController
                                                .chooseAmountPrintModels
                                                .clear();
                                            appController
                                                .chooseAmountPrintModels
                                                .add(null);

                                            appController
                                                .chooseBindingBookModels
                                                .clear();
                                            appController
                                                .chooseBindingBookModels
                                                .add(null);

                                            appController.chooseAmountBookModels
                                                .clear();
                                            appController.chooseAmountBookModels
                                                .add(null);

                                            appController.price.value = 0.0;
                                          },
                                          child: Text(
                                            'แก้ไข',
                                            style:
                                                StyleProjects().contentstyle1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              appController.price.value == 0.0
                                  ? const SizedBox()
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      onPressed: () async {
                                        var datas = <String>[];
                                        // datas.add(appController
                                        //     .chooseSizePaperModels.last.size);
                                        // datas.add(appController
                                        //     .chooseSizePaperModels.last.factor);

                                        datas.add(appController
                                            .chooseTypePrintModels
                                            .last
                                            .typeprint);

                                        datas.add(appController
                                            .chooseAmountPrintModels.last.amount
                                            .toString());
                                        datas.add(appController
                                            .chooseBindingBookModels
                                            .last
                                            .bindingbook);
                                        datas.add(appController
                                            .chooseAmountBookModels.last.amount
                                            .toString());
                                        datas.add(
                                            appController.price.toString());

                                        print('datas ---> $datas');

                                        SharedPreferences preferences =
                                            await SharedPreferences
                                                .getInstance();
                                        preferences
                                            .setStringList('price', datas)
                                            .then((value) {
                                          Get.snackbar(
                                              'Save Success', 'Save Success');
                                          appController.chooseSizePaperModels
                                              .clear();
                                          appController.chooseSizePaperModels
                                              .add(null);

                                          appController.chooseTypePrintModels
                                              .clear();
                                          appController.chooseTypePrintModels
                                              .add(null);

                                          appController.chooseAmountPrintModels
                                              .clear();
                                          appController.chooseAmountPrintModels
                                              .add(null);

                                          appController.chooseBindingBookModels
                                              .clear();
                                          appController.chooseBindingBookModels
                                              .add(null);

                                          appController.chooseAmountBookModels
                                              .clear();
                                          appController.chooseAmountBookModels
                                              .add(null);

                                          appController.price.value = 0.0;
                                        });
                                      },
                                      child: const Text('บันทึก'),
                                    ),

                              StyleProjects().boxTop2,
                              // displayItem(
                              //   head: 'รูปแบบการพิมพ์',
                              //   widget: dropdownTypePrint(
                              //       appController: appController),
                              // ),
                              // displayItem(
                              //   head: 'จำนวนหน้าทั้งหมด',
                              //   widget: dropdownAmountPrint(
                              //       appController: appController),
                              // ),
                              // displayItem(
                              //   head: 'วิธีการเข้าเล่ม',
                              //   widget: dropdownBindingBook(
                              //       appController: appController),
                              // ),
                              // displayItem(
                              //   head: 'จำนวนเล่มที่ต้องการ',
                              //   widget: dropdownAmountBook(
                              //       appController: appController),
                              // ),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceAround,
                              //   children: [
                              //     ElevatedButton(
                              //         style: ElevatedButton.styleFrom(
                              //           backgroundColor: Colors.green,
                              //           shape: RoundedRectangleBorder(
                              //             borderRadius:
                              //                 BorderRadius.circular(5),
                              //           ),
                              //         ),
                              //         onPressed: () {
                              //           if (appController
                              //                   .chooseTypePrintModels.length ==
                              //               1) {
                              //             Get.snackbar('รูปแบบการพิมพ์ ?',
                              //                 'กรุณาเลือกรูปแบบการพิมพ์ ด้วยคะ');
                              //           } else if (appController
                              //                   .chooseAmountPrintModels
                              //                   .length ==
                              //               1) {
                              //             Get.snackbar('จำนวนหน้า ?',
                              //                 'กรุณาเลือกจำนวนหน้า ด้วยคะ');
                              //           } else if (appController
                              //                   .chooseBindingBookModels
                              //                   .length ==
                              //               1) {
                              //             Get.snackbar('วิธีการเข้าเล่ม ?',
                              //                 'กรุณาเลือกวิธีการเข้าเล่ม ด้วยคะ');
                              //           } else if (appController
                              //                   .chooseAmountBookModels
                              //                   .length ==
                              //               1) {
                              //             Get.snackbar('จำนวนเล่ม ?',
                              //                 'กรุณาเลือกจำนวนเล่ม ด้วยคะ');
                              //           } else {
                              //             // double factorSizePaperDou = double.parse(
                              //             //     appController
                              //             //         .chooseSizePaperModels.last.factor);
                              //             double amountDou = double.parse(
                              //                 appController
                              //                     .chooseAmountPrintModels
                              //                     .last
                              //                     .amount
                              //                     .toString());
                              //             double factorTypePrintDou =
                              //                 double.parse(appController
                              //                     .chooseTypePrintModels
                              //                     .last
                              //                     .factor);
                              //             double factorBindingBookDou =
                              //                 double.parse(appController
                              //                     .chooseBindingBookModels
                              //                     .last
                              //                     .factor);
                              //             double amountBookDou = double.parse(
                              //                 appController
                              //                     .chooseAmountBookModels
                              //                     .last
                              //                     .amount
                              //                     .toString());
                              //             double price =
                              //                 //factorSizePaperDou *
                              //                 factorTypePrintDou * amountDou +
                              //                     factorBindingBookDou *
                              //                         amountBookDou;
                              //             print('## price ---> $price');
                              //             appController.price.value = price;
                              //           }
                              //         },
                              //         child: Text(
                              //           'คำนวณ',
                              //           style: StyleProjects().contentstyle1,
                              //         )),
                              //     Text(appController.price.value.toString())
                              //   ],
                              // ),
                              // appController.price.value == 0.0
                              //     ? const SizedBox()
                              //     : ElevatedButton(
                              //         style: ElevatedButton.styleFrom(
                              //           backgroundColor: Colors.green,
                              //           shape: RoundedRectangleBorder(
                              //             borderRadius:
                              //                 BorderRadius.circular(5),
                              //           ),
                              //         ),
                              //         onPressed: () async {
                              //           var datas = <String>[];
                              //           // datas.add(appController
                              //           //     .chooseSizePaperModels.last.size);
                              //           // datas.add(appController
                              //           //     .chooseSizePaperModels.last.factor);

                              //           datas.add(appController
                              //               .chooseTypePrintModels
                              //               .last
                              //               .typeprint);

                              //           datas.add(appController
                              //               .chooseAmountPrintModels.last.amount
                              //               .toString());
                              //           datas.add(appController
                              //               .chooseBindingBookModels
                              //               .last
                              //               .bindingbook);
                              //           datas.add(appController
                              //               .chooseAmountBookModels.last.amount
                              //               .toString());
                              //           datas.add(
                              //               appController.price.toString());

                              //           print('datas ---> $datas');

                              //           SharedPreferences preferences =
                              //               await SharedPreferences
                              //                   .getInstance();
                              //           preferences
                              //               .setStringList('price', datas)
                              //               .then((value) {
                              //             Get.snackbar(
                              //                 'Save Success', 'Save Success');
                              //             appController.chooseSizePaperModels
                              //                 .clear();
                              //             appController.chooseSizePaperModels
                              //                 .add(null);

                              //             appController.chooseTypePrintModels
                              //                 .clear();
                              //             appController.chooseTypePrintModels
                              //                 .add(null);

                              //             appController.chooseAmountPrintModels
                              //                 .clear();
                              //             appController.chooseAmountPrintModels
                              //                 .add(null);

                              //             appController.chooseBindingBookModels
                              //                 .clear();
                              //             appController.chooseBindingBookModels
                              //                 .add(null);

                              //             appController.chooseAmountBookModels
                              //                 .clear();
                              //             appController.chooseAmountBookModels
                              //                 .add(null);

                              //             appController.price.value = 0.0;
                              //           });
                              //         },
                              //         child: const Text('บันทึก'),
                              //       ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );

            //
          }),
    );
  }

  Row displayItem({
    required String head,
    required Widget widget,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            head,
            style: StyleProjects().contentstyle4,
          ),
        ),
        Expanded(
          flex: 3,
          child: widget,
        ),
      ],
    );
  }

  DropdownButton<Object> dropdownSizePaper(
      {required AppController appController}) {
    return DropdownButton(
      isExpanded: true,
      items: appController.sizePaperModels
          .map(
            (element) => DropdownMenuItem(
              child: Text(
                element.size,
                style: StyleProjects().contentstyle5,
              ),
              value: element,
            ),
          )
          .toList(),
      onChanged: (value) {
        appController.chooseSizePaperModels.add(value);
      },
      value: appController.chooseSizePaperModels.last,
      hint: const Text('เลือกขนาดกระดาษ'),
    );
  }

  DropdownButton<Object> dropdownFormatPaper(
      {required AppController appController}) {
    return DropdownButton(
      isExpanded: true,
      items: appController.formatPaperModels
          .map(
            (element) => DropdownMenuItem(
              child: Text(
                element.paper,
                style: StyleProjects().contentstyle5,
              ),
              value: element,
            ),
          )
          .toList(),
      onChanged: (value) {
        appController.chooseFormatPaperModels.add(value);
      },
      value: appController.chooseFormatPaperModels.last,
      hint: const Text('เลือกรูปแบบกระดาษ'),
    );
  }

  DropdownButton<Object> dropdownAmountPrint(
      {required AppController appController}) {
    return DropdownButton(
      isExpanded: true,
      items: appController.amountPrintModels
          .map(
            (element) => DropdownMenuItem(
              child: Text(
                element.amount.toString(),
                style: StyleProjects().contentstyle5,
              ),
              value: element,
            ),
          )
          .toList(),
      onChanged: (value) {
        appController.chooseAmountPrintModels.add(value);
      },
      value: appController.chooseAmountPrintModels.last,
      hint: Text(
        'เลือกจำนวนหน้า',
        style: StyleProjects().contentstyle8,
      ),
    );
  }

  DropdownButton<Object> dropdownAmountBook(
      {required AppController appController}) {
    return DropdownButton(
      isExpanded: true,
      items: appController.amountBookModels
          .map(
            (element) => DropdownMenuItem(
              child: Text(
                element.amount.toString(),
                style: StyleProjects().contentstyle5,
              ),
              value: element,
            ),
          )
          .toList(),
      onChanged: (value) {
        appController.chooseAmountBookModels.add(value);
      },
      value: appController.chooseAmountBookModels.last,
      hint: Text(
        'เลือกจำนวนเล่ม',
        style: StyleProjects().contentstyle8,
      ),
    );
  }

  DropdownButton<Object> dropdownBindingBook(
      {required AppController appController}) {
    return DropdownButton(
      isExpanded: true,
      items: appController.bindingBookModels
          .map(
            (element) => DropdownMenuItem(
              child: Text(
                element.bindingbook,
                style: StyleProjects().contentstyle5,
              ),
              value: element,
            ),
          )
          .toList(),
      onChanged: (value) {
        appController.chooseBindingBookModels.add(value);
      },
      value: appController.chooseBindingBookModels.last,
      hint: Text(
        'เลือกวิธีการเข้าเล่ม',
        style: StyleProjects().contentstyle8,
      ),
    );
  }

  DropdownButton<Object> dropdownTypePrint(
      {required AppController appController}) {
    return DropdownButton(
      isExpanded: true,
      items: appController.typePrintModels
          .map(
            (element) => DropdownMenuItem(
              child: Text(
                element.typeprint,
                style: StyleProjects().contentstyle5,
              ),
              value: element,
            ),
          )
          .toList(),
      onChanged: (value) {
        appController.chooseTypePrintModels.add(value);
      },
      value: appController.chooseTypePrintModels.last,
      hint: Text(
        'เลือกรูปแบบการพิมพ์',
        style: StyleProjects().contentstyle8,
      ),
    );
  }

  //
  Widget blockheader() {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              'การประเมินราคาสิ่งพิมพ์',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xff004080),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              '**ราคาอาจมีการเปลี่ยนแปลง**',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xfff57777),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget blockbackButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xffffda7a),
              ),
            ),
            const Text(
              'Back',
              style: TextStyle(
                fontFamily: 'TH Sarabun New',
                fontSize: 18,
                color: Color(0xffffda7a),
              ),
            )
          ],
        ),
      ),
    );
  }

  //
}
