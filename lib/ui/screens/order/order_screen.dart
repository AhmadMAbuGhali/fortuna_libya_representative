import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../general_component/drawar_widget.dart';
import 'acrive_order.dart';
import 'complete_order.dart';


class OrderScreen extends StatefulWidget {
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  TabController? tabController;
  List<Color>? tabBackground;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabBackground = [Colors.blue, Colors.pink, Colors.cyan];
    tabController?.addListener(() {
      if (tabController!.indexIsChanging) {
        setState(() {
          tabBackground![tabController!.index] = ColorManager.primary;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGround,
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                  //close drawer, if drawer is open
                } else {
                  scaffoldKey.currentState!.openDrawer();
                  //open drawer, if drawer is closed
                }
              },
              icon: Icon(
                Icons.menu,
                color: ColorManager.black,
              )),
          title: Text(
            'الطلبات',
            style: getBoldStyle(color: ColorManager.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(IconAssets.cart),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //search
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  hintText: "إبحث عن طلبية",
                ),
              ),
              SizedBox(height: 10.h,),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        buttonMargin: EdgeInsets.symmetric(horizontal: 10),
                        contentPadding: EdgeInsets.only(
                            top: 5, bottom: 10, left: 18, right: 18),
                        height: 40.h,
                        decoration:const BoxDecoration(
                          gradient:  LinearGradient(
                              colors: [
                                Color(0xFF127AB9),
                                Color(0xFF006FAE),
                                Color(0xFF066CAC),
                                Color(0xFF045BA0),
                                Color(0xFF08589D),

                              ],
                              begin: FractionalOffset(0.0, 0.0,),
                              end: FractionalOffset(1.0, 0.0),
                              stops: [0.0,0.2,0.4,0.6 ,1.0],
                              tileMode: TileMode.clamp),
                        ),
                        unselectedBackgroundColor: Colors.white,
                        unselectedLabelStyle: TextStyle(color: Colors.black),
                        borderWidth: 1,
                        borderColor: ColorManager.primary,
                        labelStyle: getBoldStyle(
                            color: ColorManager.white, fontSize: 18),
                        tabs: const [
                          Tab(
                            text: "الطلبات النشطة",
                            height: 70,
                          ),
                          Tab(
                            text: "  الطلبات المكتملة",
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: ActiveOrder(),
                              );
                            }),
                            ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: CompleteOrder(),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        drawer: DrawarWidget(
            function: () => scaffoldKey.currentState?.closeDrawer()),
      ),
    );
  }
}
