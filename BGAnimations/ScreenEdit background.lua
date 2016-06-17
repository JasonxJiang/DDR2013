return Def.Sprite {
	InitCommand=function(self)
		self:Center();
		self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
		self:diffuse(1,1,1,0.5);
		self:scale_or_crop_background();
	end;
};