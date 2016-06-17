--return LoadActor(THEME:GetPathB('','_frame 3x1'), 'Life_Frame_default', SCREEN_WIDTH*0.5-88) .. {
-- };
local t = Def.ActorFrame{};
local style = GAMESTATE:GetCurrentStyle():GetStyleType()

if style == "StyleType_TwoPlayersTwoSides" then
--	t[#t+1] = LoadActor(THEME:GetPathB('','_frame 3x1'), 'Life_Frame_default', SCREEN_WIDTH*0.5-88) .. {
	t[#t+1] = LoadActor("Life_Frame_2013")..{
	};
else
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
if GAMESTATE:IsPlayerEnabled(pn) then
			local bEXScore = EXScore(pn);
			local bComboGraphic = ComboGraphic(pn);
			local function flamePath()
				if bComboGraphic == '2013' then
					return "Life_Frame_2013";
				else
				--	return THEME:GetPathB('','_frame 3x1'), 'Life_Frame_default', SCREEN_WIDTH*0.5-88;
					return "Life_Frame_2013";
				end;
			end;
			t[#t+1] = LoadActor(flamePath())..{
				InitCommand=function(self)
					self:y(-1);
					if bComboGraphic == '2013' then
						self:x(0);
					else
						self:x(0);
					end;
				end;
			};
		end;
	end;
end;

return t;