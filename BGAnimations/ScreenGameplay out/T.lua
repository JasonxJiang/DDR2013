local t = Def.ActorFrame{};
t[#t+1] = LoadActor("P_Full") .. {
		InitCommand=cmd(zoom,0.7);
		OnCommand=cmd(diffusealpha,0;sleep,2;y,50;accelerate,0.25;addy,-50;diffusealpha,1;sleep,3);
	};
t[#t+1] = LoadActor("P_Full") .. {
		InitCommand=cmd(zoom,0.7);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2;y,50;accelerate,0.25;addy,-50;diffusealpha,1;decelerate,0.5;diffusealpha,0;sleep,3);
	};	
	
return t;