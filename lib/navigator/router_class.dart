import 'package:flutter/material.dart';
class RouterClass {
  RouterClass._();
  static RouterClass routerClass = RouterClass._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  pushWidget(Widget widget) {
    navKey.currentState?.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  pushWidgetReplacement(Widget widget) {
     navKey.currentState?.pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
  pushWidgetRemovePrev(Widget widget){
    navKey.currentState?.pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
    return widget;
    }), (route) => false);

  }

  Future<dynamic> navigateTo(String routeName, {Object? args}) {
    return navKey.currentState!.pushNamed(routeName, arguments: args);
  }
  Future<dynamic> navigateToAndRemove(String routeName) {
    return navKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
          (_) => false,
    );
  }
  popFunction() {
    navKey.currentState?.pop();
  }
}
