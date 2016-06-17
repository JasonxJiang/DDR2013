local t = Def.ActorFrame{};
-- Door
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(y,SCREEN_CENTER_Y);
	OnCommand=function(self)
		if GAMESTATE:IsExtraStage() then
			self:diffuse(color("#ff5aec"));
		elseif GAMESTATE:IsExtraStage2() then
			self:diffuse(color("#ff5a63"));
		end;
	end;	
--[[	LoadActor( "../door1" ) .. {
		InitCommand=cmd(horizalign,right;x,SCREEN_CENTER_X);
	};	
	LoadActor( "../doorbottan1" ) .. {	
		InitCommand=cmd(horizalign,left;x,SCREEN_LEFT);
	};	
	LoadActor( "../door2" ) .. {
		InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X);
	};
	LoadActor( "../doorbottan2" ) .. {
		InitCommand=cmd(horizalign,right;x,SCREEN_RIGHT);
	};	
	---- DOOR OPEN > CLOSE  CLOSE > OPEN
		LoadActor("../2013Door01.png")..{
		InitCommand=cmd(zoomx,1.1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
		OnCommand=cmd(linear,0.25;y,SCREEN_CENTER_Y-360);
	};
		LoadActor("../2013Door02.png")..{
		InitCommand=cmd(zoomx,1.1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
		OnCommand=cmd(linear,0.25;y,SCREEN_CENTER_Y+360);
	};]]--
};

return t;