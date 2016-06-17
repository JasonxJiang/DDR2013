local t = Def.ActorFrame {
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
		OnCommand=cmd(diffusealpha,0;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
		SetHelpTextCommand=function(self, params)
			self:SetTipsColonSeparated( params.Text );
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
		OnCommand=cmd(diffusealpha,0;linear,0.25;diffusealpha,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
		SetHelpTextCommand=function(self, params)
			self:SetTipsColonSeparated( params.Text );
		end;
	};
};
return t