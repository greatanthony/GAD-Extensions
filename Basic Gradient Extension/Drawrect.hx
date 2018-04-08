package;

import com.stencyl.graphics.G;
import openfl.geom.Matrix;
import openfl.display.GradientType;
import openfl.display.SpreadMethod;
import openfl.display.InterpolationMethod;
import com.stencyl.utils.Utils;
import openfl.display.LineScaleMode;

/** ...
 * @author greatanthony
 */
class Drawrect { 
	
        public static function draw(g:G, color1:UInt, opacity1:Float, color2:UInt, opacity2:Float, Thickness:Float, Angle:Float, X:Float, Y:Float, Width:Float, Height:Float) {
	    var alphas = [opacity1/100, opacity2/100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
	    matr.createGradientBox(Width, Height, Angle * Utils.RAD, X, Y);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [color1, color2];
		
		g.graphics.endFill();
        g.startGraphics();		
        g.graphics.lineStyle(Thickness, 0, 1, false, LineScaleMode.NORMAL, null, null, 3);
	    g.graphics.lineGradientStyle(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawRect(X, Y, Width, Height);
        g.endGraphics();		
	}

}
