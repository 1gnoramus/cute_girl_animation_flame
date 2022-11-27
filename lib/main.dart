import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MySpriteTutorial()));
}

class MySpriteTutorial extends FlameGame {
  late SpriteAnimationComponent girlWalking;
  late SpriteComponent background;

  Future<void> onLoad() async {
    super.onLoad();

    background = SpriteComponent()
      ..sprite = await loadSprite('bg.png')
      ..size = size;
    add(background);

    final spriteSheet =
        await fromJSONAtlas('spritesheet.png', 'spritesheet.json');
    SpriteAnimation walk =
        SpriteAnimation.spriteList(spriteSheet, stepTime: .1);
    girlWalking = SpriteAnimationComponent()
      ..animation = walk
      ..position = Vector2(70, 0)
      ..size = Vector2(100, 100);
    add(girlWalking);
  }

  void update(double dt) {
    super.update(dt);
    if (girlWalking.x < 100) {
      girlWalking.y += dt * 40;
      girlWalking.x += dt * 40;
    } else if (girlWalking.x > 100 && girlWalking.x < 320) {
      girlWalking.y += dt * 0;
      girlWalking.x += dt * 40;
    } else if (girlWalking.x > 320) {
      girlWalking.y += dt * 40;
      girlWalking.x += dt * 0;
    } else if (girlWalking.x > 320 && girlWalking.y < 200) {
      girlWalking.y += dt * 40;
      girlWalking.x += dt * 0;
    }
  }
}
