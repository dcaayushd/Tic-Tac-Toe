import 'package:get/get.dart';
import 'package:tic_tac_toe/screens/auth/auth_screen.dart';
import 'package:tic_tac_toe/screens/game_screen/multi_player_screen.dart';
import 'package:tic_tac_toe/screens/game_screen/single_player_screen.dart';
import 'package:tic_tac_toe/screens/home/home_screen.dart';
import 'package:tic_tac_toe/screens/lobby_screen/lobby_screen.dart';
import 'package:tic_tac_toe/screens/room_screen/room_screen.dart';
import 'package:tic_tac_toe/screens/splash/splash_screen.dart';
import 'package:tic_tac_toe/screens/update_profile/update_profile_screen.dart';
import 'package:tic_tac_toe/screens/welcome/welcome_screen.dart';

var screens = [
  GetPage(
    name: '/room',
    page: () => RoomScreen(),
  ),
  GetPage(
    name: '/lobby',
    page: () => LobbyScreen(),
  ),
  GetPage(
    name: '/auth',
    page: () => AuthScreen(),
  ),
  GetPage(
    name: "/home",
    page: () => HomeScreen(),
  ),
  GetPage(
    name: "/splash",
    page: () => SplashScreen(),
  ),
  GetPage(
    name: "/updateProfile",
    page: () => UpdateProfileScreen(),
  ),
  GetPage(
    name: "/welcome",
    page: () => WelcomeScreen(),
  ),
  GetPage(
    name: "/multiPlayer",
    page: () => MultiPlayerScreen(),
  ),
  GetPage(
    name: "/singlePlayer",
    page: () => SinglePlayerScreen(),
  ),
];
