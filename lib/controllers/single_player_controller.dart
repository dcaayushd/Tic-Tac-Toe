import 'package:get/get.dart';





class SinglePlayerController extends GetxController {
  RxList playValue = ["", "", "", "", "", "", "", "", ""].obs;
  RxBool isXtime = true.obs;


  void onClick(int index) {
    if (playValue[index] == "") {
      if (isXtime.value) {
        playValue[index] = "X";
        isXtime.value = !isXtime.value;
      } else {
        playValue[index] = "O";
        isXtime.value = !isXtime.value;
      }
    }

  }

}
