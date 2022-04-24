extends Node2D

#basics 
var weapon_type
var num_enchantments = 0
var rangedWeapon = false
var meleeWeapon = false
var total_enchants
#for duplicaiton handling
var number_of_runes
var has_extra_damage
var has_runes
var has_protection
var rolling_runes
var message

#An Dictionary for properties
var properties = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func rand_weapon_type():
# Picks random melee or ranged weapon
	var meleeOrRange = randi() % 100
	if meleeOrRange < 75:
		meleeWeapon = true
		rangedWeapon = false
	else:
		rangedWeapon = true
		meleeWeapon = false
# Melee weapons
	if meleeWeapon == true:
		var rnd_melee = randi() % 100
		if rnd_melee <= 00:
			weapon_type = "Whip"
		elif rnd_melee >= 99:
			weapon_type = "Rapier"
		elif rnd_melee >= 95:
			weapon_type = "Quarterstaff"
		elif rnd_melee >= 92:
			weapon_type = "Net"
		elif rnd_melee >= 89:
			weapon_type = "Lance"
		elif rnd_melee >= 87:
			weapon_type = "Polearm"
		elif rnd_melee >= 85:
			weapon_type = "Flail"
		elif rnd_melee >= 81:
			weapon_type = "lefthand dagger"
		elif rnd_melee >= 79:
			weapon_type = "Bastard Sword"
		elif rnd_melee >= 75:
			weapon_type = "2-Handed Flail"
		elif rnd_melee >= 73:
			weapon_type = "2-Handed Sword"
		elif rnd_melee >= 67:
			weapon_type = "2-Handed Mace"
		elif rnd_melee >= 62:
			weapon_type = "2-Handed hammer"
		elif rnd_melee >= 58:
			weapon_type = "2-Handed Axe"
		elif rnd_melee >= 53:
			weapon_type = "Pick"
		elif rnd_melee >= 50:
			weapon_type = "Club"
		elif rnd_melee >= 45:
			weapon_type = "Dagger"
		elif rnd_melee >= 40:
			weapon_type = "Warhammer"
		elif rnd_melee >= 35:
			weapon_type = "Spear"
		elif rnd_melee >= 27:
			weapon_type = "Sword"
		elif rnd_melee >= 17:
			weapon_type = "Mace"
		elif rnd_melee >= 9:
			weapon_type = "Axe"

# Ranged weapons
	if rangedWeapon == true:
		var rnd_ranged = randi() % 100
		if rnd_ranged >= 00:
			weapon_type = "Crossbow"
		elif rnd_ranged >= 95:
			weapon_type = "Blowpipe"
		elif rnd_ranged >= 90:
			weapon_type = "Throwing Knife"
		elif rnd_ranged >= 85:
			weapon_type = "Dart"
		elif rnd_ranged >= 80:
			weapon_type = "Javelin"
		elif rnd_ranged >= 69:
			weapon_type = "Staff Sling"
		elif rnd_ranged >= 63:
			weapon_type = "Sling"
		elif rnd_ranged >= 52:
			weapon_type = "Crossbow Pistol"
		elif rnd_ranged >= 49:
			weapon_type = "Elf Bow"
		elif rnd_ranged >= 47:
			weapon_type = "Crossbow"
		elif rnd_ranged >= 37:
			weapon_type = "Longbow"
		elif rnd_ranged >= 31:
			weapon_type = "Bow"
		elif rnd_ranged >= 15:
			weapon_type = "Shortbow"

func number_of_enchantments():
# Roll our enchantments
	var rnd_num_enchantments = randi() % 100 +1
	if rnd_num_enchantments == 100:
		num_enchantments = 5
	elif rnd_num_enchantments >= 96:
		num_enchantments = 4
	elif rnd_num_enchantments >= 90:
		num_enchantments = 3
	elif rnd_num_enchantments >= 71:
		num_enchantments = 2
	elif rnd_num_enchantments >= 21:
		num_enchantments = 1
	elif rnd_num_enchantments <= 20:
		num_enchantments = 0
	total_enchants = num_enchantments

