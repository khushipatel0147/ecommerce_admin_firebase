import 'package:get/get.dart';

class AdminController extends GetxController
{
// ================== Image Picker ===========================

  RxString finalcategory='Select Category'.obs;


  RxList categoryList = [
    'Select Category',
    'Furniture',
    'Home Decor',
    'Kitchen',
    'Bath',
    'Lawn & Garden',
    'Lighting',
    'Storage',
    'Game',
  ].obs;

  void changeCategory(String newCategory)
  {
    finalcategory.value=newCategory;
  }

  RxString finalImage='https://cdn-icons-png.flaticon.com/512/107/107790.png'.obs;

  RxList imageList = [
    'https://cdn-icons-png.flaticon.com/512/107/107790.png',
    'https://cdn-icons-png.flaticon.com/512/5564/5564849.png',
    'https://cdn-icons-png.flaticon.com/512/942/942114.png',
    'https://cdn-icons-png.flaticon.com/512/1698/1698691.png',
    'https://cdn-icons-png.flaticon.com/512/3130/3130313.png',
    'https://cdn-icons-png.flaticon.com/512/628/628283.png',
    'https://cdn-icons-png.flaticon.com/512/2402/2402479.png',
    'https://cdn-icons-png.flaticon.com/512/407/407826.png',
    'https://cdn-icons-png.flaticon.com/512/808/808476.png',
  ].obs;

  void changeImage(int i)
  {
    finalImage.value=imageList[i];
  }

  RxString doneImage='https://cdn-icons-png.flaticon.com/512/5709/5709755.png'.obs;

}