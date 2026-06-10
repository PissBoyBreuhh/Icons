Icons.Icon = SMODS.GameObject:extend {
    obj_table = Icons.Icons,
    set = "Icons",
    required_params = {
        "key"
    },

    inject = function(self)
        if not self.key then sendErrorMessage("Missing key!","ICONS") return end
        self.atlas = self.atlas or 'Joker'
        self.pos = self.pos or {x = 0, y = 0}
        self.targets = self.targets or {self.key}
    
        Icons.Icons[SMODS.current_mod.prefix..'_'..self.key] = {
            key = SMODS.current_mod.prefix..'_'..self.key,
            original_key = self.key,
            atlas = self.atlas,
            pos = self.pos,
            targets = self.targets
        }
        sendDebugMessage(("Icon %s has been registered"):format(self.key),"ICONS")
    end
}

-- misc_functions.lua has localize(), init_localization(), loc_parse_string()
-- game.lua has G.localization line 993

function Icons.get_starting_index(obj)
    local c = 1
    for _,line in ipairs(G.localization.descriptions[obj.set][obj.key].text_parsed) do
        for i=1,#line do
            if line[i].control and line[i].control.element then
                c = c + 1
            end
        end
    end
    return c
end

function Icons.get_needed_icons(args)
    args.set = args.set or 'Other'
    if not args or not args.set or not args.key then return {} end
    if not G.localization.descriptions[args.set][args.key] then return {} end
    local c = {}
    for _,line in ipairs(G.localization.descriptions[args.set][args.key].text_parsed) do
        for i=1,#line do
            if line[i].control and line[i].control.element and line[i+1] then
                table.insert(c,Icons.get_icon_data(line[i+1].strings[1]))
            end
        end
    end
    return c
end

function Icons.get_element_count(t)
    local c = 0
    for i, v in ipairs(t) do
        for ii,vv in ipairs(v) do
            if vv.control and vv.control.element then c = c + 1 end
        end
    end
    return c
end

function Icons.get_icon_data(str)
    for i, v in pairs(Icons.Icons) do
        for ii,vv in ipairs(v.targets) do
            if str == vv then
                return {
                    atlas = v.atlas,
                    pos = v.pos
                }
            end
        end
    end
    return {
        atlas = 'Joker',
        pos = {x = 0, y = 0}
    }
end
