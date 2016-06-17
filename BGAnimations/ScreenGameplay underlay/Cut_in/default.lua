-- local t = Def.ActorFrame {}

local pn = ...;
assert(...);

local style = GAMESTATE:GetCurrentStyle():GetStyleType()
local character = GAMESTATE:GetCharacter(pn):GetCharacterID();
--local character = Popup(player);
-------------------

------------------

-- CutIn Color
local function CutInColor()
	if character == "Afro" then
		return color("#ffff00");
	elseif character == "Lady" then
		return color("#ff33ff");
	elseif character == "Emi" then
		return color("#00ccff");
	else
		return color("#ffffff");
	end;
end; 
	
local t = Def.ActorFrame {
	JudgmentMessageCommand = function(self,params)
		if params.Player ~= pn then return end
		if params.TapNoteScore and
		   params.TapNoteScore ~= 'TapNoteScore_AvoidMine' and
		   params.TapNoteScore ~= 'TapNoteScore_HitMine' and
		   params.TapNoteScore ~= 'TapNoteScore_CheckpointMiss' and
		   params.TapNoteScore ~= 'TapNoteScore_CheckpointHit' and
		   params.TapNoteScore ~= 'TapNoteScore_W5' and
		   params.TapNoteScore ~= 'TapNoteScore_Miss' and
		   params.TapNoteScore ~= 'TapNoteScore_None'
		then
			-- ひとつ間にコマンドを入れないとズレることが多い
			self:queuecommand("Connect");
		end
	end;
	ConnectCommand = function(self)
		if getenv("CutInC_"..ToEnumShortString(pn)) then
			self:queuecommand("CutinC");
			self:queuecommand("Cutin");
		elseif getenv("CutInB_"..ToEnumShortString(pn)) then
			self:queuecommand("CutinB");
			self:queuecommand("Cutin");
		elseif getenv("CutInA_"..ToEnumShortString(pn)) then
			self:queuecommand("CutinA");
			self:queuecommand("Cutin");
		end;
	end;
};

-- Mask
t[#t+1] = Def.Sprite {
	InitCommand=function(self)
	--	self:MaskSource();
		self:clearzbuffer(true);
		self:zwrite(true);
		self:blend('BlendMode_NoEffect');
		if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			if pn == PLAYER_1 then
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/_Mask_down"));
			else
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/_Mask_up"));
				self:y(-3)
			end;
		else
			self:visible(false);
		end
	end;
};

-- Back
t[#t+1] = LoadActor("Back") .. {
	InitCommand=cmd(diffusealpha,0;MaskDest);
	CutinCommand=function(self)
		self:finishtweening();
		self:setstate(0);
		self:linear(0.2);
		self:diffusealpha(1);
		self:diffuse(CutInColor());
		self:sleep(1);
		self:linear(0.2);
		self:diffusealpha(0);
	end; 
};

-- Character A
t[#t+1] = Def.Sprite {
	InitCommand=function(self)
		self:MaskDest();
		self:diffusealpha(0);
		if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			if pn == PLAYER_1 then
				self:y(-50)
			else
				self:y(150)
			end; 
		end
		if pn == PLAYER_2 then
			self:rotationy(180)
		end; 
		if character == "Afro" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Afro_A"));
		elseif character == "Lady" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Lady_A"));
		elseif character == "Emi" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_5th_Emi_A"));
		end;
--[[		if character == "ALICE" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Afro_A"));
		elseif character == "BABY-LON" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Lady_A"));
		elseif character == "EMI" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_5th_Emi_A"));
		end; ]]--
	end; 
	CutinACommand=function(self)
		self:finishtweening();
		self:addy(13);
		self:sleep(0.1);
		self:linear(0.1);
		self:diffusealpha(1);
		self:diffuse(color("#ffffff"));
		self:linear(1);
		self:addy(-13);
		self:linear(0.1);
		self:diffusealpha(0);
	end; 
	CutinBCommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
	CutinCCommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
};

-- Character B
t[#t+1] = Def.Sprite {
	InitCommand=function(self)
		self:MaskDest();
		self:diffusealpha(0);
		if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			if pn == PLAYER_1 then
				self:y(-50)
			else
				self:y(180)
			end; 
		end
		if pn == PLAYER_2 then
			self:rotationy(180)
		end; 
		if character == "Afro" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Afro_B"));
		elseif character == "Lady" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Lady_B"));
		elseif character == "Emi" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_5th_Emi_B"));
		end;
--[[		if character == "ALICE" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Afro_B"));
		elseif character == "BABY-LON" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Lady_B"));
		elseif character == "EMI" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_5th_Emi_B"));
		end; ]]--
	end; 
	CutinBCommand=function(self)
		self:finishtweening(); 
		self:addy(13);
		self:sleep(0.1);
		self:linear(0.1);
		self:diffusealpha(1);
		self:diffusebottomedge(CutInColor());
		self:linear(1);
		self:addy(-13);
		self:linear(0.1);
		self:diffusealpha(0);
	end;
	CutinACommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
	CutinCCommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
};

