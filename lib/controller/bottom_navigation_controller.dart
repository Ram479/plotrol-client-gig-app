import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
//  PageController pageController = PageController();

  var selectedIndex = 0.obs;

  onTapped(int index) {
    selectedIndex.value = index;
    print('controller Index : $selectedIndex');
  }
}
