setenv("SetProfileIndexP1",1);
setenv("SetProfileIndexP2",1);

function GetLocalProfiles()
	local ret = {};
	
	for p = 0,PROFILEMAN:GetNumLocalProfiles()-1 do
		local profile=PROFILEMAN:GetLocalProfileFromIndex(p);

		local item = Def.ActorFrame {
			-- Gray Name frame
--			LoadActor("Gray_Dancer_Name");
			-- Gray Dancer Name header
--[[			LoadFont("Common Normal") .. {
				Text="DANCER NAME";
				InitCommand=cmd(diffuse,color("#999999");x,-75;y,-21;zoom,0.47);
			}; ]]--
			----- name  voltage freeze air etc ---
		    LoadFont("_arial Bold 24px") .. {
				Text="AIR" ;
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,-66;y,163;zoom,0;diffuse,color("0,0,0,1");ztest,true);
				OnCommand=cmd(sleep,0.4;linear,0.3;rotationz,720;diffusealpha,1;zoom,0.6;);
				OffCommand=cmd(linear,0.5;zoomy,0;diffusealpha,0);
			};
			LoadFont("_arial Bold 24px") .. {
				Text="VOLTAGE" ;
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,-100;y,84;zoom,0;diffuse,color("0,0,0,1");ztest,true);
				OnCommand=cmd(sleep,0.6;linear,0.3;rotationz,720;diffusealpha,1;zoom,0.58;zoomx,0.59);
				OffCommand=cmd(linear,0.5;zoomy,0;diffusealpha,0);
			};
			LoadFont("_arial Bold 24px") .. {
				Text="STREAM" ;
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,0;y,33;zoom,0;diffuse,color("0,0,0,1");ztest,true);
				OnCommand=cmd(sleep,0.8;linear,0.3;rotationz,720;diffusealpha,1;zoom,0.58);
				OffCommand=cmd(linear,0.5;zoomy,0;diffusealpha,0);
			};
			LoadFont("_arial Bold 24px") .. {
				Text="CHAOS" ;
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,99;y,84;zoom,0;diffuse,color("0,0,0,1");ztest,true);
				OnCommand=cmd(sleep,1;linear,0.3;rotationz,720;diffusealpha,1;zoom,0.58);
				OffCommand=cmd(linear,0.5;zoomy,0;diffusealpha,0);
			};
			LoadFont("_arial Bold 24px") .. {
				Text="FREEZE" ;
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,64;y,163;zoom,0;diffuse,color("0,0,0,1");ztest,true);
				OnCommand=cmd(sleep,1.2;linear,0.3;rotationz,720;diffusealpha,1;zoom,0.6);
				OffCommand=cmd(linear,0.5;zoomy,0;diffusealpha,0);
			};
			LoadActor("RadarFrame") .. {
				InitCommand=cmd(diffusealpha,0;shadowlength,1;x,5;y,100;zoom,0;diffuse,color("0,0,0,1");ztest,true);
				OnCommand=cmd(x,5;y,100;sleep,1.2;linear,0.3;rotationz,720;diffusealpha,1;zoom,0.85);
				OffCommand=cmd(x,5;y,100;linear,0.5;zoomy,0;diffusealpha,0);
			};
			-- Gray Dancer Name
			LoadFont("Common Normal") .. {
				Text="RADAR NOT AVAILABLE YET";
				InitCommand=cmd(diffuse,color("#999999");maxwidth,334;shadowlength,1;y,110;zoomy,1;glowshift,1;ztest,true);
			};
			
			-- Played Songs header
			LoadFont("Common Normal") .. {
				Text=THEME:GetString(Var "LoadingScreen","NumTotalSongsPlayed");
				InitCommand=cmd(diffuse,color("#999999");x,-75;y,14;zoom,0.47);
			};
			-- Played Songs Number
			LoadFont("Common Normal") .. {
				InitCommand=cmd(diffuse,color("#999999");shadowlength,1;x,63;y,18.5;zoom,0.5;vertspacing,-8;ztest,true);
				BeginCommand=function(self)
					local numSongsPlayed = profile:GetNumTotalSongsPlayed();
					self:settext( numSongsPlayed );
				end;
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
		LoadActor("CardFrameBase");
	};
	table.insert( ret, t );
	
	--[[
	t = Def.ActorFrame {
		Name = 'JoinFrame';
		LoadActor(THEME:GetPathB("ScreenSelectStyle","overlay/Press_Start")) .. {
			InitCommand=cmd(shadowlength,1);
			OnCommand=cmd(diffusealpha,0.75;diffuseshift;effectcolor1,1,1,1,0.5;effectcolor2,0,0,0,0.5;effectperiod,2;);
			OffCommand=cmd(linear,0.25;zoomx,0);
		};
	};
	table.insert( ret, t );
	--]]

	t = Def.ActorFrame {
		Name = 'JoinFrame';
		Def.Sprite {
			InitCommand=function(self)
				if PROFILEMAN:GetNumLocalProfiles() ~= 1 then
--					self:Load(THEME:GetPathB("ScreenSelectStyle","overlay/Press_Start"));
					self:Load(THEME:GetPathB("ScreenSelectProfile","overlay/Start"));
				else
					self:Load(THEME:GetPathB("ScreenProfileOptions","overlay/Wait"));
				end;
			--	(cmd(shadowlength,1;diffusealpha,0.75;diffuseshift;effectcolor1,1,1,1,0.5;effectcolor2,0,0,0,0.5;effectperiod,2))(self)
	         	(cmd(diffusealpha,1;bob;effectmagnitude,0,5,0;effectperiod,0.5))(self)
			--    (cmd(sleep,0.3;zoomx,0;linear,0.3;diffusealpha,1;zoomx,1))(self);
			--	OnCommand=cmd(sleep,0.3;zoomx,0;linear,0.3;diffusealpha,1;zoomx,1;playcommand,"Animate");
			--	AnimateCommand=cmd(linear,0.25;zoomx,0.95;linear,0.25;zoomx,1;queuecommand,"Animate");
			end;
			OffCommand=function(self)
				if PROFILEMAN:GetNumLocalProfiles() ~= 1 then
					self:linear(0.25);
					self:zoomx(0);
				end;
			end;
		};
	};
	table.insert( ret, t );
	

	t = Def.ActorScroller{
		Name = 'Scroller';
		NumItemsToDraw=1;
-- 		InitCommand=cmd(y,-230/2+20;);
		OnCommand=cmd(y,-7;SetFastCatchup,true;SetMask,1000,0;SetSecondsPerItem,0.15);
		TransformFunction=function(self, offset, itemIndex, numItems)
			local focus = scale(math.abs(offset),0,2,1,0);
			self:visible(false);
			self:y(math.floor( offset*63 ));
-- 			self:zoomy( focus );
-- 			self:z(-math.abs(offset));
-- 			self:zoom(focus);
		end;
		OffCommand=cmd(linear,0.25;zoomx,0);
		children = GetLocalProfiles();
	};
	table.insert( ret, t );

	t = Def.ActorFrame {
		Name = 'SmallFrame';
		-- Name frame
		Def.ActorFrame {
			OffCommand=cmd(linear,0.25;zoomx,0);
			-- Frame
--[[			LoadActor("Dancer_Name") .. {
				InitCommand=cmd(y,-50);
			}; ]]--	
			-- Datacard Back
		    LoadActor("DataCard") .. {
			InitCommand=cmd(y,5;);
			OffCommand=cmd(zoom,0);
		    };
			------------------------------------- rotation Frame ---------
			-- CIRCLE LEVEL FRAME-----------------------------------------
		    LoadActor("CircleLevel") .. {
			InitCommand=cmd(x,-127;y,-68;shadowlength,0;zoomy,0);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoom,1;);
			OffCommand=cmd(linear,0.5;zoomy,0.100;diffusealpha,0);
		    };
		-- CIRCLE LEVEL FRAME---- Effect-
		    LoadActor("CircleLevel") .. {
			InitCommand=cmd(x,-127;y,-68;shadowlength,0;zoomy,0);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoom,1;glowshift,1);
			OffCommand=cmd(linear,0.5;zoomy,0.100;diffusealpha,0);
		    };
		-- Contour Level Frame --- Effect-
		    LoadActor("ContourLevel") .. {
			InitCommand=cmd(x,-127;y,-68;shadowlength,0;zoomy,0);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoom,1;spin;effectmagnitude,0,0,270);
			OffCommand=cmd(linear,0.5;zoomy,0.100;diffusealpha,0);
		    };
			--------------------------------------------------------------
			-- ENJOY LV CARD --
		    LoadActor("SongEnjoy") .. {
			InitCommand=cmd(x,0;y,-65;zoomy,0);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoom,1;);
			OffCommand=cmd(linear,0.5;zoomy,0;diffusealpha,0);
		    };
			-- DancerName header text
			LoadFont("Common Normal") .. {
				Text="DANCER NAME";
				InitCommand=cmd(diffuse,color("#fff90a");x,-100;y,-223;zoom,0.7;vertspacing,-8);
			};
			-- DancerName
			LoadFont("Common Normal") .. {
				Text="LOCALISATION";
				InitCommand=cmd(diffuse,color("#fff90a");x,-100;y,-160;zoomy,0.8;zoomx,0.7;vertspacing,-6);
			};
		};
		-- Top bar
		LoadActor("Bar") .. {
			InitCommand=cmd(y,-255;scaletoclipped,380,34);
			OffCommand=cmd(zoom,0);
		};
		
		-- Under bar big
		LoadActor("ExplBar") .. {
			InitCommand=cmd(y,235);
		};
