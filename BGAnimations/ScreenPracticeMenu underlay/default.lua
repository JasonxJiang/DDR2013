return Def.ActorFrame {
	
--�S�̂̃o�b�N
	LoadActor("ScreenPracticeMenu_page") .. {
		InitCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);	
		OnCommand=cmd();
		OffCommand=cmd();
	};

--�z�C�[���J�o�[	
	LoadActor("Title_Back") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+70;y,SCREEN_CENTER_Y-101);
		OnCommand=cmd();
	};
	
};