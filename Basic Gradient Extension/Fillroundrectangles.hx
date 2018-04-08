package;

import com.stencyl.graphics.G;
import openfl.geom.Matrix;
import openfl.display.GradientType;
import openfl.display.SpreadMethod;
import openfl.display.InterpolationMethod;
import com.stencyl.utils.Utils;

/** ...
 * @author greatanthony
 */
class Fillroundrectangles {
	
        public static function fill(g:G, color1:UInt, opacity1:Float, color2:UInt, opacity2:Float, Angle:Float, X:Float, Y:Float, Width:Float, Height:Float, Arc:Float) {
	    var alphas = [opacity1/100, opacity2/100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
	    matr.createGradientBox(Width, Height, Angle * Utils.RAD, X, Y);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [color1, color2];
		
		g.graphics.endFill();
        g.startGraphics();
	    g.graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawRoundRect(X, Y, Width, Height, Arc, Arc);
		g.endGraphics();
	}

}
