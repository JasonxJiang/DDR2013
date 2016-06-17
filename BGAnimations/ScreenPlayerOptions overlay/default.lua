setenv("PlayerOptionExitP1",false);
setenv("PlayerOptionExitP2",false);

local MenuState = {
	PlayerNumber_P1 = {
		CurIndex = 1,
	},
	PlayerNumber_P2 = {
		CurIndex = 1,
	},
};

-- Change PlayMode CurIndex
local function MinusCurIndex()
	local minus = 0;
	if GAMESTATE:GetPlayMode() == "PlayMode_Oni" or GAMESTATE:GetPlayMode() == "PlayMode_Rave" then
		minus = 8;
	elseif GAMESTATE:GetPlayMode() == "PlayMode_Nonstop" or GAMESTATE:GetPlayMode() == "PlayMode_Endless" then
		minus = 1;
	end;
	return minus;
end;
local bMinusCurIndex = MinusCurIndex();

-- Change PlayMode CurIndex2
local function MinusCurIndex2()
	local minus = 0;
	if GAMESTATE:GetPlayMode() == "PlayMode_Oni" or GAMESTATE:GetPlayMode() == "PlayMode_Rave" then
		minus = 7;
	elseif GAMESTATE:GetPlayMode() == "PlayMode_Nonstop" or GAMESTATE:GetPlayMode() == "PlayMode_Endless" then
		minus = 0;
	end;
	return minus;
end;
local bMinusCurIndex2 = MinusCurIndex2();
	
