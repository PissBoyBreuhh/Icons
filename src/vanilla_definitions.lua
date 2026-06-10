SMODS.Atlas{
    key = 'icons',
    path = 'icons.png',
    px = 18,
    py = 18
}


Icons.Icon{
    key = 'spades',
    atlas = 'icons',
    pos = {x = 0, y = 0},
    targets = {
        ['en-us'] = {
            {
                values = {"Spade", "Spades"},
            }
        }
    },
}
Icons.Icon{
    key = 'hearts',
    atlas = 'icons',
    pos = {x = 1, y = 0},
    targets = {
        ['en-us'] = {
            {
                values = {"Heart", "Hearts"},
            }
        }
    },
}
Icons.Icon{
    key = 'clubs',
    atlas = 'icons',
    pos = {x = 2, y = 0},
    targets = {
        ['en-us'] = {
            {
                values = {"Club", "Clubs"},
            }
        }
    },
}
Icons.Icon{
    key = 'diamonds',
    atlas = 'icons',
    pos = {x = 3, y = 0},
    targets = {
        ['en-us'] = {
            {
                values = {"Diamond", "Diamonds"},
            }
        }
    },
}

Icons.Icon{
    key = 'ace',
    atlas = 'icons',
    pos = {x = 0, y = 1},
    targets = {
        ['en-us'] = {
            {
                values = {"Ace", "Aces"},
            }
        }
    },
}
Icons.Icon{
    key = 'king',
    atlas = 'icons',
    pos = {x = 1, y = 1},
    targets = {
        ['en-us'] = {
            {
                values = {"King", "Kings"},
            }
        }
    },
}
Icons.Icon{
    key = 'queen',
    atlas = 'icons',
    pos = {x = 2, y = 1},
    targets = {
        ['en-us'] = {
            {
                values = {"Queen", "Queens"},
            }
        }
    },
}
Icons.Icon{
    key = 'jack',
    atlas = 'icons',
    pos = {x = 3, y = 1},
    targets = {
        ['en-us'] = {
            {
                values = {"Jack", "Jacks"},
            }
        }
    },
}

Icons.Icon{
    key = 'consumable',
    atlas = 'icons',
    pos = {x = 0, y = 2},
    targets = {
        ['en-us'] = {
            {
                values = {"Consumable", "Consumables", "consumable", "consumables"},
            }
        }
    },
}
Icons.Icon{
    key = 'planet',
    atlas = 'icons',
    pos = {x = 1, y = 2},
    targets = {
        ['en-us'] = {
            {
                values = {"Planet", "Planets", "planet", "planets"},
            }
        }
    },
}
Icons.Icon{
    key = 'tarot',
    atlas = 'icons',
    pos = {x = 2, y = 2},
    targets ={
        ['en-us'] = {
            {
                values = {"Tarot", "Tarots", "tarot", "Tarots"},
            }
        }
    }
}
Icons.Icon{
    key = 'spectral',
    atlas = 'icons',
    pos = {x = 3, y = 2},
    targets = {
        ['en-us'] = {
            {
                values = {"Spectral", "Spectrals"},
            }
        }
    }
}

Icons.Icon{
    key = 'copy',
    atlas = 'icons',
    pos = {x = 0, y = 3},
    targets = {
        ['en-us'] = {
            {
                values = {"Copy", "copy", "Copies", "copies"},
            }
        }
    }
}
Icons.Icon{
    key = 'joker',
    atlas = 'icons',
    pos = {x = 1, y = 3},
    targets = {
        ['en-us'] = {
            {
                values = {"Joker", "Jokers"},
            }
        }
    }
}
Icons.Icon{
    key = 'mult',
    atlas = 'icons',
    pos = {x = 2, y = 3},
    targets = {
        ['en-us'] = {
            {
                values = {"Mult", "mult"},
                apply = function (comp, str)
                    return comp == str
                end
            }
        }
    }
}
Icons.Icon{
    key = 'pack',
    atlas = 'icons',
    pos = {x = 3, y = 3},
    targets = {
        ['en-us'] = {
            {
                values = {"Booster", "Boosters", "booster", "Boosters"},
            }
        }
    }
}

