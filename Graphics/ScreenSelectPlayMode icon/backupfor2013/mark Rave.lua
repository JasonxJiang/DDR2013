return Def.Sprite {
	InitCommand=function(self)
		if GAMESTATE:GetCurrentStyle():GetName() == "single" then
			if THEME:GetCurLanguage() == "ja" then
				self:Load(THEME:GetPathG("ScreenSelectPlayMode","icon/_mark/mark Rave_jp"));
			else
				self:Load(THEME:GetPathG("ScreenSelectPlayMode","icon/_mark/mark Rave_en"));
			end;
		else
		end;
	end;
	GainFocusCommand=cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.8,0.8,0.8,1;effectperiod,0.25;addx,-10;decelerate,0.1;addx,10;visible,true);
	LoseFocusCommand=cmd(visible,false);
	PlayerJoinedMessageCommand=cmd(diffusealpha,0);
};