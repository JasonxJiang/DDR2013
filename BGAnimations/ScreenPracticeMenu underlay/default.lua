return Def.ActorFrame {
	
--全体のバック
	LoadActor("ScreenPracticeMenu_page") .. {
		InitCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);	
		OnCommand=cmd();
		OffCommand=cmd();
	};

--ホイールカバー	
	LoadActor("Title_Back") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+70;y,SCREEN_CENTER_Y-101);
		OnCommand=cmd();
	};
	
};
