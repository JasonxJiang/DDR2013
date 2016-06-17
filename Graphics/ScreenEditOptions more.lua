return Def.ActorFrame{
	Def.ActorFrame{
		InitCommand=cmd(player,PLAYER_1);
		LoadActor("ScreenOptions more/1P_OK")..{
			InitCommand=cmd(diffusealpha,0;zoomy,0);
			ExitSelectedP1Command=cmd(stoptweening;bob;effectmagnitude,0,2,0;effectperiod,1;bounceend,0.2;diffusealpha,1;zoom,1);
			ExitUnselectedP1Command=cmd(stoptweening;diffusealpha,0;zoomy,0);
			OffCommand=cmd(stoptweening;zoom,0);
		};
		LoadActor("ScreenOptions more/1P_WAIT")..{
			OnCommand=cmd(zoom,0);
			OffCommand=cmd(zoom,1);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(player,PLAYER_2);
		LoadActor("ScreenOptions more/2P_OK")..{
			InitCommand=cmd(diffusealpha,0;zoomy,0);
			ExitSelectedP2Command=cmd(stoptweening;bob;effectmagnitude,0,2,0;effectperiod,1;bounceend,0.2;diffusealpha,1;zoom,1);
			ExitUnselectedP2Command=cmd(stoptweening;diffusealpha,0;zoomy,0);
			OffCommand=cmd(stoptweening;zoom,0);
		};
		LoadActor("ScreenOptions more/2P_WAIT")..{
			OnCommand=cmd(zoom,0);
			OffCommand=cmd(zoom,1);
		};
	};
};