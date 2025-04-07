SMODS.Joker{
	key = 'jokermostwanted',
	loc_txt = {
		name = 'Most Wanted',
		text = {
			"This Joker gains {C:red}+#1#{} Mult",
			"per discarded {C:attention}#2#{},",
			"rank changes every round",
			"{C:inactive}(Currently {C:red}+#3#{C:inactive} Mult)",
		}
	},
	atlas = 'Jokers',
	unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
	cost = 7,
	pos = {x = 4, y = 0},
	config = { 
		extra = { 
			mult = 0, 
			mult_mod = 3 
		} 
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult_mod, localize(G.GAME.current_round.jokermostwanted.rank, 'ranks'), card.ability.extra.mult, colours = { G.C.SUITS[G.GAME.current_round.jokermostwanted.suit] }
			}
		}
	end,
	calculate = function(self, card, context)
		if context.discard and not context.other_card.debuff and context.other_card:get_id() == G.GAME.current_round.jokermostwanted.id and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
				card = card
			}
		end
		if context.joker_main and card.ability.extra.mult > 0 then
			return {
				message = localize{type='variable', key='a_mult', vars={card.ability.extra.mult}},
				mult_mod = card.ability.extra.mult, -- adds the mult
				colour = G.C.MULT
			}
		end
	end
}




