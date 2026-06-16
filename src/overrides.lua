--[[local ref = loc_parse_string
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
                    if parsed_line[i] and v.apply(parsed_line[i].strings[1],vv) then
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
end]]

local ref = init_localization
function init_localization(...)
    local ret = ref(...)
    G.Icons_temp_loc_acc = nil
    G.Icons_temp_loc_skip = nil

    local function handle_string (ref,target,i,ii,iii,wc)
        wc = wc or 0 -- word count
        local word = ''
        local function store_data()
            if word:sub(1,1) == ' ' then word = word:sub(2,#word) end
            wc = wc + 1
            table.insert(ref,{
                string = word,
                address = {
                    box = iii ~= nil and i or false,
                    line = iii ~= nil and ii or i,
                    segment = iii ~= nil and iii or ii,
                    word = wc
                },
            })
            word = ''
        end
        local function check_string(str)
            for j = 1, #str do
                local l_char = str:sub(j-1,j-1)
                local char = str:sub(j,j)
                local r_char = str:sub(j+1,j+1)
                if char == ' ' and l_char and l_char ~= ' ' then
                    if #word > 0 then
                        store_data()
                    end
                else
                    word = word..char
                end
                
            end
            if #word > 0 then
                store_data()
            end
        end
        if target.strings and type(target.strings[1]) == 'string' then
            check_string(target.strings[1])
        else
            if type(target) == 'table' then
                if target.strings then
                    handle_string(ref,target.strings,i,ii,iii,wc)
                    wc = wc + 1
                end
                for j in ipairs(target) do
                    handle_string(ref,target[j],i,ii,iii,wc)
                    wc = wc + 1
                end
            else

                check_string(target)
            end
        end
    end

    for g_k, group in pairs(G.localization) do
        if g_k == 'descriptions' then
            for _, set in pairs(group) do
                for _, center in pairs(set) do
                    center.icon_text_data = {}
                    print(center.name)
                    if center.text_parsed and center.text_parsed[1] and center.text_parsed[1][1] and center.text_parsed[1][1].strings then center.icon_text_data.multi_box = false else center.icon_text_data.multi_box = true end
                    for i,line in ipairs(center.text_parsed) do
                        for ii,segment in ipairs(line) do
                            if segment.strings then -- single box
                                handle_string(center.icon_text_data,segment,i,ii,nil)
                            else -- multi_box
                                for iii, mb_segment in ipairs(segment) do
                                    handle_string(center.icon_text_data,mb_segment,i,ii,iii)
                                end
                            end
                        end
                    end

                    local icons_count = 1
                    for _,line in ipairs(center.text_parsed) do
                        for _,segment in ipairs(line) do
                            if not center.icon_text_data.multi_box then
                                if segment.control.element then icons_count = icons_count + 1 end
                            else
                                for _,mb_segment in ipairs(segment) do
                                    if mb_segment.control.element then icons_count = icons_count + 1 end
                                end
                            end
                        end
                    end
                    local target_offset, prev_line = 0, 0
                    local segment_offset, prev_segment = 0, 0 -- prep work for multi words
                    for _, target in ipairs(center.icon_text_data) do
                        if prev_line ~= target.address.line then target_offset = 0 end
                        if not center.icon_text_data.multi_box then
                            for _, icon in pairs(Icons.Icons) do
                                local lang = G.SETTINGS.language
                                lang = icon.targets[lang] and lang or 'en-us'
                                for _, v in ipairs(icon.targets[lang]) do
                                    for _, vv in ipairs(v.values) do
                                        if v.apply(target.string,vv) then
                                            local part = center.text_parsed[target.address.line][target.address.segment + target_offset]
                                            if type(part.strings[1]) == 'string' and part.strings[1]:sub(1,1) == ' ' then
                                                part.strings[1] = part.strings[1]:sub(2,#part.strings[1])
                                                table.insert(center.text_parsed[target.address.line],
                                                target.address.segment + target_offset - 1,
                                                {strings = {' '}, control = part.control})
                                                target_offset = target_offset + 1
                                            end
                                            table.insert(center.text_parsed[target.address.line],
                                            target.address.segment + target_offset,
                                            {strings = {}, control = {element = icons_count}})
                                            icons_count = icons_count + 1
                                            target_offset = target_offset + 1
                                        end
                                    end
                                end
                            end
                        else
                        end
                        prev_line = target.line
                    end                    
                end
            end
        end
    end
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