func set_number_of_runes():
	number_of_runes = randi() % 4 +1

func enchantments():
	if num_enchantments >= 1:
		while num_enchantments > 0:
				roll_neat_enchantments()

func roll_extra_damage():
	var enchantment_key
	var enchantment
	var extra_damage = randi() % 100 +1
	if has_extra_damage == false:
#		print_debug("Extra Damage Roll: ", extra_damage)
		if extra_damage >= 99:
			enchantment_key = "d1"
			enchantment="Double Damage +4"
			if !check_exists(enchantment_key):
				properties.d1 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_extra_damage()
		elif extra_damage >= 96:
			enchantment_key = "d2"
			enchantment="Double Damage"
			if !check_exists(enchantment_key):
				properties.d2 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_extra_damage()
		elif extra_damage >= 91:
			enchantment_key = "d3"
			enchantment="+4 Damage"
			if !check_exists(enchantment_key):
				properties.d3 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_extra_damage()
		elif extra_damage >= 76:
			enchantment_key = "d4"
			enchantment="+3 Damage"
			if !check_exists(enchantment_key):
				properties.d4 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_extra_damage()
		elif extra_damage >= 51:
			enchantment_key = "d5"
			enchantment="+2 Damage"
			if !check_exists(enchantment_key):
				properties.d5 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_extra_damage()
		elif extra_damage >= 1:
			enchantment_key = "d6"
			enchantment="+1 Damage"
			if !check_exists(enchantment_key):
				properties.d61 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_extra_damage()
		has_extra_damage = true
	else:
		roll_neat_enchantments()

func roll_protections():
	var enchantment_key
	var enchantment
	if has_protection == false:
		var rnd_protection = randi() % 100 +1
		if rnd_protection >= 99:
			enchantment_key = "p1"
			enchantment="2 attacks parried automatically"
			if !check_exists(enchantment_key):
				properties.p1 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_protections()
		elif rnd_protection >= 96:
			enchantment_key = "p2"
			enchantment="1 attack parried automatically"
			if !check_exists(enchantment_key):
				properties.p2 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_protections()
		elif rnd_protection >= 91:
			enchantment_key = "p3"
			enchantment="+3 Armor all locations"
			if !check_exists(enchantment_key):
				properties.p3 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_protections()
		elif rnd_protection >= 76:
			enchantment_key = "p4"
			enchantment="+2 Armor all locations"
			if !check_exists(enchantment_key):
				properties.p4 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_protections()
		elif rnd_protection >= 1:
			enchantment_key = "p5"
			enchantment="+1 Armor all locations"
			if !check_exists(enchantment_key):
				properties.p5 = enchantment
				num_enchantments = num_enchantments -1
			else:
				roll_protections()
		has_protection = true
	else:
		roll_neat_enchantments()

