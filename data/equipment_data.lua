--<nowiki>
local p = {}
local equipment = {}

equipment["Disposable Missile Launcher"] = {
	Rarity = "Equipment",
	Quote = "Fire a swarm of missiles.",
	Desc = "Fire a swarm of {{Color|d|12}} missiles that deal {{Color|d|12x300% damage}}.",
	Cooldown = 45,
	Duration = 1.5,
	InternalName = "CommandMissile",
	LocalizationInternalName = "EQUIPMENT_COMMANDMISSILE",
}
equipment["Foreign Fruit"] = {
	Rarity = "Equipment",
	Quote = "Heal on use.",
	Desc = "Instantly heal for {{Color|h|50% of your maximum health}}.",
	Cooldown = 45,
	InternalName = "Fruit",
	LocalizationInternalName = "EQUIPMENT_FRUIT",
}
equipment["Glowing Meteorite"] = {
	Rarity = "Lunar Equipment",
	Quote = "Rain meteors from the sky, {{Color|#FF7F7F|hurting both enemies and allies.}}",
	Desc = "{{Color|d|Rain meteors}} from the sky, damaging ALL characters for {{Color|d|600% damage per blast}}. Lasts 20 seconds.",
	Cooldown = 140,
	Duration = 20,
	Unlock = "Moon Worshipper",
	InternalName = "Meteor",
	LocalizationInternalName = "EQUIPMENT_METEOR",
}
equipment["Primordial Cube"] = {
	Rarity = "Equipment",
	Quote = "Fire a black hole that draws enemies in.",
	Desc = "Fire a black hole that {{Color|u|draws enemies within 30m into its center}}. Lasts 10 seconds",
	Cooldown = 60,
	Duration = 10,
	InternalName = "Blackhole",
	LocalizationInternalName = "EQUIPMENT_BLACKHOLE",
}
equipment["Ocular HUD"] = {
	Rarity = "Equipment",
	Quote = "Gain 100% Critical Strike Chance for 8 seconds.",
	Desc = "Gain {{Color|d|+100% Critical Strike Chance}} for 8 seconds.",
	Cooldown = 60,
	Duration = 8,
	InternalName = "CritOnUse",
	LocalizationInternalName = "EQUIPMENT_CRITONUSE",
}
equipment["The Back-up"] = {
	Rarity = "Equipment",
	Quote = "Call drones for back up. Lasts 25 seconds.",
	Desc = "Call {{Color|d|4 Strike Drones}} to fight for you. Lasts 25 seconds.",
	Cooldown = 100,
	Duration = 25,
	Unlock = "Mechanic",
	InternalName = "DroneBackUp",
	LocalizationInternalName = "EQUIPMENT_DRONEBACKUP",
}
equipment["Preon Accumulator"] = {
	Rarity = "Equipment",
	Quote = "Fire a ball of energy that electrocutes nearby enemies before detonating.",
	Desc = "Fires preon tendrils, zapping enemies within 35m for up to {{Color|d|600% damage/second}}. On contact, detonate in an enormous 20m explosion for {{Color|d|4000% damage}}.",
	Cooldown = 140,
	Unlock = "REDACTED|[REDACTED]",
	InternalName = "BFG",
	LocalizationInternalName = "EQUIPMENT_BFG",
}
equipment["Milky Chrysalis"] = {
	Rarity = "Equipment",
	Quote = "Gain temporary flight.",
	Desc = "Sprout wings and {{Color|u|fly for 15 seconds}}. Gain {{Color|u|+20% movement speed}} for the duration.",
	Cooldown = 60,
	Duration = 15,
	InternalName = "Jetpack",
	LocalizationInternalName = "EQUIPMENT_JETPACK",
}
equipment["Royal Capacitor"] = {
	Rarity = "Equipment",
	Quote = "Call down a lightning strike on a targeted monster.",
	Desc = "Call down a lightning strike on a targeted monster, dealing {{Color|d|3000% damage}} and {{Color|d|stunning}} nearby monsters.",
	Cooldown = 20,
	Unlock = "Ascendant",
	InternalName = "Lightning",
	LocalizationInternalName = "EQUIPMENT_LIGHTNING",
}
equipment["The Crowdfunder"] = {
	Rarity = "Equipment",
	Quote = "Toggle to fire. Costs gold per bullet.",
	Desc = "Fires a continuous barrage that deals {{Color|d|100% damage per bullet}}. Costs $1 per bullet. Cost increases over time.",
	Unlock = "Funded!",
	InternalName = "GoldGat",
	LocalizationInternalName = "EQUIPMENT_GOLDGAT",
}
equipment["Gnarled Woodsprite"] = {
	Rarity = "Equipment",
	Quote = "Heal over time. Activate to send to an ally.",
	Desc = "Gain a Woodsprite follower that heals for {{Color|h|1.5% of your maximum health/second}}. Can be sent to an ally to heal them for {{Color|h|10% of their maximum health}}.",
	Cooldown = 15,
	Unlock = "One with the Woods",
	InternalName = "PassiveHealing",
	LocalizationInternalName = "EQUIPMENT_PASSIVEHEALING",
}
equipment["Ifrit's Distinction"] = {
	Rarity = "Elite Equipment",
	Elite = "{{StatusEffectLink|AffixRed}}",
	Quote = "Become an aspect of fire.",
	Desc = "Become an aspect of fire.",
	Droppable = false,
	InternalName = "EliteFireEquipment",
	LocalizationInternalName = "EQUIPMENT_AFFIXRED",
}
equipment["Silence Between Two Strikes"] = {
	Rarity = "Elite Equipment",
	Elite = "{{StatusEffectLink|AffixBlue}}",
	Quote = "Become an aspect of lightning.",
	Desc = "Become an aspect of lightning.",
	Droppable = false,
	InternalName = "EliteLightningEquipment",
	LocalizationInternalName = "EQUIPMENT_AFFIXBLUE",
}
equipment["Her Biting Embrace"] = {
	Rarity = "Elite Equipment",
	Elite = "{{StatusEffectLink|AffixWhite}}",
	Quote = "Become an aspect of ice.",
	Desc = "Become an aspect of ice.",
	Droppable = false,
	InternalName = "EliteIceEquipment",
	LocalizationInternalName = "EQUIPMENT_AFFIXWHITE",
}
equipment["N'kuhana's Retort"] = {
	Rarity = "Elite Equipment",
	Elite = "{{StatusEffectLink|AffixPoison}}",
	Quote = "Become an aspect of corruption.",
	Desc = "Become an aspect of corruption.",
	Droppable = false,
	InternalName = "ElitePoisonEquipment",
	LocalizationInternalName = "EQUIPMENT_AFFIXPOISON",
}
equipment["Spectral Circlet"] = {
	Rarity = "Elite Equipment",
	Elite = "{{StatusEffectLink|AffixHaunted}}",
	Quote = "Become an aspect of incorporeality.",
	Desc = "Become an aspect of incorporeality.",
	Droppable = false,
	InternalName = "EliteHauntedEquipment",
	LocalizationInternalName = "EQUIPMENT_AFFIXHAUNTED",
}
equipment["Shared Design"] = {
	Rarity = "Elite Equipment",
	Elite = "{{StatusEffectLink|AffixLunar}}",
	Quote = "Become an aspect of perfection.",
	Desc = "Become an aspect of perfection.",
	Droppable = false,
	InternalName = "EliteLunarEquipment",
	LocalizationInternalName = "EQUIPMENT_AFFIXLUNAR",
}
equipment["Helfire Tincture"] = {
	Rarity = "Lunar Equipment",
	Quote = "Burn everything nearby... {{Color|#FF7F7F|including you and allies.}}",
	-- Modified Description
	Desc = "Ignite ALL characters within 15m for 12s. Deal {{Color|d|5% of your maximum health/second as burning}} as damage. The burn is {{Color|d|0.5x}} stronger on yourself, {{Color|d|0.25x}} stronger on allies, and {{Color|d|24x}} stronger on enemies.",
	Cooldown = 45,
	Duration = 12,
	Unlock = "Multikill!",
	InternalName = "BurnNearby",
	LocalizationInternalName = "EQUIPMENT_BURNNEARBY",
}
equipment["Radar Scanner"] = {
	Rarity = "Equipment",
	Quote = "Reveal all nearby interactables.",
	Desc = "{{Color|u|Reveal}} all interactables within 500m for {{Color|u|10 seconds}}.",
	Cooldown = 45,
	Duration = 10,
	Unlock = "Bookworm",
	InternalName = "Scanner",
	LocalizationInternalName = "EQUIPMENT_SCANNER",
}
equipment["Effigy of Grief"] = {
	Rarity = "Lunar Equipment",
	Quote = "Drop a permanent effigy that cripples ALL characters inside. Can place up to 5.",
	Desc = "ALL characters within are {{Color|u|slowed by 50%}} and have their {{Color|d|armor reduced by 20}}. Can place up to {{Color|u|5}}.",
	Cooldown = 15,
	InternalName = "CrippleWard",
	LocalizationInternalName = "EQUIPMENT_CRIPPLEWARD",
}
equipment["Eccentric Vase"] = {
	Rarity = "Equipment",
	Quote = "Create a quantum tunnel between two locations.",
	Desc = "Create a {{Color|u|quantum tunnel}} of up to {{Color|u|1000m}} in length. Lasts 30 seconds.",
	Cooldown = 45,
	Unlock = "Blackout",
	InternalName = "Gateway",
	LocalizationInternalName = "EQUIPMENT_GATEWAY",
}
equipment["Spinel Tonic"] = {
	Rarity = "Lunar Equipment",
	Quote = "Gain a massive boost to ALL stats. {{Color|#FF7F7F|Chance to gain an affliction that reduces ALL stats.}}",
	Desc = "Drink the Tonic, gaining a boost for 20 seconds. Increases {{Color|d|damage}} by {{Color|d|+100%}}. Increases {{Color|d|attack speed}} by {{Color|d|+70%}}. Increases {{Color|d|armor}} by {{Color|d|+20}}. Increases {{Color|h|maximum health}} by {{Color|h|+50%}}. Increases {{Color|h|passive health regeneration}} by {{Color|h|+300%}}. Increases {{Color|u|movespeed}} by {{Color|u|+30%}}.\r\n\r\nWhen the Tonic wears off, you have a {{Color|hp|20%}} chance to gain a {{Color|hp|Tonic Affliction, reducing all of your stats}} by {{Color|hp|-5%}} {{Stack|(-5% per stack)}}.",
	Cooldown = 60,
	Duration = 20,
	Unlock = "Cosmic Explorer",
	InternalName = "Tonic",
	LocalizationInternalName = "EQUIPMENT_TONIC",
}
equipment["Fuel Array"] = {
	Rarity = "Equipment",
	Quote = "Looks like it could power something. {{Color|#FF7F7F|EXTREMELY unstable...}}",
	Desc = "Looks like it could power something. {{Color|#FF7F7F|EXTREMELY unstable...}}",
	Droppable = false,
	InternalName = "QuestVolatileBattery",
	LocalizationInternalName = "EQUIPMENT_QUESTVOLATILEBATTERY",
}
equipment["Blast Shower"] = {
	Rarity = "Equipment",
	Quote = "Cleanse all negative effects.",
	Desc = "{{Color|u|Cleanse}} all negative effects. Includes debuffs, damage over time, and nearby projectiles.",
	Cooldown = 20,
	Unlock = "Warm For Life",
	InternalName = "Cleanse",
	LocalizationInternalName = "EQUIPMENT_CLEANSE",
}
equipment["Volcanic Egg"] = {
	Rarity = "Equipment",
	Quote = "Transform into a speeding draconic fireball, dealing damage as you pass through enemies.",
	Desc = "Turn into a {{Color|d|draconic fireball}} for {{Color|d|5}} seconds. Deal {{Color|d|500% damage}} on impact. Detonates at the end for {{Color|d|800% damage}}.",
	Cooldown = 30,
	Duration = 5,
	InternalName = "FireballDash",
	LocalizationInternalName = "EQUIPMENT_FIREBALLDASH",
}
equipment["Jade Elephant"] = {
	Rarity = "Equipment",
	Quote = "Gain massive armor for 5 seconds.",
	Desc = "Gain {{Color|d|500 armor}} for {{Color|u|5 seconds}}.",
	Cooldown = 45,
	Duration = 5,
	InternalName = "GainArmor",
	LocalizationInternalName = "EQUIPMENT_GAINARMOR",
}
equipment["Sawmerang"] = {
	Rarity = "Equipment",
	Quote = "Throw a fan of buzzing saws that come back to you.",
	Desc = "Throw {{Color|d|three large saw blades}} that slice through enemies for {{Color|d|3x400%}} damage. Also deals an additional {{Color|d|3x100% damage per second}} while {{Color|d|bleeding}} enemies. Can {{Color|d|strike}} enemies again on the way back.",
	Cooldown = 45,
	InternalName = "Saw",
	LocalizationInternalName = "EQUIPMENT_SAWMERANG",
}
equipment["Recycler"] = {
	Rarity = "Equipment",
	Quote = "Transform an Item or Equipment into a different one. Can only recycle once.",
	Desc = "{{Color|u|Transform}} an Item or Equipment into a different one. {{Color|u|Can only be converted into the same tier one time}}.",
	Cooldown = 45,
	Unlock = "Cleanup Duty",
	InternalName = "Recycle",
	LocalizationInternalName = "EQUIPMENT_RECYCLER",
}
equipment["Super Massive Leech"] = {
	Rarity = "Equipment",
	Quote = "Heal for a percentage of the damage you deal for 8 seconds.",
	Desc = "{{Color|h|Heal}} for {{Color|h|20%}} of the {{Color|d|damage}} you deal. Lasts {{Color|h|8}} seconds.",
	Cooldown = 60,
	Duration = 8,
	InternalName = "LifestealOnHit",
	LocalizationInternalName = "EQUIPMENT_LIFESTEALONHIT",
}
equipment["Gorag's Opus"] = {
	Rarity = "Equipment",
	Quote = "You and all your allies enter a frenzy.",
	Desc = "All allies enter a {{Color|d|frenzy}} for {{Color|u|7}} seconds. Increases {{Color|u|movement speed}} by {{Color|u|50%}} and {{Color|d|attack speed}} by {{Color|d|100%}}.",
	Cooldown = 45,
	Duration = 7,
	InternalName = "TeamWarCry",
	LocalizationInternalName = "EQUIPMENT_TEAMWARCRY",
}
equipment["Forgive Me Please"] = {
	Rarity = "Equipment",
	Quote = "Throw a cursed doll that repeatedly triggers your 'On Kill' effects.",
	Desc = "Throw a cursed doll out that {{Color|d|triggers}} any {{Color|d|On-Kill}} effects you have every {{Color|u|1}} second for {{Color|u|8}} seconds.",
	Cooldown = 45,
	Duration = 8,
	Unlock = "I Love Dying!",
	InternalName = "DeathProjectile",
	LocalizationInternalName = "EQUIPMENT_DEATHPROJECTILE",
}
equipment["Trophy Hunter's Tricorn"] = {
	Expansion = "SotV",
	Rarity = "Equipment",
	Quote = "Execute a large monster and claim its {{Color|d|trophy.}} Consumed on use.",
	Desc = "{{Color|d|Execute}} any enemy capable of spawning a {{Color|d|unique reward}}, and it will drop that {{Color|d|item}}. Equipment is {{Color|u|consumed}} on use.",
	Cooldown = 0,
	InternalName = "BossHunter",
	LocalizationInternalName = "EQUIPMENT_BOSSHUNTER",
}
equipment["Trophy Hunter's Tricorn (Consumed)"] = {
	Expansion = "SotV",
	Rarity = "Equipment",
	Quote = "",
	Desc = "Looks kinda cool, but that's about it.",
	Cooldown = 60,
	Droppable = false,
	InternalName = "BossHunterConsumed",
	LocalizationInternalName = "EQUIPMENT_BOSSHUNTERCONSUMED",
}
equipment["Goobo Jr."] = {
	Expansion = "SotV",
	Rarity = "Equipment",
	Quote = "Create a clone of you for 30 seconds.",
	Desc = "Spawn a gummy clone that has {{Color|d|300% damage}} and {{Color|h|300% health}}. Expires in {{Color|u|30}} seconds.",
	Cooldown = 100,
	Duration = 30,
	InternalName = "GummyClone",
	LocalizationInternalName = "EQUIPMENT_GUMMYCLONE",
}
equipment["Molotov (6-Pack)"] = {
	Expansion = "SotV",
	Rarity = "Equipment",
	Quote = "Throw 6 flaming molotovs that ignite enemies upon shattering.",
	Desc = "Throw {{Color|d|6}} molotov cocktails that {{Color|d|ignites}} enemies for {{Color|d|500% base damage}}. Each molotov leaves a burning area for {{Color|d|200% damage per second}}.",
	Cooldown = 45,
	InternalName = "Molotov",
	LocalizationInternalName = "EQUIPMENT_MOLOTOV",
}
equipment["Executive Card"] = {
	Expansion = "SotV",
	Rarity = "Equipment",
	Quote = "Gain 10% cash back on all purchases. Multishops remain open.",
	Desc = "Whenever you make a gold purchase, get {{Color|u|10%}} of the spent gold back. If the purchase is a {{Color|u|multishop}} terminal, the other terminals will {{Color|u|remain open}}.",
	Cooldown = 0.1,
	InternalName = "MultiShopCard",
	LocalizationInternalName = "EQUIPMENT_MULTISHOPCARD",
}
equipment["Remote Caffeinator"] = {
	Expansion = "SotV",
	Rarity = "Equipment",
	Quote = "Request a healing soda machine.",
	Desc = "Request an {{Color|d|Eclipse Zero Vending Machine}} from the {{Color|d|UES Safe Travels}}. Delivery guaranteed in {{Color|u|5 seconds}}, dealing {{Color|d|2000% damage}}. {{Color|h|Heal}} up to 3 targets for {{Color|h|25% of their maximum health}}.",
	Cooldown = 60,
	InternalName = "VendingMachine",
	LocalizationInternalName = "EQUIPMENT_VENDINGMACHINE",
}
equipment["His Reassurance"] = {
	Expansion = "SotV",
	Rarity = "Elite Equipment",
	Elite = "{{StatusEffectLink|AffixEarth}}",
	Quote = "Become an aspect of earth.",
	Desc = "Become an aspect of earth.",
	Droppable = false,
	InternalName = "EliteEarthEquipment",
	LocalizationInternalName = "EQUIPMENT_AFFIXEARTH",
}
equipment["Seed of Life"] = {
	Expansion = "SotS",
	Rarity = "Equipment",
	Quote = "Revives the user when killed or dead allies on activation. Consumed on use.",
	Desc = "Revives the user when killed or dead allies on activation. Consumed on use.",
	Cooldown = 60,
	InternalName = "HealAndRevive",
	LocalizationInternalName = "EQUIPMENT_HEALANDREVIVE",
}
equipment["Seed of Life (Consumed)"] = {
	Expansion = "SotS",
	Rarity = "Equipment",
	Quote = "On activation places a sprout that drops healing orbs.",
	Desc = "On activation places a sprout that drops healing orbs.",
	Cooldown = 15,
	Droppable = false,
	InternalName = "HealAndReviveConsumed",
	LocalizationInternalName = "EQUIPMENT_HEALANDREVIVECONSUMED",
}
equipment["Aurelionite's Blessing"] = {
	Expansion = "SotS",
	Rarity = "Elite Equipment",
	Elite = "{{StatusEffectLink|AffixAurelionite}}",
	Quote = "Become an aspect of radiance.",
	Desc = "Become an aspect of radiance.",
	Cooldown = 25,
	Droppable = false,
	InternalName = "EliteAurelioniteEquipment",
	LocalizationInternalName = "EQUIPMENT_AFFIXAURELIONITE",
}
equipment["His Spiteful Boon"] = {
	Expansion = "SotS",
	Rarity = "Elite Equipment",
	Elite = "{{StatusEffectLink|AffixBead}}",
	Quote = "Become an aspect of spite.",
	Desc = "Become an aspect of spite.",
	Droppable = false,
	InternalName = "EliteBeadEquipment",
	LocalizationInternalName = "EQUIPMENT_AFFIXBEAD",
}
equipment["Deus Ex Machina"] = {
	Expansion = "AC",
	Rarity = "Equipment",
	Quote = "Counter any damage. Successful counters {{Color|#E6CA65|bless}} your next attack, ensuring your on-hit effects ALWAYS activate.",
	Desc = "Briefly enter a countering stance that lets you parry {{Color|u|any and ALL}} damage. A successful parry {{Color|h|nullifies incoming damage}}, reduces your equipment cooldown by {{Color|d|75%}}, and grants {{Color|#E6CA65|Blessing}}, causing your next attack to ALWAYS activate your on-hit effects.",
	Cooldown = 60,
	Droppable = true,
	InternalName = "Parry",
	LocalizationInternalName = "EQUIPMENT_PARRY",
}
equipment["Of One Mind"] = {
	Expansion = "AC",
	Rarity = "Elite Equipment",
	Elite = "{{StatusEffectLink|AffixCollective}}",
	Quote = "Become an aspect of the Collective.",
	Desc = "Become an aspect of the Collective.",
	Droppable = false,
	InternalName = "EliteCollectiveEquipment",
	LocalizationInternalName = "EQUIPMENT_AFFIXCOLLECTIVE",
}


p.equipment = equipment

return p
--</nowiki>