package mis.scene;

import mis.game.Player;

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
  var player : Player;
  var fallingTree : Obj;

  public function new(stage : Stage) {
    super(stage, "Wiley Woods");

    var tile = Tile.fromColor(0x00cc00, 16, 64);

    // background trees
    var treesData = [
      {x: 100, y: 200},
      {x: 500, y: 300},
      {x: 600, y: 600},
    ];

    for (treeData in treesData) {
      var treeSprite = new Bitmap(tile, s2d);
      var tree = new Obj(treeSprite, null, null, s2d);
      tree.x = treeData.x;
      tree.y = treeData.y;
    }

    var treeSprite = new Bitmap(tile, s2d);
    fallingTree = new Obj(treeSprite, null, null, s2d);
    fallingTree.x = 500;
    fallingTree.y = 300;

    player = new Player(s2d);
    player.x = 500;
    player.y = 500;
  }

  public override function update(dt: Float) {
    super.update(dt);

    if (!isTrDone) {
      return;
    }

    player.update(dt);
  }

  override function trDone(dt : Float) {

  }
}
