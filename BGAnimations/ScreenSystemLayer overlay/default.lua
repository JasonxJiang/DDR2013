local function CreditsText( pn )
	local text = LoadFont(Var "LoadingScreen","credits") .. {
		InitCommand=function(self)
			self:name("Credits" .. PlayerNumberToString(pn))
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
		end;
		UpdateTextCommand=function(self)
			if PROFILEMAN:IsPersistentProfile(pn) then
				return self:visible(false);
			end;
			local str = ScreenSystemLayerHelpers.GetCreditsMessage(pn);
			-- str ~= "CREDIT(S)"..?
			if str == "CARD SWITCHED" or 
			str == "CARD CHECK" or 
			str == "CARD MOUNT ERROR" or 
			str == "NO NAME" or 
			str == "READY" or 
			str == "CARD GONE" or 
			str == "CARD WRITE ERROR" or 
			str == "CARD TOO LATE" or 
			str == "SIGNATURE FAILED" or 
			str == " (backup)" then
				if pn == PLAYER_1 then
					self:x(SCREEN_LEFT+102);
				else
					self:x(SCREEN_RIGHT-102);
				end;
			else
				self:x(SCREEN_CENTER_X);
			end;
			self:settext(str);
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if PROFILEMAN:IsPersistentProfile(pn) then
				bShow = false;
			elseif GAMESTATE:GetCoinMode() == "CoinMode_Pay" or GAMESTATE:GetCoinMode() == "CoinMode_Free" then
				bShow = true;
			elseif screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end
			self:visible( bShow );
		end
	};
	return text;
end;

local t = Def.ActorFrame {}

-- Credits
t[#t+1] = Def.ActorFrame {
 	CreditsText( PLAYER_1 );
	CreditsText( PLAYER_2 ); 
};

-- Text
t[#t+1] = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(zoomtowidth,SCREEN_WIDTH;zoomtoheight,30;horizalign,left;vertalign,top;y,SCREEN_TOP;diffuse,color("0,0,0,0"));
		OnCommand=cmd(finishtweening;diffusealpha,0.85;);
		OffCommand=cmd(sleep,3;linear,0.5;diffusealpha,0;);
	};
	LoadFont("Common","Normal") .. {
		Name="Text";
		InitCommand=cmd(maxwidth,750;horizalign,left;vertalign,top;y,SCREEN_TOP+12;x,SCREEN_LEFT+10;shadowlength,1;diffusealpha,0;);
		OnCommand=cmd(finishtweening;diffusealpha,1;zoom,0.55);
		OffCommand=cmd(sleep,3;linear,0.5;diffusealpha,0;);
	};
	SystemMessageMessageCommand = function(self, params)
		self:GetChild("Text"):settext( params.Message );
		self:playcommand( "On" );
		if params.NoAnimate then
			self:finishtweening();
		end
		self:playcommand( "Off" );
	end;
	HideSystemMessageMessageCommand = cmd(finishtweening);
};

-- EventMode　FreeMode　Text
t[#t+1] = LoadFont("Common normal")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-10;zoom,0.55;strokecolor,color("#000000"));
	BeginCommand=cmd(playcommand,"Set");
	SetCommand=function(self)
		local screen = SCREENMAN:GetTopScreen();
		if GAMESTATE:IsEventMode() then
			if GAMESTATE:GetCoinMode() == "CoinMode_Pay" or GAMESTATE:GetCoinMode() == "CoinMode_Free" then
				self:visible(true);
				self:settext("FREE PLAY            EVENT MODE");
			else
				self:visible(THEME:GetMetric( screen:GetName(), "ShowCreditDisplay" ));
				self:settext("EVENT MODE");
			end;
		else
			if GAMESTATE:GetCoinMode() == "CoinMode_Free" then
				self:visible(true);
				self:settext("FREE PLAY");
			else
				self:visible(false);
			end;
		end
	end;
--	RefreshCreditTextMessageCommand=cmd(playcommand,"Set");
--	CoinInsertedMessageCommand=cmd(playcommand,"Set");
--	PlayerJoinedMessageCommand=cmd(playcommand,"Set");
	ScreenChangedMessageCommand=cmd(playcommand,"Set");
};

return t;