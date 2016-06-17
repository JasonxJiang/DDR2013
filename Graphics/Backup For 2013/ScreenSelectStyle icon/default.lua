local gc = Var("GameCommand");
local st = gc:GetStyle():GetStyleType();
local mpn = GAMESTATE:GetMasterPlayerNumber();
local max_stages = PREFSMAN:GetPreference( "SongsPerPlay" );
local pad_file = "";

if st == "StyleType_OnePlayerOneSide" or st == "StyleType_OnePlayerTwoSides" then
	pad_file = st .. " " .. mpn;
elseif st == "StyleType_TwoPlayersTwoSides" then
	pad_file = st;
else
	assert(0);
end

local CoinModePlusY = 15

local t = Def.ActorFrame {

	-- フットパネル
	LoadActor( "stage " .. gc:GetName() ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y+154);
		OffCommand=cmd(accelerate,0.075;zoom,0.75;decelerate,0.075;zoom,1;accelerate,0.075;zoom,0);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
	
	-- フットパネルライト	
	LoadActor( "stage_light " .. gc:GetName() ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y+154);
		OffCommand=cmd(accelerate,0.075;zoom,0.75;decelerate,0.075;zoom,1;accelerate,0.075;zoom,0);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};

	-- 1P2Pキャラクターアニメーション
	LoadActor( "1p2p " .. pad_file ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y+149);
		OffCommand=cmd(vertalign,bottom;sleep,0.1;accelerate,0.05;zoom,0.75;decelerate,0.05;zoom,1;accelerate,0.05;zoom,0);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);		
	};	
		
	-------------------------------------------------------------

	-- 右上表示まとめ	
	Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X+143;y,SCREEN_CENTER_Y-116;);
		OffCommand=cmd(decelerate,0.25;addx,SCREEN_WIDTH*0.6);
		GainFocusCommand=cmd(addx,-10;decelerate,0.1;addx,10;visible,true);
		LoseFocusCommand=cmd(visible,false);
		
		-- シングルとかダブルとかの大表示
		LoadActor( "Card_Frame") .. {
		};
	
		-- ステージ数、イベントモードの時は消す
		LoadFont( "Stage_max" ) .. {
			InitCommand=cmd(x,99;y,-54.5;zoom,0.55;horizalign,right;settext,max_stages;maxwidth,100);
			Condition=not GAMESTATE:IsEventMode();
		};
		
		-- イベントモード用ステージ数[-]
		LoadActor( "Stage_text_Event" ) .. {
			InitCommand=cmd(x,101;y,-54.5;zoom,0.55;horizalign,right);
			Condition=GAMESTATE:IsEventMode();
		};
		
		-- Card frame icon
		LoadActor( "card frame icon " .. gc:GetName() ) .. {
			InitCommand=cmd(x,145;y,-20);
		};
		
		-- Style header
		LoadFont("_serpentinedbol 19px") .. {
			Text=THEME:GetString(Var "LoadingScreen", gc:GetName() .. "Header");
			InitCommand=cmd(x,-153;y,-20;horizalign,left;diffuse,color("#fff90a");diffusealpha,0;skewx,-0.2;zoomx,2.05;zoomy,1.5);
			GainFocusCommand=cmd(diffusealpha,1);
			LoseFocusCommand=cmd(diffusealpha,0);
		};
		
		-- Explanation
		LoadFont("_tt-jtc win r4p 20px") .. {
			Text=THEME:GetString(Var "LoadingScreen", gc:GetName() .. "Explanation");
			InitCommand=cmd(x,-153;y,15;horizalign,left;skewx,-0.125;zoom,0.66;maxwidth,500);
		};
		
	};
	
	-------------------------------------------------------------

	-- Payモード専用のフレーム「1・2クレジットが必要です」
	LoadActor( "coin frame " .. st ) .. {
		InitCommand=cmd(x,SCREEN_CENTER_X+143;y,SCREEN_CENTER_Y-114;);
		OffCommand=cmd(decelerate,0.25;addx,SCREEN_WIDTH*0.6);
		GainFocusCommand=cmd(addx,-10;decelerate,0.1;addx,10;visible,true);
		LoseFocusCommand=cmd(visible,false);
		Condition = GAMESTATE:GetCoinMode() == "CoinMode_Pay";
	};

	-- Board Player1 Blue
	LoadActor("board P1") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+159)
			if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
				self:y(SCREEN_CENTER_Y+58+CoinModePlusY)
			else
				self:y(SCREEN_CENTER_Y+58)
			end
		end;
		OffCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.6);
		GainFocusCommand=function(self)
			if st == "StyleType_TwoPlayersTwoSides" then
				self:visible(true)
			elseif mpn == PLAYER_1 then
				self:visible(true)
			elseif mpn == PLAYER_2 then
				self:visible(false)
			end
		end;
		LoseFocusCommand=cmd(visible,false);
	};	

	-- Board Player2 Red
	LoadActor("board P2") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+159)
			if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
				self:y(SCREEN_CENTER_Y+58+CoinModePlusY)
			else
				self:y(SCREEN_CENTER_Y+58)
			end
		end;
		OffCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.6);
		GainFocusCommand=function(self)
			if st == "StyleType_TwoPlayersTwoSides" then
				self:visible(true)
				if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
					self:y(SCREEN_CENTER_Y+96.5+CoinModePlusY)
				else
					self:y(SCREEN_CENTER_Y+96.5)
				end
			elseif mpn == PLAYER_2 then
				self:visible(true)
			elseif mpn == PLAYER_1 then
				self:visible(false)
			end
		end;
		LoseFocusCommand=cmd(visible,false);
	};	

	-- Board Hint
	LoadActor("board Hint") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+159)
			if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
				self:y(SCREEN_CENTER_Y+96.5+CoinModePlusY)
			else
				self:y(SCREEN_CENTER_Y+96.5)
			end
		end;
		OffCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.6);
		GainFocusCommand=function(self)
			if GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit" or GAMESTATE:GetPremium() == "Premium_DoubleFor1Credit" then
				self:visible(false)
			elseif st == "StyleType_OnePlayerOneSide" then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
		LoseFocusCommand=cmd(visible,false);
	};	

	-- Board DoublesPremium
	LoadActor("board DoublesPremium") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+159)
			if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
				self:y(SCREEN_CENTER_Y+96.5+CoinModePlusY)
			else
				self:y(SCREEN_CENTER_Y+96.5)
			end
		end;
		OffCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.6);
		GainFocusCommand=function(self)
			if GAMESTATE:GetPremium() == "Premium_DoubleFor1Credit" then
				self:visible(true)
			else
				self:visible(false)
			end
		end;
		LoseFocusCommand=cmd(visible,false);
	};	

	-- Board JointPremium
	LoadActor("board JointPremium") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+159)
			if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
				self:y(SCREEN_CENTER_Y+96.5+CoinModePlusY)
			else
				self:y(SCREEN_CENTER_Y+96.5)
			end
		end;
		OffCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.6);
		GainFocusCommand=function(self)
			if GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit" and st == "StyleType_OnePlayerOneSide" or GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit" and st == "StyleType_OnePlayerTwoSides" then
				self:visible(true)
			elseif GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit" and st == "StyleType_TwoPlayersTwoSides" then
				self:visible(true)
				if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
					self:y(SCREEN_CENTER_Y+134.5+CoinModePlusY)
				else
					self:y(SCREEN_CENTER_Y+134.5)
				end
			else
				self:visible(false)
			end
		end;
		LoseFocusCommand=cmd(visible,false);
	};	
	
	-- Board text 1
	LoadFont("_tt-jtc win r4p 20px") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+26)
			if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
				self:y(SCREEN_CENTER_Y+53.5+CoinModePlusY)
			else
				self:y(SCREEN_CENTER_Y+53.5)
			end
			(cmd(diffuse,color("#fff90a");horizalign,left;vertalign,top;zoomx,0.66;zoomy,0.56;maxwidth,445))(self);
		end;
		OffCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.6);
		BeginCommand=function(self)
			if mpn == PLAYER_1 then
				self:settext(THEME:GetString(Var "LoadingScreen","P1START"))
			elseif mpn == PLAYER_2 and st == "StyleType_OnePlayerOneSide" or st == "StyleType_OnePlayerTwoSides" then
				self:settext(THEME:GetString(Var "LoadingScreen","P2START"))
			else
				self:settext(THEME:GetString(Var "LoadingScreen","P1START"))
			end
		end;
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
	
	-- Board text 2
	LoadFont("_tt-jtc win r4p 20px") .. {
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+26)
			if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
				self:y(SCREEN_CENTER_Y+91.5+CoinModePlusY)
			else
				self:y(SCREEN_CENTER_Y+91.5)
			end
			(cmd(diffuse,color("#fff90a");horizalign,left;vertalign,top;zoomx,0.66;zoomy,0.56;maxwidth,445))(self);
		end;
		OffCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.6);
		BeginCommand=function(self)
			if GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit" and st == "StyleType_OnePlayerOneSide" or GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit" and st == "StyleType_OnePlayerTwoSides" then
				self:settext(THEME:GetString(Var "LoadingScreen","Premium"))
			elseif GAMESTATE:GetPremium() == "Premium_DoubleFor1Credit" and st == "StyleType_OnePlayerOneSide" or GAMESTATE:GetPremium() == "Premium_DoubleFor1Credit" and st == "StyleType_OnePlayerTwoSides" then
				self:settext(THEME:GetString(Var "LoadingScreen","Double"))
			elseif st == "StyleType_TwoPlayersTwoSides" then
				self:settext(THEME:GetString(Var "LoadingScreen","P2START"))
			elseif mpn == PLAYER_1 and st == "StyleType_OnePlayerOneSide" then
				self:settext(THEME:GetString(Var "LoadingScreen","HintP1"))
			elseif mpn == PLAYER_2 and st == "StyleType_OnePlayerOneSide" then
				self:settext(THEME:GetString(Var "LoadingScreen","HintP2"))
			else
				self:settext("")
			end
		end;
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};
	
	-- Board text 3
	LoadFont("_tt-jtc win r4p 20px") .. {
	--	InitCommand=cmd(x,SCREEN_CENTER_X+26;y,SCREEN_CENTER_Y+130;diffuse,color("#fff90a");horizalign,left;vertalign,top;zoomx,0.66;zoomy,0.56;maxwidth,445); -- skewx,-0.125
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+26)
			if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
				self:y(SCREEN_CENTER_Y+130+CoinModePlusY)
			else
				self:y(SCREEN_CENTER_Y+130)
			end
			(cmd(diffuse,color("#fff90a");horizalign,left;vertalign,top;zoomx,0.66;zoomy,0.56;maxwidth,445))(self);
		end;
		OffCommand=cmd(linear,0.25;addx,SCREEN_WIDTH*0.6);
		BeginCommand=function(self)
			if GAMESTATE:GetPremium() == "Premium_2PlayersFor1Credit" and st == "StyleType_TwoPlayersTwoSides" then
				self:settext(THEME:GetString(Var "LoadingScreen","Premium"))
			end
		end;
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
	};	

	-------------------------------------------------------------
	
	-- 丸いアイコンまとめ
	Def.ActorFrame {
	--	InitCommand=cmd(x,SCREEN_CENTER_X+28+gc:GetIndex()*65;y,SCREEN_CENTER_Y-13);
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+28+gc:GetIndex()*65)
			if GAMESTATE:GetCoinMode() == "CoinMode_Pay" then
				self:y(SCREEN_CENTER_Y-13+CoinModePlusY)
			else
				self:y(SCREEN_CENTER_Y-13)
			end
		end;
		OffCommand=cmd(bouncebegin,0.125;zoom,0;runcommandsonleaves,cmd(diffusealpha,1;sleep,gc:GetIndex()/12;linear,.16;diffusealpha,0;););
		
		LoadActor( "icon_under " .. gc:GetName() ) .. {
			InitCommand=cmd(diffuse,color("#00ff00"));
			GainFocusCommand=cmd(diffuse,color("#00ff00");diffuseshift;effectcolor1,0,1,0,1;effectcolor2,0,0.8,0,1;effectperiod,0.25;);
			LoseFocusCommand=cmd(stopeffect;diffuse,color("#666666"));
		};

		LoadActor( "icon_panel " .. gc:GetName() ) .. {
			InitCommand=cmd();
			GainFocusCommand=cmd(visible,true);
			LoseFocusCommand=cmd(visible,false);
		};

		LoadActor( "icon " .. pad_file ) .. {
			InitCommand=cmd();
			GainFocusCommand=cmd(visible,true);
			LoseFocusCommand=cmd(visible,false);
		};
	};
	
};

return t;