local t = Def.ActorFrame {
	OffCommand=cmd(accelerate,0.25;addx,WideScale(SCREEN_WIDTH+50,SCREEN_WIDTH));
	MenuInputMessageCommand=function(self,params)
		if GAMESTATE:IsHumanPlayer(params.Player) then
			local curIndex = MenuState[params.Player].CurIndex
		--	StartButton is not work. (SM5b1a)
			if params.Input == "Up" then
				if curIndex == 1 then
					MenuState[params.Player].CurIndex = 1
				elseif curIndex > 1 then
					MenuState[params.Player].CurIndex = curIndex - 1
				end
				MESSAGEMAN:Broadcast("PlayerChangedFocus",{Player = params.Player, Direction = params.Input})
			elseif params.Input == "Down" then
				if curIndex < (15 - bMinusCurIndex) then
					MenuState[params.Player].CurIndex = curIndex + 1
				else
					MenuState[params.Player].CurIndex = 1
				end
				MESSAGEMAN:Broadcast("PlayerChangedFocus",{Player = params.Player, Direction = params.Input})
			end;
		end;
	end;
			
	MenuUpP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Up", }); end;
	MenuUpP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Up", }); end;
	MenuDownP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Down", }); end;
	MenuDownP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Down", }); end;
--	MenuStartP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Start", }); end;
--	MenuStartP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Start", }); end;
	CodeMessageCommand=function(self,params)
		MESSAGEMAN:Broadcast("MenuInput", { Player = params.PlayerNumber, Input = params.Name, })
	end;
	--[[
	-- Line Check 1P
	LoadFont("common normal")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-330;y,SCREEN_CENTER_Y-50;zoom,2;diffusetopedge,color("#ffffff");diffusebottomedge,color("#ff33ff");strokecolor,color("#000000");settext,1);
		PlayerChangedFocusMessageCommand=function(self,params)
			self:settext(MenuState[PLAYER_1].CurIndex)
		end;
	};
	-- Line Check 2P
	LoadFont("common normal")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+330;y,SCREEN_CENTER_Y-50;zoom,2;diffusetopedge,color("#ffffff");diffusebottomedge,color("#ff33ff");strokecolor,color("#000000"));
		PlayerChangedFocusMessageCommand=function(self,params)
			self:settext(MenuState[PLAYER_2].CurIndex)
		end;
	};
	--]]
	-- ScreenFilter Icon P1
	Def.Sprite {
		Name="ScreenFilterIconP1";
		InitCommand=cmd(zoom,0.8;x,SCREEN_CENTER_X-420;y,SCREEN_CENTER_Y+240;visible,false);
		PlayerChangedFocusMessageCommand=function(self,params)
			local curIndex = MenuState[PLAYER_1].CurIndex
			if curIndex == (12 - bMinusCurIndex2) then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	-- ScreenFilter Icon P2
	Def.Sprite {
		Name="ScreenFilterIconP2";
		InitCommand=cmd(zoom,0.8;x,SCREEN_CENTER_X+420;y,SCREEN_CENTER_Y+240;visible,false);
		PlayerChangedFocusMessageCommand=function(self,params)
			local curIndex = MenuState[PLAYER_2].CurIndex
			if curIndex == (12 - bMinusCurIndex2) then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	-- ScreenFilter Explanation P1
	LoadFont("common normal")..{
		Name="ScreenFilterExplanationP1";
		InitCommand=cmd(x,SCREEN_CENTER_X-360;y,SCREEN_CENTER_Y+240;zoom,0.53;horizalign,left;diffuse,color("#ffffff");visible,false);
		PlayerChangedFocusMessageCommand=function(self,params)
			local curIndex = MenuState[PLAYER_1].CurIndex
			if curIndex == (12 - bMinusCurIndex2) then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	-- ScreenFilter Explanation P2
	LoadFont("common normal")..{
		Name="ScreenFilterExplanationP2";
		InitCommand=cmd(x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y+240;zoom,0.53;horizalign,left;diffuse,color("#ffffff");visible,false);
		PlayerChangedFocusMessageCommand=function(self,params)
			local curIndex = MenuState[PLAYER_2].CurIndex
			if curIndex == (12 - bMinusCurIndex2) then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	-- Evaluation Icon P1
	Def.Sprite {
		Name="JudgeComboIconP1";
		InitCommand=cmd(x,SCREEN_CENTER_X-420;y,SCREEN_CENTER_Y+240;visible,false);
		PlayerChangedFocusMessageCommand=function(self,params)
			local curIndex = MenuState[PLAYER_1].CurIndex
			if curIndex == (14 - bMinusCurIndex2) then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	-- Evaluation Icon P2
	Def.Sprite {
		Name="JudgeComboIconP2";
		InitCommand=cmd(x,SCREEN_CENTER_X+52-1;y,SCREEN_CENTER_Y+240;visible,false);
		PlayerChangedFocusMessageCommand=function(self,params)
			local curIndex = MenuState[PLAYER_2].CurIndex
			if curIndex == (14 - bMinusCurIndex2) then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	-- Evaluation Explanation P1
	LoadFont("common normal")..{
		Name="EvaluationIconExplanationP1";
		InitCommand=cmd(x,SCREEN_CENTER_X-360;y,SCREEN_CENTER_Y+240;zoom,0.53;horizalign,left;diffuse,color("#ffffff");settext,THEME:GetString("ScreenPlayerOptions","ComboGraphic");visible,false);
		PlayerChangedFocusMessageCommand=function(self,params)
			local curIndex = MenuState[PLAYER_1].CurIndex
			if curIndex == (14 - bMinusCurIndex2) then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
	-- Evaluation Explanation P2
	LoadFont("common normal")..{
		Name="EvaluationIconExplanationP2";
		InitCommand=cmd(x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y+240;zoom,0.53;horizalign,left;diffuse,color("#ffffff");settext,THEME:GetString("ScreenPlayerOptions","ComboGraphic");visible,false);
		PlayerChangedFocusMessageCommand=function(self,params)
			local curIndex = MenuState[PLAYER_2].CurIndex
			if curIndex == (14 - bMinusCurIndex2) then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
	};
};

-- update function to change it actively
local function Update(self)

	local SFIconP1 = self:GetChild("ScreenFilterIconP1");
	local SFExplanationP1 = self:GetChild("ScreenFilterExplanationP1");
	local EvaIconP1 = self:GetChild("JudgeComboIconP1");
	local EvaIconExplanationP1 = self:GetChild("EvaluationIconExplanationP1");
	local LoadScreenFilterP1 = ScreenFilter(PLAYER_1);
	local LoadComboGraphicP1 = ComboGraphic(PLAYER_1);
	
	local SFIconP2 = self:GetChild("ScreenFilterIconP2");
	local SFExplanationP2 = self:GetChild("ScreenFilterExplanationP2");
	local EvaIconP2 = self:GetChild("JudgeComboIconP2");
	local EvaIconExplanationP2 = self:GetChild("EvaluationIconExplanationP2");
	local LoadScreenFilterP2 = ScreenFilter(PLAYER_2);
	local LoadComboGraphicP2 = ComboGraphic(PLAYER_2);
	
	-- Set From Graphics/ScreenOptions more 
	if getenv("PlayerOptionExitP1") then
		MenuState[PLAYER_1].CurIndex = 16 - bMinusCurIndex
		SFIconP1:visible(false);
		SFExplanationP1:visible(false);
		EvaIconP1:visible(false);
		EvaIconExplanationP1:visible(false);
	end;
	if getenv("PlayerOptionExitP2") then
		MenuState[PLAYER_2].CurIndex = 16 - bMinusCurIndex
		SFIconP2:visible(false);
		SFExplanationP2:visible(false);
		EvaIconP2:visible(false);
		EvaIconExplanationP2:visible(false);
	end;
	
	--EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_"..LoadComboGraphicP1) );
	--EvaIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_"..LoadComboGraphicP2) );
	
	--combographic
	
	if LoadComboGraphicP1 ~= "OFF" then
		EvaIconExplanationP1:settext(THEME:GetString("ScreenPlayerOptions","ComboGraphic"));
	else
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_2013") );
		EvaExplanationP1:settext(THEME:GetString("ScreenPlayerOptions","JudgeComboIcon_2013"));
	end;	
	if LoadComboGraphicP1 == "1st" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_1st") );
	elseif LoadComboGraphicP1 == "3rd" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_3rd") );
	elseif LoadComboGraphicP1 == "5th" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_5th") );
	elseif LoadComboGraphicP1 == "max" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_max") );
	elseif LoadComboGraphicP1 == "extreme" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_extreme") );		
	elseif LoadComboGraphicP1 == "supernova1" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_supernova1") );
	elseif LoadComboGraphicP1 == "supernova2" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_supernova2") );
	elseif LoadComboGraphicP1 == "x1" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_x1") );
	elseif LoadComboGraphicP1 == "x2" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_x2") );
	elseif LoadComboGraphicP1 == "x3" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_x3") );
	elseif LoadComboGraphicP1 == "2013" then
		EvaIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/JudgeComboIcon_2013") );
	end;
	
	
	--screenfilter
	
	if LoadScreenFilterP1 ~= "OFF" then
		SFExplanationP1:settext(THEME:GetString("ScreenPlayerOptions","ScreenFilterOn"));
	else
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Off") );
		SFExplanationP1:settext(THEME:GetString("ScreenPlayerOptions","ScreenFilterOff"));
	end;	
	if LoadScreenFilterP1 == "DARK" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Dark1") );
	elseif LoadScreenFilterP1 == "DARKER" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Darker") );
	elseif LoadScreenFilterP1 == "DARKEST" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Darkest") );
	elseif LoadScreenFilterP1 == "BLUE LANE" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Blue") );
	elseif LoadScreenFilterP1 == "RED LANE" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Red") );		
	elseif LoadScreenFilterP1 == "GREEN LANE" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Green") );
	elseif LoadScreenFilterP1 == "YELLOW LANE" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Yellow") );
	elseif LoadScreenFilterP1 == "DARK LANE" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_DarkR") );
	elseif LoadScreenFilterP1 == "TOKIMEKI MIYUKI" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Tokimeki_Miyuki") );
	elseif LoadScreenFilterP1 == "TOKIMEKI KAORI" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Tokimeki_Kaori") );
	elseif LoadScreenFilterP1 == "TOKIMEKI MIHO" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Tokimeki_Miho") );
	elseif LoadScreenFilterP1 == "TOKIMEKI MAHO" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Tokimeki_Maho") );				
	end;
	
	if LoadScreenFilterP2 ~= "OFF" then
		SFExplanationP2:settext(THEME:GetString("ScreenPlayerOptions","ScreenFilterOn"));
	else
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Off") );
		SFExplanationP2:settext(THEME:GetString("ScreenPlayerOptions","ScreenFilterOff"));
	end;
	if LoadScreenFilterP2 == "DARK" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Dark1") );
	elseif LoadScreenFilterP2 == "DARKER" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Darker") );
	elseif LoadScreenFilterP2 == "DARKEST" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Darkest") );
	elseif LoadScreenFilterP2 == "BLUE LANE" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Blue") );
	elseif LoadScreenFilterP2 == "RED LANE" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Red") );		
	elseif LoadScreenFilterP2 == "GREEN LANE" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Green") );
	elseif LoadScreenFilterP2 == "YELLOW LANE" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Yellow") );
	elseif LoadScreenFilterP2 == "DARK LANE" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_DarkR") );
	elseif LoadScreenFilterP2 == "TOKIMEKI MIYUKI" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Tokimeki_Miyuki") );
	elseif LoadScreenFilterP2 == "TOKIMEKI KAORI" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Tokimeki_Kaori") );
	elseif LoadScreenFilterP2 == "TOKIMEKI MIHO" then
		SFIconP2:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Tokimeki_Miho") );
	elseif LoadScreenFilterP2 == "TOKIMEKI MAHO" then
		SFIconP1:Load( THEME:GetPathB("ScreenPlayerOptions","overlay/ScreenFilterIcon_Tokimeki_Maho") );		
	end;
end;

t.InitCommand=cmd(SetUpdateFunction,Update);

return t;