--[[		-- Help text
		LoadFont("Common Normal") .. {
			Text=THEME:GetString(Var "LoadingScreen","HelpText");
			InitCommand=cmd(horizalign,left;x,-125;y,177;zoomx,0.68;zoomy,WideScale(0.58,0.51));
			OffCommand=cmd(zoom,0);
		}; ]]--
	};
	table.insert( ret, t );

	t = Def.ActorFrame {
		Name = 'CardFrame';
		InitCommand=cmd();
		-- Name frame
		LoadActor("Dancer_Name") .. {
			InitCommand=cmd(y,-8);
			OffCommand=cmd(linear,0.25;zoomx,0);
		};
		-- Under bar big
		LoadActor("BigBar") .. {
			InitCommand=cmd(y,177);
		};
		-- Help text card
		LoadFont("Common Normal") .. {
			Text=THEME:GetString(Var "LoadingScreen","HelpTextCard");
			InitCommand=cmd(y,177;zoomx,0.68;zoomy,WideScale(0.58,0.51));
			OffCommand=cmd(zoom,0);
		};
	};
	table.insert( ret, t );
	-- name profile
	t = LoadFont("_futura std medium 20px") .. {
		Name = 'SelectedProfileText';
		InitCommand=cmd(maxwidth,334;shadowlength,1;y,-198;zoomy,1.3;zoomx,1.3);
			OffCommand=cmd(linear,0.25;zoomx,0);
	};
	table.insert( ret, t );
	-- num of song played text
	t = LoadFont("_enjoysongnumber") .. {
		Name = 'NumTotalSongsPlayed';
		InitCommand=cmd(shadowlength,1;x,-127;y,-68;zoom,1;vertspacing,-8);
		OffCommand=cmd(zoomx,0);
	};
	table.insert( ret, t );
	--Player 1 and player 2 text
	t = LoadFont("_serpentinedbol 19px") .. {
		Name = 'PlayerText';
		InitCommand=cmd(settext,"PLAYER:"..pn;diffuse,PlayerColor(Player);x,0;y,-256;zoomx,1;zoomy,1;strokecolor,color("#000000"));
	};
	table.insert( ret, t );
	
	return ret;
