import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mafia/role.dart';
import 'package:mafia/user.dart';

class GameManager extends ChangeNotifier {
  GameManager._privateConstructor();

  static final GameManager instance = GameManager._privateConstructor();

  List<User> players = [];

  void addPlayer(User user) {
    players.add(user);
    notifyListeners();
  }

  void reset() {
    players.clear();
    notifyListeners();
  }

  void start() {
    for (var i = 0; i < players.length; i++) {
      final player = players[i];
      player.role = Role.none;
    }

    // every 3rd - mafia
    // players > 7 --> sheriff & doctor
    // players > 9 --> lady & killer
    // all others --> citizen

    // Get random role
    final random = Random();
    final roleIndex = random.nextInt(Role.values.length);
    final role = Role.values[roleIndex];

    // Shuffle players
    players.shuffle();

    for (var p = 0; p < players.length; p++) {
      final mafiaCount = players.length ~/ 3;
      if (players.length < 7) {
        if (p < mafiaCount) {
          if (p == 0) {
            players[p].role = Role.boss;
          } else {
            players[p].role = Role.mafia;
          }
        } else {
          players[p].role = Role.citizen;
        }
      } else if (players.length >= 7 && players.length < 9) {
        if (p < mafiaCount) {
          if (p == 0) {
            players[p].role = Role.boss;
          } else {
            players[p].role = Role.mafia;
          }
        } else if (p < mafiaCount + 1) {
          players[p].role = Role.doctor;
        } else if (p < mafiaCount + 2) {
          players[p].role = Role.sheriff;
        }else {
          players[p].role = Role.citizen;
        }
      } else if (players.length >= 9) {
        if (p < mafiaCount) {
          if (p == 0) {
            players[p].role = Role.boss;
          } else {
            players[p].role = Role.mafia;
          }
        } else if (p < mafiaCount + 1) {
          players[p].role = Role.doctor;
        } else if (p < mafiaCount + 2) {
          players[p].role = Role.sheriff      ;
        } else if (p < mafiaCount + 3) {
          players[p].role = Role.killer;
        } else if (p < mafiaCount + 4) {
          players[p].role = Role.lady;
        } else {
          players[p].role = Role.citizen;
        }
      }
    }
  }
}

