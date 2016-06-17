return Def.Quad {
--	InitCommand=cmd(zoomtowidth,WideScale(256,350);zoomtoheight,16;diffuse,color("0.2,0.2,0.2,1");diffusetopedge,color("0.5,0.5,0.5,1"););
	InitCommand=function(self)
		local style = GAMESTATE:GetCurrentStyle():GetStyleType()
		if style == "StyleType_TwoPlayersTwoSides" then
			local fItemWidth = ( WideScale(256,350) )
			self:zoomtowidth(fItemWidth);
		else
			local mpn = GAMESTATE:GetMasterPlayerNumber();
			local bComboGraphic = ComboGraphic(mpn);
			if bComboGraphic == '2013' then
				local fItemWidth = ( WideScale(256,295) );
				self:zoomtowidth(fItemWidth);
			else
				local fItemWidth = ( WideScale(256,350) );
				self:zoomtowidth(fItemWidth);
			end
		end;
		self:zoomtoheight(16);
		self:diffuse(color("0.2,0.2,0.2,1"));
		self:diffusetopedge(color("0.5,0.5,0.5,1"));
	end;
};
