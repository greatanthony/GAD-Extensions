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
class Mainwa {
	
	public static var mcolor1: UInt = 0x000000;
	public static var mcolor2: UInt = 0xFFFFFF;
	public static var mop1: Float = 100;
	public static var mop2: Float = 100;
	public static var angle: Float = 0;
	public static var stroke: Float = 1;
	
    public static function Drawrect(g:G, engim: Bool, X:Float, Y:Float, width:Float, height: Float) {
		
		if(engim){
		var alphas = [mop1 / 100, mop2 / 100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(X, Y);                      
		X = X * g.scaleX + Engine.cameraX;          
		Y = Y * g.scaleY + Engine.cameraY;         
		width = width * g.scaleX;
		height = height * g.scaleY;
		
		matr.createGradientBox(width, height,  angle * Utils.RAD, X, Y);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1,mcolor2];
		
		g.graphics.endFill();
        g.startGraphics();
		g.graphics.lineStyle(stroke, 0, 1, false, LineScaleMode.NORMAL, null, null, 3);
	    g.graphics.lineGradientStyle(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawRect(X,Y, width,height);
		g.endGraphics();
		}
		else{
		var alphas = [mop1 / 100, mop2/ 100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(X, Y);                      
		X = X * g.scaleX + Engine.cameraX;          
		Y = Y * g.scaleY + Engine.cameraY;         
		width = width * g.scaleX;
		height = height * g.scaleY;
		
		matr.createGradientBox(width, height,  angle * Utils.RAD, X, Y);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1,mcolor2];
		
		g.graphics.endFill();
        g.startGraphics();
		g.graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawRect(X,Y, width,height);
		g.endGraphics();	
		}
	}
	
	
	    public static function Drawroundrect(g:G, enigm: Bool, X:Float, Y:Float, Width:Float, Height:Float, Arc:Float) {
		if(enigm){
	    var alphas = [mop1/100, mop2/100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(0, 0);                      
		X = X * g.scaleX + Engine.cameraX;           
		Y = Y * g.scaleY + Engine.cameraY;  
		Width = Width * g.scaleX;
		Height = Height * g.scaleY;
		
	    matr.createGradientBox(Width, Height, angle * Utils.RAD, X, Y);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1, mcolor2];
		
		g.graphics.endFill();
		g.startGraphics();
        g.graphics.lineStyle(stroke, 0, 1, false, LineScaleMode.NORMAL, null, null, 3);
	    g.graphics.lineGradientStyle(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawRoundRect(X, Y, Width, Height, Arc, Arc);
		g.endGraphics();
		
	}
	else{
		var alphas = [mop1/100, mop2/100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(0, 0);                      
		X = X * g.scaleX + Engine.cameraX;           
		Y = Y * g.scaleY + Engine.cameraY;  
		Width = Width * g.scaleX;
		Height = Height * g.scaleY;
		
	    matr.createGradientBox(Width, Height, angle * Utils.RAD, X, Y);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1, mcolor2];
		
		g.graphics.endFill();
		g.startGraphics();
        g.graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawRoundRect(X, Y, Width, Height, Arc, Arc);
		g.endGraphics();	
	}
	}
	
	public static function Drawellipse(g:G, engim:Bool, X:Float, Y:Float, Width:Float, Height:Float) {
		if(engim){
	    var alphas = [mop1/100, mop2/100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(0, 0);                      
		X = X * g.scaleX + Engine.cameraX;           
		Y = Y * g.scaleY + Engine.cameraY; 
		Width = Width * g.scaleX;
		Height = Height * g.scaleY;
		
	    matr.createGradientBox(Width, Height, angle * Utils.RAD, X, Y);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1, mcolor2];
		
		g.graphics.endFill();
		g.startGraphics();
		g.graphics.lineStyle(stroke, 0, 1, false, LineScaleMode.NORMAL, null, null, 3);
	    g.graphics.lineGradientStyle(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawEllipse(X, Y, Width, Height);
        g.endGraphics();		
	}
	else{
		var alphas = [mop1/100, mop2/100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(0, 0);                      
		X = X * g.scaleX + Engine.cameraX;           
		Y = Y * g.scaleY + Engine.cameraY; 
		Width = Width * g.scaleX;
		Height = Height * g.scaleY;
		
	    matr.createGradientBox(Width, Height, angle * Utils.RAD, X, Y);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1, mcolor2];
		
		g.graphics.endFill();
		g.startGraphics();
		g.graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawEllipse(X, Y, Width, Height);
        g.endGraphics();	
	}
	}
	
	public static function Drawcircle(g:G,enigm: Bool,X:Float, Y:Float, Radius:Float) {
		if(enigm){	

	    var alphas = [mop1 / 100, mop2 / 100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(X, Y);                      
		X = X * g.scaleX + Engine.cameraX;            
		Y = Y * g.scaleY + Engine.cameraY;   
        Radius = Radius * g.scaleX;
		
	    matr.createGradientBox(2 * Radius, 2 * Radius, angle * Utils.RAD, X - Radius, Y - Radius);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1, mcolor2];
		
		g.graphics.endFill();
        g.startGraphics();
        g.graphics.lineStyle(stroke, 0, 1, false, LineScaleMode.NORMAL, null, null, 3);
	    g.graphics.lineGradientStyle(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawCircle(X,Y, Radius);
		g.endGraphics();

	}
	else{
		var alphas = [mop1 / 100, mop2 / 100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(X, Y);                      
		X = X * g.scaleX + Engine.cameraX;            
		Y = Y * g.scaleY + Engine.cameraY;   
        Radius = Radius * g.scaleX;
		
	    matr.createGradientBox(2 * Radius, 2 * Radius, angle * Utils.RAD, X - Radius, Y - Radius);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1, mcolor2];
		
		g.graphics.endFill();
        g.startGraphics();
	    g.graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.drawCircle(X,Y, Radius);
		g.endGraphics();	
	}
	}
	
	    public static function Drawline(g:G, X1:Float, Y1:Float, X2:Float, Y2:Float) {
	    var alphas = [mop1 / 100, mop2 / 100];
	    var ratios = [0, 225];
	    var matr = new Matrix();
		
		matr.translate(X1, Y1);                      
		X1 = X1 * g.scaleX + Engine.cameraX;          
		Y1 = Y1 * g.scaleY + Engine.cameraY;            
		X2 = X2 * g.scaleX + Engine.cameraX;           
		Y2 = Y2 * g.scaleY + Engine.cameraY;           
		
		
	    matr.createGradientBox(X2-X1, 10, angle * Utils.RAD, X1, Y1);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1, mcolor2];
		
		g.graphics.endFill();		
        g.startGraphics();
        g.graphics.lineStyle(stroke, 0, 1, false, LineScaleMode.NORMAL, null, null, 3);
	    g.graphics.lineGradientStyle(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, RGB, 0);
		g.graphics.moveTo(X1, Y1);
		g.graphics.lineTo(X2, Y2);
		g.endGraphics();

	}
	
	public static function Setcolors(c1: UInt, c2: UInt){
	mcolor1 = c1;
	mcolor2 = c2;
	}
	
	public static function Setopacities(o1: Float, o2: Float){
	mop1 = o1;
	mop2 = o2;
	}
	
	public static function Setangle(ang: Float){
	angle = ang;	
	}
	
	public static function Setstrokethickness(thickness: Float){
	stroke = thickness;	
	}
	
		
	public static function Drawcurve(g:G,enigm: Bool,X1:Float, Y1:Float, X2:Float, Y2: Float, X3: Float, Y3: Float) {
		if(enigm){	

	    var alphas = [mop1 / 100, mop2 / 100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(X1, Y1);                      
		X1 = X1 * g.scaleX + Engine.cameraX;            
		Y1 = Y1 * g.scaleY + Engine.cameraY;
		X2 = X2 * g.scaleX + Engine.cameraX;            
		Y2 = Y2 * g.scaleY + Engine.cameraY;
		X3 = X3 * g.scaleX + Engine.cameraX;            
		Y3 = Y3 * g.scaleY + Engine.cameraY;
		
		var tempX = Math.round((X1 + X3) / 2);
		var tempY = Math.round((Y1 + Y3) / 2);
		X2 = (tempX + ((X2 - tempX) * 2));
		Y2 = (tempY + ((Y2 - tempY) * 2));
		
	    matr.createGradientBox(Math.round(Math.max(X2, X3)-X1), Math.round(Math.max(Y2, Y3)-Y1), angle * Utils.RAD, X1, Y1);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1, mcolor2];
		
		g.graphics.endFill();
        g.startGraphics();
        g.graphics.lineStyle(stroke, 0, 1, false, LineScaleMode.NORMAL, null, null, 3);
	    g.graphics.lineGradientStyle(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.moveTo(X1, Y1);
	    g.graphics.curveTo(X2, Y2, X3, Y3);
		g.endGraphics();

	}
	else{
		var alphas = [mop1 / 100, mop2 / 100];
	    var ratios = [0, 0xFF];
	    var matr = new Matrix();
		
		matr.translate(X1, Y1);                      
		X1 = X1 * g.scaleX + Engine.cameraX;            
		Y1 = Y1 * g.scaleY + Engine.cameraY;
		X2 = X2 * g.scaleX + Engine.cameraX;            
		Y2 = Y2 * g.scaleY + Engine.cameraY;
		X3 = X3 * g.scaleX + Engine.cameraX;            
		Y3 = Y3 * g.scaleY + Engine.cameraY;
		
		var tempX = Math.round((X1 + X3) / 2);
		var tempY = Math.round((Y1 + Y3) / 2);
		X2 = (tempX + ((X2 - tempX) * 2));
		Y2 = (tempY + ((Y2 - tempY) * 2));
		
	    matr.createGradientBox(Math.round(Math.max(X2, X3)-X1), Math.round(Math.max(Y2, Y3)-Y1), angle * Utils.RAD, X1, Y1);
	    var sprMethod = SpreadMethod.PAD;
		var colors = [mcolor1, mcolor2];
		
		g.graphics.endFill();
        g.startGraphics();
	    g.graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, matr, sprMethod, InterpolationMethod.RGB, 0);
	    g.graphics.moveTo(X1, Y1);
	    g.graphics.curveTo(X2, Y2, X3, Y3);
		g.endGraphics();	
	}
	}
	

}
