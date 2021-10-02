package mis.scene;

import hxt.input.Input;
import hxt.obj2d.Obj;
import hxt.scene.Stage;
import hxt.scene.Scene;

import h2d.Bitmap;
import h2d.Graphics;
import h2d.Text;
import h2d.Tile;
import hxd.res.DefaultFont;

class WoodsScene extends GameScene {
  public static inline var SPEED = 100;

  var tree : Obj;

  public function new(stage : Stage) {
    super(stage, "Wiley Woods");

    var tile = Tile.fromColor(0x00FF00, 10, 50);
    var treeSprite = new Bitmap(tile, s2d);

    tree = new Obj(treeSprite, null, null, null);
    tree.x = 100;
    tree.y = 300;

    s2d.add(tree, 0);
  }

  public override function update(dt: Float) {
    super.update(dt);

    if (!isTrDone) {
      return;
    }

    if (Input.game.isDown("moveLeft")) {
      tree.x -= dt * SPEED;
    } else if (Input.game.isDown("moveRight")) {
      tree.x += dt * SPEED;
    }
  }

  override function trDone(dt : Float) {

  }
}
