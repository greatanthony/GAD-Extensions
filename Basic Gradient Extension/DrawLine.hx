package;

import com.stencyl.graphics.G;
import openfl.geom.Matrix;
import openfl.display.GradientType;
import openfl.display.SpreadMethod;
import openfl.display.InterpolationMethod;
import com.stencyl.utils.Utils;
import openfl.display.LineScaleMode;
import com.stencyl.Engine;

/** ...
 * @author greatanthony
 */
class DrawLine { 
	
        public static function draw(g:G, color1:UInt, opacity1:Float, color2:UInt, opacity2:Float, Thickness:Float, X1:Float, Y1:Float, X2:Float, Y2:Float, Angle:Float) {
	    var alphas = [opacity1 / 100, opacity2 / 100];
	    var ratios = [0, 225];
	    var matr = new Matrix();
		
		matr.translate(X1, Y1);                         // ss edit
		X1 = X1 * g.scaleX + Engine.cameraX;            // ss edit
		Y1 = Y1 * g.scaleY + Engine.cameraY;            // draws by screen space  , ss edit
		X2 = X2 * g.scaleX + Engine.cameraX;            // ss edit
		Y2 = Y2 * g.scaleY + Engine.cameraY;            // draws by screen space  , ss edit
		
		
	    matr.createGradientBox(X2-X1, 10, Angle * Utils.RAD, X1, Y1);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [color1, color2];
		
		g.graphics.endFill();		
        g.startGraphics();
        g.graphics.lineStyle(Thickness, 0, 1, false, LineScaleMode.NORMAL, null, null, 3);
	    g.graphics.lineGradientStyle(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, RGB, 0);
		g.graphics.moveTo(X1, Y1);
		g.graphics.lineTo(X2, Y2);
		g.endGraphics();

	}

}
