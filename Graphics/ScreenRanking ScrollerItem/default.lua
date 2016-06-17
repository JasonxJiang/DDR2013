local t = Def.ActorFrame{
	InitCommand=cmd(runcommandsonleaves,cmd(ztest,true));
	LoadActor("_song frame");

	Def.Banner{
		InitCommand=cmd(x,-276;halign,0;scaletoclipped,128,40;diffusealpha,0.5;fadeleft,0.25;faderight,0.25);
		SetCommand=function(self, params)
			if params.Song then
				self:LoadFromSong( params.Song );
			end
		end;
	};
	LoadFont("common normal")..{
		--maxwidth,264
		InitCommand=cmd(x,-292;halign,0;zoom,0.6;shadowlength,1;wrapwidthpixels,264;maxheight,58);
		SetCommand=function(self, params)
			if params.Song then
			--[[
				local song = params.Song;
				local group = song:GetGroupName();
				if group == "DDR 1st" then return end
				--]]
				self:settext( params.Song:GetDisplayFullTitle() );
			end
		end;
	};
};

local c
local Scores = Def.ActorFrame{
	InitCommand=function(self) c = self:GetChildren(); end;
};

for i=1,5 do
	Scores[#Scores+1] = LoadFont("common normal")..{
		Name="Name"..i;
		InitCommand=cmd(x,scale(i,1,5,-48,240);y,-8;zoom,0.625);
	};
	Scores[#Scores+1] = Def.Sprite{
		Name="Score2"..i;
		InitCommand=cmd(x,scale(i,1,5,-48,240);y,12;zoom,1);
	};
end

Scores.SetCommand=function(self,params)
	local profile = PROFILEMAN:GetMachineProfile();
	for name, child in pairs(c) do child:visible(false); end
	local sel = params.Song
	if not sel then return end
	
	list = {"Difficulty_Challenge","Difficulty_Hard","Difficulty_Medium","Difficulty_Easy","Difficulty_Beginner","Difficulty_Edit"}
--	for i,value in ipairs(list) do
	
--	for i, item in pairs(params.Entries) do
	for i, item in pairs(params.Entries) do
		if item then
			local hsl = profile:GetHighScoreList(sel, item);
			local hs = hsl and hsl:GetHighScores();

			assert(c["Name"..i])
			assert(c["Score2"..i])

			c["Name"..i]:visible(true)
			c["Score2"..i]:visible(true)
			
			if hs and #hs > 0 then
				c["Name"..i]:settext( hs[1]:GetName() );
				c["Score2"..i]:LoadBackground(THEME:GetPathB("ScreenSelectMusic decorations/Grade/GradeDisplayEval",ToEnumShortString(hs[1]:GetGrade())));
			else
				c["Name"..i]:settext( "-----" );
				c["Score2"..i]:visible(false)
			end
			
		end
	end
end;

t[#t+1] = Scores

return t