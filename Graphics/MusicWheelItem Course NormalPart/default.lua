return Def.Banner {
	SetMessageCommand=function(self,params)
		if not params.Song then
			self:LoadFromCourse(params.Course);
		else
			self:LoadFromSong(params.Song);
		end;
		self:zoom_to_banner();
	end;
};



