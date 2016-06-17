
--曲の間隔
local spacing_y = 15;



local t = LoadFallbackB();
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;);
	BeginCommand=function(self)
		SCREENMAN:GetTopScreen():PostScreenMessage( "SM_BeginFadingOut", begin_fading_out_seconds );
	end;
	LoadActor("ScreenEnding1_background_01") .. {
		InitCommand=cmd();
		OnCommand=cmd(diffusealpha,0;sleep,0;linear,0.5;diffusealpha,1;sleep,3.5;linear,0.5;diffusealpha,0);
	};
	LoadActor("ScreenEnding1_background_01") .. {
		InitCommand=cmd(diffusealpha,0;linear,0.5;glowshift;effectperiod,2.25;diffusealpha,0.75;linear,0.5;diffusealpha,0;);
		OnCommand=cmd();
	};
	
	
	LoadActor("ScreenEnding1_background_02") .. {
		InitCommand=cmd();
		OnCommand=cmd(diffusealpha,0;sleep,4.5;linear,0.5;diffusealpha,1;sleep,3.5;linear,0.5;diffusealpha,0);
	};
	LoadActor("ScreenEnding1_background_02") .. {
		InitCommand=cmd(diffusealpha,0;sleep,4.5;linear,0.5;glowshift;effectperiod,2.25;diffusealpha,0.75;linear,0.5;diffusealpha,0;);
		OnCommand=cmd();
	};
	
	
	LoadActor("ScreenEnding1_background_03") .. {
		InitCommand=cmd();
		OnCommand=cmd(diffusealpha,0;sleep,9;linear,0.5;diffusealpha,1;sleep,4.5;linear,0.5;diffusealpha,0);
	};
	LoadActor("ScreenEnding1_background_03") .. {
		InitCommand=cmd(diffusealpha,0;sleep,9;linear,0.5;glowshift;effectperiod,2.25;diffusealpha,0.75;linear,0.5;diffusealpha,0;);
		OnCommand=cmd();
	};
};



return t;
