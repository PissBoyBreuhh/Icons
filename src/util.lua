Icons.default_apply = {
    strict = function (comp, str)
        return comp == str
    end,
    strict_no_case_sensitive = function (comp, str)
        if type(comp) ~= 'string' then return false end
        return comp:lower() == str:lower()
    end,
    -- where str is the word itself
    ['en-us'] = function (comp, str)
        if type(comp) ~= 'string' then return false end
        local punctuations = ',.;:()[]{}/!?'
        for i=1, #punctuations do
            if string.sub(comp,#comp,#comp) == string.sub(punctuations,i,i) then
                comp = string.sub(comp,1,#comp-1)
                break
            end
        end
        comp = string.lower(comp)
        return comp == str or string.sub(comp,#comp,#comp) == 's' and string.sub(comp,1,#comp-1) == str
    end
}

Icons.Icon = SMODS.GameObject:extend {
    obj_table = Icons.Icons,
    set = "Icons",
    required_params = {
        "key"
    },
    atlas = 'Joker',
    pos = {x = 0, y = 0},
    targets = {
        ['en-us'] = {
            {
                values = {},
                apply = Icons.default_apply['en-us']
            }
        }
    },
    register = function (self)
        if not self.key then sendErrorMessage("Missing key!","ICONS") return end
        for k, v in pairs(self.targets) do
            for _, vv in ipairs(v) do
                vv.values = vv.values
                vv.apply = Icons.default_apply[k]
            end
        end
        Icons.Icons[self.key] = self
        sendDebugMessage(("Icon %s has been registered"):format(self.key),"ICONS")
    end,
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
    if not G.localization.descriptions[args.set][args.key].icon_text_data then return {} end
    local c = {}
    if not G.localization.descriptions[args.set][args.key].icon_text_data.multi_box then
        for _,part in ipairs(G.localization.descriptions[args.set][args.key].icon_text_data or {}) do
            if not Icons.get_icon_data(part.string).err then
                table.insert(c,Icons.get_icon_data(part.string))
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
    for _, icon in pairs(Icons.Icons) do
        local lang = G.SETTINGS.language
        lang = icon.targets[lang] and lang or 'en-us'
        for _, v in ipairs(icon.targets[lang]) do
            for _, vv in ipairs(v.values) do
                if v.apply(str,vv) then
                    return {
                        atlas = icon.atlas,
                        pos = icon.pos
                    }
                end
            end
        end
    end
    return {
        atlas = 'Joker',
        pos = {x = 0, y = 0},
        err = true
    }
end