Icons.Icon{
    key = 'tag',
    atlas = 'icons',
    pos = {x = 0, y = 4},
    targets = {
        ['en-us'] = {
            {
                values = {"Tag", "Tags", "tag", "tags"},
            }
        }
    }
}
Icons.Icon{
    key = 'blind',
    atlas = 'icons',
    pos = {x = 1, y = 4},
    targets = {
        ['en-us'] = {
            {
                values = {"Blind", "Blinds", "blind", "blinds"},
            }
        }
    }
}
Icons.Icon{
    key = 'retrigger',
    atlas = 'icons',
    pos = {x = 2, y = 4},
    targets = 
    {
        ['en-us'] = {
            {
                values = {"Retrigger", "Retriggers", "retrigger", "retriggers"},
            }
        }
    }
}
Icons.Icon{
    key = 'voucher',
    atlas = 'icons',
    pos = {x = 3, y = 4},
    targets = {
        ['en-us'] = {
            {
                values = {'Voucher', 'Vouchers', 'voucher', 'vouchers'},
            }
        }
    }
}

Icons.Icon{
    key = 'chpis',
    atlas = 'icons',
    pos = {x = 0, y = 5},
    targets = {
        ['en-us'] = {
            {
                values = {'Chip', 'Chips'},
            }
        }
    }
}
Icons.Icon{
    key = 'deck',
    atlas = 'icons',
    pos = {x = 1, y = 5},
    targets = {
        ['en-us'] = {
            {
                values = {'Deck', 'deck'},
            }
        }
    }
}
Icons.Icon{
    key = 'discard',
    atlas = 'icons',
    pos = {x = 2, y = 5},
    targets = {
        ['en-us'] = {
            {
                values = {'Discard', 'Discards', 'discard', 'discards'},
            }
        }
    }
}
Icons.Icon{
    key = 'hand',
    atlas = 'icons',
    pos = {x = 3, y = 5},
    targets = {
        ['en-us'] = {
            {
                values = {'Hands', 'Hand', 'hand', 'hands'},
            }
        }
    }
}

-- HC suits

Icons.Icon{
    key = 'debuff',
    atlas = 'icons',
    pos = {x = 0, y = 7},
    targets = {
        ['en-us'] = {
            {
                values = {'Debuff', 'Debuffs', 'debuff', 'debuffs'},
            }
        }
    }
}
Icons.Icon{
    key = 'shop',
    atlas = 'icons',
    pos = {x = 1, y = 7},
    targets = {
        ['en-us'] = {
            {
                values = {'Shop', 'shop'},
            }
        }
    }
}
Icons.Icon{
    key = 'reroll',
    atlas = 'icons',
    pos = {x = 2, y = 7},
    targets = {
        ['en-us'] = {
            {
                values = {'Reroll', 'reroll'},
            }
        }
    }
}
Icons.Icon{
    key = 'unkown',
    atlas = 'icons',
    pos = {x = 3, y = 7},
    targets = {
        ['en-us'] = {
            {
                values = {},
            }
        }
    }
}

Icons.Icon{
    key = 'boss',
    atlas = 'icons',
    pos = {x = 0, y = 8},
    targets = {
        ['en-us'] = {
            {
                values = {'Boss', 'boss'},
            }
        }
    }
}
Icons.Icon{
    key = 'chpis',
    atlas = 'icons',
    pos = {x = 1, y = 8},
    targets = {
        ['en-us'] = {
            {
                values = {'end of round'},
            }
        }
    }
}
Icons.Icon{
    key = 'enhancement',
    atlas = 'icons',
    pos = {x = 2, y = 8},
    targets = {
        ['en-us'] = {
            {
                values = {'Enhancement', 'Enhancements', 'enhancement', 'enhancements'},
            }
        }
    }
}
Icons.Icon{
    key = 'edition',
    atlas = 'icons',
    pos = {x = 3, y = 8},
    targets = {
        ['en-us'] = {
            {
                values = {'Edition', 'Editions', 'edition', 'editions'},
            }
        }
    }
}

Icons.Icon{
    key = 'seal',
    atlas = 'icons',
    pos = {x = 0, y = 9},
    targets = {
        ['en-us'] = {
            {
                values = {'Seal', 'Seals', 'seal', 'Seals'},
            }
        }
    }
}