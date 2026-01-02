--<nowiki>
local p = {}
local items = {}

items["57 Leaf Clover"] = {
	Rarity = "Legendary",
	Quote = "Luck is on your side.",
	Desc = "All random effects are rolled {{Color|u|+1}} {{Stack|(+1 per stack)}} times for a {{Color|u|favorable outcome}}.",
	Category = { "Utility" },
	Unlock = "The Long Road",
	Corrupt = "Benthic Bloom",
	Stats = {
		{
			Stat = "Luck",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "Clover",
	LocalizationInternalName = "ITEM_CLOVER",
}
items["Soldier's Syringe"] = {
	Rarity = "Common",
	Quote = "Increase attack speed.",
	Desc = "Increases {{Color|d|attack speed}} by {{Color|d|15%}} {{Stack|(+15% per stack)}}.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Attack Speed",
			Value = "15%",
			Stack = "Linear",
			Add = "+15%"
		}
	},
	InternalName = "Syringe",
	LocalizationInternalName = "ITEM_SYRINGE",
}
items["Tougher Times"] = {
	Rarity = "Common",
	Quote = "Chance to block incoming damage.",
	Desc = "{{Color|h|15%}} {{Stack|(+15% per stack)}} chance to {{Color|h|block}} incoming damage. {{Color|u|Unaffected by luck}}.",
	Category = { "Utility", "BrotherBlacklist" },
	Unlock = "Learning Process",
	Corrupt = "Safer Spaces",
	Stats = {
		{
			Stat = "Block Chance",
			Value = "15%",
			Stack = "Hyperbolic",
			Add = "+15%"
		}
	},
	InternalName = "Bear",
	LocalizationInternalName = "ITEM_BEAR",
}
items["Brilliant Behemoth"] = {
	Rarity = "Legendary",
	Quote = "All your attacks explode!",
	Desc = "All your {{Color|d|attacks explode}} in a {{Color|d|4m}} {{Stack|(+2.5m per stack)}} radius for a bonus {{Color|d|60%}} TOTAL damage to nearby enemies.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Explosion Radius",
			Value = "4m",
			Stack = "Linear",
			Add = "+2.5m"
		}
	},
	InternalName = "Behemoth",
	LocalizationInternalName = "ITEM_BEHEMOTH",
}
items["AtG Missile Mk. 1"] = {
	Rarity = "Uncommon",
	Quote = "Chance to fire a missile.",
	Desc = "{{Color|d|10%}} chance to fire a missile that deals {{Color|d|300%}} {{Stack|(+300% per stack)}} TOTAL damage.",
	Category = { "Damage" },
	Corrupt = "Plasma Shrimp",
	Stats = {
		{
			Stat = "Damage",
			Value = "300%",
			Stack = "Linear",
			Add = "+300%"
		}
	},
	InternalName = "Missile",
	LocalizationInternalName = "ITEM_MISSILE",
}
items["Will-o'-the-wisp"] = {
	Rarity = "Uncommon",
	Quote = "Detonate enemies on kill.",
	Desc = "On killing an enemy, spawn a {{Color|d|lava pillar}} in a {{Color|d|12m}} {{Stack|(+2.4m per stack)}} radius for {{Color|d|350%}} {{Stack|(+280% per stack)}} base damage.",
	Category = { "Damage", "OnKillEffect" },
	Corrupt = "Voidsent Flame",
	Stats = {
		{
			Stat = "Damage",
			Value = "350%",
			Stack = "Linear",
			Add = "+280%"
		}, {
			Stat = "Radius",
			Value = "12m",
			Stack = "Linear",
			Add = "+2.4m"
		}
	},
	InternalName = "ExplodeOnDeath",
	LocalizationInternalName = "ITEM_EXPODEONDEATH",
}
items["Ceremonial Dagger"] = {
	Rarity = "Legendary",
	Quote = "Killing an enemy releases homing daggers.",
	Desc = "Killing an enemy fires out {{Color|d|3}} {{Color|d|homing daggers}} that deal {{Color|d|150%}} {{Stack|(+150% per stack)}} base damage.",
	Category = { "Damage", "OnKillEffect", "AIBlacklist" },
	Stats = {
		{
			Stat = "Damage",
			Value = "150%",
			Stack = "Linear",
			Add = "+150%"
		}
	},
	InternalName = "Dagger",
	LocalizationInternalName = "ITEM_DAGGER",
}
items["Monster Tooth"] = {
	Rarity = "Common",
	Quote = "Drop a healing orb on kill.",
	Desc = "Killing an enemy spawns a {{Color|h|healing orb}} that heals for {{Color|h|8}} plus an additional {{Color|h|2%}} {{Stack|(+2% per stack)}} of {{Color|h|maximum health}}.",
	Category = { "Healing", "OnKillEffect" },
	Stats = {
		{
			Stat = "Health per Orb",
			Value = "2%",
			Stack = "Linear",
			Add = "+2%"
		}
	},
	InternalName = "Tooth",
	LocalizationInternalName = "ITEM_TOOTH",
}
items["Lens-Maker's Glasses"] = {
	Rarity = "Common",
	Quote = "Gain 10% chance for hits to 'Critically Strike', dealing double damage.",
	Desc = "Your attacks have a {{Color|d|10%}} {{Stack|(+10% per stack)}} chance to '{{Color|d|Critically Strike}}', dealing {{Color|d|double damage}}.",
	Category = { "Damage" },
	Corrupt = "Lost Seer's Lenses",
	Stats = {
		{
			Stat = "Critical Chance",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}
	},
	InternalName = "CritGlasses",
	LocalizationInternalName = "ITEM_CRITGLASSES",
}
items["Paul's Goat Hoof"] = {
	Rarity = "Common",
	Quote = "Increase movement speed.",
	Desc = "Increases {{Color|u|movement speed}} by {{Color|u|14%}} {{Stack|(+14% per stack)}}.",
	Category = { "Utility" },
	Unlock = "\"Is This Bugged?\"",
	Stats = {
		{
			Stat = "Movement Speed",
			Value = "14%",
			Stack = "Linear",
			Add = "+14%"
		}
	},
	InternalName = "Hoof",
	LocalizationInternalName = "ITEM_HOOF",
}
items["Hopoo Feather"] = {
	Rarity = "Uncommon",
	Quote = "Gain an extra jump.",
	Desc = "Gain {{Color|u|+1}} {{Stack|(+1 per stack)}} maximum {{Color|u|jump count}}.",
	Category = { "Utility", "AIBlacklist" },
	Stats = {
		{
			Stat = "Extra Jump",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "Feather",
	LocalizationInternalName = "ITEM_FEATHER",
}
items["Ukulele"] = {
	Rarity = "Uncommon",
	Quote = "...and his music was electric.",
	Desc = "{{Color|d|25%}} chance to fire {{Color|d|chain lightning}} for {{Color|d|80%}} TOTAL damage on up to {{Color|d|3}} {{Stack|(+2 per stack)}} targets within {{Color|d|20m}} {{Stack|(+2m per stack)}}.",
	Category = { "Damage" },
	Corrupt = "Polylute",
	Stats = {
		{
			Stat = "Targets",
			Value = "3",
			Stack = "Linear",
			Add = "+2"
		}, {
			Stat = "Radius",
			Value = "20m",
			Stack = "Linear",
			Add = "+2m"
		}
	},
	InternalName = "ChainLightning",
	LocalizationInternalName = "ITEM_CHAINLIGHTNING",
}
items["Leeching Seed"] = {
	Rarity = "Uncommon",
	Quote = "Dealing damage heals you.",
	Desc = "Dealing damage {{Color|h|heals}} you for {{Color|h|1 {{Stack|(+1 per stack)}} health}}.",
	Category = { "Healing" },
	Stats = {
		{
			Stat = "Heal",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "Seed",
	LocalizationInternalName = "ITEM_SEED",
}
items["Frost Relic"] = {
	Rarity = "Legendary",
	Quote = "Killing enemies surrounds you with an ice storm.",
	-- Modified Description
	Desc = "Killing an enemy surrounds you with an {{Color|d|ice storm}} that deals {{Color|d|1200% damage per second}} and {{Color|u|slows}} enemies by {{Color|u|80%}} for {{Color|u|1.5s}}. The storm {{Color|d|grows with every kill}}, increasing its radius by {{Color|d|2m}}. Stacks up to {{Color|d|18m}} {{Stack|(+12m per stack)}}.",
	Category = { "Damage", "OnKillEffect" },
	Stats = {
		{
			Stat = "Maximum Radius",
			Value = "18m",
			Stack = "Linear",
			Add = "+12m"
		}
	},
	InternalName = "Icicle",
	LocalizationInternalName = "ITEM_ICICLE",
}
items["Happiest Mask"] = {
	Rarity = "Legendary",
	Quote = "Chance on killing an enemy to summon a ghost.",
	Desc = "Killing enemies has a {{Color|d|7%}} chance to {{Color|d|spawn a ghost}} of the killed enemy with {{Color|d|1500%}} damage. Lasts {{Color|d|30s}} {{Stack|(+30s per stack)}}.",
	Category = { "Damage", "Utility", "OnKillEffect" },
	Stats = {
		{
			Stat = "Ghost Duration",
			Value = "30s",
			Stack = "Linear",
			Add = "+30s"
		}
	},
	InternalName = "GhostOnKill",
	LocalizationInternalName = "ITEM_GHOSTONKILL",
}
items["Bustling Fungus"] = {
	Rarity = "Common",
	Quote = "Heal all nearby allies after standing still for 1 second.",
	Desc = "After standing still for {{Color|h|1}} second, create a zone that {{Color|h|heals}} for {{Color|h|4.5%}} {{Stack|(+2.25% per stack)}} of your {{Color|h|health}} every second to all allies within {{Color|h|3m}} {{Stack|(+1.5m per stack)}}.",
	Category = { "Healing", "AIBlacklist" },
	Corrupt = "Weeping Fungus",
	Stats = {
		{
			Stat = "Health per Second",
			Value = "4.5%",
			Stack = "Linear",
			Add = "+2.25%"
		}, {
			Stat = "Radius",
			Value = "3m",
			Stack = "Linear",
			Add = "+1.5m"
		}
	},
	InternalName = "Mushroom",
	LocalizationInternalName = "ITEM_MUSHROOM",
}
items["Crowbar"] = {
	Rarity = "Common",
	Quote = "Deal bonus damage to enemies above 90% health.",
	Desc = "Deal {{Color|d|+75%}} {{Stack|(+75% per stack)}} damage to enemies above {{Color|d|90% health}}.",
	Category = { "Damage" },
	Unlock = "The Basics",
	Stats = {
		{
			Stat = "Damage",
			Value = "75%",
			Stack = "Linear",
			Add = "+75%"
		}
	},
	InternalName = "Crowbar",
	LocalizationInternalName = "ITEM_CROWBAR",
}
items["Predatory Instincts"] = {
	Rarity = "Uncommon",
	Quote = "'Critical Strikes' increase attack speed. Stacks 3 times.",
	-- Modified Description
	Desc = "Gain {{Color|d|5% critical chance}}. {{Color|d|Critical strikes}} increase {{Color|d|attack speed}} by {{Color|d|12%}}. Maximum cap of {{Color|d|36% {{Stack|(+24% per stack)}} attack speed}}.",
	Category = { "Damage" },
	Unlock = "Rapidfire",
	Stats = {
		{
			Stat = "Attack Speed Cap",
			Value = "36%",
			Stack = "Linear",
			Add = "+24%"
		}, {
			Stat = "Crit chance",
			Value = "5%",
			Stack = "None",
			Add = ""
		}
	},
	InternalName = "AttackSpeedOnCrit",
	LocalizationInternalName = "ITEM_ATTACKSPEEDONCRIT",
}
items["Tri-Tip Dagger"] = {
	Rarity = "Common",
	Quote = "Gain +10% chance to bleed enemies on hit.",
	Desc = "{{Color|d|10%}} {{Stack|(+10% per stack)}} chance to {{Color|d|bleed}} an enemy for {{Color|d|240%}} base damage.",
	Category = { "Damage" },
	Corrupt = "Needletick",
	Stats = {
		{
			Stat = "Chance to Bleed",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}
	},
	InternalName = "BleedOnHit",
	LocalizationInternalName = "ITEM_BLEEDONHIT",
}
items["Red Whip"] = {
	Rarity = "Uncommon",
	Quote = "Move fast out of combat.",
	Desc = "Leaving combat boosts your {{Color|u|movement speed}} by {{Color|u|30%}} {{Stack|(+30% per stack)}}.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Movement Speed ",
			Value = "30%",
			Stack = "Linear",
			Add = "+30%"
		}
	},
	InternalName = "SprintOutOfCombat",
	LocalizationInternalName = "ITEM_SPRINTOUTOFCOMBAT",
}
items["H3AD-5T v2"] = {
	Rarity = "Legendary",
	Quote = "Increase jump height. Hold 'Interact' to slam down to the ground.",
	Desc = "Increase {{Color|u|jump height}}. Creates a {{Color|d|5m-100m}} radius {{Color|d|kinetic explosion}} on hitting the ground, dealing {{Color|d|1000%-10000%}} base damage that scales up with {{Color|d|fall distance}}. Recharges in {{Color|d|10}} {{Stack|(-50% per stack)}} seconds.",
	Category = { "Damage", "Utility", "AIBlacklist" },
	Stats = {
		{
			Stat = "Cooldown",
			Value = "10s",
			Stack = "Reciprocal",
			Add = "+1"
		}
	},
	InternalName = "FallBoots",
	LocalizationInternalName = "ITEM_FALLBOOTS",
}
items["Warbanner"] = {
	Rarity = "Common",
	Quote = "Drop a Warbanner on level up or starting the Teleporter event. Grants allies attack and movement speed.",
	Desc = "On {{Color|u|level up}} or starting the {{Color|u|Teleporter event}}, drop a banner that strengthens all allies within {{Color|u|16m}} {{Stack|(+8m per stack)}}. Raise {{Color|d|attack}} and {{Color|u|movement speed}} by {{Color|d|30%}}.",
	Category = { "Utility", "AIBlacklist", "TurretBlacklist" },
	Stats = {
		{
			Stat = "Radius",
			Value = "16m",
			Stack = "Linear",
			Add = "+8m"
		}
	},
	InternalName = "WardOnLevel",
	LocalizationInternalName = "ITEM_WARDONLEVEL",
}
items["Berzerker's Pauldron"] = {
	Rarity = "Uncommon",
	Quote = "Enter a frenzy after killing 4 enemies in quick succession.",
	Desc = "{{Color|d|Killing 4 enemies}} within {{Color|d|1}} second sends you into a {{Color|d|frenzy}} for {{Color|d|6s}} {{Stack|(+4s per stack)}}. Increases {{Color|u|movement speed}} by {{Color|u|50%}} and {{Color|d|attack speed}} by {{Color|d|100%}}.",
	Category = { "Damage", "OnKillEffect" },
	Unlock = "Glorious Battle",
	Stats = {
		{
			Stat = "Frenzy Duration",
			Value = "6s",
			Stack = "Linear",
			Add = "+4s"
		}
	},
	InternalName = "WarCryOnMultiKill",
	LocalizationInternalName = "ITEM_WARCRYONMULTIKILL",
}
items["Old War Stealthkit"] = {
	Rarity = "Uncommon",
	Quote = "Turn invisible at low health.",
	Desc = "Falling below {{Color|hp|25% health}} causes you to gain {{Color|u|40% movement speed}} and {{Color|u|invisibility}} for {{Color|u|5s}}. Recharges every {{Color|u|30 seconds}} {{Stack|(-50% per stack)}}.",
	Category = { "Utility", "LowHealth" },
	Stats = {
		{
			Stat = "Cooldown",
			Value = "30s",
			Stack = "Exponential",
			Add = "-50%"
		}
	},
	InternalName = "Phasing",
	LocalizationInternalName = "ITEM_PHASING",
}
items["Harvester's Scythe"] = {
	Rarity = "Uncommon",
	Quote = "'Critical Strikes' heal you.",
	Desc = "Gain {{Color|d|5% critical chance}}. {{Color|d|Critical strikes}} {{Color|h|heal}} for {{Color|h|8}} {{Stack|(+4 per stack)}} {{Color|h|health}}.",
	Category = { "Healing" },
	Unlock = "Prismatically Aligned",
	Stats = {
		{
			Stat = "Heal",
			Value = "8",
			Stack = "Linear",
			Add = "+4"
		}, {
			Stat = "Crit chance",
			Value = "5%",
			Stack = "None",
			Add = ""
		}
	},
	InternalName = "HealOnCrit",
	LocalizationInternalName = "ITEM_HEALONCRIT",
}
items["Cautious Slug"] = {
	Rarity = "Common",
	Quote = "Rapidly heal outside of danger.",
	Desc = "Increases {{Color|h|base health regeneration}} by {{Color|h|+3 hp/s}} {{Stack|(+3 hp/s per stack)}} while outside of combat.",
	Category = { "Healing" },
	Stats = {
		{
			Stat = "Health Regen",
			Value = "3",
			Stack = "Linear",
			Add = "+3"
		}
	},
	InternalName = "HealWhileSafe",
	LocalizationInternalName = "ITEM_HEALWHILESAFE",
}
items["Wax Quail"] = {
	Rarity = "Uncommon",
	Quote = "Jumping while sprinting boosts you forward.",
	Desc = "{{Color|u|Jumping}} while {{Color|u|sprinting}} boosts you forward by {{Color|u|10m}} {{Stack|(+10m per stack)}}.",
	Category = { "Utility", "SprintRelated" },
	Unlock = "Going Fast Recommended",
	Stats = {
		{
			Stat = "Boost",
			Value = "10m",
			Stack = "Linear",
			Add = "+10m"
		}
	},
	InternalName = "JumpBoost",
	LocalizationInternalName = "ITEM_JUMPBOOST",
}
items["Personal Shield Generator"] = {
	Rarity = "Common",
	Quote = "Gain a recharging shield.",
	Desc = "Gain a {{Color|h|shield}} equal to {{Color|h|8%}} {{Stack|(+8% per stack)}} of your maximum health. Recharges outside of danger.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Shield",
			Value = "8%",
			Stack = "Linear",
			Add = "+8%"
		}
	},
	InternalName = "PersonalShield",
	LocalizationInternalName = "ITEM_PERSONALSHIELD",
}
items["N'kuhana's Opinion"] = {
	Rarity = "Legendary",
	Quote = "Fire haunting skulls when healed.",
	Desc = "Store {{Color|h|100%}} {{Stack|(+100% per stack)}} of healing as {{Color|h|Soul Energy}}. After your {{Color|h|Soul Energy}} reaches {{Color|h|10%}} of your {{Color|h|maximum health}}, {{Color|d|fire a skull}} that deals {{Color|d|250%}} of your {{Color|h|Soul Energy}} as {{Color|d|damage}}.",
	Category = { "Damage" },
	Unlock = "Her Concepts",
	Stats = {
		{
			Stat = "Damage",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}
	},
	InternalName = "NovaOnHeal",
	LocalizationInternalName = "ITEM_NOVAONHEAL",
}
items["Medkit"] = {
	Rarity = "Common",
	Quote = "Receive a delayed heal after taking damage.",
	Desc = "2 seconds after getting hurt, {{Color|h|heal}} for {{Color|h|20}} plus an additional {{Color|h|5%}} {{Stack|(+5% per stack)}} of {{Color|h|maximum health}}.",
	Category = { "Healing" },
	Unlock = "Elite Slayer",
	Stats = {
		{
			Stat = "Heal",
			Value = "5%",
			Stack = "Linear",
			Add = "+5%"
		}
	},
	InternalName = "Medkit",
	LocalizationInternalName = "ITEM_MEDKIT",
}
items["Fuel Cell"] = {
	Rarity = "Uncommon",
	Quote = "Hold an additional equipment charge. Reduce equipment cooldown.",
	Desc = "Hold an {{Color|u|additional equipment charge}} {{Stack|(+1 per stack)}}. {{Color|u|Reduce equipment cooldown}} by {{Color|u|15%}} {{Stack|(+15% per stack)}}.",
	Category = { "Utility", "AIBlacklist", "EquipmentRelated" },
	Unlock = "Experimenting",
	Corrupt = "Lysate Cell",
	Stats = {
		{
			Stat = "Charges",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}, {
			Stat = "Cooldown Reduction",
			Value = "15%",
			Stack = "Exponential",
			Add = "+15%"
		}
	},
	InternalName = "EquipmentMagazine",
	LocalizationInternalName = "ITEM_EQUIPMENTMAGAZINE",
}
items["Infusion"] = {
	Rarity = "Uncommon",
	Quote = "Killing an enemy permanently increases your maximum health, up to 100.",
	Desc = "Killing an enemy increases your {{Color|h|health permanently}} by {{Color|h|1}} {{Stack|(+1 per stack)}}, up to a {{Color|h|maximum}} of {{Color|h|100 {{Stack|(+100 per stack)}} health}}.",
	Category = { "Utility", "Healing", "OnKillEffect" },
	Unlock = "Slaughter",
	Stats = {
		{
			Stat = "Max Health Increase",
			Value = "100",
			Stack = "Linear",
			Add = "+100"
		}, {
			Stat = "Health Per Kill",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "Infusion",
	LocalizationInternalName = "ITEM_INFUSION",
}
items["Unstable Tesla Coil"] = {
	Rarity = "Legendary",
	Quote = "Shock all nearby enemies every 10 seconds.",
	Desc = "Fire out {{Color|d|lightning}} that hits {{Color|d|3}} {{Stack|(+2 per stack)}} enemies for {{Color|d|200%}} base damage every {{Color|d|0.5s}}. The Tesla Coil switches off every {{Color|d|10 seconds}}.",
	Category = { "Damage", "AIBlacklist" },
	Unlock = "Macho",
	Stats = {
		{
			Stat = "Targets",
			Value = "3",
			Stack = "Linear",
			Add = "+2"
		}
	},
	InternalName = "ShockNearby",
	LocalizationInternalName = "ITEM_SHOCKNEARBY",
}
items["Gasoline"] = {
	Rarity = "Common",
	Quote = "Killing an enemy ignites other nearby enemies.",
	Desc = "Killing an enemy {{Color|d|ignites}} all enemies within {{Color|d|12m}} {{Stack|(+4m per stack)}} for {{Color|d|150%}} base damage. Additionally, enemies {{Color|d|burn}} for {{Color|d|150%}} {{Stack|(+75% per stack)}} base damage.",
	Category = { "Damage", "OnKillEffect" },
	Stats = {
		{
			Stat = "Damage",
			Value = "150%",
			Stack = "Linear",
			Add = "+75%"
		}, {
			Stat = "Radius",
			Value = "12m",
			Stack = "Linear",
			Add = "+4m"
		}
	},
	InternalName = "IgniteOnKill",
	LocalizationInternalName = "ITEM_IGNITEONKILL",
}
items["BoostDamage"] = {
	Rarity = "Untiered",
	Category = { "Hidden", "Damage" },
	Stats = {
		{
			Stat = "Damage Multiplier",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}
	},
	InternalName = "BoostDamage",
}
items["BoostHP"] = {
	Rarity = "Untiered",
	Category = { "Hidden", "Utility" },
	Stats = {
		{
			Stat = "Health Multiplier",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}
	},
	InternalName = "BoostHp",
}
items["Sentient Meat Hook"] = {
	Rarity = "Legendary",
	Quote = "Chance to hook all nearby enemies.",
	Desc = "{{Color|d|20%}} {{Stack|(+20% per stack)}} chance on hit to {{Color|d|fire homing hooks}} at up to {{Color|d|10}} {{Stack|(+5 per stack)}} enemies for {{Color|d|100%}} TOTAL damage.",
	Category = { "Damage" },
	Unlock = "Deja Vu?",
	Stats = {
		{
			Stat = "Chance",
			Value = "20%",
			Stack = "Hyperbolic",
			Add = "+20%"
		}, {
			Stat = "Targets",
			Value = "10",
			Stack = "Linear",
			Add = "+5"
		}
	},
	InternalName = "BounceNearby",
	LocalizationInternalName = "ITEM_BOUNCENEARBY",
}
items["Bundle of Fireworks"] = {
	Rarity = "Common",
	Quote = "Activating an interactable launches fireworks at nearby enemies.",
	Desc = "Activating an interactable {{Color|d|launches 8 {{Stack|(+4 per stack)}} fireworks}} that deal {{Color|d|300%}} base damage.",
	Category = { "Damage", "AIBlacklist", "InteractableRelated" },
	Unlock = "...Maybe One More.",
	Stats = {
		{
			Stat = "Fireworks",
			Value = "8",
			Stack = "Linear",
			Add = "+4"
		}
	},
	InternalName = "Firework",
	LocalizationInternalName = "ITEM_FIREWORK",
}
items["Bandolier"] = {
	Rarity = "Uncommon",
	Quote = "Chance on kill to drop an ammo pack that resets all skill cooldowns.",
	Desc = "{{Color|u|18%}} {{Stack|(+10% per stack)}} chance on kill to drop an ammo pack that {{Color|u|resets all skill cooldowns}}.",
	Category = { "Utility", "OnKillEffect" },
	Stats = {
		{
			Stat = "Chance",
			Value = "18%",
			Stack = "Special",
			Add = "+10%"
		}
	},
	InternalName = "Bandolier",
	LocalizationInternalName = "ITEM_BANDOLIER",
}
items["Stun Grenade"] = {
	Rarity = "Common",
	Quote = "Chance to stun on hit.",
	Desc = "{{Color|u|5%}} {{Stack|(+5% on stack)}} chance on hit to {{Color|u|stun}} enemies for {{Color|u|2 seconds}}.",
	Category = { "Utility", "AIBlacklist" },
	Stats = {
		{
			Stat = "Chance",
			Value = "5%",
			Stack = "Hyperbolic",
			Add = "+5%"
		}
	},
	InternalName = "StunChanceOnHit",
	LocalizationInternalName = "ITEM_STUNCHANCEONHIT",
}
items["Shaped Glass"] = {
	Rarity = "Lunar",
	Quote = "Double your damage... {{Color|#FF7F7F|BUT halve your health.}}",
	Desc = "Increase base damage by {{Color|d|100%}} {{Stack|(+100% per stack)}}. {{Color|h|Reduce maximum health by 50%}} {{Stack|(+50% per stack)}}.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Damage",
			Value = "100%",
			Stack = "Exponential",
			Add = "+100%"
		}, {
			Stat = "Health Reduction",
			Value = "50%",
			Stack = "Exponential",
			Add = "-50%"
		}
	},
	InternalName = "LunarDagger",
	LocalizationInternalName = "ITEM_LUNARDAGGER",
}
items["Brittle Crown"] = {
	Rarity = "Lunar",
	Quote = "Gain gold on hit... {{Color|#FF7F7F|BUT surrender gold on getting hit.}}",
	Desc = "{{Color|u|30% chance on hit}} to gain {{Color|u|2 {{Stack|(+2 per stack)}} gold}}. {{Color|u|Scales over time.}}\r\n\r\n{{Color|hp|Lose gold}} on taking damage equal to {{Color|hp|100%}} {{Stack|(+100% per stack)}} of the {{Color|hp|maximum health percentage you lost}}.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Gold Gained",
			Value = "2",
			Stack = "Linear",
			Add = "+2"
		}, {
			Stat = "Gold Lost",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}
	},
	InternalName = "GoldOnHit",
	LocalizationInternalName = "ITEM_GOLDONHIT",
}
items["Transcendence"] = {
	Rarity = "Lunar",
	Quote = "Convert all your health into shield. Increase maximum health.",
	Desc = "{{Color|h|Convert}} all but {{Color|h|1 health}} into {{Color|h|regenerating shields}}. {{Color|h|Gain 50% {{Stack|(+25% per stack)}} maximum health}}.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Maximum Health",
			Value = "50%",
			Stack = "Linear",
			Add = "+25%"
		}
	},
	InternalName = "ShieldOnly",
	LocalizationInternalName = "ITEM_SHIELDONLY",
}
items["Alien Head"] = {
	Rarity = "Legendary",
	Quote = "Reduces cooldowns for your skills.",
	Desc = "{{Color|u|Reduce skill cooldowns}} by {{Color|u|25%}} {{Stack|(+25% per stack)}}.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Cooldown",
			Value = "25%",
			Stack = "Exponential",
			Add = "+25%"
		}
	},
	InternalName = "AlienHead",
	LocalizationInternalName = "ITEM_ALIENHEAD",
}
items["Soulbound Catalyst"] = {
	Rarity = "Legendary",
	Quote = "Kills reduce equipment cooldown.",
	Desc = "{{Color|d|Kills reduce}} {{Color|u|equipment cooldown}} by {{Color|u|4s}} {{Stack|(+2s per stack)}}.",
	Category = { "Utility", "AIBlacklist", "OnKillEffect", "EquipmentRelated" },
	Unlock = "Newtist",
	Stats = {
		{
			Stat = "Cooldown Reduction",
			Value = "4s",
			Stack = "Linear",
			Add = "+2s"
		}
	},
	InternalName = "Talisman",
	LocalizationInternalName = "ITEM_TALISMAN",
}
items["Titanic Knurl"] = {
	Rarity = "Boss",
	Boss = "Stone Titan",
	Quote = "Boosts health and regeneration.",
	Desc = "{{Color|h|Increase maximum health}} by {{Color|h|40}} {{Stack|(+40 per stack)}} and {{Color|h|base health regeneration}} by {{Color|h|+1.6 hp/s}} {{Stack|(+1.6 hp/s per stack)}}.",
	Category = { "Utility", "Healing" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Maximum Health",
			Value = "40",
			Stack = "Linear",
			Add = "+40"
		}, {
			Stat = "Health Regen",
			Value = "1.6",
			Stack = "Linear",
			Add = "+1.6"
		}
	},
	InternalName = "Knurl",
	LocalizationInternalName = "ITEM_KNURL",
}
items["Queen's Gland"] = {
	Rarity = "Boss",
	Boss = "Beetle Queen",
	Quote = "Recruit a Beetle Guard.",
	Desc = "Every 30 seconds, {{Color|u|summon a Beetle Guard}} with bonus {{Color|d|300%}} damage and {{Color|h|100% health}}. Can have up to {{Color|u|1}} {{Stack|(+1 per stack)}} Guards at a time.",
	Category = { "Utility" , "TurretBlacklist" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Beetle Guard",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "BeetleGland",
	LocalizationInternalName = "ITEM_BEETLEGLAND",
}
items["BurnNearby"] = {
	Rarity = "Untiered",
	Category = { "Abandoned" },
}
items["CritHeal"] = {
	Rarity = "Untiered",
	Category = { "Abandoned", "Healing" },
	Stats = {
		{
			Stat = "Critical Chance",
			Value = "5%",
			Stack = "None",
			Add = ""
		}
	}
}
items["CrippleWardOnLevel"] = {
	Rarity = "Untiered",
	Category = { "Abandoned", "Utility" },
	Stats = {
		{
			Stat = "Radius",
			Value = "16m",
			Stack = "Linear",
			Add = "+8m"
		}
	}
}
items["Energy Drink"] = {
	Rarity = "Common",
	Quote = "Increase sprint speed by +25%.",
	Desc = "{{Color|u|Sprint speed}} is improved by {{Color|u|25%}} {{Stack|(+25% per stack)}}.",
	Category = { "Utility", "AIBlacklist", "SprintRelated" },
	Stats = {
		{
			Stat = "Sprint Speed",
			Value = "25%",
			Stack = "Linear",
			Add = "+25%"
		}
	},
	InternalName = "SprintBonus",
	LocalizationInternalName = "ITEM_SPRINTBONUS",
}
items["Backup Magazine"] = {
	Rarity = "Common",
	Quote = "Add an extra charge of your Secondary skill.",
	Desc = "Add {{Color|u|+1}} {{Stack|(+1 per stack)}} charge of your {{Color|u|Secondary skill}}.",
	Category = { "Utility" },
	Unlock = "Flawless",
	Stats = {
		{
			Stat = "Charge",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "SecondarySkillMagazine",
	LocalizationInternalName = "ITEM_SECONDARYSKILLMAGAZINE",
}
items["Sticky Bomb"] = {
	Rarity = "Common",
	Quote = "Chance on hit to attach a bomb to enemies.",
	Desc = "{{Color|d|5%}} {{Stack|(+5% per stack)}} chance on hit to attach a {{Color|d|bomb}} to an enemy, detonating for {{Color|d|180%}} TOTAL damage.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Chance",
			Value = "5%",
			Stack = "Linear",
			Add = "+5%"
		}
	},
	InternalName = "StickyBomb",
	LocalizationInternalName = "ITEM_STICKYBOMB",
}
items["Rusted Key"] = {
	Rarity = "Common",
	Quote = "Gain access to a Rusty Lockbox that contains a powerful item.",
	Desc = "A {{Color|u|hidden cache}} containing an item ({{Color|h|80%}}/{{Color|hp|20%}}) will appear in a random location {{Color|u|on each stage}}. Opening the cache {{Color|u|consumes}} this item.",
	Category = { "Utility", "AIBlacklist", "OnStageBeginEffect" },
	Unlock = "Keyed Up",
	Corrupt = "Encrusted Key",
	Stats = {
	},
	InternalName = "TreasureCache",
	LocalizationInternalName = "ITEM_TREASURECACHE",
}
items["Armor-Piercing Rounds"] = {
	Rarity = "Common",
	Quote = "Deal extra damage to bosses.",
	Desc = "Deal an additional {{Color|d|20%}} damage {{Stack|(+20% per stack)}} to bosses.",
	Category = { "Damage", "AIBlacklist" },
	Unlock = "Advancement",
	Stats = {
		{
			Stat = "Damage",
			Value = "20%",
			Stack = "Linear",
			Add = "+20%"
		}
	},
	InternalName = "BossDamageBonus",
	LocalizationInternalName = "ITEM_BOSSDAMAGEBONUS",
}
items["Rose Buckler"] = {
	Rarity = "Uncommon",
	Quote = "Reduce incoming damage while sprinting.",
	Desc = "{{Color|h|Increase armor}} by {{Color|h|30}} {{Stack|(+30 per stack)}} {{Color|u|while sprinting}}.",
	Category = { "Utility", "AIBlacklist", "SprintRelated" },
	Stats = {
		{
			Stat = "Armor",
			Value = "30",
			Stack = "Linear",
			Add = "+30"
		}
	},
	InternalName = "SprintArmor",
	LocalizationInternalName = "ITEM_SPRINTARMOR",
}
items["Runald's Band"] = {
	Rarity = "Uncommon",
	Quote = "High damage hits also blasts enemies with runic ice. Recharges over time.",
	Desc = "Hits that deal {{Color|d|more than 400% damage}} also blasts enemies with a {{Color|d|runic ice blast}}, {{Color|u|slowing}} them by {{Color|u|80%}} for {{Color|u|3s}} {{Stack|(+3s per stack)}} and dealing {{Color|d|250%}} {{Stack|(+250% per stack)}} TOTAL damage. Recharges every {{Color|u|10}} seconds.",
	Category = { "Damage" },
	Unlock = "Death Do Us Part",
	Corrupt = "Singularity Band",
	Stats = {
		{
			Stat = "Slow Duration",
			Value = "3s",
			Stack = "Linear",
			Add = "+3s"
		}, {
			Stat = "Damage",
			Value = "250%",
			Stack = "Linear",
			Add = "+250%"
		}
	},
	InternalName = "IceRing",
	LocalizationInternalName = "ITEM_ICERING",
}
items["Kjaro's Band"] = {
	Rarity = "Uncommon",
	Quote = "High damage hits also blasts enemies with a runic flame tornado. Recharges over time.",
	Desc = "Hits that deal {{Color|d|more than 400% damage}} also blasts enemies with a {{Color|d|runic flame tornado}}, dealing {{Color|d|300%}} {{Stack|(+300% per stack)}} TOTAL damage over time. Recharges every {{Color|u|10}} seconds.",
	Category = { "Damage" },
	Unlock = "Death Do Us Part",
	Corrupt = "Singularity Band",
	Stats = {
		{
			Stat = "Damage",
			Value = "300%",
			Stack = "Linear",
			Add = "+300%"
		}
	},
	InternalName = "FireRing",
	LocalizationInternalName = "ITEM_FIRERING",
}
items["Chronobauble"] = {
	Rarity = "Uncommon",
	Quote = "Slow enemies on hit.",
	Desc = "{{Color|u|Slow}} enemies on hit for {{Color|u|-60% movement speed}} for {{Color|u|2s}} {{Stack|(+2s per stack)}}.",
	Category = { "Utility" },
	Corrupt = "Tentabauble",
	Stats = {
		{
			Stat = "Slow Duration",
			Value = "2s",
			Stack = "Linear",
			Add = "+2s"
		}
	},
	InternalName = "SlowOnHit",
	LocalizationInternalName = "ITEM_SLOWONHIT",
}
items["Dio's Best Friend"] = {
	Rarity = "Legendary",
	Quote = "Cheat death. Consumed on use.",
	Desc = "{{Color|u|Upon death}}, this item will be {{Color|u|consumed}} and you will {{Color|h|return to life}} with {{Color|h|3 seconds of invulnerability}}.",
	Category = { "Utility" },
	Unlock = "The Lone Survivor",
	Corrupt = "Pluripotent Larva",
	Stats = {
		{
			Stat = "Uses",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "ExtraLife",
	LocalizationInternalName = "ITEM_EXTRALIFE",
}
items["Dio's Best Friend (Consumed)"] = {
	Rarity = "Untiered",
	Quote = "",
	Desc = "A spent item with no remaining power.",
	Category = { "Utility" },
	Stats = {
	},
	InternalName = "ExtraLifeConsumed",
	LocalizationInternalName = "ITEM_EXTRALIFECONSUMED",
	Consumed = true,
}
items["Hardlight Afterburner"] = {
	Rarity = "Legendary",
	Quote = "Add 2 extra charges of your Utility skill. Reduce Utility skill cooldown.",
	Desc = "Add {{Color|u|+2}} {{Stack|(+2 per stack)}} charges of your {{Color|u|Utility skill}}. {{Color|u|Reduces Utility skill cooldown}} by {{Color|u|33%}}.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Charges",
			Value = "2",
			Stack = "Linear",
			Add = "+2"
		}
	},
	InternalName = "UtilitySkillMagazine",
	LocalizationInternalName = "ITEM_UTILITYSKILLMAGAZINE",
}
items["Wake of Vultures"] = {
	Rarity = "Legendary",
	Quote = "Temporarily steal the power of slain elites.",
	Desc = "Gain the {{Color|d|power}} of any killed elite monster for {{Color|d|8s}} {{Stack|(+5s per stack)}}.",
	Category = { "Damage", "Utility", "AIBlacklist", "OnKillEffect" },
	Stats = {
		{
			Stat = "Duration",
			Value = "8s",
			Stack = "Linear",
			Add = "+5s"
		}
	},
	InternalName = "HeadHunter",
	LocalizationInternalName = "ITEM_HEADHUNTER",
}
items["Brainstalks"] = {
	Rarity = "Legendary",
	Quote = "Skills have NO cooldowns for a short period after killing an elite.",
	-- Modified Description
	Desc = "Upon killing an elite monster, {{Color|d|enter a frenzy}} for {{Color|d|4s}} {{Stack|(+4s per stack)}} where {{Color|u|skills have 0.5s cooldowns}}.",
	Category = { "Utility", "AIBlacklist", "OnKillEffect" },
	Unlock = "Deicide",
	Stats = {
		{
			Stat = "Duration",
			Value = "4s",
			Stack = "Linear",
			Add = "+4s"
		}
	},
	InternalName = "KillerEliteFrenzy",
	LocalizationInternalName = "ITEM_KILLELITEFRENZY",
}
items["Rejuvenation Rack"] = {
	Rarity = "Legendary",
	Quote = "Double the strength of healing.",
	Desc = "{{Color|h|Heal +100%}} {{Stack|(+100% per stack)}} more.",
	Category = { "Healing" },
	Unlock = "Naturopath",
	Stats = {
		{
			Stat = "Heal",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}
	},
	InternalName = "IncreaseHealing",
	LocalizationInternalName = "ITEM_INCREASEHEALING",
}
items["Corpsebloom"] = {
	Rarity = "Lunar",
	Quote = "Double your healing... {{Color|#FF7F7F|BUT it's applied over time.}}",
	Desc = "{{Color|h|Heal +100%}} {{Stack|(+100% per stack)}} more. {{Color|h|All healing is applied over time}}. Can {{Color|h|heal}} for a {{Color|h|maximum}} of {{Color|h|10%}} {{Stack|(-50% per stack)}} of your {{Color|h|health per second}}.",
	Category = { "Healing" },
	Stats = {
		{
			Stat = "Heal",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}, {
			Stat = "Maximum Heal",
			Value = "10%",
			Stack = "Reciprocal",
			Add = "+1"
		}
	},
	InternalName = "RepeatHeal",
	LocalizationInternalName = "ITEM_REPEATHEAL",
}
items["Gesture of the Drowned"] = {
	Rarity = "Lunar",
	Quote = "Dramatically reduce Equipment cooldown... {{Color|#FF7F7F|BUT it automatically activates.}}",
	Desc = "{{Color|u|Reduce Equipment cooldown}} by {{Color|u|50%}} {{Stack|(+15% per stack)}}. Forces your Equipment to {{Color|u|activate}} whenever it is off {{Color|u|cooldown}}.",
	Category = { "Utility", "EquipmentRelated" },
	Unlock = "The Demons And The Crabs",
	Stats = {
		{
			Stat = "Cooldown Reduction",
			Value = "50%",
			Stack = "Exponential",
			Add = "15%"
		}
	},
	InternalName = "AutoCastEquipment",
	LocalizationInternalName = "ITEM_AUTOCASTEQUIPMENT",
}
items["Old Guillotine"] = {
	Rarity = "Uncommon",
	Quote = "Instantly kill low health Elite monsters.",
	Desc = "Instantly kill Elite monsters below {{Color|hp|13% {{Stack|(+13% per stack)}} health}}.",
	Category = { "Damage", "AIBlacklist" },
	Unlock = "Cut Down",
	Stats = {
		{
			Stat = "Threshold",
			Value = "13%",
			Stack = "Hyperbolic",
			Add = "+13%"
		}
	},
	InternalName = "ExecuteOnLowHealthElite",
	LocalizationInternalName = "ITEM_EXECUTELOWHEALTHELITE",
}
items["War Horn"] = {
	Rarity = "Uncommon",
	Quote = "Activating your Equipment gives you a burst of attack speed.",
	Desc = "Activating your Equipment gives you {{Color|d|+70% attack speed}} for {{Color|d|8s}} {{Stack|(+4s per stack)}}.",
	Category = { "Damage", "AIBlacklist", "EquipmentRelated" },
	Unlock = "Warmonger",
	Stats = {
		{
			Stat = "Duration",
			Value = "8s",
			Stack = "Linear",
			Add = "+4s"
		}
	},
	InternalName = "EnergizedOnEquipmentUse",
	LocalizationInternalName = "ITEM_ENERGIZEDONEQUIPMENTUSE",
}
items["Aegis"] = {
	Rarity = "Legendary",
	Quote = "Healing past full grants you a temporary barrier.",
	Desc = "Healing past full grants you a {{Color|h|temporary barrier}} for {{Color|h|50%}} {{Stack|(+50% per stack)}} of the amount you {{Color|h|healed}}.",
	Category = { "Utility", "Healing" },
	Stats = {
		{
			Stat = "Healing Converted",
			Value = "50%",
			Stack = "Linear",
			Add = "+50%"
		}
	},
	InternalName = "BarrierOnOverHeal",
	LocalizationInternalName = "ITEM_BARRIERONOVERHEAL",
}
items["DrizzlePlayerHelper"] = {
	Rarity = "Untiered",
	Category = { "Hidden" },
	Stats = {
		{
			Stat = "Armor",
			Value = "70",
			Stack = "Linear",
			Add = "+70"
		}, {
			Stat = "Regen Multiplier",
			Value = "+0.5",
			Stack = "None",
			Add = ""
		}
	},
	InternalName = "DrizzlePlayerHelper",
}
items["Ghost"] = {
	Rarity = "Untiered",
	Category = { "Hidden" },
	InternalName = "Ghost",
}
items["HealthDecay"] = {
	Rarity = "Untiered",
	Category = { "Hidden" },
	Stats = {
		{
			Stat = "Health Regen",
			Value = "- Health/Stacksize",
			Stack = "Reciprocal",
			Add = "+1"
		}
	},
	InternalName = "HealthDecay",
}
items["MageAttunement"] = {
	Rarity = "Untiered",
	Category = { "Abandoned" },
}
items["Tonic Affliction"] = {
	Rarity = "Untiered",
	Quote = "{{Color|#FF7F7F|Reduce ALL stats when not under the effects of Spinel Tonic.}}",
	Desc = "{{Color|#FF7F7F|Reduce ALL stats by -5% {{Stack|(-5% per stack)}}.}}",
	Category = { "Cleansable" },
	Stats = {
		{
			Stat = "Most",
			Value = "-5%",
			Stack = "Exponential",
			Add = "-5%"
		}
	},
	InternalName = "TonicAffliction",
	LocalizationInternalName = "ITEM_TONICAFFLICTION",
}
items["Halcyon Seed"] = {
	Rarity = "Boss",
	Boss = "Aurelionite",
	Quote = "Summon Aurelionite during the Teleporter event.",
	Desc = "Summon {{Color|d|Aurelionite}} during the teleporter event. It has {{Color|d|100% {{Stack|(+50% per stack)}} damage}} and {{Color|h|100% {{Stack|(+100% per stack)}} health}}.",
	Category = { "Utility", "WorldUnique", "CannotSteal", "TurretBlacklist", "HoldoutZoneRelated" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Health",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}, {
			Stat = "Damage",
			Value = "100%",
			Stack = "Linear",
			Add = "+50%"
		}
	},
	InternalName = "TitanGoldDuringTP",
	LocalizationInternalName = "ITEM_TITANGOLDDURINGTP",
}
items["Little Disciple"] = {
	Rarity = "Boss",
	Boss = "Grovetender",
	Quote = "Fire tracking wisps while sprinting.",
	Desc = "Fire a {{Color|d|tracking wisp}} for {{Color|d|300% {{Stack|(+300% per stack)}} damage}}. Fires every {{Color|u|1.6}} seconds while sprinting. Fire rate increases with {{Color|u|movement speed}}.",
	Category = { "Damage", "SprintRelated" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Damage",
			Value = "300%",
			Stack = "Linear",
			Add = "+300%"
		}
	},
	InternalName = "SprintWisp",
	LocalizationInternalName = "ITEM_SPRINTWISP",
}
items["Topaz Brooch"] = {
	Rarity = "Common",
	Quote = "Gain a temporary barrier on kill.",
	Desc = "Gain a {{Color|h|temporary barrier}} on kill for {{Color|h|15 health}} {{Stack|(+15 per stack)}}.",
	Category = { "Utility", "Healing", "OnKillEffect" },
	Stats = {
		{
			Stat = "Barrier",
			Value = "15",
			Stack = "Linear",
			Add = "+15"
		}
	},
	InternalName = "BarrierOnKill",
	LocalizationInternalName = "ITEM_BARRIERONKILL",
}
items["Shattering Justice"] = {
	Rarity = "Legendary",
	Quote = "Reduce the armor of enemies after repeatedly striking them.",
	Desc = "After hitting an enemy {{Color|d|5}} times, reduce their {{Color|d|armor}} by {{Color|d|60}} for {{Color|d|8}} {{Stack|(+8 per stack)}} seconds.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Duration",
			Value = "8s",
			Stack = "Linear",
			Add = "+8s"
		}
	},
	InternalName = "ArmorReductionOnHit",
	LocalizationInternalName = "ITEM_ARMORREDUCTIONONHIT",
}
items["Lepton Daisy"] = {
	Rarity = "Uncommon",
	Quote = "Periodically release a healing nova during the Teleporter event and 'Holdout Zones' such as the Void Fields.",
	Desc = "Release a {{Color|h|healing nova}} during the Teleporter event, {{Color|h|healing}} all nearby allies for {{Color|h|50%}} of their maximum health. Occurs {{Color|h|1}} {{Stack|(+1 per stack)}} times.",
	Category = { "Healing", "AIBlacklist", "TurretBlacklist", "HoldoutZoneRelated" },
	Stats = {
		{
			Stat = "Healing Nova",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "TPHealingNova",
	LocalizationInternalName = "ITEM_TPHEALINGNOVA",
}
items["Focus Crystal"] = {
	Rarity = "Common",
	Quote = "Deal bonus damage to nearby enemies.",
	Desc = "Increase damage to enemies within {{Color|d|13m}} by {{Color|d|20%}} {{Stack|(+20% per stack)}}.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Damage",
			Value = "20%",
			Stack = "Linear",
			Add = "+20%"
		}
	},
	InternalName = "NearbyDamageBonus",
	LocalizationInternalName = "ITEM_NEARBYDAMAGEBONUS",
}
items["Strides of Heresy"] = {
	Rarity = "Lunar",
	Quote = "Replace your Utility Skill with 'Shadowfade'.",
	-- Modified Description
	Desc = "{{Color|u|Replace your Utility Skill}} with {{Color|u|Shadowfade}}.\r\n\r\nFade away, becoming {{Color|u|intangible}} and gaining {{Color|u|+30% movement speed}}. {{Color|h|Heal}} for {{Color|h|18.2% {{Stack|(+18.2% per stack)}} of your maximum health}}. Lasts 3 {{Stack|(+3 per stack)}} seconds.",
	Category = { "Utility", "AIBlacklist", "CannotSteal" },
	Unlock = "Blockade Breaker",
	Stats = {
		{
			Stat = "Heal",
			Value = "18.2%",
			Stack = "Linear",
			Add = "+18.2%"
		}, {
			Stat = "Duration",
			Value = "3s",
			Stack = "Linear",
			Add = "+3s"
		}
	},
	InternalName = "LunarUtilityReplacement",
	LocalizationInternalName = "ITEM_LUNARUTILITYREPLACEMENT",
}
items["MonsoonPlayerHelper"] = {
	Rarity = "Untiered",
	Category = { "Hidden" },
	Stats = {
		{
			Stat = "Regen Multiplier",
			Value = "-0.4",
			Stack = "None",
			Add = ""
		}
	},
	InternalName = "MonsoonPlayerHelper",
}
items["Razorwire"] = {
	Rarity = "Uncommon",
	Quote = "Retaliate in a burst of razors on taking damage.",
	Desc = "Getting hit causes you to explode in a burst of razors, dealing {{Color|d|160% damage}}. Hits up to {{Color|d|5}} {{Stack|(+2 per stack)}} targets in a {{Color|d|25m}} {{Stack|(+10m per stack)}} radius",
	Category = { "Damage", "AIBlacklist" },
	Stats = {
		{
			Stat = "Targets",
			Value = "5",
			Stack = "Linear",
			Add = "+2"
		}, {
			Stat = "Radius",
			Value = "25m",
			Stack = "Linear",
			Add = "+10m"
		}
	},
	InternalName = "Thorns",
	LocalizationInternalName = "ITEM_THORNS",
}
items["Bison Steak"] = {
	Rarity = "Common",
	Quote = "Gain 25 max health.",
	Desc = "Increases {{Color|h|maximum health}} by {{Color|h|25}} {{Stack|(+25 per stack)}}.",
	Category = { "Healing" },
	Stats = {
		{
			Stat = "Health",
			Value = "25",
			Stack = "Linear",
			Add = "+25"
		}
	},
	InternalName = "FlatHealth",
	LocalizationInternalName = "ITEM_FLATHEALTH",
}
items["Pearl"] = {
	Rarity = "Boss",
	Boss = "Cleansing Pool",
	Quote = "Increase your maximum health.",
	Desc = "Increases {{Color|h|maximum health}} by {{Color|h|10%}} {{Stack|(+10% per stack)}}.",
	Category = { "Utility", "WorldUnique" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Health",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}
	},
	InternalName = "Pearl",
	LocalizationInternalName = "ITEM_PEARL",
}
items["Irradiant Pearl"] = {
	Rarity = "Boss",
	Boss = "Cleansing Pool",
	Quote = "Increase ALL of your stats.",
	Desc = "Increases {{Color|u|ALL stats}} by {{Color|u|10%}} {{Stack|(+10% per stack)}}.",
	Category = { "Damage", "Healing", "Utility", "WorldUnique" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Health",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}, {
			Stat = "Health Regen",
			Value = "+0.1",
			Stack = "Linear",
			Add = "+0.02"
		}, {
			Stat = "Movement Speed",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}, {
			Stat = "Damage",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}, {
			Stat = "Attack Speed",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}, {
			Stat = "Crit Chance",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}, {
			Stat = "Armor Multiplier",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}
	},
	InternalName = "ShinyPearl",
	LocalizationInternalName = "ITEM_SHINYPEARL",
}
items["Ghor's Tome"] = {
	Rarity = "Uncommon",
	Quote = "Chance on kill to drop a treasure.",
	Desc = "{{Color|u|4%}} {{Stack|(+4% on stack)}} chance on kill to drop a treasure worth {{Color|u|$25}}. {{Color|u|Scales over time.}}",
	Category = { "Utility", "OnKillEffect" },
	Stats = {
		{
			Stat = "Drop Chance",
			Value = "4%",
			Stack = "Linear",
			Add = "+4%"
		}
	},
	InternalName = "BonusGoldPackOnKill",
	LocalizationInternalName = "ITEM_BONUSGOLDPACKONKILL",
}
items["Resonance Disc"] = {
	Rarity = "Legendary",
	Quote = "Obtain a Resonance Disc charged by killing enemies. Fires automatically when fully charged.",
	Desc = "Killing {{Color|d|4}} enemies in {{Color|u|7 seconds}} charges the Resonance Disc. The disc launches itself toward a target for {{Color|d|300%}} base damage {{Stack|(+300% per stack)}}, piercing all enemies it doesn't kill, and then explodes for {{Color|d|1000%}} base damage {{Stack|(+1000% per stack)}}. Returns to the user, striking all enemies along the way for {{Color|d|300%}} base damage {{Stack|(+300% per stack)}}.",
	Category = { "Damage", "OnKillEffect" },
	Stats = {
		{
			Stat = "Damage",
			Value = "300%",
			Stack = "Linear",
			Add = "+300%"
		}, {
			Stat = "Explosion",
			Value = "1000%",
			Stack = "Linear",
			Add = "+1000%"
		}
	},
	InternalName = "LaserTurbine",
	LocalizationInternalName = "ITEM_LASERTURBINE",
}
items["Visions of Heresy"] = {
	Rarity = "Lunar",
	Quote = "Replace your Primary Skill with 'Hungering Gaze'.",
	Desc = "{{Color|u|Replace your Primary Skill}} with {{Color|u|Hungering Gaze}}.\r\n\r\nFire a flurry of {{Color|u|tracking shards}} that detonate after a delay, dealing {{Color|d|120%}} base damage. Hold up to 12 charges {{Stack|(+12 per stack)}} that reload after 2 seconds {{Stack|(+2 per stack)}}.",
	Category = { "Damage", "AIBlacklist", "CannotSteal"},
	Unlock = "Blockade Breaker",
	Stats = {
		{
			Stat = "Charges",
			Value = "12",
			Stack = "Linear",
			Add = "+12"
		}, {
			Stat = "Reload",
			Value = "2s",
			Stack = "Linear",
			Add = "+2s"
		}
	},
	InternalName = "LunarPrimaryReplacement",
	LocalizationInternalName = "ITEM_LUNARPRIMARYREPLACEMENT",
}
items["Genesis Loop"] = {
	Rarity = "Boss",
	Boss = "Wandering Vagrant",
	Quote = "Fire an electric nova at low health.",
	-- Modified Description
	Desc = "Falling below {{Color|hp|25% health}} causes you to explode, dealing {{Color|d|6000% base damage}}. Recharges every {{Color|u|30 / (2 {{Stack|+1 per stack}}) seconds}} .",
	Category = { "Damage", "LowHealth" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Recharge Speed",
			Value = "100%",
			Stack = "Linear",
			Add = "+50%"
		}
	},
	InternalName = "NovaOnLowHealth",
	LocalizationInternalName = "ITEM_NOVAONLOWHEALTH",
}
items["Beads of Fealty"] = {
	Rarity = "Lunar",
	Quote = "Seems to do nothing... {{Color|#FF7F7F|but...}}",
	Desc = "Seems to do nothing... {{Color|#FF7F7F|but...}}",
	InternalName = "LunarTrinket",
	LocalizationInternalName = "ITEM_LUNARTRINKET",
}
items["Artifact Key"] = {
	Rarity = "Boss",
	Boss = "Bulwark's Ambry",
	Quote = "A stone shard with immense power.",
	Desc = "A stone shard with immense power.",
	Category = { "WorldUnique" },
	InternalName = "ArtifactKey",
	LocalizationInternalName = "ITEM_ARTIFACTKEY",
}
items["Repulsion Armor Plate"] = {
	Rarity = "Common",
	Quote = "Receive flat damage reduction from all attacks.",
	Desc = "Reduce all {{Color|d|incoming damage}} by {{Color|d|5{{Stack| (+5 per stack)}}}}. Cannot be reduced below {{Color|d|1}}.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Damage Reduction",
			Value = "5",
			Stack = "Linear",
			Add = "+5"
		}
	},
	InternalName = "ArmorPlate",
	LocalizationInternalName = "ITEM_REPULSIONARMORPLATE",
}
items["Squid Polyp"] = {
	Rarity = "Uncommon",
	Quote = "Activating an interactable summons a Squid Turret nearby.",
	Desc = "Activating an interactable summons a {{Color|d|Squid Turret}} that attacks nearby enemies at {{Color|d|100% {{Stack|(+100% per stack)}} attack speed}}. Lasts {{Color|u|30}} seconds.",
	Category = { "Damage", "AIBlacklist", "InteractableRelated" },
	Unlock = "Automation Activation",
	Stats = {
		{
			Stat = "Attack Speed",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}
	},
	InternalName = "Squid",
	LocalizationInternalName = "ITEM_SQUIDTURRET",
}
items["Death Mark"] = {
	Rarity = "Uncommon",
	Quote = "Enemies with 4 or more debuffs are marked for death, taking bonus damage.",
	Desc = "Enemies with {{Color|d|4}} or more debuffs are {{Color|d|marked for death}}, increasing damage taken by {{Color|d|50%}} from all sources for {{Color|u|7}} {{Stack|(+7 per stack)}} seconds.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Debuff Duration",
			Value = "7s",
			Stack = "Linear",
			Add = "+7s"
		}
	},
	InternalName = "DeathMark",
	LocalizationInternalName = "ITEM_DEATHMARK",
}
items["Interstellar Desk Plant"] = {
	Rarity = "Legendary",
	Quote = "Plant a healing fruit on kill.",
	-- Modified Description
	Desc = "On kill, plant a {{Color|h|healing}} fruit seed that grows into a plant after {{Color|u|5}} seconds.\r\n\r\nThe plant {{Color|h|heals}} for {{Color|h|5%}} of {{Color|h|maximum health}} every 0.5 second to all allies within {{Color|h|10m}} {{Stack|(+5.0m per stack)}}. Lasts {{Color|u|10}} seconds.",
	Category = { "Healing", "OnKillEffect" },
	Stats = {
		{
			Stat = "Radius",
			Value = "5m",
			Stack = "Linear",
			Add = "+5m"
		}
	},
	InternalName = "Plant",
	LocalizationInternalName = "ITEM_INTERSTELLARDESKPLANT",
}
items["Ancestral Incubator"] = {
	Rarity = "Untiered",
	Boss = "Grandparent",
	Quote = "Chance on kill to summon an Ancestral Pod.",
	Desc = "{{Color|d|7%}} chance {{Stack|(+1% per stack)}} on kill to {{Color|u|summon an Ancestral Pod}} that distracts enemies.\r\n\r\nOnce it fully grows, it will hatch into an allied {{Color|d|Parent}} with {{Color|h|100% health}} {{Stack|(+100% per stack)}}.",
	Category = { "Utility", "OnKillEffect" },
	Stats = {
		{
			Stat = "Chance",
			Value = "7%",
			Stack = "Linear",
			Add = "+1%"
		}, {
			Stat = "Parent Health",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}
	},
	InternalName = "Incubator",
	LocalizationInternalName = "ITEM_ANCESTRALINCUBATOR",
}
items["Focused Convergence"] = {
	Rarity = "Lunar",
	Quote = "Increase the speed of Teleporter charging... {{Color|#FF7F7F|BUT reduce the size of the zone}}.",
	Desc = "Teleporters charge {{Color|u|30% {{Stack|(+30% per stack)}} faster}}, but the size of the Teleporter zone is {{Color|hp|50%}} {{Stack|(-50% per stack)}} smaller.",
	Category = { "Utility", "AIBlacklist", "TurretBlacklist", "HoldoutZoneRelated" },
	Unlock = "Never Back Down",
	Stats = {
		{
			Stat = "Charge Speed",
			Value = "30%",
			Stack = "Linear",
			Add = "+30%"
		}, {
			Stat = "Teleporter Zone",
			Value = "100%",
			Stack = "Reciprocal",
			Add = "+2"
		}
	},
	InternalName = "FocusConvergence",
	LocalizationInternalName = "ITEM_FOCUSEDCONVERGENCE",
}
items["Molten Perforator"] = {
	Rarity = "Boss",
	Boss = "Magma Worm",
	Quote = "Chance on hit to fire magma balls.",
	Desc = "{{Color|d|10%}} chance on hit to call forth {{Color|d|3 magma balls}} from an enemy, dealing {{Color|d|300%}} {{Stack|(+300% per stack)}} damage each.",
	Category = { "Damage" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Damage",
			Value = "300%",
			Stack = "Linear",
			Add = "+300%"
		}
	},
	InternalName = "FireballsOnHit",
	LocalizationInternalName = "ITEM_FIREBALLSONHIT",
}
items["Charged Perforator"] = {
	Rarity = "Boss",
	Boss = "Overloading Worm",
	Quote = "Chance on hit to call down a lightning strike.",
	Desc = "{{Color|d|10%}} chance on hit to down a lightning strike, dealing {{Color|d|500%}} {{Stack|(+500% per stack)}} damage.",
	Category = { "Damage" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Damage",
			Value = "500%",
			Stack = "Linear",
			Add = "+500%"
		}
	},
	InternalName = "LightningStrikeOnHit",
	LocalizationInternalName = "ITEM_LIGHTNINGSTRIKEONHIT",
}
items["Shatterspleen"] = {
	Rarity = "Boss",
	Boss = "Imp Overlord",
	Quote = "Critical strikes always bleed enemies. Bleeding enemies now explode.",
	-- Modified Description
	Desc = "Gain {{Color|d|5% critical chance}}. {{Color|d|Critical Strikes bleed}} enemies for {{Color|d|240%}} base damage. {{Color|d|Bleeding}} enemies {{Color|d|explode}} on death for {{Color|d|400%}} {{Stack|(+400% per stack)}} damage, plus an additional {{Color|d|15%}} {{Stack|(+15% per stack)}} of their maximum health.", 
	Category = { "Damage" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Damage (Base)",
			Value = "400%",
			Stack = "Linear",
			Add = "+400%"
		}, {
			Stat = "Damage (Max HP)",
			Value = "15%",
			Stack = "Linear",
			Add = "+15%"
		}, {
			Stat = "Crit chance",
			Value = "5%",
			Stack = "None",
			Add = ""
		}
	},
	InternalName = "BleedOnHitAndExplode",
	LocalizationInternalName = "ITEM_BLEEDONHITANDEXPLODE",
}
items["Mired Urn"] = {
	Rarity = "Boss",
	Boss = "Clay Dunestrider",
	Quote = "Siphon health from nearby enemies while in combat.",
	Desc = "While in combat, the nearest 1 {{Stack|(+1 per stack)}} enemies to you within {{Color|d|13m}} will be 'tethered' to you, dealing {{Color|d|100%}} damage per second, applying {{Color|d|tar}}, and {{Color|h|healing}} you for {{Color|h|100%}} of the damage dealt.",
	Category = { "Healing", "BrotherBlacklist" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Tethered Enemies",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "SiphonOnLowHealth",
	LocalizationInternalName = "ITEM_SIPHONONLOWHEALTH",
}
items["Defiant Gouge"] = {
	Rarity = "Lunar",
	Quote = "Using a Shrine summons enemies nearby.",
	-- Modified Description
	Desc = "Using a Shrine summons {{Color|hp|enemies}} {{Stack|(stronger per stack)}} nearby. {{Color|u|Scales over time.}}",
	Category = { "Utility", "AIBlacklist" },
	Stats = {
		{
			Stat = "Enemy Difficulty",
			Value = "40%",
			Stack = "Linear",
			Add = "+40%"
		}
	},
	InternalName = "MonstersOnShrineUse",
	LocalizationInternalName = "ITEM_MONSTERSONSHRINEUSE",
}
items["Mercurial Rachis"] = {
	Rarity = "Lunar",
	Quote = "Randomly create a Ward of Power. ALL characters deal bonus damage while in the Ward.",
	Desc = "Creates a Ward of Power in a random location nearby that buffs both enemies and allies within {{Color|u|16m}} {{Stack|(+50% per stack)}}, causing them to deal {{Color|d|+50%}} damage.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Range",
			Value = "16m",
			Stack = "Exponential",
			Add = "+50%"
		}
	},
	InternalName = "RandomDamageZone",
	LocalizationInternalName = "ITEM_RANDOMDAMAGEZONE",
}
items["Defensive Microbots"] = {
	Rarity = "Legendary",
	Quote = "Shoot down nearby projectiles. Recharge rate scales with attack speed.",
	Desc = "Shoot down {{Color|d|1}} {{Stack|(+1 per stack)}} projectiles within {{Color|d|20m}} every {{Color|d|0.5 seconds}}. {{Color|u|Recharge rate scales with attack speed}}.",
	Category = { "Utility", "WorldUnique", "RebirthBlacklist" },
	Stats = {
		{
			Stat = "Projectiles Shot",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "CaptainDefensiveMatrix",
	LocalizationInternalName = "ITEM_CAPTAINDEFENSEMATRIX",
}
items["Item Scrap, White"] = {
	Rarity = "Common",
	Quote = "Does nothing. Prioritized when used with 3D Printers.",
	Desc = "Does nothing. Prioritized when used with 3D Printers.",
	Category = { "WorldUnique", "Scrap" },
	InternalName = "ScrapWhite",
	LocalizationInternalName = "ITEM_SCRAPWHITE",
}
items["Item Scrap, Green"] = {
	Rarity = "Uncommon",
	Quote = "Does nothing. Prioritized when used with 3D Printers.",
	Desc = "Does nothing. Prioritized when used with 3D Printers.",
	Category = { "WorldUnique", "Scrap" },
	InternalName = "ScrapGreen",
	LocalizationInternalName = "ITEM_SCRAPGREEN",
}
items["Item Scrap, Red"] = {
	Rarity = "Legendary",
	Quote = "Does nothing. Prioritized when used with 3D Printers.",
	Desc = "Does nothing. Prioritized when used with 3D Printers.",
	Category = { "WorldUnique", "Scrap" },
	InternalName = "ScrapRed",
	LocalizationInternalName = "ITEM_SCRAPRED",
}
items["Item Scrap, Yellow"] = {
	Rarity = "Boss",
	Quote = "Does nothing. Prioritized when used with 3D Printers.",
	Desc = "Does nothing. Prioritized when used with 3D Printers.",
	Category = { "WorldUnique", "Scrap" },
	Corrupt = "Newly Hatched Zoea",
	InternalName = "ScrapYellow",
	LocalizationInternalName = "ITEM_SCRAPYELLOW",
}
items["Purity"] = {
	Rarity = "Lunar",
	Quote = "Reduce your skill cooldowns by 2 seconds. {{Color|#FF7F7F|You are unlucky.}}",
	Desc = "All skill cooldowns are reduced by {{Color|u|2}} {{Stack|(+1 per stack)}} seconds. All random effects are rolled {{Color|u|+1}} {{Stack|(+1 per stack)}} times for an {{Color|hp|unfavorable outcome}}.", 
	Category = { "Utility" },
	Unlock = "The Calm",
	Stats = {
		{
			Stat = "Cooldown Reduction",
			Value = "2s",
			Stack = "Linear",
			Add = "+1s"
		}, {
			Stat = "Luck",
			Value = "-1",
			Stack = "Linear",
			Add = "-1"
		}
	},
	InternalName = "LunarBadLuck",
	LocalizationInternalName = "ITEM_LUNARBADLUCK",
}
items["Hooks of Heresy"] = {
	Rarity = "Lunar",
	Quote = "Replace your Secondary Skill with 'Slicing Maelstrom'.",
	-- Modified Description
	Desc = "{{Color|u|Replace your Secondary Skill }} with {{Color|u|Slicing Maelstrom}}.\r\n\r\nCharge up a projectile that deals {{Color|d|875% damage per second}} to nearby enemies, exploding after {{Color|u|3}} seconds to deal {{Color|d|700% damage}} and {{Color|d|root}} enemies for {{Color|u|3}} {{Stack|(+3 per stack)}} seconds. Recharges after 5 {{Stack|(+5 per stack)}} seconds.", 
	Category = { "Damage", "AIBlacklist", "CannotSteal"},
	Unlock = "Blockade Breaker",
	Stats = {
		{
			Stat = "Root Duration",
			Value = "3s",
			Stack = "Linear",
			Add = "+3s"
		}, {
			Stat = "Cooldown",
			Value = "5s",
			Stack = "Linear",
			Add = "+5s"
		}
	},
	InternalName = "LunarSecondaryReplacement",
	LocalizationInternalName = "ITEM_LUNARSECONDARYREPLACEMENT",
}
items["Empathy Cores"] = {
	Rarity = "Boss",
	Boss = "Solus Control Unit",
	Quote = "Recruit a pair of Solus Probes that gain power with more allies.",
	Desc = "Every 30 seconds, {{Color|u|summon two Solus Probes}} that gain {{Color|d|+100%}} {{Stack|(+100% per stack)}} damage per {{Color|u|ally on your team}}.",
	Category = { "Utility", "TurretBlacklist" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Probe Damage",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}
	},
	InternalName = "RoboBallBuddy",
	LocalizationInternalName = "ITEM_ROBOBALLBUDDY",
}
items["Planula"] = {
	Rarity = "Boss",
	Boss = "Grandparent",
	Quote = "Receive flat healing when attacked.",
	Desc = "Heal from {{Color|d|incoming damage}} for {{Color|h|15{{Stack| (+15 per stack)}}}}.",
	-- The item actually has the Damage tag, but leaving the Healing tag as is, so it can be listed on the category page
	Category = { "Healing" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Healing",
			Value = "15",
			Stack = "Linear",
			Add = "+15"
		}
	},
	InternalName = "ParentEgg",
	LocalizationInternalName = "ITEM_PARENTEGG",
}
items["Essence of Heresy"] = {
	Rarity = "Lunar",
	Quote = "Replace your Special Skill with 'Ruin'.",
	Desc = "{{Color|u|Replace your Special Skill}} with {{Color|u|Ruin}}.\r\n\r\nDealing damage adds a stack of {{Color|d|Ruin}} for 10 {{Stack|(+10 per stack)}} seconds. Activating the skill {{Color|d|detonates}} all Ruin stacks at unlimited range, dealing {{Color|d|300% damage}} plus {{Color|d|120% damage per stack of Ruin}}. Recharges after 8 {{Stack|(+8 per stack)}} seconds.",
	Category = { "Damage", "AIBlacklist", "CannotSteal"},
	Unlock = "Blockade Breaker",
	Stats = {
		{
			Stat = "Ruin Duration",
			Value = "10s",
			Stack = "Linear",
			Add = "+10s"
		}, {
			Stat = "Cooldown",
			Value = "8s",
			Stack = "Linear",
			Add = "+8s"
		}
	},
	InternalName = "LunarSpecialReplacement",
	LocalizationInternalName = "ITEM_LUNARSPECIALREPLACEMENT",
}
items["Mocha"] = {
	Expansion = "SotV",
	Rarity = "Common",
	Quote = "Slightly increase attack speed and movement speed.",
	Desc = "Increases {{Color|d|attack speed}} by {{Color|d|7.5%}} {{Stack|(+7.5 per stack)}} and {{Color|u|movement speed}} by {{Color|u|7%}} {{Stack|(+7% per stack)}}.",
	Category = { "Damage", "Utility" },
	Stats = {
		{
			Stat = "Attack Speed",
			Value = "7.5%",
			Stack = "Linear",
			Add = "+7.5%"
		}, {
			Stat = "Movement Speed",
			Value = "7%",
			Stack = "Linear",
			Add = "+7%"
		}
	},
	InternalName = "AttackSpeedAndMoveSpeed",
	LocalizationInternalName = "ITEM_ATTACKSPEEDANDMOVESPEED",
}
items["Plasma Shrimp"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "While you have shield, fire missiles on every hit. {{Color|v|Corrupts all AtG Missile Mk. 1s}}.",
	Desc = "Gain a {{Color|h|shield}} equal to {{Color|h|10%}} of your maximum health. While you have a {{Color|h|shield}}, hitting an enemy fires a missile that deals {{Color|d|40%}} {{Stack|(+40% per stack)}} TOTAL damage. {{Color|v|Corrupts all AtG Missile Mk. 1s}}.",
	Category = { "Damage" },
	Uncorrupt = "AtG Missile Mk. 1",
	Stats = {
		{
			Stat = "Damage",
			Value = "40%",
			Stack = "Linear",
			Add = "+40%"
		}
	},
	InternalName = "MissileVoid",
	LocalizationInternalName = "ITEM_MISSILEVOID",
}
items["Safer Spaces"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Block the next source of damage. {{Color|v|Corrupts all Tougher Times}}.",
	Desc = "{{Color|h|Blocks}} incoming damage once. Recharges after {{Color|u|15 seconds}} {{Stack|(-10% per stack)}} {{Color|v|Corrupts all Tougher Times}}.",
	Category = { "Utility", "BrotherBlacklist" },
	Uncorrupt = "Tougher Times",
	Stats = {
		{
			Stat = "Recharge",
			Value = "15s",
			Stack = "Exponential",
			Add = "-10%"
		}
	},
	InternalName = "BearVoid",
	LocalizationInternalName = "ITEM_BEARVOID",
}
items["Shuriken"] = {
	Expansion = "SotV",
	Rarity = "Uncommon",
	Quote = "Activating your Primary skill also throws a shuriken. Recharges over time.",
	Desc = "Activating your {{Color|u|Primary skill}} also throws a {{Color|d|shuriken}} that deals {{Color|d|400%}} {{Stack|(+100% per stack)}} base damage. You can hold up to {{Color|u|3}} {{Stack|(+1 per stack)}} {{Color|d|shurikens}} which all reload over {{Color|u|10}} seconds.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Damage",
			Value = "400%",
			Stack = "Linear",
			Add = "+100%"
		},
		{
			Stat = "Shurikens",
			Value = "3",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "PrimarySkillShuriken",
	LocalizationInternalName = "ITEM_PRIMARYSKILLSHURIKEN",
}
items["Laser Scope"] = {
	Expansion = "SotV",
	Rarity = "Legendary",
	Quote = "Your 'Critical Strikes' deal an additional 100% damage.",
	Desc = "{{Color|d|Critical Strikes}} deal an additional {{Color|d|100% damage}} {{Stack|(+100% per stack)}}.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Damage",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}
	},
	InternalName = "CritDamage",
	LocalizationInternalName = "ITEM_CRITDAMAGE",
}
items["Spare Drone Parts"] = {
	Expansion = "SotV",
	Rarity = "Legendary",
	Quote = "Your drones fire faster, have less cooldowns, shoot missiles, and gain a bonus chaingun.",
	Desc = "Gain {{Color|d|Col. Droneman}}. Drones gain {{Color|d|+50%}} {{Stack|(+50% per stack)}} attack speed and cooldown reduction. Drones gain {{Color|d|10%}} chance to fire a {{Color|d|missile}} on hit, dealing {{Color|d|300%}} TOTAL damage. Drones gain an {{Color|d|automatic chain gun}} that deals {{Color|d|6x100%}} damage, bouncing to {{Color|d|2}} enemies.",
	Category = { "Damage", "AIBlacklist", "TurretBlacklist", "BrotherBlacklist" },
	Stats = {
		{
			Stat = "Attack Speed",
			Value = "50%",
			Stack = "Linear",
			Add = "+50%"
		}
	},
	InternalName = "DroneWeapons",
	LocalizationInternalName = "ITEM_DRONEWEAPONS",
}
items["Hunter's Harpoon"] = {
	Expansion = "SotV",
	Rarity = "Uncommon",
	Quote = "Killing an enemy gives you a burst of movement speed.",
	Desc = "Killing an enemy increases {{Color|u|movement speed}} by {{Color|u|125%}}, fading over {{Color|u|1}} {{Stack|(+0.5 per stack)}} seconds.",
	-- The game data do not have the OnKillEffect tag, but the item behaves like one
	Category = { "Utility", "OnKillEffect" },
	Stats = {
		{
			Stat = "Duration",
			Value = "1s",
			Stack = "Linear",
			Add = "+0.5s"
		}
	},
	InternalName = "MoveSpeedOnKill",
	LocalizationInternalName = "ITEM_MOVESPEEDONKILL",
}
items["Ignition Tank"] = {
	Expansion = "SotV",
	Rarity = "Uncommon",
	Quote = "Your ignite effects deal quadruple damage.",
	Desc = "Ignite effects deal {{Color|d|+300%}} {{Stack|(+300% per stack)}} more damage over time.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Damage",
			Value = "300%",
			Stack = "Linear",
			Add = "+300%"
		}
	},
	InternalName = "StrengthenBurn",
	LocalizationInternalName = "ITEM_STRENGTHENBURN",
}
items["Power Elixir"] = {
	Expansion = "SotV",
	Rarity = "Common",
	Quote = "Receive an instant heal at low health. Consumed on use.",
	Desc = "Taking damage to below {{Color|hp|25% health}} {{Color|u|consumes}} this item, {{Color|h|healing}} you for {{Color|h|75%}} of {{Color|h|maximum health}}.",
	Category = { "Healing", "LowHealth", "AIBlacklist" },
	Stats = {
	},
	InternalName = "HealingPotion",
	LocalizationInternalName = "ITEM_HEALINGPOTION",
}
items["Empty Bottle"] = {
	Expansion = "SotV",
	Rarity = "Untiered",
	Quote = "",
	Desc = "An empty container for an Elixir. Does nothing.",
	Category = { "Healing" },
	Stats = {
	},
	InternalName = "HealingPotionConsumed",
	LocalizationInternalName = "ITEM_HEALINGPOTIONCONSUMED",
	Consumed = true,
}
items["Symbiotic Scorpion"] = {
	Expansion = "SotV",
	Rarity = "Legendary",
	Quote = "Permanently reduce armor on hit.",
	Desc = "{{Color|d|100%}} chance on hit to reduce {{Color|d|armor}} by {{Color|d|2}} {{Stack|(+2 per stack)}} {{Color|d|permanently}}.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Armor Reduction",
			Value = "2",
			Stack = "Linear",
			Add = "+2"
		}
	},
	InternalName = "PermanentDebuffOnHit",
	LocalizationInternalName = "ITEM_PERMANENTDEBUFFONHIT",
}
items["Pocket I.C.B.M."] = {
	Expansion = "SotV",
	Rarity = "Legendary",
	Quote = "All Missile items deal more damage and fire an additional two missiles.",
	Desc = "All missile items and equipment fire an additional {{Color|d|2}} {{Color|d|missiles}}. Increase missile damage by {{Color|d|0%}} {{Stack|(+50% per stack)}}",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Damage",
			Value = "0%",
			Stack = "Linear",
			Add = "+50%"
		}, {
			Stat = "Extra missiles",
			Value = "2",
			Stack = "None",
			Add = ""
		}
	},
	InternalName = "MoreMissile",
	LocalizationInternalName = "ITEM_MOREMISSILE",
}
items["Weeping Fungus"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Heal while sprinting. {{Color|v|Corrupts all Bustling Fungi}}.",
	Desc = "{{Color|h|Heals}} for {{Color|h|2%}} {{Stack|(+2% per stack)}} of your health every second {{Color|u|while sprinting}}. {{Color|v|Corrupts all Bustling Fungi}}.",
	-- The game data do not have the SprintRelated tag, but it is related to it programmatically
	Category = { "Healing", "SprintRelated" },
	Uncorrupt = "Bustling Fungus",
	Stats = {
		{
			Stat = "HP per second",
			Value = "2%",
			Stack = "Linear",
			Add = "+2%"
		}
	},
	InternalName = "MushroomVoid",
	LocalizationInternalName = "ITEM_MUSHROOMVOID",
}
items["Stone Flux Pauldron"] = {
	Expansion = "SotV",
	Rarity = "Lunar",
	Quote = "Double your health... {{Color|hp|BUT halve your speed.}}",
	Desc = "Increase {{Color|h|max health}} by {{Color|h|100% {{Stack|(+100% per stack)}}}}. Reduce {{Color|u|movement speed}} by {{Color|u|50%}} {{Stack|(+50% per stack)}}.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Max Health",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}, {
			Stat = "Speed",
			Value = "100%",
			Stack = "Reciprocal",
			Add = "+1"
		}
	},
	InternalName = "HalfSpeedDoubleHealth",
	LocalizationInternalName = "ITEM_HALFSPEEDDOUBLEHEALTH",
}
items["Light Flux Pauldron"] = {
	Expansion = "SotV",
	Rarity = "Lunar",
	Quote = "Halve your cooldowns.. {{Color|hp|BUT halve your attack speed.}}",
	Desc = "Decrease {{Color|u|skill cooldowns}} by {{Color|u|50% {{Stack|(+50% per stack)}}}}. Decrease {{Color|d|attack speed}} by {{Color|d|50%}} {{Stack|(+50% per stack)}}.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Skill Cooldowns",
			Value = "50%",
			Stack = "Exponential",
			Add = "-50%"
		}, {
			Stat = "Attack Speed",
			Value = "100%",
			Stack = "Reciprocal",
			Add = "+1"
		}
	},
	InternalName = "HalfAttackSpeedHalfCooldowns",
	LocalizationInternalName = "ITEM_HALFATTACKSPEEDHALFCOOLDOWNS",
}
items["Eulogy Zero"] = {
	Expansion = "SotV",
	Rarity = "Lunar",
	Quote = "Items and equipment have a small chance to transform into a Lunar item instead.",
	Desc = "Items have a {{Color|u|5%}} {{Stack|(+5% per stack)}} chance to become a {{Color|lunar|Lunar}} item instead.",
	Category = { "Utility", "BrotherBlacklist" },
	Stats = {
		{
			Stat = "Effect chance",
			Value = "5%",
			Stack = "Linear",
			Add = "+5%"
		}
	},
	InternalName = "RandomlyLunar",
	LocalizationInternalName = "ITEM_RANDOMLYLUNAR",
}
items["Ben's Raincoat"] = {
	Expansion = "SotV",
	Rarity = "Legendary",
	Quote = "Prevent debuffs, instead gaining a temporary barrier. Recharges over time.",
	Desc = "Prevents {{Color|u|1}} {{Stack|(+1 per stack)}} {{Color|d|debuff}} and instead grants a {{Color|h|temporary barrier}} for {{Color|h|10%}} of {{Color|h|maximum health}}. Recharges every {{Color|u|5}} seconds.",
	Category = { "Utility", "Healing" },
	Stats = {
		{
			Stat = "Debuffs Blocked",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}, {
			Stat = "Cooldown",
			Value = "5s",
			Stack = "None",
			Add = "",
		}
	},
	InternalName = "ImmuneToDebuff",
	LocalizationInternalName = "ITEM_IMMUNETODEBUFF",
}
items["Regenerating Scrap"] = {
	Expansion = "SotV",
	Rarity = "Uncommon",
	Quote = "Prioritized when used with {{Color|h|Uncommon}} 3D Printers. Usable once per stage.",
	Desc = "Does nothing. Prioritized when used with {{Color|h|Uncommon}} 3D Printers. At the start of each stage, it regenerates.",
	Category = { "Utility", "AIBlacklist", "CannotDuplicate", "OnStageBeginEffect" },
	InternalName = "RegeneratingScrap",
	LocalizationInternalName = "ITEM_REGENERATINGSCRAP",
}
items["Regenerating Scrap (Consumed)"] = {
	Expansion = "SotV",
	Rarity = "Untiered",
	Quote = "",
	Desc = "At the start of each stage, it transforms into Regenerating Scrap.",
	Category = { "Utility", "OnStageBeginEffect" },
	InternalName = "RegeneratingScrapConsumed",
	LocalizationInternalName = "ITEM_REGENERATINGSCRAPCONSUMED",
	Consumed = true,
}
items["Lost Seer's Lenses"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Gain a 0.5% chance to instantly kill a non-boss enemy. {{Color|v|Corrupts all Lens-Maker's Glasses}}.",
	Desc = "Your attacks have a {{Color|d|0.5%}} {{Stack|(+0.5% per stack)}} chance to {{Color|d|instantly kill}} a {{Color|d|non-Boss enemy}}. {{Color|v|Corrupts all Lens-Maker's Glasses}}.",
	Category = { "Damage" },
	Uncorrupt = "Lens-Maker's Glasses",
	Stats = {
		{
			Stat = "Kill chance",
			Value = "0.5%",
			Stack = "Linear",
			Add = "+0.5%"
		}
	},
	InternalName = "CritGlassesVoid",
	LocalizationInternalName = "ITEM_CRITGLASSESVOID",
}
items["Voidsent Flame"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Full health enemies also detonate on hit. {{Color|v|Corrupts all Will-o'-the-wisps}}.",
	Desc = "Upon hitting an enemy at {{Color|d|full health}}, spawn a {{Color|d|lava pillar}} in a {{Color|d|12m}} {{Stack|(+2.4m per stack)}} radius for {{Color|d|260%}} {{Stack|(+156% per stack)}} base damage. {{Color|v|Corrupts all Will-o'-the-wisps}}.",
	Category = { "Damage" },
	Uncorrupt = "Will-o'-the-wisp",
	Stats = {
		{
			Stat = "Damage",
			Value = "260%",
			Stack = "Linear",
			Add = "+156%"
		}, {
			Stat = "Radius",
			Value = "12m",
			Stack = "Linear",
			Add = "+2.4m"
		}
	},
	InternalName = "ExplodeOnDeathVoid",
	LocalizationInternalName = "ITEM_EXPLODEONDEATHVOID",
}
items["Needletick"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Chance to collapse enemies on hit. {{Color|v|Corrupts all Tri-Tip Daggers}}.",
	Desc = "{{Color|d|10%}} {{Stack|(+10% per stack)}} chance to {{Color|d|collapse}} an enemy for {{Color|d|400%}} base damage. {{Color|v|Corrupts all Tri-Tip Daggers}}.",
	Category = { "Damage" },
	Uncorrupt = "Tri-Tip Dagger",
	Stats = {
		{
			Stat = "Chance to Collapse",
			Value = "10%",
			Stack = "Linear",
			Add = "+10%"
		}
	},
	InternalName = "BleedOnHitVoid",
	LocalizationInternalName = "ITEM_BLEEDONHITVOID",
}
items["Polylute"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Chance to repeatedly strike a single enemy with lightning. {{Color|v|Corrupts all Ukuleles}}.",
	Desc = "{{Color|d|25%}} chance to fire {{Color|d|lightning}} for {{Color|d|60%}} TOTAL damage up to {{Color|d|3 {{Stack|(+3 per stack)}}}} times. {{Color|v|Corrupts all Ukuleles}}.",
	Category = { "Damage" },
	Uncorrupt = "Ukulele",
	Stats = {
		{
			Stat = "Hits",
			Value = "3",
			Stack = "Linear",
			Add = "+3"
		}
	},
	InternalName = "ChainLightningVoid",
	LocalizationInternalName = "ITEM_CHAINLIGHTNINGVOID",
}
items["Encrusted Key"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Gain access to an Encrusted Cache that contains a void item. {{Color|v|Corrupts all Rusted Keys}}.",
	Desc = "A {{Color|u|hidden cache}} containing an item (60%/{{Color|h|30%}}/{{Color|hp|10%}}) will appear in a random location {{Color|u|on each stage}}. Opening the cache {{Color|u|consumes}} this item. {{Color|v|Corrupts all Rusted Keys}}.",
	Category = { "Utility", "AIBlacklist", "OnStageBeginEffect" },
	Uncorrupt = "Rusted Key",
	InternalName = "TreasureCacheVoid",
	LocalizationInternalName = "ITEM_TREASURECACHEVOID",
}
items["Benthic Bloom"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Upgrades your items at the start of each stage. {{Color|v|Corrupts all 57 Leaf Clovers}}.",
	Desc = "{{Color|u|Upgrades 3}} {{Stack|(+3 per stack)}} random items to items of the next {{Color|u|higher rarity}} at the {{Color|u|start of each stage}}. {{Color|v|Corrupts all 57 Leaf Clovers}}.",
	Category = { "Utility", "OnStageBeginEffect" },
	Uncorrupt = "57 Leaf Clover",
	Stats = {
		{
			Stat = "Items upgraded",
			Value = "3",
			Stack = "Linear",
			Add = "+3"
		}
	},
	InternalName = "CloverVoid",
	LocalizationInternalName = "ITEM_CLOVERVOID",
}
items["Tentabauble"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Chance to root enemies on hit. {{Color|v|Corrupts all Chronobaubles}}.",
	Desc = "{{Color|u|5%}} {{Stack|(+5% per stack)}} chance on hit to {{Color|d|root}} enemies for {{Color|u|1s}} {{Stack|(+1s per stack)}}. {{Color|v|Corrupts all Chronobaubles}}.",
	Category = { "Utility" },
	Uncorrupt = "Chronobauble",
	Stats = {
		{
			Stat = "Root chance",
			Value = "5%",
			Stack = "Hyperbolic",
			Add = "+5%"
		}, {
			Stat = "Duration",
			Value = "1s",
			Stack = "Linear",
			Add = "+1s"
		}
	},
	InternalName = "SlowOnHitVoid",
	LocalizationInternalName = "ITEM_SLOWONHITVOID",
}
items["Lysate Cell"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Add an extra charge of your Special skill. {{Color|v|Corrupts all Fuel Cells}}.",
	Desc = "Add {{Color|u|+1}} {{Stack|(+1 per stack)}} charge of your {{Color|u|Special skill}}. {{Color|u|Reduces Special skill cooldown}} by {{Color|u|33%}}. {{Color|v|Corrupts all Fuel Cells}}.",
	Category = { "Utility" },
	Uncorrupt = "Fuel Cell",
	Stats = {
		{
			Stat = "Charges",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "EquipmentMagazineVoid",
	LocalizationInternalName = "ITEM_EQUIPMENTMAGAZINEVOID",
}
items["Pluripotent Larva"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Get a {{Color|v|corrupted}} extra life. Consumed on use. {{Color|v|Corrupts all Dio's Best Friends}}.",
	Desc = "{{Color|u|Upon death}}, this item will be {{Color|u|consumed}} and you will {{Color|h|return to life}} with {{Color|h|3 seconds of invulnerability}}, and all of your items that can be {{Color|u|corrupted}} will be. {{Color|v|Corrupts all Dio's Best Friends}}.",
	Category = { "Utility" },
	Uncorrupt = "Dio's Best Friend",
	Stats = {
		{
			Stat = "Uses",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "ExtraLifeVoid",
	LocalizationInternalName = "ITEM_EXTRALIFEVOID",
}
items["Pluripotent Larva (Consumed)"] = {
	Expansion = "SotV",
	Rarity = "Untiered",
	Quote = "",
	Desc = "A spent item with no remaining power.",
	Category = { "Utility" },
	Stats = {
	},
	InternalName = "ExtraLifeVoidConsumed",
	LocalizationInternalName = "ITEM_EXTRALIFEVOIDCONSUMED",
	Consumed = true,
}
items["Delicate Watch"] = {
	Expansion = "SotV",
	Rarity = "Common",
	Quote = "Deal bonus damage. Breaks at low health.",
	Desc = "Increase damage by {{Color|d|20%}} {{Stack|(+20% per stack)}}. Taking damage to below {{Color|hp|25% health}} {{Color|u|breaks}} this item.",
	Category = { "Damage", "LowHealth" },
	Stats = {
		{
			Stat = "Damage",
			Value = "20%",
			Stack = "Linear",
			Add = "+20%"
		}
	},
	InternalName = "FragileDamageBonus",
	LocalizationInternalName = "ITEM_FRAGILEDAMAGEBONUS",
}
items["Delicate Watch (Broken)"] = {
	Expansion = "SotV",
	Rarity = "Untiered",
	Quote = "",
	Desc = "...well, it's still right twice a day.",
	Category = { },
	Stats = {
	},
	InternalName = "FragileDamageBonusConsumed",
	LocalizationInternalName = "ITEM_FRAGILEDAMAGEBONUSCONSUMED",
	Consumed = true,
}
items["Oddly-shaped Opal"] = {
	Expansion = "SotV",
	Rarity = "Common",
	Quote = "Reduce damage the first time you are hit.",
	Desc = "{{Color|h|Increase armor}} by {{Color|h|100}} {{Stack|(+100 per stack)}} while out of danger.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Armor",
			Value = "100",
			Stack = "Linear",
			Add = "+100"
		}
	},
	InternalName = "OutOfCombatArmor",
	LocalizationInternalName = "ITEM_OUTOFCOMBATARMOR",
}
items["Roll of Pennies"] = {
	Expansion = "SotV",
	Rarity = "Common",
	Quote = "Gain gold on taking damage.",
	Desc = "Gain {{Color|u|3 {{Stack|(+3 per stack)}} gold}} on {{Color|d|taking damage}} from an enemy. {{Color|u|Scales over time.}}",
	Category = { "Utility", "AIBlacklist" },
	Stats = {
		{
			Stat = "Base Gold",
			Value = "3",
			Stack = "Linear",
			Add = "+3"
		}
	},
	InternalName = "GoldOnHurt",
	LocalizationInternalName = "ITEM_GOLDONHURT",
}
items["Bottled Chaos"] = {
	Expansion = "SotV",
	Rarity = "Legendary",
	Quote = "Activating your Equipment triggers an additional, random Equipment effect.",
	Desc = "Trigger a {{Color|d|random equipment}} effect {{Color|d|1}} {{Stack|(+1 per stack)}} time(s).",
	Category = { "Utility", "AIBlacklist", "EquipmentRelated" },
	Stats = {
		{
			Stat = "Effects",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "RandomEquipmentTrigger",
	LocalizationInternalName = "ITEM_RANDOMEQUIPMENTTRIGGER",
}
items["Shipping Request Form"] = {
	Expansion = "SotV",
	Rarity = "Uncommon",
	Quote = "Get a delivery each stage that contains powerful items.",
	Desc = "A {{Color|u|delivery}} containing 2 items (79%/{{Color|h|20%}}/{{Color|hp|1%}}) will appear in a random location {{Color|u|on each stage}}. {{Stack|(Increases rarity chances of the items per stack).}}",
	Category = { "Utility", "AIBlacklist", "OnStageBeginEffect" },
	Stats = {
		{
			Stat = "Rarity",
			Value = "",
			Stack = "Special",
			Add = ""
		}
	},
	InternalName = "FreeChest",
	LocalizationInternalName = "ITEM_FREECHEST",
}
items["Singularity Band"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "High damage hits also create unstable black holes. Recharges over time. {{Color|v|Corrupts all Runald's and Kjaro's Bands}}.",
	Desc = "Hits that deal {{Color|d|more than 400% damage}} also fire a black hole that {{Color|u|draws enemies within 15m into its center}}. Lasts {{Color|u|5}} seconds before collapsing, dealing {{Color|d|100%}} {{Stack|(+100% per stack)}} TOTAL damage. Recharges every {{Color|u|20}} seconds. {{Color|v|Corrupts all Runald's and Kjaro's Bands}}.",
	Category = { "Damage", "Utility" },
	Stats = {
		{
			Stat = "Damage",
			Value = "100%",
			Stack = "Linear",
			Add = "+100%"
		}
	},
	InternalName = "ElementalRingVoid",
	LocalizationInternalName = "ITEM_ELEMENTALRINGVOID",
}
items["Egocentrism"] = {
	Expansion = "SotV",
	Rarity = "Lunar",
	Quote = "Gain multiple orbiting bombs. {{Color|hp|Every minute, assimilate another item into Egocentrism.}}",
	Desc = "Every {{Color|u|3}} {{Stack|(-50% per stack)}} seconds, gain an {{Color|d|orbiting bomb}} that detonates on impact for {{Color|d|360%}} damage, up to a maximum of {{Color|u|3 bombs}} {{Stack|(+1 per stack)}}. Every {{Color|u|60}} seconds, a random item is {{Color|u|converted}} into this item.",
	Category = { "Damage", "Utility" },
	Stats = {
		{
			Stat = "Charge time",
			Value = "3s",
			Stack = "Reciprocal",
			Add = "+1"
		}, {
			Stat = "Max orbs",
			Value = "3",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "LunarSun",
	LocalizationInternalName = "ITEM_LUNARSUN",
}
items["Defense Nucleus"] = {
	Expansion = "SotV",
	Rarity = "Boss",
	Boss = "Xi Construct",
	Quote = "Summon an Alpha Construct on killing an elite.",
	Desc = "Killing elite monsters spawns an {{Color|d|Alpha Construct}} with bonus {{Color|d|300%}} damage and {{Color|h|300% health}}. Limited to {{Color|u|4}} {{Stack|(+4 per stack)}}.",
	Category = { "Damage", "OnKillEffect" },
	Corrupt = "Newly Hatched Zoea",
	Stats = {
		{
			Stat = "Max Constructs",
			Value = "4",
			Stack = "Linear",
			Add = "+4"
		}
	},
	InternalName = "MinorConstructOnKill",
	LocalizationInternalName = "ITEM_MINORCONSTRUCTONKILL",
}
items["Newly Hatched Zoea"] = {
	Expansion = "SotV",
	Rarity = "Void",
	Quote = "Periodically recruit allies from the {{Color|v|Void}}. {{Color|v|Corrupts all}} {{Color|boss|yellow items}}.",
	Desc = "Every {{Color|u|60}} {{Stack|(-50% per stack)}} seconds, gain a random {{Color|v|Void}} ally. Can have up to {{Color|u|1}} {{Stack|(+1 per stack)}} allies at a time. {{Color|v|Corrupts all}} {{Color|boss|yellow items}}.",
	Category = { "Damage", "TurretBlacklist" },
	Stats = {
		{
			Stat = "Charge time",
			Value = "60s",
			Stack = "Reciprocal",
			Add = "+1"
		}, {
			Stat = "Max allies",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "VoidMegaCrabItem",
	LocalizationInternalName = "ITEM_VOIDMEGACRABITEM",
}
items["Growth Nectar"] = {
	Expansion = "SotS",
	Rarity = "Legendary",
	Quote = "Your buffs grant an increase to ALL of your stats.",
	Desc = "Grants 4% increase to {{Color|u|ALL stats}} for each buff, up to a maximum of {{Color|u|4}} {{Stack|(+4 per stack)}}.",
	Category = { "Utility", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Maximum Buffs",
			Value = "4",
			Stack = "Linear",
			Add = "+4"
		}
		
	},
	InternalName = "BoostAllStats",
	LocalizationInternalName = "ITEM_BOOSTALLSTATS",
}
items["Chance Doll"] = {
	Expansion = "SotS",
	Rarity = "Uncommon",
	Quote = "Gain 40% chance to increase item rarity at Shrines of Chance.",
	Desc = "On Shrine of Chance success, {{Color|u|40%}} {{Stack|(+10% per stack)}} chance to get higher rarity items.",
	Category = { "Utility", "AIBlacklist", "CannotDuplicate", "HalcyoniteShrine", "SacrificeBlacklist" },
	Stats = {
		{
			Stat = "Chance",
			Value = "40%",
			Stack = "Linear",
			Add = "+10%"
		}
	},
	InternalName = "ExtraShrineItem",
	LocalizationInternalName = "ITEM_EXTRASHRINEITEM",
}
items["Breaching Fin"] = {
	Expansion = "SotS",
	Rarity = "Uncommon",
	Quote = "Grounded enemies hit with any skill are launched and take bonus damage.",
	Desc = "Grounded enemies hit with any {{Color|u|skill}} are {{Color|u|launched}} and {{Color|u|stunned}}. Enemies hit while airborne are {{Color|u|launched}} again up to {{Color|u|2 times}} {{Stack|(+1 per stack)}}. Launched enemies take increased damage by {{Color|d|10%}} from all sources per launch. Recharges after {{Color|u|15s}}.",
	Category = { "Damage", "Utility", "AIBlacklist", "HalcyoniteShrine", "DevotionBlacklist" },
	Stats = {
		{
			Stat = "Max Launches",
			Value = "2",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "KnockBackHitEnemies",
	LocalizationInternalName = "ITEM_KNOCKBACKHITENEMIES",
}
items["Bolstering Lantern"] = {
	Expansion = "SotS",
	Rarity = "Common",
	Quote = "Increases your attack speed for every nearby enemy and ally.",
	Desc = "Increase your {{Color|d|attack speed}} by {{Color|d|10%}} {{Stack|(+3.5% per stack)}} for up to {{Color|u|3}} {{Stack|(+1 per stack)}} enemies and allies within {{Color|u|20}} meters.",
	Category = { "Damage", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Attack Speed",
			Value = "10%",
			Stack = "Linear",
			Add = "+3.5%"
		},
		{
			Stat = "Max Buff Stacks",
			Value = "3",
			Stack = "Linear",
			Add = "+1"
		},
	},
	InternalName = "AttackSpeedPerNearbyAllyOrEnemy",
	LocalizationInternalName = "ITEM_ATTACKSPEEDPERNEARBYALLYORENEMY",
}
items["Luminous Shot"] = {
	Expansion = "SotS",
	Rarity = "Uncommon",
	Quote = "Activating your Secondary skill charges your Primary skill with powerful lightning strikes. Requires 3 charges.",
	Desc = "Activating {{Color|u|Secondary skill}} stores up to {{Color|u|5 charges}} {{Stack|(+1 per stack)}}. Requires {{Color|u|3 charges}} for your {{Color|u|Primary skill}} to fire lightning strikes, dealing {{Color|d|175% TOTAL damage}} {{Stack|(+50% per stack)}} each. {{Color|u|Reduces Secondary skill cooldown by 20%}}.",
	Category = { "Damage", "Utility", "AIBlacklist", "HalcyoniteShrine", "DevotionBlacklist" },
	Stats = {
		{
			Stat = "Damage per Charge",
			Value = "175%",
			Stack = "Linear",
			Add = "+50%"
		}, {
			Stat = "Max Charge",
			Value = "5",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "IncreasePrimaryDamage",
	LocalizationInternalName = "ITEM_INCREASEPRIMARYDAMAGE",
}
items["Sale Star"] = {
	Expansion = "SotS",
	Rarity = "Uncommon",
	Quote = "First chest bought yields more than one reward. Usable once per stage.",
	Desc = "Gain an extra item on the first chest opened per stage. {{Stack|Each additional Sale Star increases the chance of getting more items by 5%}}.",
	Category = { "Utility", "AIBlacklist", "CannotDuplicate", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Extra Item Count",
			Value = "+100%",
			Stack = "Linear",
			Add = "+5%"
		}
	},
	InternalName = "LowerPricedChests",
	LocalizationInternalName = "ITEM_LOWERPRICEDCHESTS",
}
items["Sale Star (Consumed)"] = {
	Expansion = "SotS",
	Rarity = "Untiered",
	Quote = "At the start of each stage, it transforms into Sale Star.",
	Desc = "At the start of each stage, it transforms into Sale Star.",
	Category = { "Utility", "OnStageBeginEffect" },
	InternalName = "LowerPricedChestsConsumed",
	LocalizationInternalName = "ITEM_LOWERPRICEDCHESTSCONSUMED",
	Consumed = true,
}
items["Elusive Antlers"] = {
	Expansion = "SotS",
	Rarity = "Common",
	Quote = "Spawns orbs of energy that give bonus movement speed.",
	Desc = "Spawns orbs of energy nearby every {{Color|u|10s}} {{Stack|(-10% per stack)}}, giving {{Color|u|+12% movement speed}} up to {{Color|u|3}} {{Stack|(+3 per stack)}} {{Color|u|times}} for {{Color|u|12s}}.",
	Category = { "Utility", "AIBlacklist", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Orb Frequency",
			Value = "10s",
			Stack = "Hyperbolic",
			Add = "-10%"
		},
		{
			Stat = "Max Stacks",
			Value = "3",
			Stack = "Linear",
			Add = "+3"
		}
	
	},
	InternalName = "SpeedBoostPickup",
	LocalizationInternalName = "ITEM_NEGATEATTACK",
}
items["Sonorous Whispers"] = {
	Expansion = "SotS",
	Rarity = "Legendary",
	Quote = "Upon large or elite monster kill chance to drop items.",
	Desc = "When a large monster is killed it will always drop an item. All elites have a {{Color|u|4%}} chance of dropping an item {{Stack|(+1% per stack)}}.",
	Category = { "Utility", "AIBlacklist", "CannotDuplicate", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Chance",
			Value = "5%",
			Stack = "Linear",
			Add = "+1%"
		}
	},
	InternalName = "ItemDropChanceOnKill",
	LocalizationInternalName = "ITEM_ITEMDROPCHANCEONKILL",
}
items["Electric Boomerang"] = {
	Expansion = "SotS",
	Rarity = "Legendary",
	Quote = "On hit chance to throw a stunning boomerang.",
	Desc = "{{Color|d|15%}} chance on hit to fire an electric boomerang that slices through enemies dealing {{Color|d|120% base damage}} {{Stack|(+120% per stack)}} and deals an additional {{Color|d|120% base damage per second}} and {{Color|d|stuns}} all enemies hit. Can {{Color|d|strike}} enemies on the way back.",
	Category = { "Damage", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Damage",
			Value = "124%",
			Stack = "Linear",
			Add = "+124%"
		}
	},
	InternalName = "StunAndPierce",
	LocalizationInternalName = "ITEM_STUNANDPIERCE",
}
items["Noxious Thorn"] = {
	Expansion = "SotS",
	Rarity = "Uncommon",
	Quote = "Killing an enemy transfers debuffs to a nearby enemy.",
	Desc = "Gain {{Color|d|10%}} chance to {{Color|d|bleed}} an enemy. On killing an enemy, {{Color|d|transfer 33%}} of every debuff stack to {{Color|d|1 enemy}} {{Stack|(+1 per stack)}} within 20m {{Stack|(+5m per stack)}}.",
	Category = { "Damage", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Targets",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}, {
			Stat = "Radius",
			Value = "20m",
			Stack = "Linear",
			Add = "+5m"
		}
	},
	InternalName = "TriggerEnemyDebuffs",
	LocalizationInternalName = "ITEM_TRIGGERENEMYDEBUFFS",
}
items["Chronic Expansion"] = {
	Expansion = "SotS",
	Rarity = "Common",
	Quote = "Deal bonus damage for each enemy killed",
	Desc = "Killing an enemy increase your damage by {{Color|d|3.5}} {{Stack|(+1% per stack)}}, up to {{Color|u|10}} {{Stack|(+5 per stack)}}, for {{Color|u|7s}}. Dealing damage refreshes the timer.",
	Category = { "Damage", "OnKillEffect", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Damage",
			Value = "3.5%",
			Stack = "Linear",
			Add = "+1%"
		},
		{
			Stat = "Max Buff",
			Value = "10",
			Stack = "Linear",
			Add = "+5"
		}
	},
	InternalName = "IncreaseDamageOnMultiKill",
	LocalizationInternalName = "ITEM_INCREASEDAMAGEONMULTIKILL",
}
items["War Bonds"] = {
	Expansion = "SotS",
	Rarity = "Legendary",
	Quote = "Bombard boss events with missiles. The more gold earned, the more UES support is granted.",
	Desc = "During boss events, {{Color|u|5}} missiles bombard the area, dealing {{Color|d|2.5%}} {{Stack|(+2.5% per stack)}} {{Color|d|of boss' Max Health in damage}}. Before the boss event, gain additional missiles, up to a maximum of {{Color|u|20}} {{Stack|(+5 per stack)}}, per {{Color|u|50}} gold gained. {{Color|u|Gold requirement scales over time.}}",
	Category = { "Damage", "AIBlacklist", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Damage",
			Value = "2.5%",
			Stack = "Linear",
			Add = "+2.5%"
		},  {
			Stat = "Max Missiles",
			Value = "20",
			Stack = "Linear",
			Add = "+5"
		}
	},
	InternalName = "BarrageOnBoss",
	LocalizationInternalName = "ITEM_BARRAGEONBOSS",
}
items["Warped Echo"] = {
	Expansion = "SotS",
	Rarity = "Common",
	Quote = "Incoming damage is reduced and dealt over time.",
	Desc = "The next source of damage is {{Color|h|reduced}} by {{Color|h|20%}} and {{Color|h|spread}} into {{Color|u|3}} {{Stack|(+1 per stack)}} {{Color|u|hits}}. All echoed damage is {{Color|u|non-lethal}} except for the final hit. Recharges every {{Color|u|15s}}.",
	Category = { "Utility", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Damage Spread",
			Value = "3",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "DelayedDamage",
	LocalizationInternalName = "ITEM_DELAYEDDAMAGE",
}
items["Unstable Transmitter"] = {
	Expansion = "SotS",
	Rarity = "Uncommon",
	Quote = "Gain a temporary barrier and a dimensional aura on low health.",
	Desc = "Falling below {{Color|hp|25% health}} gives you {{Color|h|temporary barrier}} and a dimensional aura that {{Color|d|bleeds}} and {{Color|u|teleports}} away enemies for {{Color|u|8s}}. {{Color|d|Enemies killed}} by the aura {{Color|u|extend}} the duration by 1s. At the start of each stage, it regenerates",
	Category = { "Utility", "AIBlacklist", "LowHealth", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Uses per Stage",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "TeleportOnLowHealth",
	LocalizationInternalName = "ITEM_TELEPORTONLOWHEALTH",
}
items["Unstable Transmitter (Consumed)"] = {
	Rarity = "Untiered",
	Quote = "",
	Desc = "At the start of each stage, it transforms into Unstable Transmitter.",
	Category = { "Utility", "OnStageBeginEffect" },
	Stats = {
	},
	InternalName = "TeleportOnLowHealthConsumed",
	LocalizationInternalName = "ITEM_TELEPORTONLOWHEALTHCONSUMED",
	Consumed = true,
}
items["Prayer Beads"] = {
	Expansion = "SotS",
	Rarity = "Uncommon",
	Quote = "Gains experience alongside you. Upon removal, grants bonus stats.",
	Desc = "Grows by gaining experience, storing {{Color|u|20%}} {{Stack|(+5% per item stack)}} bonus stats ({{Color|h|health}}, {{Color|h|regeneration}}, and {{Color|d|damage}}). On removal, gain all stored stats.",
	Category = { "Utility", "AIBlacklist", "CannotDuplicate", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Stored Stats",
			Value = "20%",
			-- TODO: This is probably not Linear
			Stack = "Linear",
			Add = "+5%"
		}
	},
	InternalName = "ExtraStatsOnLevelUp",
	LocalizationInternalName = "ITEM_EXTRASTATSONLEVELUP",
}
items["Runic Lens"] = {
	Expansion = "SotS",
	Rarity = "Legendary",
	Quote = "Chance to call down a meteor. Damage and chance are increased with higher damage hits.",
	Desc = "{{Color|d|3%}} chance on hit to call a meteor strike, dealing {{Color|d|2000%}} base damage. Every {{Color|d|100%}} attack damage dealt increase the activation chance by {{Color|d|3%}} {{Stack|(+3% per stack)}} and damage by {{Color|d|150%}} {{Stack|(+50% per stack)}}.",
	Category = { "Damage", "HalcyoniteShrine" },
	Stats = {
		{
			Stat = "Chance",
			Value = "3%",
			Stack = "Linear",
			Add = "+3%"
		}, {
			Stat = "Damage",
			Value = "150%",
			Stack = "Linear",
			Add = "+50%"
		}
	},
	InternalName = "MeteorAttackOnHighDamage",
	LocalizationInternalName = "ITEM_METEORATTACKONHIGHDAMAGE",
}
items["Longstanding Solitude"] = {
	Expansion = "SotS",
	Rarity = "Lunar",
	Quote = "Free purchases on Level Up. {{Color|#FF7F7F|Gold converts to Experience.}}",
	Desc = "{{Color|u|On level up}} gain a free unlock for the next purchase {{Stack|(+1 free unlock per item stack)}} but {{Color|#FF7F7F|all gold is converted to experience}}. Anything that costs gold is increased by 50% {{Stack|(+50% per item stack)}}",
	Category = {"Utility", "Damage", "HalcyoniteShrine"},
	Stats = {
		{
			Stat = "Free Purchases",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}, {
			Stat = "Experience",
			Value = "12%",
			Stack = "Linear",
			Add = "+1.25%"
		}, {
			Stat = "Cost Increase",
			Value = "50%",
			Stack = "Linear",
			Add = "+50%"
		}
	},
	InternalName = "OnLevelUpFreeUnlock",
	LocalizationInternalName = "ITEM_ONLEVELUPFREEUNLOCK",
}
items["Eclipse Lite"] = {
	Expansion = "AC",
	Rarity = "Common",
	Quote = "Gain a small temporary barrier when a skill comes off cooldown.",
	Desc = "When a skill comes off cooldown, gain a {{Color|d|temporary barrier}} for {{Color|h|1%}} {{Stack|(+0.25% per stack)}} of your maximum health per second of the skill's base cooldown.",
	Category = {"Damage", "Shield"},
	Stats = {
		{
			Stat = "Shield",
			Value = "1%",
			Stack = "Linear",
			Add = "+0.25%"
		}
	},
	InternalName = "BarrierOnCooldown",
	LocalizationInternalName = "ITEM_BARRIERONCOOLDOWN",
}
items["Hiker's Boots"] = {
	Expansion = "AC",
	Rarity = "Common",
	Quote = "Striking enemies from a higher elevation grants critical strike chance and damage.",
	Desc = "Striking enemies from a higher elevation grants {{Color|d|+1%}} {{Stack|(+1% per stack)}} {{Color|d|critical strike chance}} and {{Color|d|critical strike damage}}, up to {{Color|u|10 times}}. Lasts 10 seconds.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Crit Damage",
			Value = "1%",
			Stack = "Linear",
			Add = "+1%"
		},
		{
			Stat = "Crit Chance",
			Value = "1%",
			Stack = "Linear",
			Add = "+1%"
		}
	},
	InternalName = "CritAtLowerElevation",
	LocalizationInternalName = "ITEM_CRITATLOWERELEVATION",
}
items["Box of Dynamite"] = {
	Expansion = "AC",
	Rarity = "Uncommon",
	Quote = "Your drones periodically drop dynamite.",
	Desc = "Gain {{Color|d|Lt. Droneboy}}. While in combat, your drones drop sticks of dynamite that detonate for {{Color|d|240% damage}} {{Stack|(+85% per stack)}}, stunning enemies. Recharges after {{Color|u|10}} seconds.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Damage",
			Value = "240%",
			Stack = "Linear",
			Add = "+85%"
		}
	},
	InternalName = "DroneDropsDynamite",
	LocalizationInternalName = "ITEM_DRONESDROPDYNAMITE",
}
items["Collector's Compulsion"] = {
	Expansion = "AC",
	Rarity = "Uncommon",
	Quote = "Pickups grant a stacking bonus to all stats. Open a barrel to find a minor pick-up.",
	Desc = "Picking up {{Color|d|an item or other collectible}} increases {{Color|u|all stats}} by {{Color|u|+3% for 20 seconds, up to 3}} {{Stack|(+2 per stack)}} {{Color|u|times}}. Barrels grant minor pickups.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Stacks",
			Value = "3",
			Stack = "Linear",
			Add = "+2"
		}
	},
	InternalName = "SpeedOnPickup",
	LocalizationInternalName = "ITEM_SPEEDONPICKUP",
}
items["Faraday Spur"] = {
	Expansion = "AC",
	Rarity = "Uncommon",
	Quote = "Moving around builds up movement speed and jump height. At 25% charge or higher, jump to discharge into an electric blast.",
	Desc = "Moving around builds up {{Color|u|charge}}, granting up to {{Color|u|+160% movement speed}} and {{Color|u|+200% jump height}} at 100%. At 25% charge or higher, jumping triggers an {{Color|d|explosive discharge}} for {{Color|d|400%}} {{Stack|(+280% per stack)}} {{Color|d|damage}} in a 5m to 32.3m {{Stack|(+7.5m per stack)}} area.",
	Category = { "Damage", "Utility" },
	Stats = {
		{
			Stat = "Movement Speed",
			Value = "160%",
			Stack = "Linear",
			Add = "+0"
		},
		{
			Stat = "Jump Height",
			Value = "200%",
			Stack = "Linear",
			Add = "+0"
		},
		{
			Stat = "Damage",
			Value = "400%",
			Stack = "Linear",
			Add = "+280%"
		},
		{
			Stat = "Minimum Range",
			Value = "5m",
			Stack = "Linear",
			Add = "+7.5m"
		},
		{
			Stat = "Maximum Range",
			Value = "32.5m",
			Stack = "Linear",
			Add = "+7.5m"
		}
	},
	InternalName = "JumpDamageStrike",
	LocalizationInternalName = "ITEM_JUMPDAMAGESTRIKE",
}
items["Kinetic Dampener"] = {
	Expansion = "AC",
	Rarity = "Uncommon",
	Quote = "Gain bonus armor while you have a shield. When shield breaks, release a stunning pulse that deals more damage the more shield you have.",
	Desc = "Increases armor by {{Color|u|30}} {{Stack|(+30 per stack)}} while you have a shield. When shield breaks, release a stunning pulse for {{Color|d|100% damage}} plus an amount {{Color|d|equal to 100%}} {{Stack|(+10% per stack)}} {{Color|d|of your max shield}}. Grants a shield for {{Color|h|4% of your max health}}.",
	Category = { "Damage", "Utility", "Healing" },
	Stats = {
		{
			Stat = "Armor",
			Value = "30",
			Stack = "Linear",
			Add = "+30"
		},
		{
			Stat = "Damage",
			Value = "100%",
			Stack = "Linear",
			Add = "+10"
		}
	},
	InternalName = "ShieldBooster",
	LocalizationInternalName = "ITEM_SHIELDBOOSTER",
}
items["Networked Suffering"] = {
	Expansion = "AC",
	Rarity = "Legendary",
	Quote = "Inflict a computer virus on hit that spreads a portion of all damage dealt between infected enemies. Affects up to 4 enemies.",
	Desc = "Infect up to {{Color|u|4}} {{Stack|(+2 per stack)}} enemies with a computer virus that duplicates {{Color|d|50% of all damage taken}} and sends it to a global damage pool. Every 3 seconds, ALL infected enemies suffer {{Color|d|100% pooled damage}}.",
	Category = { "Damage" },
	Stats = {
		{
			Stat = "Number Of Enemies Infected",
			Value = "4",
			Stack = "Linear",
			Add = "+2"
		}
	},
	InternalName = "SharedSuffering",
	LocalizationInternalName = "ITEM_SHAREDSUFFERING",
}
items["Orphaned Core"] = {
	Expansion = "AC",
	Rarity = "Legendary",
	Quote = "Gain a buddy who launches itself at enemies to deal damage. Inherits your movement-related items.",
	Desc = "Gain a {{Color|h|friendly Solus unit}} that launches itself at enemies for {{Color|d|400%}} {{Stack|(+400% per stack)}} {{Color|d|damage}}. The unit inherits your {{Color|u|movement speed items}} and deals {{Color|d|more damage the faster it moves}}. The unit can be pet to {{Color|u|cleanse negative effects}}. Recharges after 15 seconds.",
	Category = { "Damage", "Utility" },
	Stats = {
		{
			Stat = "Damage",
			Value = "400%",
			Stack = "Linear",
			Add = "+400%"
		}
	},
	InternalName = "PhysicsProjectile",
	LocalizationInternalName = "ITEM_PHYSICSPROJECTILE",
}
items["Substandard Duplicator"] = {
	Expansion = "AC",
	Rarity = "Legendary",
	Quote = "Picking up an item grants a temporary copy.",
	Desc = "{{Color|u|Picking up an item}} gives you a {{Color|t|temporary copy}} of itself. Temporary items last an additional {{Color|d|10}} {{Stack|(+10 per stack)}} {{Color|d|seconds}}.",
	Category = { "Damage", "Utility" },
	Stats = {
		{
			Stat = "Duration",
			Value = "10s",
			Stack = "Linear",
			Add = "+10s"
		}
	},
	InternalName = "Duplicator",
	LocalizationInternalName = "ITEM_DUPLICATOR",
}
items["Encrypted Cerebellum"] = {
	Expansion = "AC",
	Rarity = "Boss",
	Quote = "Contains encrypted remnants of the Collective network. Needs to be decrypted.",
	Desc = "Contains encrypted remnants of the Collective network. Needs to be decrypted before it can be returned.",
	Category = { "WorldUnique" },
	Stats = {
	},
	InternalName = "MasterBattery",
	LocalizationInternalName = "ITEM_MASTERBATTERY",
}
items["Exposed Cerebellum"] = {
	Expansion = "AC",
	Rarity = "Boss",
	Quote = "A swarming data nexus representing the Collective network. Can be given to a powerful entity.",
	Desc = "A swarming data nexus representing the Collective network. Can be given to a powerful entity.",
	Category = { "WorldUnique" },
	Stats = {
	},
	InternalName = "MasterCore",
	LocalizationInternalName = "ITEM_MASTERCORE",
}
items["Faulty Conductor"] = {
	Expansion = "AC",
	Rarity = "Boss",
	Quote = "Occasionally release a pulse of electricity that energizes allies and makes enemies more susceptible to electric damage.",
	Desc = "Every {{Color|u|15}} {{Stack|(-20% per stack)}} {{Color|u|seconds}}, release a wave of electricity that {{Color|h|energizes}} nearby allies for {{Color|u|7}} seconds. Energized allies gain {{Color|d|+30% attack and movement speed}}, and ALWAYS land {{Color|d|critical strikes}} with {{Color|u|electric}} items and attacks.",
	Category = { "Damage", "Utility" },
	Stats = {
		{
			Stat = "Cooldown",
			Value = "15s",
			Stack = "Linear",
			Add = "-20%"
		}
	},
	InternalName = "ShockDamageAura",
	LocalizationInternalName = "ITEM_SHOCKDAMAGEAURA",
}
items["Functional Coupler"] = {
	Expansion = "AC",
	Rarity = "Boss",
	Quote = "Hold an additional equipment.",
	Desc = "Hold {{Color|u|1 additional equipment}} {{Stack|(+1 per stack)}}. Press the {{Color|u|interact}} and {{Color|u|equipment}} buttons to cycle through held equipment.",
	Category = { "Utility" },
	Stats = {
		{
			Stat = "Additional Equipment Held",
			Value = "1",
			Stack = "Linear",
			Add = "+1"
		}
	},
	InternalName = "ExtraEquipment",
	LocalizationInternalName = "ITEM_EXTRAEQUIPMENT",
}
items["Prison Matrix"] = {
	Expansion = "AC",
	Rarity = "Boss",
	Quote = "Gain {{Color|u|+50% armor}}. Can be placed in a Matrix Terminal.",
	Desc = "Gain {{Color|u|+50% armor}}. Can be placed in a Matrix Terminal.",
	Category = { "WorldUnique" },
	Stats = {
		{
			Stat = "Armor",
			Value = "50%",
			Stack = "Linear",
			Add = "+0"
		}
	},
	InternalName = "PowerCube",
	LocalizationInternalName = "ITEM_POWERCUBE",
}
items["Sentry Key"] = {
	Expansion = "AC",
	Rarity = "Boss",
	Quote = "Gain {{Color|u|+15% move speed}}. Can be placed in a Sentry Terminal.",
	Desc = "Gain {{Color|u|+15% move speed}}. Can be placed in a Sentry Terminal or used for decryption.",
	Category = { "WorldUnique" },
	Stats = {
		{
			Stat = "Movement Speed",
			Value = "15%",
			Stack = "Linear",
			Add = "+0%"
		}
	},
	InternalName = "PowerPyramid",
	LocalizationInternalName = "ITEM_POWERPYRAMID",
}
items["Neutronium Weight"] = {
	Expansion = "AC",
	Rarity = "Lunar",
	Quote = "{{Color|hp|Reduces all stats while in combat}}, but can be sent to an enemy on hit.",
	Desc = "{{Color|hp|Reduces your stats while in combat}}, but {{Color|u|send this item to an enemy}} on hit. On death, this item will be sent to its holder's killer.\r\n\r\nReduces {{Color|d|damage}} by 30% {{Stack|(+10% per stack)}}, {{Color|d|attack speed}} by 30% {{Stack|(+10% per stack)}}, {{Color|u|movement speed}} by 30% {{Stack|(+10% per stack)}}, and {{Color|u|armor}} by 35 {{Stack|(+15 per stack)}}.",
	Category = { "Damage"},
	Stats = {
		{
			Stat = "Damage",
			Value = "-30%",
			Stack = "Exponential",
			Add = "-10%"
		}, 
		{
			Stat = "Attack Speed",
			Value = "-30%",
			Stack = "Exponential",
			Add = "-10%"
		},
		{
			Stat = "Movement Speed",
			Value = "-30%",
			Stack = "Exponential",
			Add = "-10%"
		},
		{
			Stat = "Armor",
			Value = "-35",
			Stack = "Linear",
			Add = "-15"
		}
	},
	InternalName = "TransferDebuffOnHit",
	LocalizationInternalName = "ITEM_TRANSFERDEBUFFONHIT",
}

p.items = items

return p
--</nowiki>