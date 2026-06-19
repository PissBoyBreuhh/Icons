Icons.testjk_2 = SMODS.Joker{
    key = 'test_2',
    loc_vars = function (self, info_queue, card)
        return {vars = {
            22,
            elements = {
                { n=G.UIT.C, config = { align="cm" }, nodes = { 
                { n=G.UIT.O, config= { object =
                    SMODS.create_sprite(0, 0, .5, .5, "Joker", {x = 0, y = 0})
                } }
            } },
            }
        }}
    end,
    loc_txt = {
        name = 'tester',
        text = {
                "{C:green} Mult #1# {element:1}jimball",
                "Test lol!"
        }
    }
}
Icons.testjk = SMODS.Joker{
    key = 'test',
    loc_vars = function (self, info_queue, card)
        return {vars = {
            22,
            elements = {
                { n=G.UIT.C, config = { align="cm" }, nodes = { 
                { n=G.UIT.O, config= { object =
                    SMODS.create_sprite(0, 0, .5, .5, "Joker", {x = 0, y = 0})
                } }
            } },
            }
        }}
    end,
    loc_txt = {
        name = 'test',
        text = {
            {
                "{C:green} Mult #1# {element:1}jimbo",
                "Chips spectral"
            },
            {
                "second",
                "box! mult",
                "deck"
            }
        }
    }
}
Icons.testjk_1 = SMODS.Joker{
    key = 'test_1',
    loc_vars = function (self, info_queue, card)
        return {vars = {
            22,
            elements = {
                { n=G.UIT.C, config = { align="cm" }, nodes = { 
                { n=G.UIT.O, config= { object =
                    SMODS.create_sprite(0, 0, .5, .5, "Joker", {x = 0, y = 0})
                } }
            } },
            }
        }}
    end,
    loc_txt = {
        name = 'test',
        text = {
            {
                "{C:green} #1# {element:1}jimbo",
            }
        }
    }
}