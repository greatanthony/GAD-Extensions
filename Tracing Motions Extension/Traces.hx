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
import com.stencyl.models.Actor;

/**
 * ...
 * @author squeeb
 */
class Traces
{   
	public static var aclist =  new StringMap<Actor>();
	public static var ThisSound: Sound;
	public static var url: String;
	public static var Xspeedlist = new StringMap<Float>();
	public static var Yspeedlist = new StringMap<Float>();
	public static var XPrev1 = new StringMap<Float>();
	public static var XPrev2 = new StringMap<Float>();
	public static var YPrev1 = new StringMap<Float>();
	public static var YPrev2 = new StringMap<Float>();
	public static var idle = new StringMap<Bool>();
	public static var fleft = new StringMap<Bool>();
	public static var fright = new StringMap<Bool>();
	public static var fup = new StringMap<Bool>();
	public static var fdown = new StringMap<Bool>();
	public static var LastchangedX = new StringMap<Float>();
	public static var LastchangedY = new StringMap<Float>();

	

	
	public static function operatios(id: Actor, time: Float):Void    // this block calculates coordinates , that's why it was asked to put this in "When Updating" section.
	{	
	aclist.set(("" + id), id);
	
	
	XPrev2.set(("" + id), XPrev1.get("" + id));
	XPrev1.set(("" + id), id.getX());
	Xspeedlist.set(("" + id), (( XPrev1.get("" + id) - XPrev2.get("" + id) ) * 1/time));
            if (!((( XPrev1.get("" + id) - XPrev2.get("" + id) ) * 1/time ) == 0))
			{
		     LastchangedX.set(("" + id), (( XPrev1.get("" + id) - XPrev2.get("" + id) ) * 1/time)); 	
			}                                                                                       //functions for X end here 
	
	YPrev2.set(("" + id), YPrev1.get("" + id));
	YPrev1.set(("" + id), id.getY());
	Yspeedlist.set(("" + id), (( YPrev1.get("" + id) - YPrev2.get("" + id) ) * 1/time));
            if (!((( YPrev1.get("" + id) - YPrev2.get("" + id) ) * 1/time ) == 0))
			{
			LastchangedY.set(("" + id), ( YPrev1.get("" + id) - YPrev2.get("" + id) ) * 1/time); 	
			}                                                                                       //functions for Y end here 
			
			
	//functions for giving values to main attributes start here
	        if (((Xspeedlist.get("" + id)) == 0) && (Yspeedlist.get("" + id) == 0))           // if both speeds are zero , then we assume it's idle at the moment
			{
			idle.set(("" + id), true);	
			}
			else{
			idle.set(("" + id), false);	
			}
			
			if (LastchangedX.get("" + id) > 0){          // setting facing directions for right and left
			fleft.set(("" + id), false);
			fright.set(("" + id), true);
			}
			else{
			fleft.set(("" + id), true);
			fright.set(("" + id), false);	
			}
			
			if ((LastchangedY.get("" + id)) > 0){          // setting facing directions for up and down
			fup.set(("" + id), false);
			fdown.set(("" + id), true);
			}
			else{
			fup.set(("" + id), true);
			fdown.set(("" + id), false);	
			}
				
    }
	

	
	
	public static function idlecheck(id:Actor):Bool
	{
        if (idle.exists("" + id)){     //checking whether such actor even exists or not
        return idle.get("" + id);	
		}
		
		else{
		return false;       //even if there's no such actor, we would simply return false and typing the info in console	
		trace("well..there's no such actor...so we just returned false to you");
		}
	}
	
	
	public static function movecheck(id:Actor):Bool
	{
        if (idle.exists("" + id)){     //checking whether such actor even exists or not
           if(idle.get("" + id)){
			return false;   
		   }
		   else{
			return true;   
		   }
				
		}
		
		else{
		return false;       //even if there's no such actor, we would simply return false and typing the info in console	
		trace("well..there's no such actor...so we just returned false to you");
		}
	}
	
	
	
	
	public static function facinghorizontal(id: Actor, left:Bool):Bool
	{
	   if (fleft.exists("" + id)){     //checking whether such actor even exists or not
		    if(left){ 
            return fleft.get("" + id);
		    }
			else{
			return fright.get("" + id);	
			}
		
	   }	
		else{
		return false;       //even if there's no such actor, we would simply return false and typing the info in console	
		trace("well..there's no such actor...so we just returned false to you");
		}
	   
	}
	
	public static function facingvertical(id: Actor, down:Bool):Bool
	{
	   if (fdown.exists("" + id)){     //checking whether such actor even exists or not
		    if(down){ 
            return fdown.get("" + id);
		    }
			else{
			return fup.get("" + id);	
			}
		
	   }	
		else{
		return false;       //even if there's no such actor, we would simply return false and typing the info in console	
		trace("well..there's no such actor...so we just returned false to you");
		}
	   
	}
	
	
	
	public static function movingvertical(id: Actor, down:Bool):Bool
	{
	   if (fdown.exists("" + id)){     //checking whether such actor even exists or not
		    if(down){ 
                 if((fdown.get("" + id)) && (Yspeedlist.get("" + id) > 0)){
				 return true;	 
				 }
				 
				 else{
				return false;	 
				 }
		    }
			else{
				if((fup.get("" + id)) && (Yspeedlist.get("" + id) < 0)){
				 return true;	 
				 }
				 
				 else{
				 return false;	 
				 }
			}
			
			
	   }
			
		else{
		return false;       //even if there's no such actor, we would simply return false and typing the info in console	
		trace("well..there's no such actor...so we just returned false to you");
		}
	   }
	
	public static function movinghorizontal(id: Actor, left:Bool):Bool
	{
	   if (fleft.exists("" + id)){     //checking whether such actor even exists or not
		    if(left){ 
                 if((fleft.get("" + id)) && (Xspeedlist.get("" + id) < 0)){
				 return true;	 
				 }
				 
				 else{
				return false;	 
				 }
		    }
			else{
				if((fright.get("" + id)) && (Xspeedlist.get("" + id) > 0)){
				 return true;	 
				 }
				 
				 else{
				 return false;	 
				 }
			}
			
			
	   }
			
		else{
		return false;       //even if there's no such actor, we would simply return false and typing the info in console	
		trace("well..there's no such actor...so we just returned false to you");
		}
	   }
	
	
	   public static function xspeed(id: Actor):Float
	  {
        if (Xspeedlist.exists("" + id)){     //checking whether such actor even exists or not
		return Xspeedlist.get("" + id);		
		}
		
		else{
		return 0;       //even if there's no such actor, we would simply return 0 and typing the info in console	
		trace("well..there's no such actor...so we just returned 0 to you");
		}
	   }
	   
	     public static function yspeed(id: Actor):Float
	  {
        if (aclist.exists("" + id)){     //checking whether such actor even exists or not
		return Yspeedlist.get("" + id);		
		}
		
		else{
		return 0;       //even if there's no such actor, we would simply return 0 and typing the info in console	
		trace("well..there's no such actor...so we just returned 0 to you");
		}
	   }
}

	
