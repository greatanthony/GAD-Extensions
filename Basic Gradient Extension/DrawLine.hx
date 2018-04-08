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
class DrawLine { 
	
        public static function draw(g:G, color1:UInt, opacity1:Float, color2:UInt, opacity2:Float, Thickness:Float, X1:Float, Y1:Float, X2:Float, Y2:Float, Angle:Float) {
	    var alphas = [opacity1 / 100, opacity2 / 100];
	    var ratios = [0, 225];
	    var matr = new Matrix();
	    matr.createGradientBox(X2, 10, Angle * Utils.RAD, 0, 0);
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
