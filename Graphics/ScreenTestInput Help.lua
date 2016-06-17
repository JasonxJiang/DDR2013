local t = Def.ActorFrame {
	Def.HelpDisplay {
		File = THEME:GetPathF("HelpDisplay", "text");
		InitCommand=function(self)
			local s = THEME:GetString(Var "LoadingScreen","HelpText");
			self:SetTipsColonSeparated(s);
			self:SetSecsBetweenSwitches(3);
			self:x(1);
			self:y(1);
			self:zoomx(0.68);
			self:zoomy(WideScale(0.58,0.51));
			self:strokecolor(color("#000000"));
			self:diffuse(color("#000000"));
			self:maxwidth(WideScale(920,1227));
		end;
		OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
		SetHelpTextCommand=function(self, params)
			self:SetTipsColonSeparated( params.Text );
		end;
		SortOrderChangedMessageCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_ModeMenu" then
				self:diffusealpha(0);
			else
				self:diffusealpha(1);
			end;
		end;
	};
	Def.HelpDisplay {
		File = THEME:GetPathF("HelpDisplay", "text");
		InitCommand=function(self)
			local s = THEME:GetString(Var "LoadingScreen","HelpText");
			self:SetTipsColonSeparated(s);
			self:SetSecsBetweenSwitches(3);
			self:zoomx(0.68);
			self:zoomy(WideScale(0.58,0.51));
			self:strokecolor(color("#000000"));
			self:maxwidth(WideScale(920,1227));
		end;
		OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
		SetHelpTextCommand=function(self, params)
			self:SetTipsColonSeparated( params.Text );
		end;
		SortOrderChangedMessageCommand=function(self)
			local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_ModeMenu" then
				self:diffusealpha(0);
			else
				self:diffusealpha(1);
			end;
		end;
	};
};
return t