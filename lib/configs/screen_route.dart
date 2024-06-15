import 'package:get/get.dart';
import 'package:tic_tac_toe/screens/lobby_screen/lobby_screen.dart';
import 'package:tic_tac_toe/screens/room_screen/room_screen.dart';

var pages = [
  GetPage(
    name: '/room',
    page: () => RoomScreen(),
  ),
  GetPage(
    name: '/lobby',
    page: () => LobbyScreen(),
  ),
];
