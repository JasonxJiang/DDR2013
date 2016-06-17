
local mpn = GAMESTATE:GetMasterPlayerNumber();
local bComboGraphic = ComboGraphic(mpn);
local function FontPath()
	if bComboGraphic == '2013' then
		return "Common Normal";
	else
		return "_russellsquare Bold 24px";
	end;
end;

return Def.ActorFrame{
	-- Title
--	LoadFont("_russellsquare Bold 24px")..{
	LoadFont(FontPath())..{
		InitCommand=cmd(horizalign,left;playcommand,"Update");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			if bComboGraphic == '2013' then
				self:x(0);
				self:y(-6);
				self:strokecolor(color("#000000"));
				self:zoomx(0.9);
				self:zoomy(0.9);
				self:maxwidth(368);
			else
				self:x(0);
				self:y(-1);
				self:strokecolor(color("#ffffff00"));
				self:zoomx(0.9);
				self:zoomy(0.9);
				self:maxwidth(368);
			end;
			local title;
			local song = GAMESTATE:GetCurrentSong();
			if song then
				title = song:GetDisplayFullTitle();
			else
				title = "???";
			end;
			self:settext(title);
		end;
	};
	-- Artist
	LoadFont(FontPath())..{
		InitCommand=cmd(horizalign,left;playcommand,"Update");
		CurrentSongChangedMessageCommand=cmd(playcommand,"Update");
		UpdateCommand=function(self)
			if bComboGraphic == '2013' then
				self:strokecolor(color("#000000"));
				self:x(0);
				self:y(15);
				self:zoomx(0.9);
				self:zoomy(0.9);
				self:maxwidth(368);
			else
				self:strokecolor(color("#ffffff00"));
				self:x(0);
				self:y(15);
				self:zoomx(0.9);
				self:zoomy(0.9);
				self:maxwidth(368);
			end;
			local artist;
			local song = GAMESTATE:GetCurrentSong();
			if song then
				if song:GetDisplayArtist() == "Unknown artist" or song:GetDisplayArtist() == "♪♪♪♪♪" then
					self:visible(false);
					return;
				else
					artist = song:GetDisplayArtist();
				end;
			else
				artist = "???";
			end;
			self:settext(artist);
		end;
	};
};