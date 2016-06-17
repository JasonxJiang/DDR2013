return Def.ActorFrame {
	-- CPU battle
	Def.Sprite {
		InitCommand=function(self)
			if GAMESTATE:GetCurrentStyle():GetName() == "single" then
				if THEME:GetCurLanguage() == "ja" then
					self:Load(THEME:GetPathG("ScreenSelectPlayMode","icon/_preview/preview Rave_CPU_jp"));
				else
					self:Load(THEME:GetPathG("ScreenSelectPlayMode","icon/_preview/preview Rave_CPU_en"));
				end;
			else
				self:diffusealpha(0);
			end;
		end;
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
		PlayerJoinedMessageCommand=cmd(diffusealpha,0);
	};
	-- 2P battle
	Def.Sprite {
		InitCommand=function(self)
			if THEME:GetCurLanguage() == "ja" then
				self:Load(THEME:GetPathG("ScreenSelectPlayMode","icon/_preview/preview Rave_2P_jp"));
			else
				self:Load(THEME:GetPathG("ScreenSelectPlayMode","icon/_preview/preview Rave_2P_en"));
			end;
			if GAMESTATE:GetCurrentStyle():GetName() == "single" then
				self:diffusealpha(0);
			else
				self:diffusealpha(1);
			end;
		end;
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
		PlayerJoinedMessageCommand=cmd(diffusealpha,1);
	};
};