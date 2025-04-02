SMODS.Joker{
	key = 'jokerfez',
	loc_txt = {
		name = 'Fez',
		text = {
			'{C:blue}Chips{} and {C:red}Mult{} are',
			'swapped'
		}
	},
	atlas = 'Jokers',
	unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    rarity = 2,
	cost = 8,
	pos = {x = 2, y = 0},
	config = { 
		extra = {
		}
    },
	loc_vars = function(self, info_queue, center)
		return {vars = {}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				card = card,
				swap = true,
				message = 'Swap!',
				colour = G.C.PURPLE
			}
		end
	end
}