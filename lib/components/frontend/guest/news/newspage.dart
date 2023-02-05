import 'package:expandable/expandable.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tdvp/components/frontend/guest/home/homepage.dart';
import 'package:tdvp/main.dart';
import 'package:tdvp/utility/style.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  String? id;
  final db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  var item = firstPage;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      //backgroundColor: const Color(0xFFF7F7F7),
      //backgroundColor: const Color(0xFFC5C5C5),
      //backgroundColor: StyleProjects().backgroundState,

      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          //bg

          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xff59d3fc),
                Color(0xff124699),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),

          // constraints: BoxConstraints.expand(),
          // // ignore: prefer_const_constructors
          // decoration: BoxDecoration(
          //   // ignore: prefer_const_constructors
          //   image: DecorationImage(
          //     image: const AssetImage("assets/images/bg.png"),
          //     fit: BoxFit.cover,
          //   ),
          // ),

          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 50),
              _backButton(),
              SizedBox(height: 20),
              headertdvp1(),
              SizedBox(height: 20),
              // header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                          color: const Color(0xffffda7a),
                          //color: const Color(0xff000f3b),
                          //color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    Text(
                      'ข่าวสาร',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'THSarabunNew',
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffffda7a),
                        //color: const Color(0xff000f3b),
                        //color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          thickness: 1,
                          color: const Color(0xffffda7a),
                          //color: const Color(0xff000f3b),
                          //color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("news")
                      .orderBy('newstimes', descending: true)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Text(
                        'กรุณารอสักครู่นะคะ...',
                        style: StyleProjects().topicstyle7,
                      );
                    }
                    int length = snapshot.data!.docs.length;
                    return ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        itemCount: length,
                        itemBuilder: (_, int index) {
                          final QueryDocumentSnapshot<Object?>? doc =
                              snapshot.data?.docs[index];

                          return ExpandableNotifier(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ExpansionTileCard(
                                title: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 200,
                                        //padding: EdgeInsets.only(left: 10),
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          snapshot.data!.docs
                                              .elementAt(index)['title'],
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: StyleProjects().contentstyle5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                subtitle: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'วันที่ : ',
                                        textAlign: TextAlign.start,
                                        style: StyleProjects().contentstyle5,
                                      ),
                                      Text(
                                        snapshot.data?.docs
                                            .elementAt(index)['newstimes'],
                                        softWrap: true,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: StyleProjects().contentstyle5,
                                      ),
                                    ],
                                  ),
                                ),

                                //
                                children: <Widget>[
                                  Divider(
                                    thickness: 1.0,
                                    height: 1.0,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),

                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              snapshot.data!.docs
                                                  .elementAt(index)['title'],
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
                                              textAlign: TextAlign.start,
                                              style:
                                                  StyleProjects().contentstyle5,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 10),
                                            alignment: Alignment.bottomLeft,
                                            child: Text(
                                              snapshot.data!.docs
                                                  .elementAt(index)['detail'],
                                              softWrap: true,
                                              overflow: TextOverflow.fade,
                                              textAlign: TextAlign.start,
                                              style:
                                                  StyleProjects().contentstyle5,
                                            ),
                                          ),
                                          StyleProjects().boxTop2,
                                          Container(
                                            alignment: Alignment.center,
                                            child: Image.network(
                                              snapshot.data?.docs
                                                  .elementAt(index)['images'],
                                              fit: BoxFit.fill,
                                              width: 250,
                                              height: 400,
                                            ),
                                          ),
                                        ],
                                      ),

                                      //
                                    ),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.spaceAround,
                                    buttonHeight: 52.0,
                                    buttonMinWidth: 90.0,
                                    children: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Get.to(() => const NewsDetailPage(),
                                              arguments: [
                                                {"newstimes": item}
                                              ],
                                              preventDuplicates: false);
                                        },
                                        child: Column(
                                          children: <Widget>[
                                            Icon(Icons.arrow_upward),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2.0),
                                            ),
                                            Text(
                                              'ปิด',
                                              textAlign: TextAlign.start,
                                              style:
                                                  StyleProjects().contentstyle5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],

                                //
                              ),
                            ),

                            //
                          );

                          //
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Get.to(() => const HomePage());
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: const Color(0xffffc52e),
              ),
            ),
            Text(
              'Back',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffc52e),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headertdvp1() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/logo.png'),
          ),
          SizedBox(
            width: 10,
          ),
          Center(
            child: Text(
              'โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง\n'
              'Territorial Defence Volunteers Printing',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffc52e),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
