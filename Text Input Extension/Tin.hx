package;


import com.stencyl.Engine;
import haxe.ds.StringMap;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.utils.Object.ObjectType;
import com.stencyl.models.Actor;
import com.stencyl.models.Font;
import com.stencyl.graphics.G;

class Tin extends Sprite {
	
	public static var initext : String;
	public static var tfx : Float;
	public static var tfy : Float;
	public static var twidth : Int;
	public static var theight : Int;
	public static var mchars : Int = 0;
	public static var tmode: Bool = false;
	public static var tflist = new StringMap<TextField>();
	public static var eligibility = new StringMap<Bool>();
	public static var CID : String;
	public static var fontname : String = "_typewriter";
	public static var size: Int = 10;
	public static var color: UInt = 0x000000;

	
	public static function create(id: String) {
	CID = id;
	}
	
	public static function setwidth(width: Int) {
	twidth = width;	
	}
	
	public static function setheight(height: Int) {
	theight = height;	
	}
	
	public static function setmaxchars(chars: Int) {
	mchars = chars;	
	}
	
	public static function setmode(normal: Bool) {
	tmode = normal;	
	}
	
	
	public static function setinext(text: String) {
	initext = text;
	}
	
	public static function createbox(Xin: Float, Yin: Float) {
	tfx =  Xin;
	tfy = Yin;
	eligibility.set(CID, true);
	var extObject : ObjectType = new Tin();
	extObject.create2();

	}
	
	public static function setsize(sz: Int)
	{
	size = sz;
	}
	
	public static function setfont(ft: Int)
	{
	   if (ft == 1)
	   {
	    fontname = "_typewriter";
	   }	
	   
	   if (ft == 2)
	   {
	    fontname = "_sans";
	   }
	   
	   if (ft == 3)
	   {
	    fontname = "_serif";
	   }
	}
	
	public static function setcolor(col: UInt)
	{
	color = col;
	}
	
	
	public static function removebox(id: String) {
	eligibility.set(id, false);
	var tf : TextField;
	tf = tflist.get(id);
	Engine.engine.root.parent.removeChild(tf);
	
	}
	
	public static function getext(id: String): String {
	var tuxt: TextField; 
	tuxt = tflist.get(id);
	return tuxt.text;
	}
	
	public function create2() {	
	

	var format:TextFormat = new TextFormat (fontname,  size, color);
	format.align = TextFormatAlign.LEFT;	
	var textField:TextField = new TextField();
	
	textField.defaultTextFormat = format;
	
	 if(!((initext == null)))
     {
	textField.text = initext;
     }
	tflist.set(CID, textField);
	 
	textField.x = tfx;
	textField.y = tfy;
	textField.maxChars = mchars;
	textField.width = twidth;
	textField.height = theight;
	textField.wordWrap = true;
	textField.displayAsPassword = tmode;
	textField.type = INPUT;
	if(eligibility.get(CID)) {
	Engine.engine.root.parent.addChild(textField);
	}
}
	}
	
	
	
