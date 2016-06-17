return Def.ActorFrame {


	LoadActor("Mini_Back") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
		OnCommand=cmd(texcoordvelocity,0.5,0.5;customtexturerect,0,0,6.7,3.75;zoomx,6.7;zoomy,3.75);
	};

--[[
LoadActor( "../door1" ) .. {
	
InitCommand=cmd(horizalign,right;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
--OnCommand=cmd(linear,0.5;addx,SCREEN_WIDTH*-1);

};	

LoadActor( "../doorbottan1" ) .. {
	
InitCommand=cmd(horizalign,left;x,SCREEN_LEFT;y,SCREEN_CENTER_Y);
--OnCommand=cmd(linear,0.5;addx,-SCREEN_WIDTH*0.5);

};	


   LoadActor( "../door2" ) .. {
	
InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
--OnCommand=cmd(linear,0.5;addx,SCREEN_WIDTH*1);

};	

LoadActor( "../doorbottan2" ) .. {
	
InitCommand=cmd(horizalign,right;x,SCREEN_RIGHT;y,SCREEN_CENTER_Y);
--OnCommand=cmd(linear,0.5;addx,SCREEN_WIDTH*0.5);

};	
	
--]]		
--[[
	Def.Quad{
		InitCommand=cmd(scaletocover,-SCREEN_WIDTH*2,SCREEN_TOP,SCREEN_WIDTH*2,SCREEN_BOTTOM;);
--		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;stretchto,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM),
		OnCommand=cmd(diffuse,color("0,0,0,0.5");),
--		OffCommand=cmd(diffuse,color("0,0,0,0.4");linear,0.1;diffuse,color("0,0,0,0");),
	};
--]]
};