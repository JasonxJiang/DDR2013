return Def.Sprite {
	InitCommand=function(self)
		if THEME:GetCurLanguage() == "ja" then
			self:Load(THEME:GetPathG("ScreenSelectPlayMode","icon/_preview/preview Nonstop_jp"));
		else
			self:Load(THEME:GetPathG("ScreenSelectPlayMode","icon/_preview/preview Nonstop_en"));
		end;
	end;
	GainFocusCommand=cmd(visible,true);
	LoseFocusCommand=cmd(visible,false);
};