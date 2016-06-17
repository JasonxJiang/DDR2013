local t = Def.ActorFrame {};

-- GameOver
t[#t+1] = LoadActor("P1GameOver") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;draworder,30;zoom,0.6);
	OnCommand=cmd(diffuseblink;effectperiod,1;effectcolor1,color("#ffffff");effectcolor2,color("#ffffff00"));
};

--  Premium text
t[#t+1] = Def.Sprite {
	InitCommand=cmd(horizalign,right;x,SCREEN_RIGHT;y,SCREEN_CENTER_Y+100;draworder,30;texcoordvelocity,0.1,0);
	OnCommand=function(self)
		if THEME:GetCurLanguage() == "ja" then
			if GAMESTATE:GetPremium() == "Premium_DoubleFor1Credit" then
				self:Load(THEME:GetPathB("ScreenDemonstration","decorations/_Double_text"));
			elseif GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit" then
				self:Load(THEME:GetPathB("ScreenDemonstration","decorations/_Joint_text"));
			else
				self:visible(false);
			end;
		else
			if GAMESTATE:GetPremium() == "Premium_DoubleFor1Credit" then
				self:Load(THEME:GetPathB("ScreenDemonstration","decorations/_Double_e_text"));
			elseif GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit" then
				self:Load(THEME:GetPathB("ScreenDemonstration","decorations/_Joint_e_text"));
			else
				self:visible(false);
			end;
		end;
		self:cropleft(1);
		self:linear(10);
		self:cropleft(0);
	end;	
};

-- Bar
t[#t+1] = LoadActor("Bar") .. {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;draworder,40;zoom,1);
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+250;draworder,45);	
	-- Title
	LoadFont("_arial Bold 24px")..{
		InitCommand=cmd(x,0;zoom,1;maxwidth,384;playcommand,"Update");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			local title;
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if song:GetDisplaySubTitle() == ""  then
					title = song:GetDisplayMainTitle();
					self:y(-0);
				else
					title = song:GetDisplayMainTitle();
					self:y(-0);
				end;
			else
				title = "???";
				self:y(-0);
			end;
			self:settext(title);
		end;
	};
	-- SubTitle
	LoadFont("_arial Bold 24px")..{
		InitCommand=cmd(x,0;y,1.5;zoom,1;maxwidth,384;playcommand,"Update");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			local title;
			local song = GAMESTATE:GetCurrentSong();
			if song then
				title = song:GetDisplaySubTitle();
			else
				title = "???";
			end;
			self:settext(title);
		end;
	};
	-- Artist
	LoadFont("_arial Bold 24px")..{
		InitCommand=cmd(x,0;zoom,1;maxwidth,384;playcommand,"Update");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			local artist;
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if song:GetDisplaySubTitle() == ""  then
					artist = song:GetDisplayArtist();
					self:y(40);
				else
					artist = song:GetDisplayArtist();
					self:y(40);
				end;
			else
				artist = "???";
				self:y(40);
			end;
			self:settext(artist);
		end;
	};
	-- Banner shadow
	Def.Sprite {
		InitCommand=cmd(diffuse,color("#000000");diffusealpha,0.5;x,433;y,-8;vertalign,bottom);
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			self:Load(GetJacketBanner(song))
			self:scale_to_clip_banner();
			self:zoom(0.78);
			self:zoomtoheight(23);
		end;						
	};
	-- Banner
	Def.Sprite {
		InitCommand=cmd(x,431;y,-14;vertalign,bottom);--horizalign,right;
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			self:Load(GetJacketBanner(song))
			self:scale_to_clip_banner();
			self:zoom(0.78);
		end;						
	};
};	
	
return t;