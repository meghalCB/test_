
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';

import 'category_list_view.dart';
import 'design_course_app_theme.dart';
import 'models/category.dart';

class PopularCourseListView extends StatefulWidget {
  const PopularCourseListView({Key? key, this.callBack}) : super(key: key);

  final Function()? callBack;
  @override
  _PopularCourseListViewState createState() => _PopularCourseListViewState();
}

class _PopularCourseListViewState extends State<PopularCourseListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        height: 800,
        child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {

             return GridView(
                padding: const EdgeInsets.all(8),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: List<Widget>.generate(Category.popularCourseList.length,(int index) {
                    final int count = Category.popularCourseList.length;
                    final Animation<double> animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController!,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    );
                    animationController?.forward();
                    return CategoryView(
                      callback: widget.callBack,
                      category: Category.popularCourseList[index],
                      animation: animation,
                      animationController: animationController,
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25.0,
                  crossAxisSpacing: 25.0,
                  childAspectRatio: 1.2,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key? key,
      this.category,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback? callback;
  final Category? category;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {

    int sum = 0;
    int totalfuel = 0;
    /*FirebaseFirestore.instance.collection('notes')
        .doc(Database.userUid).collection('Transaction').where("expensetype", isEqualTo: "${category!.dbname}").get()
        .then((querySnapshot){
      querySnapshot.docs.forEach((result) {
        // print(result.get('expenseamt'));
        sum += result.get('expenseamt') as int;
      });
      totalfuel = sum;
    });
    print(totalfuel);*/
    /*FirebaseFirestore.instance.collection('notes')
                 .doc(Database.userUid).collection('Transaction').where("expensetype", isEqualTo: "Repair")
                 .snapshots().forEach(
                     (data) => print(total+=data.docs[0]['expenseamt'] as int)
             );*/



    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: callback,
              child: SizedBox(
                height: 20,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Container(
                      height: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: DesignCourseAppTheme.nearlyWhite,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                                // border: new Border.all(
                                //     color: DesignCourseAppTheme.notWhite),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16, left: 16, right: 16),
                                            child: Text(
                                              category!.title,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                                letterSpacing: 0.27,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 21,
                                                left: 16,
                                                right: 16,
                                                bottom: 8),
                                            child: StreamBuilder<QuerySnapshot>(
                                                stream: FirebaseFirestore.instance.collection('notes')
                                                    .doc(Database.userUid).collection('Transaction').where("expensetype", isEqualTo: "${category!.dbname}")
                                                    .snapshots(),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasError) {
                                                    return Text('Something went wrong');
                                                  } else if (snapshot.hasData || snapshot.data != null) {
                                                    int total = 0;
                                                    var totalIncome = 0;
                                                    snapshot.data!.docs.forEach((element) {
                                                      total+=(element.data()?['expenseamt']) as int;
                                                      // print(element.data());
                                                    });
                                                    totalIncome = total;
                                                    print(totalIncome);

                                                    return Text('\u20B9'+totalIncome.toString(),
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w900,
                                                        fontSize: 21,
                                                        letterSpacing: 0.27,
                                                        color: category!.colors,
                                                      ),);

                                                  }
                                                  return Center(
                                                    child: CircularProgressIndicator(
                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                        CustomColors.firebaseOrange,
                                                      ),
                                                    ),
                                                  );

                                                }),

                                            /*Text(
                                              '\u20B9$totalfuel',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 21,
                                                letterSpacing: 0.27,
                                                color: category!.colors,
                                              ),
                                            ),*/
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8,
                                                left: 16,
                                                right: 16,
                                                bottom: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                /*Text(
                                                    '\u20B9${category!.total_expense}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w200,
                                                      fontSize: 12,
                                                      letterSpacing: 0.27,
                                                      color: DesignCourseAppTheme
                                                          .darkerText,
                                                    ),
                                                  ),*/
                                                /*Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        '${category!.rating}',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 18,
                                                          letterSpacing: 0.27,
                                                          color:
                                                              DesignCourseAppTheme
                                                                  .darkerText,
                                                        ),
                                                      ),
                                                      *//*Icon(
                                                        Icons.star,
                                                        color:
                                                            DesignCourseAppTheme
                                                                .nearlyBlue,
                                                        size: 20,
                                                      ),*//*
                                                    ],
                                                  ),
                                                )*/
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 48,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          /*const SizedBox(
                            height: 8,
                          ),*/
                        ],
                      ),
                    ),
                    /*Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 24, right: 16, left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: DesignCourseAppTheme.darkerText
                                      .withOpacity(0.2),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 6.0),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            child: AspectRatio(
                                aspectRatio: 1.28,
                                child: Image.asset(category!.imagePath)),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
