# tr_my_santa_claus_tradition = {
#	possible = { has_tradition = ... }									# AND trigger, scope: country
#	potential = { has_tradition = ... }									# AND trigger, scope: country
#	unlocks_agenda = agenda_name										# Only used to generate the tooltip that it unlocks this Agenda.
#	modifier = {}														# scope: country
#	triggered_modifier = {}												# scope: country
#	on_enabled = {}														# scope: country
#	on_disabled = {}													# scope: country called when a country loses the tradition
#	ai_weight = {}														# scope: country
#	custom_tooltip = tr_my_santa_claus_tradition_desc					# Custom tooltip text shown instead of the auto-generated modifier tooltip text.
#	custom_tooltip_with_modifiers = tr_my_santa_claus_tradition_desc	# Custom tooltip text shown in addition to the auto-generated modifier tooltip text.
	# tradition_swap = {					# If the tradition_swap's trigger is true, the tradition is replaced with the tradition_swap.
	# 	name = tr_my_easter_bunny_tradition	# If specified, the description uses this key instead of the tradition's key (e.g. tr_my_easter_bunny_tradition_delayed).
	# 	inherit_effects = yes				# default: no; if yes, the tradition's modifiers and on_enabled are used instead of the tradition_swap's
	# 	inherit_icon = yes					# default: no
	# 	inherit_name = yes					# default: no
	# 	trigger = {}
	# 	modifier = {}
	# 	triggered_modifier = {}
	#	on_enabled = {}
	# 	weight = {}							# If there are multiple options, the one with the highest weight is picked.
	#	custom_tooltip = tr_my_easter_bunny_tradition_desc
	#	custom_tooltip_with_modifiers = tr_my_easter_bunny_tradition_desc
	# }
# }

# The loc key for the tradition's description must be the tradition's key plus the suffix "_delayed" (for traditions) or "_desc" (for ascension perks),
# e.g. tr_my_santa_claus_tradition_delayed.