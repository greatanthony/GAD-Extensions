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
import openfl.text.Font;
import com.stencyl.graphics.G;
import com.stencyl.Engine;
import openfl.geom.Matrix;
import openfl.Assets;
import com.stencyl.behavior.Script;

class Tin extends Sprite {
	
	public static var initext : String;
	public static var tfx : Float;
	public static var tfy : Float;
	public static var twidth : Float;
	public static var theight : Float;
	public static var mchars : Int = 0;
	public static var tmode: Bool = false;
	public static var tflist = new StringMap<TextField>();
	public static var eligibility = new StringMap<Bool>();
	public static var usedembeddedfonts = new StringMap<Bool>();
	public static var initialX = new StringMap<Float>();
	public static var initialY = new StringMap<Float>();
	public static var CID : String;
	public static var fontname : String = "_typewriter";
	public static var size: Int = 10;
	public static var color: UInt = 0x000000;
	public static var extrafont: Font;

	
	public static function create(id: String) {
	CID = id;
	}
	
	public static function setwidth(width: Float) {
	twidth = width;	
	}
	
	public static function setheight(height: Float) {
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
	initialX.set(CID, Xin);
	initialY.set(CID, Yin);
	
	
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
		usedembeddedfonts.set(CID, false);
	   }	
	   
	   if (ft == 2)
	   {
	    fontname = "_sans";
		usedembeddedfonts.set(CID, false);
	   }
	   
	   if (ft == 3)
	   {
	    fontname = "_serif";
		usedembeddedfonts.set(CID, false);
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
	
	public static function loadfontfromassets(id: String){
	var font: Font;
	Assets.loadFont("assets/data/"+id);
	trace("assets/data/"+id);
	font = Assets.getFont ("assets/data/"+id);
	trace(font.fontName);
	fontname = font.fontName;
	usedembeddedfonts.set(CID, true);
	}
	
	public function create2() {	
	
    var textField:TextField = new TextField();
	var format:TextFormat = new TextFormat(fontname, size, color);
	textField.defaultTextFormat = format;
	
	if(!((initext == null)))
     {
	textField.text = initext;
     }
	else{
	textField.text = "";	 
	}
	tflist.set(CID, textField);
	
	textField.x = initialX.get(CID);
	textField.y = initialY.get(CID); 
	
	
	textField.maxChars = mchars;
	textField.width = twidth;
	textField.height = theight;
	textField.wordWrap = true;
	textField.displayAsPassword = tmode;
	textField.type = INPUT;
	
	if(usedembeddedfonts.get(CID)==true){
	textField.embedFonts = true;
	trace("GAD-functioned to use an embed font");
	}
	
	if(eligibility.get(CID)) {
	Engine.engine.root.parent.addChild(textField);
	
	}
}

}
	
	
	
