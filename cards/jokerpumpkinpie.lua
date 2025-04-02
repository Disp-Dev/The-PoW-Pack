SMODS.Joker{
	key = 'jokerpumpkinpie',
	loc_txt = {
		name = 'Pumpkin Pie',
		text = {
			'{C:red}+#1#{} Mult',
			'{C:red}-#2#{} Mult per round played'
		}
	},
	atlas = 'Jokers',
	unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
	pools = { Food = true },
    rarity = 1,
	cost = 6,
	pos = {x = 1, y = 0},
	config = { 
		extra = {
			mult = 32,
			decrease = 4
		}
    },
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.mult, center.ability.extra.decrease}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				card = card,
				mult_mod = card.ability.extra.mult, -- adds the mult
				message = localize{type='variable', key='a_mult', vars={card.ability.extra.mult}},
				colour = G.C.MULT
			}
		elseif context.end_of_round and not context.repetition and not context.game_over and not context.blueprint and not context.individual then
            if card.ability.extra.mult - card.ability.extra.decrease <= 1 then --triggers when the mult goes to 0
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
            else
                card.ability.extra.mult = card.ability.extra.mult - card.ability.extra.decrease --mult decay
                return {
                    message = localize{type='variable',key='a_mult_minus',vars={card.ability.extra.decrease}},
                    colour = G.C.RED
                }
            end
		end
	end
}