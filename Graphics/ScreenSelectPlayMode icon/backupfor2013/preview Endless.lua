return Def.Sprite {
	InitCommand=function(self)
		if THEME:GetCurLanguage() == "ja" then
			self:Load(THEME:GetPathG("ScreenSelectPlayMode","icon/_preview/preview Endless_jp"));
		else
			self:Load(THEME:GetPathG("ScreenSelectPlayMode","icon/_preview/preview Endless_en"));
		end;
	end;
	GainFocusCommand=cmd(visible,false);
	LoseFocusCommand=cmd(visible,false);
};