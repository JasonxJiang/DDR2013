return Def.ActorFrame {
	Def.HelpDisplay {
		File = THEME:GetPathF("HelpDisplay", "text");
		InitCommand=function(self)
			local s = THEME:GetString(Var "LoadingScreen","HelpText");
			self:SetTipsColonSeparated(s);
			self:SetSecsBetweenSwitches(3);
			self:x(1);
			self:y(1);
			self:zoomx(0.66);
			self:zoomy(0.55);
			self:strokecolor(color("#000000"));
			self:diffuse(color("#000000"));
			self:maxwidth(WideScale(720,1280));
		end;
		OffCommand=cmd(linear,0.25;diffusealpha,0);
		SetHelpTextCommand=function(self, params)
			self:SetTipsColonSeparated( params.Text );
		end;
		SortOrderChangedMessageCommand=function(self)
			self:finishtweening()
			local alpha;
			local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_ModeMenu" then
				alpha = 0
			else
				alpha = 1
				self:sleep(0.4)
			end;
			self:decelerate(0.25)
			self:diffusealpha(alpha)
		end;
	}; 
	Def.HelpDisplay {
		File = THEME:GetPathF("HelpDisplay", "text");
		InitCommand=function(self)
			local s = THEME:GetString(Var "LoadingScreen","HelpText");
			self:SetTipsColonSeparated(s);
			self:SetSecsBetweenSwitches(3);
			self:zoomx(0.66);
			self:zoomy(0.55);
			self:strokecolor(color("#000000"));
			self:maxwidth(WideScale(720,1280));
		end;
		OffCommand=cmd(linear,0.25;diffusealpha,0);
		SetHelpTextCommand=function(self, params)
			self:SetTipsColonSeparated( params.Text );
		end;
		SortOrderChangedMessageCommand=function(self)
			self:finishtweening()
			local alpha;
			local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_ModeMenu" then
				alpha = 0
			else
				alpha = 1
				self:sleep(0.4)
			end;
			self:decelerate(0.25)
			self:diffusealpha(alpha)
		end;
	};
};