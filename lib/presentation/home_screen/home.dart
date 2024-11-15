import '../../constants/consts.dart';
import '../../controllers/home_controller.dart';
import '../cart/cart_screen.dart';
import '../categories/categories_screen.dart';
import 'home_screen.dart';
import 'package:get/get.dart';

import '../../utils/widgets/exit_dialog.dart';
import '../profile/profile_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    /// initialize home controller

    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 25,
        ),
        label: home,
      ),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 25,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 25,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 25,
          ),
          label: account),
    ];

    var navBody = [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      AccountScreen(),
    ];

    return WillPopScope(
      onWillPop: () async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => exitDialog(context));
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: palettesTen,
            items: navbarItem,
            selectedItemColor: palettesFive,
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
