local profileGUIDP1 = PROFILEMAN:GetProfile(PLAYER_1):GetGUID();
local profileGUIDP2 = PROFILEMAN:GetProfile(PLAYER_2):GetGUID();

local Characters = CHARMAN:GetAllCharacters();

-- Load kg P1
local function LoadkgP1()
	if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
		if ReadPrefFromFile("FirstReMIX_Savekg_"..profileGUIDP1) == nil then
			WritePrefToFile("FirstReMIX_Savekg_"..profileGUIDP1, '0');
		end;
		return ReadPrefFromFile("FirstReMIX_Savekg_"..profileGUIDP1);
	else
		if ReadPrefFromFile("FirstReMIX_Savekg_"..ToEnumShortString(PLAYER_1)) == nil then
			WritePrefToFile("FirstReMIX_Savekg_"..ToEnumShortString(PLAYER_1), '0');
		end;
		return ReadPrefFromFile("FirstReMIX_Savekg_"..ToEnumShortString(PLAYER_1));
	end;
end;

-- Load kg P1
local function LoadkgP2()
	if PROFILEMAN:IsPersistentProfile(PLAYER_2) then
		if ReadPrefFromFile("FirstReMIX_Savekg_"..profileGUIDP2) == nil then
			WritePrefToFile("FirstReMIX_Savekg_"..profileGUIDP2, '0');
		end;
		return ReadPrefFromFile("FirstReMIX_Savekg_"..profileGUIDP2);
	else
		if ReadPrefFromFile("FirstReMIX_Savekg_"..ToEnumShortString(PLAYER_2)) == nil then
			WritePrefToFile("FirstReMIX_Savekg_"..ToEnumShortString(PLAYER_2), '0');
		end;
		return ReadPrefFromFile("FirstReMIX_Savekg_"..ToEnumShortString(PLAYER_2));
	end;
end;

-- Load Character P1
local function LoadCharacterP1()
	if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
		if ReadPrefFromFile("FirstReMIX_SaveCharacter_"..profileGUIDP1) == nil then
			WritePrefToFile("FirstReMIX_SaveCharacter_"..profileGUIDP1, '1');
		end;
		return ReadPrefFromFile("FirstReMIX_SaveCharacter_"..profileGUIDP1);
	else
		if ReadPrefFromFile("FirstReMIX_SaveCharacter_"..ToEnumShortString(PLAYER_1)) == nil then
			WritePrefToFile("FirstReMIX_SaveCharacter_"..ToEnumShortString(PLAYER_1), '1');
		end;
		return ReadPrefFromFile("FirstReMIX_SaveCharacter_"..ToEnumShortString(PLAYER_1));
	end;
end;

-- Load Character P2
local function LoadCharacterP2()
	if PROFILEMAN:IsPersistentProfile(PLAYER_2) then
		if ReadPrefFromFile("FirstReMIX_SaveCharacter_"..profileGUIDP2) == nil then
			WritePrefToFile("FirstReMIX_SaveCharacter_"..profileGUIDP2, '1');
		end;
		return ReadPrefFromFile("FirstReMIX_SaveCharacter_"..profileGUIDP2);
	else
		if ReadPrefFromFile("FirstReMIX_SaveCharacter_"..ToEnumShortString(PLAYER_2)) == nil then
			WritePrefToFile("FirstReMIX_SaveCharacter_"..ToEnumShortString(PLAYER_2), '1');
		end;
		return ReadPrefFromFile("FirstReMIX_SaveCharacter_"..ToEnumShortString(PLAYER_2));
	end;
end;

local MenuState = {
	PlayerNumber_P1 = {
		CurIndex = 1,
		Weight = LoadkgP1(),
		CharIndex = 0,
		LR = 0,
	},
	PlayerNumber_P2 = {
		CurIndex = 1,
		Weight = LoadkgP2(),
		CharIndex = 0,
		LR = 0,
	},
};

