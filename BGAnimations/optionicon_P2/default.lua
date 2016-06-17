return Def.ActorFrame {
	-- Speed
	Def.Sprite {
		OnCommand=function(self)
			self:x(-85);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'1x') and SCREENMAN:GetTopScreen():GetScreenType() == "ScreenType_Gameplay" then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x1_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'1.5x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x1_5_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'2x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x2_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'2.5x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x2_5_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'3x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x3_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'3.5x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x3_5_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'4x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x4_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'4.5x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x4_5_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'5x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x5_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'5.5x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x5_5_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'6x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x6_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'6.5x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x6_5_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'7x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x7_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'7.5x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x7_5_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'8x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x8_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'0.5x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x0_5_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'0.25x') then
				self:Load(THEME:GetPathB("","optionicon_P2/speed_x0_25_P2"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:playcommand("On");
			end;
		end;
		CodeMessageCommand=function(self, params)
			if params.PlayerNumber == PLAYER_2 then
				self:playcommand("On");
			end;
		end;
	};
	-- Boost
	Def.Sprite {
		InitCommand=function(self)
			self:x(-68);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'boost') then
				self:Load(THEME:GetPathB("","optionicon_P2/boost_on_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'brake') then
				self:Load(THEME:GetPathB("","optionicon_P2/boost_brake_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'wave') then
				self:Load(THEME:GetPathB("","optionicon_P2/boost_wave_P2"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:playcommand("Init");
			end;
		end;
	};
	-- Appearance
	Def.Sprite {
		InitCommand=function(self)
			self:x(-51);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'hidden') then
				self:Load(THEME:GetPathB("","optionicon_P2/appearance_hidden_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'sudden') then
				self:Load(THEME:GetPathB("","optionicon_P2/appearance_sudden_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'stealth') then
				self:Load(THEME:GetPathB("","optionicon_P2/appearance_stealth_P2"));
			else
				if GAMESTATE:GetPlayMode() ~= "PlayMode_Oni" and GAMESTATE:GetPlayMode() ~= "PlayMode_Rave" then
					local loadhidsud = PlayerOptionsAppearance(PLAYER_2);
					if loadhidsud == "HiddenPlus" then
						self:Load(THEME:GetPathB("","optionicon_P2/appearance_hiddenplus_P2"));
					elseif loadhidsud == "SuddenPlus" then
						self:Load(THEME:GetPathB("","optionicon_P2/appearance_suddenplus_P2"));
					elseif loadhidsud == "HiddenSuddenPlus" then
						self:Load(THEME:GetPathB("","optionicon_P2/appearance_hiddensuddenplus_P2"));
					end;
				end;
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:playcommand("Init");
			end;
		end;
	};
	-- Turn
	Def.Sprite {
		InitCommand=function(self)
			self:x(-34);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'mirror') then
				self:Load(THEME:GetPathB("","optionicon_P2/turn_mirror_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'left') then
				self:Load(THEME:GetPathB("","optionicon_P2/turn_left_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'right') then
				self:Load(THEME:GetPathB("","optionicon_P2/turn_right_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'shuffle') then
				self:Load(THEME:GetPathB("","optionicon_P2/turn_shuffle_P2"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:playcommand("Init");
			end;
		end;
	};
	-- Dark
	Def.Sprite {
		InitCommand=function(self)
			self:x(-17);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'dark') then
				self:Load(THEME:GetPathB("","optionicon_P2/dark_on_P2"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:playcommand("Init");
			end;
		end;
	};
	-- Scroll
	Def.Sprite {
		InitCommand=function(self)
			self:x(0);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'reverse') then
				self:Load(THEME:GetPathB("","optionicon_P2/scroll_reverse_P2"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:playcommand("Init");
			end;
		end;
	};
	-- Arrow
	Def.Sprite {
		InitCommand=function(self)
			self:x(17);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'NORMAL-FLAT')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'CLASSIC-FLAT')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'SOLO-FLAT')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'PS3-FLAT') then
				self:Load(THEME:GetPathB("","optionicon_P2/arrow_flat_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'NORMAL-NOTE')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'CLASSIC-NOTE')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'SOLO-NOTE')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'PS3-NOTE') then
				self:Load(THEME:GetPathB("","optionicon_P2/arrow_note_P2"));
			elseif GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'NORMAL-RAINBOW')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'CLASSIC-RAINBOW')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'SOLO-RAINBOW')
			or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'PS3-RAINBOW') then
				self:Load(THEME:GetPathB("","optionicon_P2/arrow_rainbow_P2"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:playcommand("Init");
			end;
		end;
	};
	-- Cut
	Def.Sprite {
		InitCommand=function(self)
			self:x(34);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'little') then
				self:Load(THEME:GetPathB("","optionicon_P2/cut_on_P2"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:playcommand("Init");
			end;
		end;
	};
	-- Freeze arrow
	Def.Sprite {
		InitCommand=function(self)
			self:x(51);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'noholds') then
				self:Load(THEME:GetPathB("","optionicon_P2/freeze_arrow_off_P2"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:playcommand("Init");
			end;
		end;
	};
	-- Jump
	Def.Sprite {
		InitCommand=function(self)
			self:x(68);
			if GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'nojumps') then
				self:Load(THEME:GetPathB("","optionicon_P2/jump_off_P2"));
			end;
		end;
		PlayerJoinedMessageCommand=function(self, params)
			if params.Player == PLAYER_2 then
				self:playcommand("Init");
			end;
		end;
	};
};