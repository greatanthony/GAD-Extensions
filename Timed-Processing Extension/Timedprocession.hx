package;

import com.stencyl.utils.Utils;
import com.stencyl.behavior.TimedTask;
import flash.display.Sprite;
import haxe.ds.StringMap;
import lime.math.color.RGBA;
import openfl.utils.Object.ObjectType;
import openfl.utils.Timer;
import motion.Actuate;
import com.stencyl.behavior.Script;
import haxe.ds.IntMap;

/** ...
 * @author greatanthony
 */
class Timedprocession {
	
	public static var countlist = new IntMap<Float>();
	public static var inlist = new IntMap<Bool>();
	
	
	public static function colortransition(Color1:UInt, Color2:UInt, Time: Float, Rnd: Int): UInt  {
	var tad: Float;
	if (!(inlist.exists(Rnd))){ 
	inlist.set(Rnd, true);
	countlist.set(Rnd, 0);
	}	
	
	if(inlist.get(Rnd))
	{
		inlist.set(Rnd, false);
		Script.runPeriodically(1000 * (Time / 100), function(timeTask:TimedTask):Void
		{
		tad = countlist.get(Rnd) + 0.01;	
		countlist.set(Rnd, tad);
		}, null);
	}
	return Utils.colorLerp(Color1,Color2,countlist.get(Rnd));
	}
	
	public static function numtransition(num1:Float, num2:Float, Time: Float, Rnd: Int): Float  {
	var tad: Float;
	if (!(inlist.exists(Rnd))){ 
	inlist.set(Rnd, true);
	countlist.set(Rnd, 0);
	}	
	
	if(inlist.get(Rnd))
	{
		inlist.set(Rnd, false);
		Script.runPeriodically(1000 * (Time / 100), function(timeTask:TimedTask):Void
		{
		tad = countlist.get(Rnd) + 0.01;	
		countlist.set(Rnd, tad);
		}, null);
	}
	return lerp(num1, num2, countlist.get(Rnd));
	}
	
	public static inline function lerp(a:Float, b:Float, t:Float = 1):Float
	{
		if (t <= 0) { return a; }
		if (t >= 1) { return b; }
		return a + (b - a) * t;
	}
	
	
}