end;

function UpdateInternal3(self, Player)
	local pn = (Player == PLAYER_1) and 1 or 2;
	local frame = self:GetChild(string.format('P%uFrame', pn));
	local scroller = frame:GetChild('Scroller');
	local seltext = frame:GetChild('SelectedProfileText');
	local NumSongtext = frame:GetChild('NumTotalSongsPlayed');
	local joinframe = frame:GetChild('JoinFrame');
	local smallframe = frame:GetChild('SmallFrame');
	local Cardframe = frame:GetChild('CardFrame');
	local bigframe = frame:GetChild('BigFrame');
	local playertext = frame:GetChild('PlayerText');

	if GAMESTATE:IsHumanPlayer(Player) then
		frame:visible(true);
		if MEMCARDMAN:GetCardState(Player) == 'MemoryCardState_none' then
			--using profile if any
			joinframe:visible(false);
			smallframe:visible(true);
			Cardframe:visible(false);
			seltext:visible(true);
			NumSongtext:visible(true);
			scroller:visible(true);
			local ind = SCREENMAN:GetTopScreen():GetProfileIndex(Player);
			if ind > 0 then
				scroller:SetDestinationItem(ind-1);
				seltext:settext(PROFILEMAN:GetLocalProfileFromIndex(ind-1):GetDisplayName());
				NumSongtext:settext(PROFILEMAN:GetLocalProfileFromIndex(ind-1):GetNumTotalSongsPlayed());			
			else
				if SCREENMAN:GetTopScreen():SetProfileIndex(Player, 1) then
					scroller:SetDestinationItem(0);
					self:queuecommand('UpdateInternal2');
				else
					joinframe:visible(false);
					smallframe:visible(true);
					Cardframe:visible(true);
