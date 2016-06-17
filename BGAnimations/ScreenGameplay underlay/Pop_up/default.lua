-- local t = Def.ActorFrame {}

local pn = ...;
assert(...);

local style = GAMESTATE:GetCurrentStyle():GetStyleType()
local bPopup = Popup(pn);
----------------------------------------------------- BackgroundColor --
-- CutIn Color
local function PopupColor()
	if bPopup == "ALICE" then
		return color("#ff00ff");
	elseif bPopup == "BABY-LON" then
		return color("#ff0000");
	elseif bPopup == "BONNIE" then
		return color("#ffff00");
	elseif bPopup == "EMI" then
		return color("#00ff00");
	elseif bPopup == "GUS" then
		return color("#009a00");
	elseif bPopup == "JENNY" then
		return color("#ff00ff");
	elseif bPopup == "RAGE" then
		return color("#f88750")
	elseif bPopup == "ALICE2" then
		return color("#5c43c2")
	else
		return color("#00ffff");
	end;
end;
-----------------------
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
		if getenv("PopupC_"..ToEnumShortString(pn)) then
			self:queuecommand("PopupC");
			self:queuecommand("Popup");
		elseif getenv("PopupB_"..ToEnumShortString(pn)) then
			self:queuecommand("PopupB");
			self:queuecommand("Popup");
		elseif getenv("PopupA_"..ToEnumShortString(pn)) then
			self:queuecommand("PopupA");
			self:queuecommand("Popup");
		end;
	end;
};
-----------------------------------------------
--local bPopup = Popup(pn);
--[[
local function Update(self)
	local song = GAMESTATE:GetCurrentSong();
	local start = song:GetFirstBeat();
	local last = song:GetLastBeat();
	if (GAMESTATE:GetSongBeat() >= last) then
		self:visible(false);
	elseif (GAMESTATE:GetSongBeat() >= start-8) then
		self:visible(true);
	else
		self:visible(false);
	end;
end; ]]--
--[[
-- MaskSource([clearzbuffer])
-- Sets an actor up as the source for a mask. Clears zBuffer by default.
function Actor:MaskSource(noclear)
	if noclear == true then
		self:clearzbuffer(true)
	end
	self:zwrite(true)
	self:blend('BlendMode_NoEffect')
end
]]--
------------------------------------------
-- Mask --- config
t[#t+1] = Def.Sprite {
	InitCommand=function(self)
	--	self:MaskSource();
		self:clearzbuffer(true);
		self:zwrite(true);
		self:blend('BlendMode_NoEffect');
		if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			if pn == PLAYER_1 then
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_Mask_down"));
			else
				self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_Mask_up"));
				self:y(-3)
			end;
		else
			self:visible(false);
		end
	end;
};
---------------------------------------
-- Back ---------- Popup background --
t[#t+1] = LoadActor("Back") .. {
	InitCommand=cmd(diffusealpha,0;MaskDest);
	PopupCommand=function(self)
		self:finishtweening();
		self:linear(0.2);
		self:diffusealpha(1);
		self:diffuse(PopupColor());
		self:sleep(1);
		self:linear(0.2);
		self:diffusealpha(0);
	end; 
};
----------------------------------------
-- Character A    Tricolor charaters sprite
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
		if bPopup == "ALICE" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_A_Alice"));
		elseif bPopup == "BABY-LON" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_A_Baby-lon"));
		elseif bPopup == "BONNIE" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_A_Bonnie"));
		elseif bPopup == "EMI" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_A_Emi"));
		elseif bPopup == "GUS" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_A_Gus"));
		elseif bPopup == "JENNY" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_A_Jenny"));
		elseif bPopup == "RAGE" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_A_Rage"));
		elseif bPopup == "ALICE2" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_A_X-Alice2"));   	
		end;
	end; 
    --------- PopupACommand is for EVERY 100 HIT COMBO  ex: 100.200.300.400 etc -----
	PopupACommand=function(self)
		self:finishtweening();
		self:addy(13);
		self:sleep(0.1);
		self:linear(0.1);
		self:diffusealpha(1);
		self:linear(1);
		self:addy(-13);
		self:linear(0.1);
		self:diffusealpha(0);
	end; 
	PopupBCommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
	PopupCCommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
};
----------------------------------------------------
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
--		if character == "ALICE" then
		if bPopup == "ALICE" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_B_Alice"));
--		elseif character == "BABY-LON" then
		elseif bPopup == "BABY-LON" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_B_Baby-lon"));
--		elseif character == "BONNIE" then
		elseif bPopup == "BONNIE" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_B_Bonnie"));
--		elseif character == "EMI" then
		elseif bPopup == "EMI" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_B_Emi"));
--		elseif character == "GUS" then
		elseif bPopup == "GUS" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_B_Gus"));
