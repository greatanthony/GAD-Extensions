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
class Fillellipse { 
	
        public static function fill(g:G, color1:UInt, opacity1:Float, color2:UInt, opacity2:Float, X:Float, Y:Float, Width:Float, Height:Float) {
	    var alphas = [opacity2/100, opacity1/100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
	    matr.createGradientBox(Width, Height, 0, X, Y);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [color2, color1];
		
		g.graphics.endFill();
        g.startGraphics();
	    g.graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawEllipse(X, Y, Width, Height);
		g.endGraphics();
	}

}
