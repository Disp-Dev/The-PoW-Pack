SMODS.Joker{
	key = 'jokerbwoink',
	loc_txt = {
		name = 'Moderator Joker',
		text = {
			'{X:mult,C:white}X#1#{} Mult if played hand',
			'is a {C:attention}secret hand{}'
		}
	},
	atlas = 'Jokers',
	unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
	cost = 6,
	pos = {x = 0, y = 0},
	config = { 
		extra = {
			Xmult = 3
		}
    },
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.Xmult}}
	end,
	calculate = function(self, card, context)
		if context.joker_main and (context.scoring_name == 'Flush House' or context.scoring_name == 'Flush Five' or context.scoring_name == 'Five of a Kind') then
			return {
				card = card,
				Xmult_mod = card.ability.extra.Xmult,
				message = 'Bwoink!',
				colour = G.C.MULT
			}
		end
	end
}