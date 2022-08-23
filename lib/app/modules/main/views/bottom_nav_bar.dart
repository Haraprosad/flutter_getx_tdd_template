import 'package:flutter/material.dart';
import 'package:flutter_getx_tdd_template/app/core/extensions/buildcontext/loc.dart';
import 'package:flutter_getx_tdd_template/app/core/values/app_values.dart';
import 'package:flutter_getx_tdd_template/app/modules/main/controllers/bottom_nav_controller.dart';
import 'package:flutter_getx_tdd_template/app/modules/main/model/menu_code.dart';
import 'package:flutter_getx_tdd_template/app/modules/main/model/menu_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final Function(MenuCode menuCode) onNewMenuSelected;
  BottomNavBar({Key? key, required this.onNewMenuSelected}) : super(key: key);

  ///required params
  final navController = BottomNavController();
  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Color selectedItemColor = Colors.white;
    Color unselectedItemColor = Colors.grey;
    List<BottomNavItem> navItems = _getNavItems(context);

    return Obx(()=>BottomNavigationBar(
        key: bottomNavKey,
        items: navItems.map((BottomNavItem navItem) => BottomNavigationBarItem(
            icon: SvgPicture.asset("images/${navItem.iconSvgName}",
            height: AppValues.iconDefaultSize,
            width: AppValues.iconDefaultSize,
            color: navItems.indexOf(navItem) == navController.selectedIndex?
              selectedItemColor: unselectedItemColor,),
            label: navItem.navTitle,
            tooltip: ""
        )).toList(),
    ));
  }

  List<BottomNavItem> _getNavItems(BuildContext context) {
    return [
      BottomNavItem(
        navTitle: context.loc.bottomNavHome,
        iconSvgName: "ic_home.svg",
        menuCode: MenuCode.HOME,
      ),
      BottomNavItem(
          navTitle: context.loc.bottomNavFavorite,
          iconSvgName: "ic_favorite.svg",
          menuCode: MenuCode.FAVORITE),
      BottomNavItem(
          navTitle: context.loc.bottomNavSettings,
          iconSvgName: "ic_settings.svg",
          menuCode: MenuCode.SETTINGS)
    ];
  }
}
