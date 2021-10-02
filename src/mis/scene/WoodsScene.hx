package mis.scene;

import mis.game.Player;

import hxt.input.Input;
import hxt.obj2d.Obj;
import hxt.scene.Stage;
import hxt.scene.Scene;

import h2d.Bitmap;
import h2d.Graphics;
import hxd.Res;
import h2d.Text;
import h2d.Tile;
import hxd.res.DefaultFont;

class WoodsScene extends GameScene {
  var player : Player;
  var fallingTree : Obj;

  public function new(stage : Stage) {
    super(stage, "Wiley Woods");

    // background trees
    var treeTile = Tile.fromColor(0x00cc00, 16, 64);
    var treesData = [
      {x: 100, y: 200, res: Res.tree1},
      {x: 500, y: 300, res: Res.tree1},
      {x: 600, y: 600, res: Res.tree1},
    ];

    for (treeData in treesData) {
      var tile = treeData.res == null ? treeTile : treeData.res.toTile();
      var treeSprite = new Bitmap(tile, s2d);
      var tree = new Obj(treeSprite, null, null, s2d);
      tree.x = treeData.x;
      tree.y = treeData.y;
    }

    var treeSprite = new Bitmap(Res.tree1.toTile(), s2d);
    fallingTree = new Obj(treeSprite, null, null, s2d);
    fallingTree.x = 500;
    fallingTree.y = 300;
    fallingTree.filter = new h2d.filter.Glow(0xff6600);

    var jackSprite = new Bitmap(Res.jack1.toTile(), s2d);
    var jack = new Obj(jackSprite, null, null, s2d);
    jack.x = 500;
    jack.y = 500;
    jack.filter = new h2d.filter.Glow(0xff6600);

    player = new Player(s2d);
    player.x = 500;
    player.y = 500;
  }

  public override function update(dt: Float) {
    super.update(dt);

    s2d.ysort(0);

    if (!isTrDone) {
      return;
    }

    player.update(dt);
  }

  override function trDone(dt : Float) {

  }
}