function GetModel()
	local ret = {};
	for i = 1, #Characters do
		local item = Def.ActorFrame {
			Def.Model{
				Materials = Characters[i]:GetModelPath();
				Meshes = Characters[i]:GetModelPath();
			--	Bones = Characters[i]:GetRestAnimationPath();
				Bones = THEME:GetPathB("ScreenProfileOptions","overlay/Random/_DDRPC_common_Rest.bones.txt");
				InitCommand=cmd(y,54;zoom,8.3;rotationy,180;cullmode,'CullMode_None';rate,1);
			};
		};
		table.insert( ret, item );
	end;
	return ret;
end;

function LoadPlayerStuff(Player)
	local ret = {};
	local pn = (Player == PLAYER_1) and 1 or 2;
	local t = Def.ActorFrame;
	
	t = Def.ActorFrame {
		Name = 'BigFrame';
		LoadActor("CardFrameBase") .. {
			InitCommand=cmd(y,9);
		};
		LoadFont("_serpentinedbol 19px") .. {
			InitCommand=cmd(settext,"PLAYER:"..pn;diffuse,PlayerColor(Player);x,0;y,-248;zoomx,1;zoomy,1;strokecolor,color("#000000"));
		};
	};
	table.insert( ret, t );
	
	t = Def.ActorFrame {
		Name = 'JoinFrame';
		LoadActor("wait") .. {
			InitCommand=function(self)
				if GAMESTATE:IsHumanPlayer(Player) then
					self:visible(false)
				else
					self:visible(true)
				end;
			--	(cmd(y,9;shadowlength,1;diffusealpha,0.75;diffuseshift;effectcolor1,1,1,1,0.5;effectcolor2,0,0,0,0.5;effectperiod,2))(self)
				(cmd(y,9;diffusealpha,1;bob;effectperiod,1))(self)
			end;
			OnCommand=function(self)
				if PROFILEMAN:GetNumLocalProfiles() ~= 1 then
					self:zoomx(0);
					self:linear(0.25);
					self:zoomx(1);
				end;
			end;
		};
	};
	table.insert( ret, t );
	
	t = Def.ActorFrame {
		Name = 'WideFrame';
		InitCommand=cmd(visible,false);
		-- Character Back
		Def.Quad {
			InitCommand=cmd(y,-83;diffuse,color("#000000");diffusealpha,0.5;zoomto,348,292);
		};
--[[		-- Character HeaderText Back
		LoadFont("_arial normal 24px")..{
			InitCommand=cmd(x,1;y,-216;zoom,1;diffusetopedge,color("#ffffff");diffusebottomedge,color("#ff33ff");strokecolor,color("#000000"));
			BeginCommand=function(self)
				self:settext(THEME:GetString("ScreenProfileOptions","SetCharacter"))
			end;
		};]]--
		-- Character HeaderText
		LoadFont("_arial normal 24px")..{
			InitCommand=cmd(y,-216;zoom,1;strokecolor,color("#000000"));
			BeginCommand=function(self)
				self:settext(THEME:GetString("ScreenProfileOptions","SetCharacter"))
			end;
		};
		-- Weight Back
		Def.Quad {
			InitCommand=cmd(y,138;diffuse,color("#000000");diffusealpha,0.5;zoomto,350,150);
		};
		-- Weight HeaderText Back
		LoadActor("Bg")..{
			InitCommand=cmd(x,0;y,0);
			BeginCommand=function(self)
				self:settext(THEME:GetString("ScreenProfileOptions","SetWeight"))
			end;
		};
		-- Weight HeaderText " set yout weight "
		LoadFont("_arial normal 24px")..{
			InitCommand=cmd(y,63;zoom,0.8;strokecolor,color("#000000"));
			BeginCommand=function(self)
				self:settext(THEME:GetString("ScreenProfileOptions","SetWeight"))
			end;
		};
		-- Weight Explanation Text
		LoadFont("_arial normal 24px")..{
			InitCommand=cmd(maxwidth,347;y,160;zoom,0.8;diffuse,color("#ffff00");strokecolor,color("#000000"));
			BeginCommand=function(self)
				if Player == PLAYER_1 then
					if LoadkgP1() == "0" then
						self:settext(THEME:GetString("ScreenProfileOptions","WeightExplanation"))
					else
						self:settext(THEME:GetString("ScreenProfileOptions","WeightExplanation2"))
					end;
				else
					if LoadkgP2() == "0" then
						self:settext(THEME:GetString("ScreenProfileOptions","WeightExplanation"))
					else
						self:settext(THEME:GetString("ScreenProfileOptions","WeightExplanation2"))
					end;
				end;
			end;
		};
		-- Under bar big
		LoadActor("ExplBar") .. {
			InitCommand=cmd(y,244);
		};
--		-- Help text
--		LoadFont("Common Normal") .. {
--			Text=THEME:GetString(Var "LoadingScreen","HelpText");
--			InitCommand=cmd(horizalign,left;x,-125;y,186;zoomx,0.68;zoomy,WideScale(0.58,0.51));
--		};
	};
	table.insert( ret, t );
	
	-- CursorIndex Test
	t = LoadFont("Common Normal") .. {
		Name = 'CursorIndex';
		InitCommand=cmd(x,0;y,-174;zoom,0;strokecolor,color("#000000"));
	};
	table.insert( ret, t );
	
	-- Character
	t = Def.ActorFrame{
		Name = 'Character';
		InitCommand=cmd(y,-109;visible,false);
		-- Character Frame
		LoadActor("OptionFrame")..{
			InitCommand=cmd(y,-80);
		};
	};
	table.insert( ret, t );
	
	-- Character Set
	t = LoadFont("common normal")..{
		Name = 'CharaSet';
		InitCommand=cmd(y,-189;diffuse,color("#ffffff");zoom,0.9;visible,false);
		BeginCommand=function(self)
			if #Characters == 0 then
				self:settext(THEME:GetString("ScreenProfileOptions","NoCharacter"))
			else
				self:settext(Characters[MenuState[Player].CharIndex]:GetCharacterID())
			end;
		end;
	};
	table.insert( ret, t );
	
	-- Character Model
	t = Def.ActorScroller{
		Name = 'Model';
		NumItemsToDraw=1;
		InitCommand=cmd(y,-50;zoom,1.3;SetFastCatchup,true;SetSecondsPerItem,0.00001;visible,false);
		TransformFunction=function(self, offset, itemIndex, numItems)
			self:visible(false);
			self:x(math.floor( offset*63 ));
		end;
		children = GetModel();
	};
	table.insert( ret, t );
	
	-- RandomModel Test
	t = Def.Model{
		Name = 'RandomModel';
		Materials = THEME:GetPathB("ScreenProfileOptions","overlay/Random/model.txt");
		Meshes = THEME:GetPathB("ScreenProfileOptions","overlay/Random/model.txt");
		Bones = THEME:GetPathB("ScreenProfileOptions","overlay/Random/_DDRPC_common_Rest.bones.txt");
		InitCommand=cmd(y,0;zoom,10;cullmode,'CullMode_None';rate,1;visible,false);
	--	InitCommand=cmd(y,54;zoom,-8.3;zoomy,8.3;rotationy,180;cullmode,'CullMode_None';rate,1);
	};
	table.insert( ret, t );
	
	-- Weight
	t = Def.ActorFrame{
		Name = 'Weight';
		InitCommand=cmd(y,125;visible,false);
		-- Weight Frame
		LoadActor("OptionFrame")..{
			InitCommand=cmd(y,-36);
		};
	};
	table.insert( ret, t );
	
	-- Weight Set
	t = LoadFont("ScreenProfileOptions Weight")..{
		Name = 'WeightSet';
		InitCommand=cmd(y,88;diffuse,color("#999999");zoom,0.8;visible,false);
		BeginCommand=function(self)
			if Player == PLAYER_1 then
				if LoadkgP1() == "0" then
					self:settext(THEME:GetString("ScreenProfileOptions","NotSetWeight"))
				else
					self:settext(THEME:GetString("ScreenProfileOptions","ConfiguredWeight"))
				end;
			else
				if LoadkgP2() == "0" then
					self:settext(THEME:GetString("ScreenProfileOptions","NotSetWeight"))
				else
					self:settext(THEME:GetString("ScreenProfileOptions","ConfiguredWeight"))
				end;
			end;
		end;
	};
	table.insert( ret, t );

	return ret;
