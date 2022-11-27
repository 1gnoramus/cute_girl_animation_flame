import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MySpriteTutorial()));
}

class MySpriteTutorial extends FlameGame {
  late SpriteAnimationComponent girlWalking;

  Future<void> onLoad() async {
    super.onLoad();
    final spriteSheet =
        await fromJSONAtlas('spritesheet.png', 'spritesheet.json');
    SpriteAnimation walk =
        SpriteAnimation.spriteList(spriteSheet, stepTime: .1);
    girlWalking = SpriteAnimationComponent()
      ..animation = walk
      ..position = Vector2(100, 100)
      ..size = Vector2(200, 200);
    add(girlWalking);
  }
}