func roll_banes():
	var enchantment_key
	var enchantment
	var rnd_banes = randi() % 100 +1
	if rnd_banes >= 96:
		enchantment_key="b1"
		enchantment="Bane to Vampires"
		if !check_exists(enchantment_key):
			properties.b1 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 91:
		enchantment_key="b2"
		enchantment="Bane to Were Creatures"
		if !check_exists(enchantment_key):
			properties.b2 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 86:
		enchantment_key="b3"
		enchantment="Bane to Ogres and Trolls"
		if !check_exists(enchantment_key):
			properties.b3 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 81:
		enchantment_key="b4"
		enchantment="Bane to Giants"
		if !check_exists(enchantment_key):
			properties.b4 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 76:
		enchantment_key="b5"
		enchantment="Bane to Lizardmen and Troglodytes"
		if !check_exists(enchantment_key):
			properties.b5 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 71:
		enchantment_key="b6"
		enchantment="Bane to Skaven"
		if !check_exists(enchantment_key):
			properties.b6 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 66:
		enchantment_key="b7"
		enchantment="Bane to Monsterous Animals"
		if !check_exists(enchantment_key):
			properties.b7 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 61:
		enchantment_key="b8"
		enchantment="Bane to Fimir"
		if !check_exists(enchantment_key):
			properties.b8 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 56:
		enchantment_key="b9"
		enchantment="Bane to Elves"
		if !check_exists(enchantment_key):
			properties.b9 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 51:
		enchantment_key="b10"
		enchantment="Bane to Dwarves, Gnomes and Halflings"
		if !check_exists(enchantment_key):
			properties.b10 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 46:
		enchantment_key="b11"
		enchantment="Bane to Dragons and Jabberwocks"
		if !check_exists(enchantment_key):
			properties.b11 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 36:
		enchantment_key="b12"
		enchantment="Bane to Chaos Creatures"
		if !check_exists(enchantment_key):
			properties.b12 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 31:
		enchantment_key="b13"
		enchantment="Bane to Undead"
		if !check_exists(enchantment_key):
			properties.b13 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 28:
		enchantment_key="b14"
		enchantment="Bane to Demons"
		if !check_exists(enchantment_key):
			properties.b14 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 26:
		enchantment_key="b15"
		enchantment="Bane to Elementals"
		if !check_exists(enchantment_key):
			properties.b15 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 21:
		enchantment_key="b16"
		enchantment="Bane to All Goblinoids"
		if !check_exists(enchantment_key):
			properties.b16 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 11:
		enchantment_key="b17"
		enchantment="Bane to Orcs and Half-Orcs"
		if !check_exists(enchantment_key):
			properties.b17 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 6:
		enchantment_key="b18"
		enchantment="Bane to Hobgoblins"
		if !check_exists(enchantment_key):
			properties.b18 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()
	elif rnd_banes >= 1:
		enchantment_key="b19"
		enchantment="Bane to Goblins and Snotlings"
		if !check_exists(enchantment_key):
			properties.b19 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_banes()

func roll_gains():
	var enchantment_key
	var enchantment
	var rnd_gains = randi() % 100 +1
#a variable for the really big gains.
	var big_gains 
	var gains
	if rnd_gains >= 99:
		enchantment_key = "g1"
		big_gains = ((randi() %3 +1) * 10)
		gains = ("Willpower + " + str(big_gains))
		enchantment=gains
		if !check_exists(enchantment_key):
			properties.g1 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 97:
		enchantment_key = "g2"
		big_gains = ((randi() %3 +1) * 10)
		gains = ("Cool + " + str(big_gains))
		enchantment=gains
		if !check_exists(enchantment_key):
			properties.g2 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 95:
		enchantment_key = "g3"
		big_gains = ((randi() %3 +1) * 10)
		gains = ("Intelligence + " + str(big_gains))
		enchantment=gains
		if !check_exists(enchantment_key):
			properties.g31 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 93:
		enchantment_key = "g4"
		big_gains = ((randi() %3 +1) * 10)
		gains = ("Leadership + " + str(big_gains))
		enchantment=gains
		if !check_exists(enchantment_key):
			properties.g4 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 91:
		enchantment_key = "g5"
		big_gains = randi() %3 +1
		gains = ("Attacks + " + str(big_gains))
		enchantment=gains
		if !check_exists(enchantment_key):
			properties.g5 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 89:
		enchantment_key = "g6"
		big_gains = ((randi() % 3 +1) * 10)
		gains = ("Initiative + " + str(big_gains))
		enchantment=gains
		if !check_exists(enchantment_key):
			properties.g6 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 87:
		enchantment_key = "g7"
		big_gains = randi() %3 +1
		gains = ("Toughness + " + str(big_gains))
		enchantment=gains
		if !check_exists(enchantment_key):
			properties.g7 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 85:
		enchantment_key = "g8"
		big_gains = randi() %3 +1
		gains = ("Strength + " + str(big_gains))
		enchantment=gains
		if !check_exists(enchantment_key):
			properties.g8 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 82:
		enchantment_key = "g9"
		big_gains = ((randi() %3 +1) * 10)
		gains = ("Weapon Skill + " + str(big_gains))
		enchantment=gains
		if !check_exists(enchantment_key):
			properties.g9 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 73:
		enchantment_key = "g10"
		enchantment="Willpower + 10"
		if !check_exists(enchantment_key):
			properties.g10 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 64:
		enchantment_key = "g11"
		enchantment="Cool + 10"
		if !check_exists(enchantment_key):
			properties.g11 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 55:
		enchantment_key = "g12"
		enchantment="Intelligence + 10"
		if !check_exists(enchantment_key):
			properties.g12 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 46:
		enchantment_key = "g13"
		enchantment="Leadership + 10"
		if !check_exists(enchantment_key):
			properties.g13 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 37:
		enchantment_key = "g14"
		enchantment="Attacks + 1"
		if !check_exists(enchantment_key):
			properties.g14 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 28:
		enchantment_key = "g15"
		enchantment="Initiative + 10"
		if !check_exists(enchantment_key):
			properties.g15 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 19:
		enchantment_key = "g16"
		enchantment="Toughness + 1"
		if !check_exists(enchantment_key):
			properties.g16 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 10:
		enchantment_key = "g17"
		enchantment="Strength + 1"
		if !check_exists(enchantment_key):
			properties.g17 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()
	elif rnd_gains >= 01:
		enchantment_key = "g18"
		enchantment="Weapon Skill + 10"
		if !check_exists(enchantment_key):
			properties.g18 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_gains()