end;

function UpdateInternal3(self, Player)
	local pn = (Player == PLAYER_1) and 1 or 2;
	local frame = self:GetChild(string.format('P%uFrame', pn));
	local joinframe = frame:GetChild('JoinFrame');
	local WideFrame = frame:GetChild('WideFrame');
	local bigframe = frame:GetChild('BigFrame');
	
	local CursorIndex = frame:GetChild('CursorIndex');
	local RandomModel = frame:GetChild('RandomModel');
	local Character = frame:GetChild('Character');
	local CharaSet = frame:GetChild('CharaSet');
	local Weight = frame:GetChild('Weight');
	local WeightSet = frame:GetChild('WeightSet');
	local Model = frame:GetChild('Model');

	if GAMESTATE:IsHumanPlayer(Player) then
		frame:visible(true);
		WideFrame:visible(true);
		
		CursorIndex:visible(true);
		CursorIndex:settext(MenuState[Player].CurIndex);
		Character:visible(true);
		CharaSet:visible(true);
		Weight:visible(true);
		WeightSet:visible(true);
		Model:visible(true);
		
		if #Characters ~= 0 then
			local char = MenuState[Player].CharIndex;
			if char == "Blank" then
				CharaSet:settext(THEME:GetString("ScreenProfileOptions","NoCharacter"))
				RandomModel:visible(false);
			elseif char == "Random" then
				CharaSet:settext("Random")
				RandomModel:visible(true);
			else
				CharaSet:settext(Characters[char]:GetCharacterID())
				RandomModel:visible(false);
			end;
			
			local char = MenuState[Player].CharIndex;
			if char == "Random" or char == "Blank" then
				Model:visible(false)
			else
				Model:SetDestinationItem(char-1);
				Model:visible(true)
			end;
		end;
		
		local weight = MenuState[Player].Weight;
		local lr = MenuState[Player].LR;
		
		if MenuState[Player].CurIndex == 1 then
			Character:diffuse(color("#ffffff"))
			CharaSet:diffuse(color("#ffffff"))
				Model:diffuse(color("#ffffff"))
				if lr == 1 then
					Model:finishtweening();
					Model:rotationy(0)
					Model:linear(6*100)
					Model:rotationy(360*100)
				elseif lr == 2 then
					Model:finishtweening();
					Model:rotationy(0)
					Model:linear(6*100)
					Model:rotationy(-360*100)
				else
					Model:finishtweening();
					Model:rotationy(0)
				end;
		--	RandomModel:diffuse(color("#ffffff"))
			Weight:diffuse(color("#555555"))
			WeightSet:diffuse(color("#999999"))
			WeightSet:settext(THEME:GetString("ScreenProfileOptions","ConfiguredWeight"))
		elseif MenuState[Player].CurIndex == 2 then
			Character:diffuse(color("#555555"))
			CharaSet:diffuse(color("#999999"))
				Model:diffuse(color("#555555"))
				Model:finishtweening();
				Model:rotationy(0)
		--	RandomModel:diffuse(color("#555555"))
			Weight:diffuse(color("#ffffff"))
			WeightSet:diffuse(color("#ffffff"))
			if weight == "0" then
				WeightSet:settext(string.format("%05.1f kg",50))
			else
				WeightSet:settext(string.format("%05.1f kg",weight))
			end;
		end
		
		if GAMESTATE:IsAnyHumanPlayerUsingMemoryCard(Player) then
			SCREENMAN:GetTopScreen():SetProfileIndex(Player, 0);
		else
			SCREENMAN:GetTopScreen():SetProfileIndex(Player, getenv("SetProfileIndex"..ToEnumShortString(Player)))
		end;
	--	SCREENMAN:GetTopScreen():SetProfileIndex(PLAYER_2, 1)
	else
		joinframe:visible(true);
		WideFrame:visible(false);
		CursorIndex:visible(false);
		RandomModel:visible(false);
		Character:visible(false);
		CharaSet:visible(false);
		Weight:visible(false);
		WeightSet:visible(false);
		Model:visible(false);
	end;
	bigframe:visible(true);
