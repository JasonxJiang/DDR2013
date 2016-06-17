local t = Def.ActorFrame {
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
	}; ]]--
	-- Black
	Def.Quad {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffuse,color("#000000ff");scaletocover,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM);
		OnCommand=cmd(linear,0.25;diffuse,color("#00000000"));
	};
	LoadActor(THEME:GetPathS( "", "SelectStyle" ) ) .. {
		StartTransitioningCommand=function(self)
			self:play();
		end;
	};
};

return t;