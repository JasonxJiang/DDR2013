return Def.ActorFrame {
	-- 全体のバック
	LoadActor("ScreenEditMenu_page") .. {
		InitCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	};
	-- ホイールカバー	
--	LoadActor("Title_Back") .. {
--		InitCommand=cmd(diffuse,color("#cccccc");x,SCREEN_CENTER_X+70;y,SCREEN_CENTER_Y-105);
--	};
};
