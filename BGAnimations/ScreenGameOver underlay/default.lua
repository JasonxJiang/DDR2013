local t = Def.ActorFrame{};
t[#t+1] = Def.ActorFrame {
	LoadActor("GameOverBG") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);	
	};
};

return t;