--		elseif character == "RAGE" then
		elseif bPopup == "JENNY" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_B_Jenny"));
		elseif bPopup == "RAGE" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_B_Rage"));
		elseif bPopup == "ALICE2" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_B_X-Alice2"));	
		end;
	end; 
	----------- use for every 50hit  ex 50 150 250 350 comb etc..
	PopupBCommand=function(self)
		self:finishtweening(); 
		self:addy(13);
		self:sleep(0.1);
		self:linear(0.1);
		self:diffusealpha(1);
	--	self:diffusebottomedge(CutInColor());
		self:linear(1);
		self:addy(-13);
		self:linear(0.1);
		self:diffusealpha(0);
	end;
	PopupACommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
	PopupCCommand=function(self)
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
		if bPopup == "ALICE" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_C_Alice"));
		elseif bPopup == "BABY-LON" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_C_Baby-lon"));
		elseif bPopup == "BONNIE" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_C_Bonnie"));
		elseif bPopup == "EMI" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_C_Emi"));
		elseif bPopup == "GUS" then
			self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_C_Gus"));
		elseif bPopup == "JENNY" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_C_Jenny"));
		elseif bPopup == "RAGE" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_C_Rage"));
		elseif bPopup == "ALICE2" then
		    self:Load(THEME:GetPathB("ScreenGameplay","underlay/Pop_up/_C_X-Alice2"));	
		end;
	end; 
	PopupCCommand=function(self)
		self:finishtweening(); 
		self:addy(13);
		self:sleep(0.1);
		self:linear(0.1);
		self:diffusealpha(1);
	 -- self:diffusebottomedge(CutInColor());
		self:linear(1);
		self:addy(-13);
		self:linear(0.1);
		self:diffusealpha(0);
	end; 
	PopupACommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
	PopupBCommand=function(self)
		self:finishtweening();
		self:diffusealpha(0);
	end; 
};

-- Light
t[#t+1] = Def.Quad{
	InitCommand=function(self)
		self:MaskDest()
		self:zoomto(300,720)
		self:diffusetopedge(color("#000000"))
		self:diffusebottomedge(PopupColor())
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
	PopupCommand=function(self)
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
	--	self:diffuse(CutInColor())
		if style == "StyleType_TwoPlayersTwoSides" or GAMESTATE:GetPlayMode() == 'PlayMode_Rave' then
			if pn == PLAYER_1 then
				self:y(-50)
			else
				self:y(180)
			end; 
		end
	end;
	-- Left 1
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		PopupCommand=function(self)
			self:finishtweening();
			self:sleep(0.17);
			self:diffusealpha(1);
			self:x(-85);
			self:y(90);
			self:zoomx(0.7);
			self:zoomy(2.2);
			self:linear(0.4);
			self:y(-150);
			self:diffusealpha(0);
		end;
	};
	-- Right 1
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		PopupCommand=function(self)
			self:finishtweening();
			self:sleep(0.17);
			self:diffusealpha(1);
			self:x(60);
			self:y(155);
			self:zoomx(0.95);
			self:zoomy(1.6);
			self:linear(0.4);
			self:y(-10);
			self:diffusealpha(0);
		end;
	};
	-- Center 2 Right
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		PopupCommand=function(self)
			self:finishtweening();
			self:sleep(0.33);
			self:diffusealpha(1);
			self:x(10);
			self:y(150);
			self:zoomx(0.8);
			self:zoomy(1.75);
			self:linear(0.4);
			self:y(-30);
			self:diffusealpha(0);
		end;
	};
	-- Center 2 Left
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		PopupCommand=function(self)
			self:finishtweening();
			self:sleep(0.33);
			self:diffusealpha(1);
			self:x(-40);
			self:y(210);
			self:zoomx(0.8);
			self:zoomy(1);
			self:linear(0.4);
			self:y(110);
			self:diffusealpha(0);
		end;
	};
	-- Right 3
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		PopupCommand=function(self)
			self:finishtweening();
			self:sleep(0.53);
			self:diffusealpha(1);
			self:x(70);
			self:y(120);
			self:zoomx(0.6);
			self:zoomy(2.07);
			self:linear(0.4);
			self:y(-120);
			self:diffusealpha(0);
		end;
	};
	-- Left 3 big
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		PopupCommand=function(self)
			self:finishtweening();
			self:sleep(0.5);
			self:diffusealpha(1);
			self:x(-75);
			self:y(-90);
			self:zoomx(1);
			self:zoomy(4.45);
			self:linear(0.4);
			self:y(-320);
			self:diffusealpha(0);
		end;
	};
	-- Left 4
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		PopupCommand=function(self)
			self:finishtweening();
			self:sleep(0.63);
			self:diffusealpha(1);
			self:x(-75);
			self:y(85);
			self:zoomx(1.2);
			self:zoomy(2.2);
			self:linear(0.4);
			self:y(-150);
			self:diffusealpha(0);
		end;
	};
	-- Right 4 small
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		PopupCommand=function(self)
			self:finishtweening();
			self:sleep(0.63);
			self:diffusealpha(1);
			self:x(40);
			self:y(185);
			self:zoomx(0.6);
			self:zoomy(1.1);
			self:linear(0.4);
			self:y(85);
			self:diffusealpha(0);
		end;
	};
	-- Right 5 big
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		PopupCommand=function(self)
			self:finishtweening();
			self:sleep(0.86);
			self:diffusealpha(1);
			self:x(70);
			self:y(20);
			self:zoomx(0.9);
			self:zoomy(3);
			self:linear(0.4);
			self:y(-190);
			self:diffusealpha(0);
		end;
	};
	-- Left 5
	LoadActor("_Circles")..{
		InitCommand=cmd(diffusealpha,0;blend,'BlendMode_Add';vertalign,top);
		PopupCommand=function(self)
			self:finishtweening();
			self:sleep(0.86);
			self:diffusealpha(1);
			self:x(-30);
			self:y(150);
			self:zoomx(0.6);
			self:zoomy(1.7);
			self:linear(0.4);
			self:y(-25);
			self:diffusealpha(0);
		end;
	};
};

return t;