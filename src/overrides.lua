local ref = loc_parse_string
function loc_parse_string(...)
    local parsed_line = ref(...) or {}
    if not G.Icons_temp_loc_process then return parsed_line end
    G.Icons_temp_loc_acc = G.Icons_temp_loc_acc or 1
    for i=1, #parsed_line do
        if parsed_line[i].control and parsed_line[i].control.element then G.Icons_temp_loc_acc = G.Icons_temp_loc_acc + 1 end
    end
    local i = 1
    while i <= #parsed_line do
        for _, icon in pairs(Icons.Icons) do
            local lang = G.SETTINGS.language
            lang = icon.targets[lang] and lang or 'en-us'
            for _, v in ipairs(icon.targets[lang]) do
                for _, vv in ipairs(v.values) do
                    if parsed_line[i] and parsed_line[i].strings[1] == vv then
                        table.insert(parsed_line,i,{strings = {}, control = {element = tostring(G.Icons_temp_loc_acc)}})
                        i = i + 1
                        G.Icons_temp_loc_acc = G.Icons_temp_loc_acc + 1
                    end
                end
            end
        end
        i = i + 1
    end
    return parsed_line
end

local ref = init_localization
function init_localization(...)
    local ret = ref(...)
    G.Icons_temp_loc_acc = nil
    G.Icons_temp_loc_skip = nil
    return ret
end

local ref = localize
function localize(args,misc_cat,...)
    if args and type(args) == 'table' then
        args.vars = args.vars or {}
        args.vars.elements = args.vars.elements or {}
        for _,v in ipairs(Icons.get_needed_icons(args)) do
                table.insert(
                args.vars.elements,
                { n=G.UIT.C, config = { align="cm" }, nodes = { 
                    { n=G.UIT.O, config= { object =
                        SMODS.create_sprite(0, 0, 0.3, 0.3, v.atlas or 'ico_icons', v.pos or {x = 0, y = 0})
                    } }
                } }
            )
        end
        if false then
        -- temporary failsafe
        for i = 1, 20 do
            table.insert(
                args.vars.elements,
                { n=G.UIT.C, config = { align="cm" }, nodes = { 
                    { n=G.UIT.O, config= { object =
                        SMODS.create_sprite(0, 0, 0.3, 0.3, 'ico_icons', {x = 0, y = 0})
                    } }
                } }
            )
        end
        end
    end
    local ret = ref(args,misc_cat,...)
    return ret
end