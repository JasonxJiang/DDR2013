local t = Def.ActorFrame {}
--[[
-- Title artist White back
t[#t+1]=LoadActor("Title_Back") .. {
	InitCommand=function(self)
		if GAMESTATE:IsCourseMode() then
			self:x(SCREEN_CENTER_X-320);
			
		else
			self:x(SCREEN_CENTER_X);
		end;
		(cmd(y,SCREEN_CENTER_Y;diffusealpha,0;draworder,205;))(self)
	end;
	CurrentSongChangedMessageCommand=function(self)
		if GAMESTATE:IsCourseMode() then
			self:diffuse(color("#ffffff"));
		else
			local song=GAMESTATE:GetCurrentSong();
			self:finishtweening();
			self:linear(0.2);
			if song then
				self:diffuse(color("#ffffffff")); ]]--
				--[[
				if song:IsLong() or song:IsMarathon() then
					self:diffuse(color("#ff6666dd"));
				else
					self:diffuse(color("#ffffffdd"));
				end;
				--]]
			--	self:diffuse(color("#000000dd"));
--[[			else
				local groupname = getenv("GetGroupName");
			--	if groupname == "" or groupname == "DIFFICULTY" then
				if groupname == "RANDOM" then
				--	self:diffuse(color("#56d4fe"));
				--	self:diffuse(color("#99ffacdd"));
				--	self:diffuse(color("#72ffacdd"));
					self:diffuse(color("#4fffacdd"));
				--	self:diffuse(color("#6effbbdd"));
				else
				--	self:diffuse(color("#ffcb55dd"));
				--	self:diffuse(color("#efda65dd"));
				--	self:diffuse(color("#ffda65dd"));
					self:diffuse(color("#ffda46dd"));
				--	self:diffuse(color("#ffdf60dd"));
				end;
			end;
		end;
	end;
	-- Fix use random
	OffCommand=cmd(linear,0.25;diffusealpha,0;linear,0;zoom,0);
}; ]]--
--[[
if not GAMESTATE:IsCourseMode() then
	--　Difficulty back 1p side
	t[#t+1]=LoadActor("1PBack_Difficulty") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
		InitCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		OnCommand=cmd(sleep,0.25;linear,0.25;zoomy,1);
		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	};
	--　Difficulty back 2p side
	t[#t+1]=LoadActor("2PBack_Difficulty") .. {
	    Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
		InitCommand = cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);

		OffCommand=cmd(sleep,0.25;linear,0.25;zoomy,0);
	};
	--　BPM back
	t[#t+1]=LoadActor("Back_BPM") .. {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		CurrentSongChangedMessageCommand=function(self)
			local song=GAMESTATE:GetCurrentSong();
			self:finishtweening();
			self:linear(0.2);
			if song then
				self:diffusealpha(1);
			else
				self:diffusealpha(0);
			end;
		end;
		OffCommand=cmd(zoom,0);
	};
	]]--
	--[[
--　GRAY BAR 1p side
	t[#t+1]=LoadActor("1PGrayBar") .. {
	--    Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
	--	InitCommand = cmd();
	--	OffCommand=cmd();	
	};
--　GRAY BAR 2p side
	t[#t+1]=LoadActor("2PGrayBar") .. {
	 --   Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
	--	InitCommand = cmd();
	--	OffCommand=cmd();	
	};	]]--

--end; 

return t