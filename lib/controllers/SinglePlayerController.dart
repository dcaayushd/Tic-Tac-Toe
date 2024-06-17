
import 'package:get/get.dart';



class SinglePlayerController extends GetxController {
  RxList playValue = ["", "", "", "", "", "", "", "", ""].obs;

  void onClick(int index) {
    playValue[index] = "X";
  }
}
