package;

import openfl.display.Bitmap;
import openfl.events.NetStatusEvent;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.events.ErrorEvent;
import openfl.display.Sprite;
import openfl.errors.SecurityError;
import openfl.events.SecurityErrorEvent;
import openfl.utils.Object.ObjectType;
import openfl.system.LoaderContext;
import openfl.system.Security;
import openfl.system.SecurityDomain;
import openfl.system.ApplicationDomain;
import openfl.display.Loader;
import openfl.display.BitmapData;
import openfl.system.System;
import openfl.system.Capabilities;
import openfl.Lib;


class STP extends Sprite  {
	
	 
    public static function getfirstxchars(x: Int, dat: String): String {
	if((x<0)||(x>dat.length)){
	return "Nan";	
	}
	else{
	var tr: String = ""	;
    for (cn in 0...x){	
	tr = tr + dat.charAt(cn);	
	}
	return tr;
	}
	} 
	
	public static function getlastxchars(x: Int, dat: String): String {
	if((x<0)||(x>dat.length)){
	return "Nan";	
	}
	else{
	var tr: String = ""	;
    for (cn in 0...x){	
	tr = tr + dat.charAt(((dat.length)-x)+cn);	
	}
	return tr;
	}
	}
	
	public static function eliminatespace(dat: String):String{
	var tr:String = "";
	for(cn in 0...dat.length){
	if(dat.charAt(cn)==" "){
		
	}
	else{
	tr = tr + dat.charAt(cn);
	}
	}
 	return tr;
	}
	
	public static function toupper(dat: String):String{
	var tr: String = dat.toUpperCase();
	return tr;
	}
	
	public static function tolower(dat: String):String{
	var tr: String = dat.toLowerCase();
	return tr;
	}
	
	public static function exists(subs: String, dat:String):Bool{    // LEFTMOST OCCURENCES
    var tc: Int = dat.indexOf(subs, 0);
	if (tc ==-1){
	return false;	
	}
	else{
	return true;	
	}
	}
	
	public static function len(dat:String):Int{   
	return dat.length;
	}
  
	public static function xremovey(dat: String, tr: String):String{   // removes all occurrences
	if (STP.exists(tr, dat) == true){
	var iej:String = "";
	iej = dat;
	while (STP.exists(tr, iej) == true){
	var st: Int = dat.indexOf(tr, 0);
	iej = iej.substring(0,st)+iej.substring(st+len(tr),len(iej));
	}
	return iej;	
	}
	else{
	return dat;	
	}
	}
	
	public static function rev(dat: String):String{
	var TR: String = "";
	for(cn in 0...dat.length){
    TR = TR + dat.charAt(dat.length - (cn+1));
	}
	return TR;
	}
 	
	public static function upcheck(dat: String):Bool{   // checking only alphabetical characters , affinity with FALSE in other cases....
	var br : Bool = false;
	for(cn in 0...dat.length){
    if((dat.charCodeAt(cn)>=65)&&(dat.charCodeAt(cn)<=90)){
	br = true;	
	}
	else{
	br = false;	
	}
	}
	return br;
	}
	
	 	
	public static function lowcheck(dat: String):Bool{   // checking only alphabetical characters , affinity with FALSE in other cases....
	var br : Bool = false;
	for(cn in 0...dat.length){
    if((dat.charCodeAt(cn)>=97)&&(dat.charCodeAt(cn)<=122)){
	br = true;	
	}
	else{
	br = false;	
	}
	}
	return br;
	}
	 
	public static function splitbw(ss: String, es: String, dat: String):String             //not order sensitive     
	{ 
	if ((STP.exists(ss, dat)==true)&&(STP.exists(es, dat)==true))
	{
	if (dat.indexOf(ss, 0) > dat.indexOf(es, 0)){
	var cop: String = "";
	cop = ss;
	ss = es;
	es = cop;
	}
    return dat.substring(dat.indexOf(ss, 0) + len(ss), dat.indexOf(es, dat.indexOf(ss, 0)));	
	}
	else{
	return "";	
	}
	}
	