end;

local t = Def.ActorFrame {

	InitCommand=function(self)
		-- LoadCharacterP1P2が数字の場合、そのまま代入すると最初が動かないので暫定処置をしておく、その他の処置も。
		if GAMESTATE:IsHumanPlayer(PLAYER_1) then
			local char1 = MenuState[PLAYER_1].CharIndex;
			if LoadCharacterP1() ~= "Blank" and LoadCharacterP1() ~= "Random" then
				-- セーブしたキャラ数よりもキャラクターが減っていた場合の処置
				if #Characters < (char1 + LoadCharacterP1()) then
					MenuState[PLAYER_1].CharIndex = 1
				else
					MenuState[PLAYER_1].CharIndex = char1 + LoadCharacterP1()
				end;
			else
				-- 前にランダムを選択していたが、キャラが1人になっていたときの処置(1人の時はランダムが出ないようになっている)
				if #Characters == 1 and LoadCharacterP1() == "Random" then
					MenuState[PLAYER_1].CharIndex = 1
				else
					MenuState[PLAYER_1].CharIndex = LoadCharacterP1()
				end;
			end;
		end;
		if GAMESTATE:IsHumanPlayer(PLAYER_2) then
			local char2 = MenuState[PLAYER_2].CharIndex;
			if LoadCharacterP2() ~= "Blank" and LoadCharacterP2() ~= "Random" then
				if #Characters < (char2 + LoadCharacterP2()) then
					MenuState[PLAYER_2].CharIndex = 1
				else
					MenuState[PLAYER_2].CharIndex = char2 + LoadCharacterP2()
				end;
			else
				if #Characters == 1 and LoadCharacterP2() == "Random" then
					MenuState[PLAYER_2].CharIndex = 1
				else
					MenuState[PLAYER_2].CharIndex = LoadCharacterP2()
				end;
			end;
		end;
	end;
	
	StorageDevicesChangedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' then
			--[[
			if not GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -1);
			else
				SCREENMAN:GetTopScreen():Finish();
			end;
			--]]
			if GAMESTATE:IsHumanPlayer(PLAYER_1) and GAMESTATE:IsHumanPlayer(PLAYER_2) then
			
				local weightP1 = MenuState[PLAYER_1].Weight
				local weightP2 = MenuState[PLAYER_2].Weight
				
				if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
					WritePrefToFile("FirstReMIX_Savekg_"..profileGUIDP1, weightP1);
				else
					WritePrefToFile("FirstReMIX_Savekg_"..ToEnumShortString(PLAYER_1), weightP1);
				end;
				if PROFILEMAN:IsPersistentProfile(PLAYER_2) then
					WritePrefToFile("FirstReMIX_Savekg_"..profileGUIDP2, weightP2);
				else
					WritePrefToFile("FirstReMIX_Savekg_"..ToEnumShortString(PLAYER_2), weightP2);
				end;
				
				if weight ~= 0 then
					PROFILEMAN:GetProfile(PLAYER_1):SetWeightPounds(weightP1/0.45359237);
					PROFILEMAN:GetProfile(PLAYER_2):SetWeightPounds(weightP2/0.45359237);
				end;
				
				if #Characters ~= 0 then
					local GetCharIndexP1 = MenuState[PLAYER_1].CharIndex;
					local GetCharIndexP2 = MenuState[PLAYER_2].CharIndex;
					if GetCharIndexP1 == "Random" then
						GAMESTATE:SetCharacter(PLAYER_1,CHARMAN:GetRandomCharacter():GetCharacterID());
					elseif GetCharIndexP1 ~= "Blank" then
						GAMESTATE:SetCharacter(PLAYER_1,Characters[GetCharIndexP1]:GetCharacterID());
					end;
					if GetCharIndexP2 == "Random" then
						GAMESTATE:SetCharacter(PLAYER_2,CHARMAN:GetRandomCharacter():GetCharacterID());
					elseif GetCharIndexP2 ~= "Blank" then
						GAMESTATE:SetCharacter(PLAYER_2,Characters[GetCharIndexP2]:GetCharacterID());
					end;
					
					if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
						WritePrefToFile("FirstReMIX_SaveCharacter_"..profileGUIDP1, GetCharIndexP1);
					else
						WritePrefToFile("FirstReMIX_SaveCharacter_"..ToEnumShortString(PLAYER_1), GetCharIndexP1);
					end;
					if PROFILEMAN:IsPersistentProfile(PLAYER_2) then
						WritePrefToFile("FirstReMIX_SaveCharacter_"..profileGUIDP2, GetCharIndexP2);
					else
						WritePrefToFile("FirstReMIX_SaveCharacter_"..ToEnumShortString(PLAYER_2), GetCharIndexP2);
					end;
					
				end;
			elseif GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local weight = MenuState[params.PlayerNumber].Weight
				if PROFILEMAN:IsPersistentProfile(params.PlayerNumber) then
					if params.PlayerNumber == PLAYER_1 then
						WritePrefToFile("FirstReMIX_Savekg_"..profileGUIDP1, weight);
					else
						WritePrefToFile("FirstReMIX_Savekg_"..profileGUIDP2, weight);
					end;
				else
					WritePrefToFile("FirstReMIX_Savekg_"..ToEnumShortString(params.PlayerNumber), weight);
				end;
				if weight ~= 0 then
					PROFILEMAN:GetProfile(params.PlayerNumber):SetWeightPounds(weight/0.45359237);
				end;
				
				if #Characters ~= 0 then
					local GetCharIndex = MenuState[params.PlayerNumber].CharIndex;
					if GetCharIndex == "Random" then
						GAMESTATE:SetCharacter(params.PlayerNumber,CHARMAN:GetRandomCharacter():GetCharacterID());
					elseif GetCharIndex ~= "Blank" then
						GAMESTATE:SetCharacter(params.PlayerNumber,Characters[GetCharIndex]:GetCharacterID());
					end;
					if PROFILEMAN:IsPersistentProfile(params.PlayerNumber) then
						if params.PlayerNumber == PLAYER_1 then
							WritePrefToFile("FirstReMIX_SaveCharacter_"..profileGUIDP1, GetCharIndex);
						else
							WritePrefToFile("FirstReMIX_SaveCharacter_"..profileGUIDP2, GetCharIndex);
						end;
					else
						WritePrefToFile("FirstReMIX_SaveCharacter_"..ToEnumShortString(params.PlayerNumber), GetCharIndex);
					end;
				end;
			end;
			MESSAGEMAN:Broadcast("StartButton");
		--	SCREENMAN:GetTopScreen():Finish();
		end;
		if params.Name == 'Up' then
			local curIndex = MenuState[params.PlayerNumber].CurIndex
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				if curIndex == 2 then
					MenuState[params.PlayerNumber].CurIndex = 1
					MESSAGEMAN:Broadcast("DirectionButton");
					if params.PlayerNumber == PLAYER_1 then
						self:queuecommand('UpdateInternalP1');
					else
						self:queuecommand('UpdateInternalP2');
					end;
				--	self:queuecommand('UpdateInternal2');
				end
			end;
		end;
		if params.Name == 'Down' then
			local curIndex = MenuState[params.PlayerNumber].CurIndex
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				if curIndex == 1 then
					MenuState[params.PlayerNumber].CurIndex = 2
					MESSAGEMAN:Broadcast("DirectionButton");
					if params.PlayerNumber == PLAYER_1 then
						self:queuecommand('UpdateInternalP1');
					else
						self:queuecommand('UpdateInternalP2');
					end;
				--	self:queuecommand('UpdateInternal2');
					MenuState[params.PlayerNumber].LR = 0
				end
			end;
		end;
		if params.Name == 'Left' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local curIndex = MenuState[params.PlayerNumber].CurIndex
				if curIndex == 1 then
					if #Characters ~= 0 then
						local idx = MenuState[params.PlayerNumber].CharIndex
						if idx == 1 then
							idx = "Blank"
						elseif idx == "Blank" then
							if #Characters > 1 then
								idx = "Random"
							else
								idx = 1
							end;
						elseif idx == "Random" then
							idx = #Characters
						else
							idx = idx - 1
						end
						MenuState[params.PlayerNumber].CharIndex = idx
						MESSAGEMAN:Broadcast("LRButton");
					end
					MenuState[params.PlayerNumber].LR = 1
				elseif curIndex == 2 then
					local weight = MenuState[params.PlayerNumber].Weight;
					if weight == "0" then
						weight = 50 - 0.1
					else
						weight = weight - 0.1
					end
					-- ↓これを上に合わせると、体重設定済みでは一番最初が動かない、MenuState Weight に数字ではなく関数を代入したのが原因らしい
					if weight < 10.1 then
						weight = 10
					else
						MESSAGEMAN:Broadcast("LRButton");
					end;
					MenuState[params.PlayerNumber].Weight = weight
				end
				if params.PlayerNumber == PLAYER_1 then
					self:queuecommand('UpdateInternalP1');
				else
					self:queuecommand('UpdateInternalP2');
				end;
			--	self:queuecommand('UpdateInternal2');
			end;
		end;
		if params.Name == 'Right' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local curIndex = MenuState[params.PlayerNumber].CurIndex
				if curIndex == 1 then
					if #Characters ~= 0 then
						local idx = MenuState[params.PlayerNumber].CharIndex
						if idx == #Characters then
							if #Characters > 1 then
								idx = "Random"
							else
								idx = "Blank"
							end;
						elseif idx == "Random" then
							idx = "Blank"
						elseif idx == "Blank" then
							idx = 1
						else
							idx = idx + 1
						end
						MenuState[params.PlayerNumber].CharIndex = idx
						MESSAGEMAN:Broadcast("LRButton");
					end;
					MenuState[params.PlayerNumber].LR = 2
				elseif curIndex == 2 then
					local weight = MenuState[params.PlayerNumber].Weight;
					if weight == "0" then
						weight = 50 + 0.1
					else
						weight = weight + 0.1
					end
					MenuState[params.PlayerNumber].Weight = weight
					MESSAGEMAN:Broadcast("LRButton");
				end
				if params.PlayerNumber == PLAYER_1 then
					self:queuecommand('UpdateInternalP1');
				else
					self:queuecommand('UpdateInternalP2');
				end;
			--	self:queuecommand('UpdateInternal2');
			end;
		end;
		if params.Name == 'Back' then
			MESSAGEMAN:Broadcast("BackButton");
			SCREENMAN:GetTopScreen():Cancel();
		end;
	end;

	PlayerJoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	PlayerUnjoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	OnCommand=function(self)
		self:queuecommand('UpdateInternal2');
	end;

	UpdateInternal2Command=function(self)
		UpdateInternal3(self, PLAYER_1);
		UpdateInternal3(self, PLAYER_2);
	end;
	
	UpdateInternalP1Command=function(self)
		UpdateInternal3(self, PLAYER_1);
	end;
	UpdateInternalP2Command=function(self)
		UpdateInternal3(self, PLAYER_2);
	end;

	-- フレーム全体の動き -- position of all thing together for each player
	children = {
		Def.ActorFrame {
			Name = 'P1Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y);
			StartButtonMessageCommand=cmd(linear,0.25;zoomy,0);
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd())(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_1);
		};
		Def.ActorFrame {
			Name = 'P2Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X+220;y,SCREEN_CENTER_Y);
			StartButtonMessageCommand=cmd(linear,0.25;zoomy,0);
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd())(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_2);
		};
		-- sounds
		LoadActor( THEME:GetPathS("Common","start") )..{
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Common","cancel") )..{
			BackButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("ScreenSelectStyle","change") )..{
			DirectionButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Common","value") )..{
			LRButtonMessageCommand=cmd(play);
		};
		-- Off Black
		Def.Quad {
			InitCommand=cmd(diffuse,color("#000000");diffusealpha,0;scaletocover,SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM);
			StartButtonMessageCommand=function(self)
				self:sleep(0.1);
				self:linear(0.25);
				self:diffusealpha(1);
				self:queuecommand('Finish');
			end;
			FinishCommand=function(self)
				SCREENMAN:GetTopScreen():Finish();
			end;
		};
		
	};
};

return t;