func roll_drains():
	var enchantment_key
	var enchantment
	var rnd_drains = randi() % 100 +1
	if rnd_drains >= 90:
		enchantment_key = "d1"
		enchantment="Drain Willpower - 10"
		if !check_exists(enchantment_key):
			properties.d1 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_drains()
	elif rnd_drains >= 79:
		enchantment_key = "d2"
		enchantment="Drain Cool - 10"
		if !check_exists(enchantment_key):
			properties.d2 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_drains()
	elif rnd_drains >= 68:
		enchantment_key = "d3"
		enchantment="Drain Intelligence - 10"
		if !check_exists(enchantment_key):
			properties.d3 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_drains()
	elif rnd_drains >= 57:
		enchantment_key = "d4"
		enchantment="Drain Leadership - 10"
		if !check_exists(enchantment_key):
			properties.d4 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_drains()
	elif rnd_drains >= 46:
		enchantment_key = "d5"
		enchantment="Drain Initiative - 10"
		if !check_exists(enchantment_key):
			properties.d5 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_drains()
	elif rnd_drains >= 31:
		enchantment_key = "d6"
		enchantment="Drain Toughness - 1"
		if !check_exists(enchantment_key):
			properties.d6 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_drains()
	elif rnd_drains >= 16:
		enchantment_key = "d7"
		enchantment="Drain Strength - 1"
		if !check_exists(enchantment_key):
			properties.d7 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_drains()
	elif rnd_drains >= 1:
		enchantment_key = "d8"
		enchantment="Drain Weapon Skill - 10"
		if !check_exists(enchantment_key):
			properties.d8 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_drains()

func roll_runes():
#	print_debug(number_of_runes, " the number of runes")
	var enchantment_key
	var rune
	rolling_runes = true