	/* 
	 * Did not enabled the below block because can cause confusion,
	 * furthermore this block is not to be expected to act as a xml/html 'TAG' parser
	 * it lists on every 'NEW' Occurences of the given start&end texts 
	 * TO ENABLE : edit [hidden="true"] to [hidden="false"] of the block of 
	 *  tag-"GAD-STP-splitbwlist" in the blocks.xml .
	 */

	
	public static function splitbwlist(ss: String, es: String, dat: String):Array<Dynamic>     //Order sensitive         
	{
	var oss = ss;
	var oes = es;
	var lt1: Int = -2;
	var lt2:Int = -2;
	var tar : Array<Dynamic> = new Array<Dynamic>();
	while ((STP.exists(ss, dat) == true) && (STP.exists(es, dat) == true)) {
	ss = oss;
	es = oes;	
	if ((dat.indexOf(ss, lt1)==-1)){
	break;	
	}
	if ((STP.exists(ss, dat)==true)&&(STP.exists(es, dat)==true))
	{
	tar.push(dat.substring(dat.indexOf(ss, lt1) + len(ss), dat.indexOf(es, lt2)));
	lt1 = dat.indexOf(ss, lt1)+len(ss);
	lt2 = dat.indexOf(es, dat.indexOf(ss, lt2))+len(es);
	}
	else{
		
	}
	}
	return tar;
	}
	
	public static function nocurence(subs:String, dat: String):Int            
	{
	if(exists(subs,dat)==false){
	return 0;	
	}
	else{
	var tn: Int = 0;
	var last: Int = -1-len(subs);
	var checkin: Int = -1-len(subs);
	while (exists(subs,dat)==true){
    checkin = dat.indexOf(subs, checkin) + len(subs);
	if(checkin>last){
	tn = tn + 1;
	last = checkin-len(subs);
	}
	else{
	break;	
	}
	}
    return tn;
	}
	}
	
	public static function digcheck(dat: String):Bool{   // checking only numerical characters , affinity with FALSE in other cases....
	var br : Bool = false;
	for(cn in 0...dat.length){
    if((dat.charCodeAt(cn)>=48)&&(dat.charCodeAt(cn)<=57)){
	br = true;	
	}
	else{
	br = false;	
	}
	}
	return br;
	}

	public static function alphacheck(dat: String):Bool{   // checking only alphabetical characters , affinity with FALSE in other cases....
	var br : Bool = false;
	for(cn in 0...dat.length){
    if((dat.charCodeAt(cn)>=65)&&(dat.charCodeAt(cn)<=90)){
	br = true;	
	}
	else{
    if((dat.charCodeAt(cn)>=97)&&(dat.charCodeAt(cn)<=122)){
	br = true;	
	}
	else{
	br = false;	
	}
	}
	}
	return br;
	}
	
	
	public static function repeat(dat: String, cnt: Float):String{	
	var TR:String = '';	
	var tnt: Int= Std.int(cnt);
	for(cn in 0...tnt){
    TR = TR + dat;		
	}
	return TR;
	}
	
	public static function spacecheck(dat: String):Bool{   // checking only alphabetical characters , affinity with FALSE in other cases....
	var br : Bool = false;
	for (cn in 0...dat.length){
	if(dat.charAt(cn)==" "){
	br = true;	
	}	
    else{
	br = false;	
	}
	}
	return br;
	}
	
	public static function iterate(dat:String, ?ctloop:String->Void):Void {
	var chchar: String = "";	
	for (cn in 0...dat.length){
    chchar = dat.charAt(cn);	
	ctloop(chchar);
	}
	}
	
	public static function ord(chr: String):Int{
	if(chr.length==1){	
	return chr.charCodeAt(0);
	}
	else{
	return (-1);	
	}
	}
	
	public static function chr(ord: Float):String{
	var ord2: Int = 0;	
	ord2 = Std.int(ord);	
	if(ord2>(-1)){	
	return String.fromCharCode(ord2);
	}
	else{
	return (ord2+'');	
	}
	}
	
	
	
	
	
	}
	
	
	


	