--					text:visible(false);
					scroller:visible(false);
					seltext:settext('No profile');
				end;
			end;
		else
			--using card
			smallframe:visible(false);
			Cardframe:visible(true);
			scroller:visible(false);
			seltext:settext('CARD');
			seltext:visible(true);
			NumSongtext:visible(false);
			joinframe:visible(false);
			SCREENMAN:GetTopScreen():SetProfileIndex(Player, 0);
		end;
	else
		joinframe:visible(true);
		scroller:visible(false);
		seltext:visible(false);
		NumSongtext:visible(false);
		smallframe:visible(false);
		Cardframe:visible(false);
	end;
	bigframe:visible(true);
	playertext:visible(true);
end;

local t = Def.ActorFrame {

	StorageDevicesChangedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			if not GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				if PROFILEMAN:GetNumLocalProfiles() ~= 1 then
					SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -1);
					MESSAGEMAN:Broadcast("StartButton");
				end;
			else
				SCREENMAN:GetTopScreen():Finish();
				MESSAGEMAN:Broadcast("StartButton");
			end;
		end;
		if params.Name == 'Up' or params.Name == 'Up2' or params.Name == 'DownLeft' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 1 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind - 1 ) then
						setenv("SetProfileIndex"..ToEnumShortString(params.PlayerNumber),ind - 1);
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Down' or params.Name == 'Down2' or params.Name == 'DownRight' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 0 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind + 1 ) then
						setenv("SetProfileIndex"..ToEnumShortString(params.PlayerNumber),ind + 1);
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Back' then
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

	-- フレーム全体の動き
	children = {
		Def.ActorFrame {
			Name = 'P1Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y+9);
			OnCommand=cmd(zoomy,0;sleep,0.25;linear,0.25;zoomy,1);
		--	OffCommand=cmd(linear,0.25;zoomy,0);
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd())(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_1);
		};
		Def.ActorFrame {
			Name = 'P2Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X+220;y,SCREEN_CENTER_Y+9);
			OnCommand=cmd(zoomy,0;sleep,0.25;linear,0.25;zoomy,1);
		--	OffCommand=cmd(linear,0.25;zoomy,0);
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
	};
};

return t;