SMODS.Joker{
	key = 'jokerbathroom',
	loc_txt = {
		name = 'Bathroom Sign',
		text = {
			'If {C:attention}first hand{} of round',
			'does not contain a {C:attention}face{} card,',
			'create a random {C:attention}face{} card'
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
	pos = {x = 3, y = 0},
	config = { 
		extra = {
			
		}
    },
	loc_vars = function(self, info_queue, center)
		return {vars = {center.ability.extra.Xmult}}
	end,
	calculate = function(self, card, context)
		_rank = pseudorandom_element({'J', 'Q', 'K'}, pseudoseed('bathroom')) -- RNG variable
		_suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('bathroom')) -- RNG variable
		if context.first_hand_drawn then -- makes the card shake on first hand (like DNA and Trading Card)
            juice_card_until(card, function() return G.GAME.current_round.hands_played == 0 end, true)
		elseif context.before and context.cardarea == G.jokers and not context.blueprint and G.GAME.current_round.hands_played == 0 then
			for i,v in ipairs(context.full_hand) do -- checks if there's face cards in the hand, if yeah, dont run it
				if v:is_face() then return end 
			end
			return {
				card = card,
                create_playing_card({front = G.P_CARDS[_suit..'_'.._rank]}, G.hand), --makes the face card
				playing_card_joker_effects({true}),
				playing_cards_created = {true}
			}
		end
	end
}