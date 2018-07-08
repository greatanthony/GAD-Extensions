package;
import openfl.Lib;
import com.stencyl.graphics.G;
import openfl.geom.Matrix;
import openfl.display.GradientType;
import openfl.display.SpreadMethod;
import openfl.display.InterpolationMethod;
import com.stencyl.utils.Utils;
import com.stencyl.Engine;

/** ...
 * @author greatanthony
 */
class Fillcircles {
	
        public static function fill(g:G, color1:UInt, opacity1:Float, color2:UInt, opacity2:Float, X:Float, Y:Float, Radius:Float) {
	    var alphas = [opacity2 / 100, opacity1 / 100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(0, 0);                         //edited on 7/7/18 => ss edit
		X = X * g.scaleX + Engine.cameraX;            // ss edit
		Y = Y * g.scaleY + Engine.cameraY;            // draws by screen space  , ss edit
		
	    matr.createGradientBox(2 * Radius, 2 * Radius, 0, X - Radius, Y - Radius);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [color2, color1];
		
		g.graphics.endFill();
        g.startGraphics();
	    g.graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawCircle(X, Y, Radius);
		g.endGraphics();
	}

}
