local t = Def.ActorFrame {

	--PRESS START 2P側
	LoadActor("Press_Start") .. {
		InitCommand = cmd(x,WideScale(SCREEN_CENTER_X+203,SCREEN_CENTER_X+225);y,SCREEN_CENTER_Y;diffuseshift;effectcolor1,1,1,1,0.5;effectcolor2,0,0,0,0.5;effectperiod,2;draworder,95;);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
		PlayerJoinedMessageCommand=cmd(diffusealpha,0);
		PlayerUnjoinedMessageCommand=cmd(linear,0.3;zoom,0);
		Condition=GAMESTATE:IsSideJoined(PLAYER_1) and not GAMESTATE:IsSideJoined(PLAYER_2); 	
	};
	
	--OK 2P側
	LoadActor("OK") .. {
		InitCommand = cmd(diffusealpha,0;x,WideScale(SCREEN_CENTER_X+203,SCREEN_CENTER_X+225);y,SCREEN_CENTER_Y;draworder,95);
		OffCommand=cmd(diffusealpha,0);
		-- 2Pが参加してアウトするときOKが出る問題を最後のlinear,0;zoom,0で回避する
		PlayerJoinedMessageCommand=cmd(glow,color("1,1,1,0.1");diffusealpha,0.75;sleep,0.5;linear,0.25;diffusealpha,0;glow,color("1,1,1,0");linear,0;zoom,0);
		PlayerUnjoinedMessageCommand=cmd(linear,0.3;zoom,0);
		Condition=GAMESTATE:IsSideJoined(PLAYER_1) and not GAMESTATE:IsSideJoined(PLAYER_2); 
	};
	
	--PRESS START 1P側
	LoadActor("Press_Start") .. {
		InitCommand = cmd(x,WideScale(SCREEN_CENTER_X-209,SCREEN_CENTER_X-231);y,SCREEN_CENTER_Y;diffuseshift;effectcolor1,1,1,1,0.5;effectcolor2,0,0,0,0.5;effectperiod,2;zoom,1;draworder,95);
		OffCommand=cmd(linear,0.25;diffusealpha,0;);
		PlayerJoinedMessageCommand=cmd(diffusealpha,0);
		PlayerUnjoinedMessageCommand=cmd(linear,0.3;zoom,0);
		Condition=not GAMESTATE:IsSideJoined(PLAYER_1) and GAMESTATE:IsSideJoined(PLAYER_2); 	
	};
	
	--OK 1P側
	LoadActor("OK") .. {
		InitCommand = cmd(diffusealpha,0;x,WideScale(SCREEN_CENTER_X-209,SCREEN_CENTER_X-231);y,SCREEN_CENTER_Y;draworder,95);
		OffCommand=cmd(diffusealpha,0);
		-- 1Pが参加してアウトするときOKが出る問題を最後のlinear,0;zoom,0で回避する
		PlayerJoinedMessageCommand=cmd(glow,color("1,1,1,0.1");diffusealpha,0.75;sleep,0.5;linear,0.25;diffusealpha,0;glow,color("1,1,1,0");linear,0;zoom,0);
		PlayerUnjoinedMessageCommand=cmd(linear,0.3;zoom,0);
		Condition=not GAMESTATE:IsSideJoined(PLAYER_1) and GAMESTATE:IsSideJoined(PLAYER_2); 
	};
	--[[
		LoadFont("common normal")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y;zoom,1;uppercase,true;strokecolor,color("#313963"));
			BeginCommand=cmd(playcommand,"Set");
			SetCommand=function(self)
				local CaloriesToday = GAMESTATE:GetPreferredDifficulty(PLAYER_1);
				self:settext(CaloriesToday);
			end;
		};
		LoadFont("common normal")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+200;y,SCREEN_CENTER_Y;zoom,1;uppercase,true;strokecolor,color("#313963"));
			BeginCommand=cmd(playcommand,"Set");
			SetCommand=function(self)
				local CaloriesToday = PROFILEMAN:GetProfile(PLAYER_2):GetWeightPounds();
				self:settext(CaloriesToday);
			end;
		};
		LoadFont("common normal")..{
			InitCommand=cmd(x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y+25;zoom,1;uppercase,true;strokecolor,color("#313963"));
			BeginCommand=cmd(playcommand,"Set");
			SetCommand=function(self)
				local CaloriesToday = PROFILEMAN:GetProfile(PLAYER_1):GetWeightPounds();
				self:settext(CaloriesToday*0.45359237);
			end;
		};
		LoadFont("common normal")..{
			InitCommand=cmd(x,SCREEN_CENTER_X+200;y,SCREEN_CENTER_Y+25;zoom,1;uppercase,true;strokecolor,color("#313963"));
			BeginCommand=cmd(playcommand,"Set");
			SetCommand=function(self)
				local CaloriesToday = PROFILEMAN:GetProfile(PLAYER_2):GetWeightPounds();
				self:settext(CaloriesToday*0.45359237);
			end;
		};
		--]]
}

return t
