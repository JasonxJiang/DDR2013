return Def.Sprite {
	InitCommand=function(self)
		if THEME:GetCurLanguage() == "ja" then
			self:Load(THEME:GetPathG("ScreenMapControllers","footer/ScreenMapControllers footer_jp"));
		else
			self:Load(THEME:GetPathG("ScreenMapControllers","footer/ScreenMapControllers footer_en"));
		end;
	end;
};