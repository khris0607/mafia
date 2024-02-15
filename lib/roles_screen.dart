import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mafia/game_manager.dart';
import 'package:mafia/main.dart';
import 'package:mafia/player_list_item_widget.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {

  @override
  void initState() {
    super.initState();

    GameManager.instance.start();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(backgroundColor: backgroundColor,),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: GameManager.instance.players.length,
                  itemBuilder: (context, index) {
                    final player = GameManager.instance.players[index];
                    return PlayerListItemWidget(player: player);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ElevatedButton
                    (style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )),onPressed: () {
                    context.push("/offline/roles/game");
                  }, child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 34, vertical: 24),
                    child: Text
                      ("Запустити гру!", style:
                    TextStyle(color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  )),
                ],
              ),
            )
          ],
        ));
  }
}
