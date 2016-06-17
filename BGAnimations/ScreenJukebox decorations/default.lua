local t = Def.ActorFrame {};

function Actor:zoom_to_banner_Summary()
	-- スクエアバナー用
	if self:GetWidth() == self:GetHeight() then
		self:zoomto(40,40);
	-- マリオ用		
	elseif (self:GetWidth() * 2) / 5 == self:GetHeight() then
		self:zoomto(52,20.8);
	-- ホッテストパーティー1・2 フルフルパーティー　Winx-Club Disney-Grooves用		
	elseif (self:GetWidth() * 55) / 113 == self:GetHeight() then
		self:zoomto(47,23);
	else
	-- その他、通常DDR	
		self:zoomto(53,17);
	end
end

t[#t+1] = LoadActor("../ScreenDemonstration decorations/Bar") .. {
	InitCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y+186;horizalign,right;draworder,40);
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_CENTER_Y+184;draworder,45);	
	-- タイトル
	LoadFont("_russellsquare Bold 24px")..{
		InitCommand=cmd(x,-490;horizalign,left;zoomy,0.65;zoomx,0.83;maxwidth,290.9;playcommand,"Update");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			local title;
			local song = GAMESTATE:GetCurrentSong();
			
		--	if song then
		--		title = song:GetDisplayMainTitle();
		--	else
		--		title = "???";
		--	end;
			
			if song then
				if song:GetDisplaySubTitle() == ""  then
					title = song:GetDisplayMainTitle();
					self:y(-12);
				else
					title = song:GetDisplayMainTitle();
					self:y(-14.5);
				end;
			else
				title = "???";
				self:y(-12);
			end;
			self:settext(title);
		end;
	};
	-- サブタイトル
	LoadFont("_russellsquare Bold 24px")..{
		InitCommand=cmd(x,-490;y,1.5;horizalign,left;zoomx,0.57;zoomy,0.45;maxwidth,423.2;playcommand,"Update");
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
	-- アーティスト名
	LoadFont("_russellsquare Bold 24px")..{
		InitCommand=cmd(x,-490;horizalign,left;zoomx,0.59;zoomy,0.47;maxwidth,410.4;playcommand,"Update");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			local artist;
			local song = GAMESTATE:GetCurrentSong();
			
		--	if song then
		--		artist = song:GetDisplayArtist();
		--	else
		--		artist = "???";
		--	end;
			
			if song then
				if song:GetDisplaySubTitle() == ""  then
					artist = song:GetDisplayArtist();
					self:y(13);
				else
					artist = song:GetDisplayArtist();
					self:y(15.5);
				end;
			else
				artist = "???";
				self:y(13);
			end;
			
			self:settext(artist);
		end;
	};
	
	-- banner shadow
	Def.Sprite {
		InitCommand=cmd(diffuse,color("#000000");diffusealpha,0.5;x,-99;y,-8;vertalign,bottom);
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			self:Load(GetJacketBanner(song))
			self:scale_to_clip_banner();
			self:zoom(0.78);
			self:zoomtoheight(23);
		end;						
	};
	
	-- banner
	Def.Sprite {
		InitCommand=cmd(x,-105;y,-14;vertalign,bottom);--horizalign,right;
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			self:Load(GetJacketBanner(song))
			self:scale_to_clip_banner();
			self:zoom(0.78);
		end;						
	};
};	

return t;