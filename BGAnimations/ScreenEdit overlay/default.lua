return Def.ActorFrame {

--[[
	LoadActor("help") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y);
		OnCommand=cmd(horizalign,left;finishtweening);
		EditCommand=cmd(playcommand,"Show");
		PlayingCommand=cmd(playcommand,"Hide");
		RecordCommand=cmd(playcommand,"Hide");
		RecordPausedCommand=cmd(playcommand,"Hide");
		ShowCommand=cmd(stoptweening;x,SCREEN_LEFT);
		HideCommand=cmd(stoptweening;accelerate,0.25;x,SCREEN_LEFT-192);
	};
	LoadActor("info") .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y);
		OnCommand=cmd(horizalign,right;finishtweening);
		EditCommand=cmd(playcommand,"Show");
		PlayingCommand=cmd(playcommand,"Hide");
		RecordCommand=cmd(playcommand,"Hide");
		RecordPausedCommand=cmd(playcommand,"Hide");
		ShowCommand=cmd(stoptweening;x,SCREEN_RIGHT);
		HideCommand=cmd(stoptweening;accelerate,0.25;x,SCREEN_RIGHT+192);
	};
	
	LoadActor(THEME:GetPathS( "", "_Door" ) ) .. {
		PlayingCommand=cmd(play);
		RecordCommand=cmd(play);
	};	
--]]	
	


	LoadActor( "../door1" ) .. {
		InitCommand=cmd(horizalign,right;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;addx,-SCREEN_WIDTH*0.5;);
		PlayingCommand=cmd(addx,SCREEN_WIDTH*0.5;sleep,0.35;linear,0.25;addx,-SCREEN_WIDTH*0.5;);
--		RecordCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.5);
		OnCommand=cmd();
		ShowCommand=cmd();
	};	
	
	LoadActor( "../door2" ) .. {	
		InitCommand=cmd(horizalign,left;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;addx,SCREEN_WIDTH*0.5;);
		PlayingCommand=cmd(addx,-SCREEN_WIDTH*0.5;sleep,0.35;linear,0.25;addx,SCREEN_WIDTH*0.5;);
--		RecordCommand=cmd(addx,SCREEN_WIDTH*0.5;linear,0.25;addx,-SCREEN_WIDTH*0.5);
		ShowCommand=cmd(playcommand,"Hide");
	};
	
--[[
	LoadActor( "../doorbottan1" ) .. {	
		InitCommand=cmd(horizalign,left;x,SCREEN_LEFT;y,SCREEN_CENTER_Y);
		PlayingCommand=cmd(addx,-SCREEN_WIDTH*0.5;linear,0.25;addx,SCREEN_WIDTH*0.5);
		RecordCommand=cmd(addx,-SCREEN_WIDTH*0.5;linear,0.25;addx,SCREEN_WIDTH*0.5);
		ShowCommand=cmd(playcommand,"Hide");
	};	



	LoadActor( "../doorbottan2" ) .. {
		InitCommand=cmd(horizalign,right;x,SCREEN_RIGHT;y,SCREEN_CENTER_Y);
		PlayingCommand=cmd(addx,SCREEN_WIDTH*0.5;linear,0.25;addx,-SCREEN_WIDTH*0.5);
		RecordCommand=cmd(addx,SCREEN_WIDTH*0.5;linear,0.25;addx,-SCREEN_WIDTH*0.5);
		ShowCommand=cmd(playcommand,"Hide");
	};	
--]]	
	
};