# rune of renewal requires other runes
# Todo add rune of flight and return for Hammers, spears, Axes and throwie types.
	if has_runes == false:
		if number_of_runes > 1:
			while number_of_runes > 0:
				var rnd_rune_roll = randi() % 100 +1
				if rnd_rune_roll >= 95:
					enchantment_key="r1"
					rune="Rune of Renewal"
					if !check_exists(enchantment_key):
						properties.r1 = rune
						number_of_runes = number_of_runes -1
					else:
						roll_runes()
				elif rnd_rune_roll >= 79:
					enchantment_key="r2"
					rune="Rune of Swiftness"
					if !check_exists(enchantment_key):
						properties.r2 = rune
						number_of_runes = number_of_runes -1
					else:
						roll_runes()
				elif rnd_rune_roll >= 58:
					enchantment_key="r3"
					rune="Rune of Cutting and Smashing"
					if !check_exists(enchantment_key):
						properties.r3 = rune
						number_of_runes = number_of_runes -1
					else:
						roll_runes()
				elif rnd_rune_roll >= 40:
					enchantment_key="r4"
					rune="Armor Rune"
					if !check_exists(enchantment_key):
						properties.r4 = rune
						number_of_runes = number_of_runes -1
					else:
						roll_runes()
				elif rnd_rune_roll >= 25:
					enchantment_key="r5"
					rune="Protection Rune"
					if !check_exists(enchantment_key):
						properties.r5 = rune
						number_of_runes = number_of_runes -1
					else:
						roll_runes()
				elif rnd_rune_roll >= 1:
					properties.r6 = "Spell Rune"
					number_of_runes = number_of_runes -1
		if number_of_runes <= 1:
			while number_of_runes > 0:
				var rnd_rune_roll = randi() % 100 +1
				if rnd_rune_roll >= 84:
					enchantment_key="r2"
					rune="Rune of Swiftness"
					if !check_exists(enchantment_key):
						properties.r2 = rune
						number_of_runes = number_of_runes -1
					else:
						roll_runes()
				elif rnd_rune_roll >= 63:
					enchantment_key="r3"
					rune="Rune of Cutting and Smashing"
					if !check_exists(enchantment_key):
						properties.r3 = rune
						number_of_runes = number_of_runes -1
					else:
						roll_runes()
				elif rnd_rune_roll >= 42:
					enchantment_key="r4"
					rune="Armor Rune"
					if !check_exists(enchantment_key):
						properties.r4 = rune
						number_of_runes = number_of_runes -1
					else:
						roll_runes()
				elif rnd_rune_roll >= 21:
					rune="Protection Rune"
					enchantment_key="r5"
					if !check_exists(enchantment_key):
						properties.r5 = rune
						number_of_runes = number_of_runes -1
					else:
						roll_runes()
				elif rnd_rune_roll >= 1:
					rune="Spell Rune"
					properties.r6 = rune
					number_of_runes = number_of_runes -1
		has_runes = true
		num_enchantments = num_enchantments -1
		rolling_runes = false

func roll_neat_enchantments():
	var enchantment_key
	var enchantment
	#check to see if we already have an existing enchantment.
	var rnd_neat_enchantments = randi() % 100 +1
