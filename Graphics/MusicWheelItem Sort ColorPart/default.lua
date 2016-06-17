return Def.ActorFrame {
	Def.Banner{
		InitCommand=cmd(y,101;scaletoclipped,256,256);
		SetMessageCommand=function(self,params)
			local so = GAMESTATE:GetSortOrder();
			local label = params.Label;
		--	if label then
			if so == "SortOrder_ModeMenu" then
				self:Load( THEME:GetPathG("MusicWheelItem","Sort ColorPart/SortBanner/"..label) );
			end;
			self:zoom_to_banner();
		end;
	};
	--[[
	LoadActor(THEME:GetPathG("MusicWheelItem","SectionCollapsed ColorPart/SortBanner/Sort")) .. {
		InitCommand=cmd(zoom_to_banner);
	};
	-- Center Big text
	LoadFont("_serpentinedbol 19px")..{
		InitCommand=cmd(y,-20-100;zoom,4.05;maxwidth,46);
		SetCommand=function(self,params)
			self:settext(params.Label);
		end;
	};
	--]]
	--[[
	Def.Quad {
		SetCommand=function(self,params)
			local so = GAMESTATE:GetSortOrder();
			if so == "SortOrder_ModeMenu" then
				if params.HasFocus ~= true then
					return;
				end;
				local label = params.Label;
				setenv("GetGroupName",label)
			end;
		end;
	};
	--]]
};