-- Character C
t[#t+1] = Def.Sprite {
	InitCommand=function(self)
		self:MaskDest();
		self:diffusealpha(0);
		if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			if pn == PLAYER_1 then
				self:y(-50)
			else
				self:y(180)
			end; 
		end
		if pn == PLAYER_2 then
			self:rotationy(180)
		end; 
		if character == "Afro" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Afro_C"));
		elseif character == "Lady" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Lady_C"));
		elseif character == "Emi" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_5th_Emi_C"));
		end;
--[[		if character == "ALICE" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Afro_C"));
		elseif character == "BABY-LON" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_1st_Lady_C"));
		elseif character == "EMI" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Cut_in/Cut_in_5th_Emi_C"));
		end; ]]--
	end; 
	CutinCCommand=function(self)
		self:finishtweening(); 
		self:addy(13);
		self:sleep(0.1);
		self:linear(0.1);
		self:diffusealpha(1);
		self:diffusebottomedge(CutInColor());
		self:linear(1);
		self:addy(-13);
		self:linear(0.1);
		self:diffusealpha(0);
	end; 
	CutinACommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
	CutinBCommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
};

-- Light
t[#t+1] = Def.Quad{
	InitCommand=function(self)
		self:MaskDest()
		self:zoomto(200,480)
		self:diffusetopedge(color("#000000"))
		self:diffusebottomedge(CutInColor())
		self:diffusealpha(0)
		self:blend('BlendMode_Add')
		if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			if pn == PLAYER_1 then
				self:y(-50)
			else
				self:y(180)
			end; 
		end
	end; 
	CutinCommand=function(self)
		self:finishtweening();
		self:sleep(0);
		self:linear(0.2);
		self:diffusealpha(0.5);
		self:sleep(0.8);
		self:linear(0.2);
		self:diffusealpha(0);
	end;
};

t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		self:MaskDest()
		self:diffuse(CutInColor())
		if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			if pn == PLAYER_1 then
				self:y(-50)
			else
				self:y(180)
			end; 
		end
	end;
	-- Left 1
	LoadActor("cercles")..{
--[[		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		CutinCommand=function(self)
			self:finishtweening();
			self:sleep(0.17);
			self:diffusealpha(1);
			self:x(-85);
			self:y(90);
			self:zoomx(0.5);
			self:zoomy(2);
			self:linear(0.4);
			self:y(-150);
			self:diffusealpha(0);
		end;
	};
	-- Right 1
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		CutinCommand=function(self)
			self:finishtweening();
			self:sleep(0.17);
			self:diffusealpha(1);
			self:x(60);
			self:y(155);
			self:zoomx(0.75);
			self:zoomy(1.4);
			self:linear(0.4);
			self:y(-10);
			self:diffusealpha(0);
		end;
	};
	-- Center 2 Right
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		CutinCommand=function(self)
			self:finishtweening();
			self:sleep(0.33);
			self:diffusealpha(1);
			self:x(10);
			self:y(150);
			self:zoomx(0.6);
			self:zoomy(1.55);
			self:linear(0.4);
			self:y(-30);
			self:diffusealpha(0);
		end;
	};
	-- Center 2 Left
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		CutinCommand=function(self)
			self:finishtweening();
			self:sleep(0.33);
			self:diffusealpha(1);
			self:x(-40);
			self:y(210);
			self:zoomx(0.6);
			self:zoomy(0.8);
			self:linear(0.4);
			self:y(110);
			self:diffusealpha(0);
		end;
	};
	-- Right 3
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		CutinCommand=function(self)
			self:finishtweening();
			self:sleep(0.53);
			self:diffusealpha(1);
			self:x(70);
			self:y(120);
			self:zoomx(0.4);
			self:zoomy(2.05);
			self:linear(0.4);
			self:y(-120);
			self:diffusealpha(0);
		end;
	};
	-- Left 3 big
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		CutinCommand=function(self)
			self:finishtweening();
			self:sleep(0.5);
			self:diffusealpha(1);
			self:x(-75);
			self:y(-90);
			self:zoomx(0.95);
			self:zoomy(4.25);
			self:linear(0.4);
			self:y(-320);
			self:diffusealpha(0);
		end;
	};
	-- Left 4
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		CutinCommand=function(self)
			self:finishtweening();
			self:sleep(0.63);
			self:diffusealpha(1);
			self:x(-75);
			self:y(85);
			self:zoomx(1);
			self:zoomy(2);
			self:linear(0.4);
			self:y(-150);
			self:diffusealpha(0);
		end;
	};
	-- Right 4 small
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		CutinCommand=function(self)
			self:finishtweening();
			self:sleep(0.63);
			self:diffusealpha(1);
			self:x(40);
			self:y(185);
			self:zoomx(0.4);
			self:zoomy(0.9);
			self:linear(0.4);
			self:y(85);
			self:diffusealpha(0);
		end;
	};
	-- Right 5 big
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		CutinCommand=function(self)
			self:finishtweening();
			self:sleep(0.86);
			self:diffusealpha(1);
			self:x(70);
			self:y(20);
			self:zoomx(0.7);
			self:zoomy(2.95);
			self:linear(0.4);
			self:y(-190);
			self:diffusealpha(0);
		end;
	};
	-- Left 5
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		CutinCommand=function(self)
			self:finishtweening();
			self:sleep(0.86);
			self:diffusealpha(1);
			self:x(-30);
			self:y(150);
			self:zoomx(0.4);
			self:zoomy(1.5);
			self:linear(0.4);
			self:y(-25);
			self:diffusealpha(0);
		end; ]]--
	}; 
};

return t;