#	print_debug( "the enchantment rolls: ", rnd_neat_enchantments)
	if rnd_neat_enchantments >= 91:
		set_number_of_runes()
		roll_runes()
	elif rnd_neat_enchantments >= 89:
		enchantment_key="e1"
		enchantment="Mighty Strike"
		if !check_exists(enchantment_key):
			properties.e1 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 86:
		enchantment_key="e2"
		enchantment="Destroy Magic Item"
		if !check_exists(enchantment_key):
			properties.e2 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 84:
		enchantment_key="e3"
		enchantment="Repel Demons"
		if !check_exists(enchantment_key):
			properties.e3 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 82:
		enchantment_key="e4"
		enchantment="Repel Undead"
		if !check_exists(enchantment_key):
			properties.e4 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 80:
		enchantment_key="e5"
		enchantment="Berserk"
		if !check_exists(enchantment_key):
			properties.e5 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 79:
		enchantment_key="e6"
		enchantment="Magic Damper"
		if !check_exists(enchantment_key):
			properties.e6 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 78:
		enchantment_key="g7"
		enchantment="Invisibility"
		if !check_exists(enchantment_key):
			properties.e7 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 77:
		enchantment_key="e8"
		enchantment="Animated Weapon"
		if !check_exists(enchantment_key):
			properties.e8 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 76:
		enchantment_key="e9"
		enchantment="Resist Fire"
		if !check_exists(enchantment_key):
			properties.e9 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 74:
		roll_protections()
	elif rnd_neat_enchantments >= 72:
		enchantment_key="e10"
		enchantment="Instability"
		if !check_exists(enchantment_key):
			properties.e10 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 70:
		enchantment_key="e11"
		enchantment="Fear"
		if !check_exists(enchantment_key):
			properties.e11 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 69:
		#nice
		enchantment_key="e12"
		enchantment="Confusion"
		if !check_exists(enchantment_key):
			properties.e12 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 68:
		enchantment_key="e13"
		enchantment="Breath Underwater"
		if !check_exists(enchantment_key):
			properties.e13 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 67:
		enchantment_key="e14"
		enchantment="Flight"
		if !check_exists(enchantment_key):
			properties.e14 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 66:
		enchantment_key="e15"
		enchantment="Sleep"
		if !check_exists(enchantment_key):
			properties.e15 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 64:
		enchantment_key="e16"
		enchantment="Freeze Attack"
		if !check_exists(enchantment_key):
			properties.e16 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 63:
		enchantment_key="e17"
		enchantment="Degeneration Attack"
		if !check_exists(enchantment_key):
			properties.e17 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 62:
		enchantment_key="e18"
		enchantment="Posion Attack"
		if !check_exists(enchantment_key):
			properties.e18 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 61:
		enchantment_key="e19"
		enchantment="Flame Attack"
		if !check_exists(enchantment_key):
			properties.e19 = enchantment
			num_enchantments = num_enchantments -1
		else:
			roll_neat_enchantments()
	elif rnd_neat_enchantments >= 51:
		roll_banes()
	elif rnd_neat_enchantments >= 41:
		roll_drains()
	elif rnd_neat_enchantments >=26:
		roll_gains()
	elif rnd_neat_enchantments >=1:
		roll_extra_damage()

func check_exists(key):
#	print_debug("checking if enchantment exists")
	if properties.has(key):
#		print_debug("enchantment already exists")
		return true
	else:
		return false

func results():
	message = "its a "
	$Panel/Report/RichTextLabel.printsometext(message)
	message =  str(weapon_type)
	$Panel/Report/RichTextLabel.printsometext(message)
	$Panel/Report/RichTextLabel.mknewline()
	message = "It has enchantments "
	$Panel/Report/RichTextLabel.printsometext(message)
	message = str(properties.size())
	$Panel/Report/RichTextLabel.printsometext(message)
	$Panel/Report/RichTextLabel.mknewline()
	message = "The Enchantments are:"
	$Panel/Report/RichTextLabel.printsometext(message)
	$Panel/Report/RichTextLabel.mknewline()
	#time to go through our dictionary
	message = str(properties.values())
	$Panel/Report/RichTextLabel.printsometext(message)
	$Panel/Report/RichTextLabel.mknewline()

#button for randos
func _on_RandomWeapon_pressed():
	$Panel/Report/RichTextLabel.clearthistext()
	has_runes = false
	has_extra_damage = false
	has_protection = false
	properties.clear()
	rand_weapon_type()
	number_of_enchantments()
	enchantments()
	results()

#button for runes
func _on_RuneWeaponButton_pressed():
	$Panel/Report/RichTextLabel.clearthistext()
	has_runes = false
	properties.clear()
	rand_weapon_type()
	num_enchantments = 1
	total_enchants = num_enchantments
	set_number_of_runes()
	roll_runes()
	results()

#button for extra-damage/addtional damage
func _on_AdditionalDamageButton_pressed():
	$Panel/Report/RichTextLabel.clearthistext()
	has_extra_damage = false
	properties.clear()
	rand_weapon_type()
	num_enchantments = 1
	total_enchants = num_enchantments
	roll_extra_damage()
	results()

#button for banes
func _on_BaneWeaponButton_pressed():
	$Panel/Report/RichTextLabel.clearthistext()
	properties.clear()
	rand_weapon_type()
	num_enchantments = 1
	total_enchants = num_enchantments
	roll_banes()
	results()
