package;

import haxe.ds.StringMap;
import haxe.macro.Type.FieldKind;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.media.SoundChannel;
import openfl.media.SoundLoaderContext;
import openfl.media.SoundTransform;
import openfl.Assets;
import openfl.net.URLRequest; 
import openfl.media.Sound;

/**
 * ...
 * @author greatanthony
 */
class StreamingSounds
{   
	public static var ThisSound: Sound;
	public static var url: String;
	public static var list = new StringMap<Sound>();
	public static var channellist = new StringMap<SoundChannel>();
	public static var positionlist = new StringMap<Float>();
	public static var pausedreservechart = new StringMap<Bool>();
	public static var volist = new StringMap<Float>();

	
	public static function srload(url:String, id: String):Void
	{	
	var thiso: Sound;
	thiso = new openfl.media.Sound(new openfl.net.URLRequest(url), new openfl.media.SoundLoaderContext(0.5, false));
	list.set(id, thiso);
    }
	
	public static function srplay(id: String):Void
	{	
	var toplay = list.get(id);
	var channel : SoundChannel;
    channel = toplay.play();
	channellist.set(id, channel);
    }
	
	
	
	public static function srcheck(id:String):Bool
	{
	var tocheck = list.get(id);	
	if(tocheck.bytesLoaded == tocheck.bytesTotal)
{
	if(tocheck.bytesLoaded != 0)
	{
	return true;	
	}
	else
	{
	return false;	
	}
}
else {
	return false;
}

	}
	
	
	public static function srloadeddata(id: String):Int
	{
	var pk = list.get(id);
	return pk.bytesLoaded;
	}
	
	
	public static function srtotaldata(id: String):Int
	{
	var pk = list.get(id);
	return pk.bytesTotal;
	}
	
	public static function srstop(id: String):Void
	{
	var tostop : SoundChannel;
	if (channellist.exists(id)){
	tostop = channellist.get(id);
	tostop.stop();
	}
	else
	{
	trace("there is no such sound named by you :-(");
	}
	}
	
	public static function srsound(id: String):Sound
	{
	var sound : Sound;
	sound = list.get(id);
	return sound;
	}
	
	public static function srposition(id: String):Float
	{
	var tchannel : SoundChannel;
	if (channellist.exists(id)){
	tchannel = channellist.get(id);
	return tchannel.position;
	}
	else
	{
	trace("there is no such sound named by you :-");
	return 0;
	}
	}
	
	public static function srlength(id: String):Float
	{
	var sound : Sound;
	sound = list.get(id);
	return sound.length;
	}
	
	public static function srpausume(pause: Bool, id: String):Void
	{
	if (pause)
	 {
		var sound: Sound;
		sound = list.get(id);
		positionlist.set(id, srposition(id)); // storing it's current and last position
		srstop(id); // stopping the sound
		pausedreservechart.set(id, true);
	 }
	 else
	 {
		if (volist.exists(id)){
		var ts : SoundTransform = new SoundTransform(volist.get(id), 0);
		var toplay: Sound;
		toplay = list.get(id); // helping the system identify the same sound again...
		var channel : SoundChannel; // and this  line is added so that the resumed sounds can also be paused and this cycle can be repeated infinite times :) 
		   if (pausedreservechart.exists(id)){
		   channel = toplay.play(positionlist.get(id), 0, ts); // playing the sound again from the last position stored so it appears smoothly as being resumed again :)
	       channellist.set(id, channel);
		   }
		}	
		 
		else { 
		var toplay: Sound;
		toplay = list.get(id); // helping the system identify the same sound again...
		var channel : SoundChannel; // and this  line is added so that the resumed sounds can also be paused and this cycle can be repeated infinite times :) 
		   if (pausedreservechart.exists(id)){
		   channel = toplay.play(positionlist.get(id), 0, null); // playing the sound again from the last position stored so it appears smoothly as being resumed again :)
	       channellist.set(id, channel);
		   }
		}   
	 }
	}
	
	public static function srplayenig(id: String, pos: Float):Void
	{	
	if (volist.exists(id)){
	var ts : SoundTransform = new SoundTransform(volist.get(id), 0);	
	var toplay = list.get(id);
	var channel : SoundChannel;
    channel = toplay.play(pos, 0, ts);
	channellist.set(id, channel);	
	}	
	else {
	var toplay = list.get(id);
	var channel : SoundChannel;
    channel = toplay.play(pos, 0, null);
	channellist.set(id, channel);		
	}
    }
	
	public static function srvol(id: String, vol: Float):Void
	{
	if(channellist.exists(id)){	
	var todot = channellist.get(id);
	var ts : SoundTransform = new SoundTransform(vol/100, 0);
	todot.soundTransform = ts;
	volist.set(id, vol / 100);          // storing the change of volume ( if a 'new play' is done by user, we will not play by prev.volume , instead by full volume )
    }
	}
	
}

	
