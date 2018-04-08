package;

import Math;

/**
 * ...
 * @author greatanthony
 */
class Elemaths
{   
	
	public static function pairedHCF(input1: Float, input2: Float):Float
	{
	var C: Float;
    var D: Float;
    var R: Float;	
	C = Math.max(input1, input2);
	D = Math.min(input1, input2);
	R = C % D;
	if((R == 0))
		{
		return D;	
		}
		else
		{
			while(!((R == 0)))
			{
			C = D;
			D = R;
			R = C % D;
			if((R == 0))
                {
	            return D;
                }

			}
		}
	return Math.NaN;
	}
	
	public static function listedHCF(hlist: Array<Dynamic>):Float
	{
	var out: Float;
	out = hlist[0];
	
    for(index0 in 0...Std.int(hlist.length))
    {
	out = Elemaths.pairedHCF(out, hlist[Std.int(index0)]);
    }
    return out;
	}
	
	public static function pairedLCM(input1: Float, input2: Float):Float
	{
	return input1 * input2 / Elemaths.pairedHCF(input1, input2);	
	}
	
	public static function listedLCM(hlist: Array<Dynamic>):Float
	{
	var out: Float;
	out = hlist[0];
	
    for(index0 in 0...Std.int(hlist.length))
    {
	out = Elemaths.pairedLCM(out, hlist[Std.int(index0)]);
    }
    return out;
	}
	
	public static function multicheck(ln:Float, sn:Float):Bool
	{
	if(!((ln % sn) == 0))
    {
	return false;
    }
	else
	{
	return true;	
	}
	return false;
	}
	
	public static function intcheck(input: Float, int:Bool):Bool
	{
	if (int)
	{
	  if(!((input % 1) == 0))
      {
	  return false;
      }	
	  else
	  {
	  return true;  
	  }
	}
	else{
	  if(!((input % 1) == 0))
      {
	  return true;
      }	
	  else
	  {
	  return false;  
	  }
	}
	}
	
	public static function odecheck(input: Float, even:Bool):Bool
	{
	if (even)
	   {
		if (intcheck(input, true))
		  {
			 if(((input % 2) == 0))
                 {
	               return true;
                 }
				 
			else 
			{
			return false;	
			}	 
 
		  }
		  
		else 
		{
		return false;	
		}  
	   }
	   else 
	   {
		if (intcheck(input, true))
		  {
			 if(!((input % 2) == 0))
                 {
	               return true;
                 }
				 
			else 
			{
			return false;	
			}	 
 
		  }
		  
		else 
		{
		return true;	
		}     
	   }
	   return false;
	}
	
	public static  function poscheck(input:Float, pos:Bool):Bool
	{
	  if (pos)
	  {
		  if (input > 0)
		  {
			return true;  
		  }
		  
		 else if (input < 0)
		  {
			return false;  
		  }
	  }
	  
	  else
	  {
		if (input > 0)
		{ 
		return false;	
		}
		
		else if (input  < 0)
		{
		return true;	
		}
	  }
	  
	  if (input == 0)
	  {
		return true;
	  }
	  
	  return true; 
	}
	
	
	public static function prc(input1:Float, input2:Float):Float
	{
	return input1 / input2 * 100;	
	}
	
	public static function sqrcheck(input1:Float):Bool
	{
	    if ((Math.sqrt(input1) % 1) == 0)
	    {
		return true;
		}
		
		else
		{
		return false;	
		}
		return false;
	}
	
	
	
}

	
