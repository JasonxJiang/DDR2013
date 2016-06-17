return Def.ActorFrame {
	OnCommand=function(self)
		if GAMESTATE:IsExtraStage() then
			self:diffuse(color("#ffffff"));
		elseif GAMESTATE:IsExtraStage2() then
			self:diffuse(color("#ff5aec"));
		end;
		self:sleep(0.35)
		self:queuecommand("Visible")
	end;
	VisibleCommand = function(self)
		self:visible(false);
	end;


--[[	LoadActor( "door1" ) .. {
		InitCommand=cmd(horizalign,right;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(sleep,0.1;linear,0.25;addx,-SCREEN_WIDTH*0.5);
	};
	LoadActor( "doorbottan1" ) .. {
		InitCommand=cmd(horizalign,left;x,SCREEN_LEFT;y,SCREEN_CENTER_Y);
		OnCommand=cmd(sleep,0.1;linear,0.25;addx,-SCREEN_WIDTH*0.5);
	};
   LoadActor( "door2" ) .. {
		InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(sleep,0.1;linear,0.25;addx,SCREEN_WIDTH*0.5);
	};
	LoadActor( "doorbottan2" ) .. {
		InitCommand=cmd(horizalign,right;x,SCREEN_RIGHT;y,SCREEN_CENTER_Y);
		OnCommand=cmd(sleep,0.1;linear,0.25;addx,SCREEN_WIDTH*0.5);
	};
};]]--
--[[
---- DOOR OPEN > CLOSE  CLOSE > OPEN
		LoadActor("2013Door01.png")..{
		InitCommand=cmd(zoomx,1.1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
		OnCommand=cmd(linear,0.25;y,SCREEN_CENTER_Y-360;);
	};
		LoadActor("2013Door02.png")..{
		InitCommand=cmd(zoomx,1.1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
		OnCommand=cmd(linear,0.25;y,SCREEN_CENTER_Y+360;);
	}; ]]--
};	