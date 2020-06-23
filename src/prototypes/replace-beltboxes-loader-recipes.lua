local tiers = {
  t1 = {
    loader = {
		  plates = {"iron-plate", 5},
    },
    beltbox = {
      plates = {"iron-plate", 10},
      gears = {"iron-gear-wheel", 10},
    },
  },
  t2 = {
    loader = {
		  gears = {"iron-gear-wheel", 20},
    },
    beltbox = {
      plates = {"iron-plate", 20},
      gears = {"iron-gear-wheel", 20},
    },
  },
  t3 = {
    loader = {
      gears = {"iron-gear-wheel", 40},
    },
    beltbox = {
      plates = {"iron-plate", 20},
      gears = {"iron-gear-wheel", 30},
    },
  }
}

-- replace iron-plate with stainless-steel / super-steel if pyrawores is used
if mods["pyrawores"] then
  tiers["t2"]["beltbox"]["plates"] = {"stainless-steel", 2}
  tiers["t3"]["beltbox"]["plates"] = {"super-steel", 3}
end

-- replace iron-gear-wheel with small-parts 1-3 if pyrawores is used
if mods["pypetroleumhandling"] then
  tiers["t1"]["beltbox"]["gears"] = {"small-parts-01", 1}
  tiers["t2"]["loader"]["gears"] = {"small-parts-02", 2}
  tiers["t2"]["beltbox"]["gears"] = {"small-parts-02", 2}
  tiers["t3"]["loader"]["gears"] = {"small-parts-03", 4}
  tiers["t3"]["beltbox"]["gears"] = {"small-parts-03", 3}
end
if mods['DeadlockStacking'] then
deadlock.add_tier({
	transport_belt      = "transport-belt",
	colour              = {r=210, g=180, b=80},
	underground_belt    = "underground-belt",
	splitter            = "splitter",
	technology          = "logistics",
	order               = "a",
	loader_ingredients  = {
		{"transport-belt", 1},
		tiers["t1"]["loader"]["plates"],
	},
	beltbox_ingredients = {
		{"transport-belt", 4},
		tiers["t1"]["beltbox"]["plates"],
		tiers["t1"]["beltbox"]["gears"],
		{"electronic-circuit", 4},
	},
	beltbox_technology  = "deadlock-stacking-1",
})

deadlock.add_tier({
  transport_belt      = "fast-transport-belt",
  colour              = {r=210, g=60, b=60},
  underground_belt    = "fast-underground-belt",
  splitter            = "fast-splitter",
  technology          = "logistics-2",
  order               = "b",
  loader_ingredients  = {
	  {"transport-belt-loader", 1},
	  tiers["t2"]["loader"]["gears"],
  },
  beltbox_ingredients = {
	  {"transport-belt-beltbox", 1},
	  tiers["t2"]["beltbox"]["plates"],
	  tiers["t2"]["beltbox"]["gears"],
	  {"advanced-circuit", 2},
  },
  beltbox_technology  = "deadlock-stacking-2",
})

deadlock.add_tier({
  transport_belt      = "express-transport-belt",
  colour              = {r=80, g=180, b=210},
  underground_belt    = "express-underground-belt",
  splitter            = "express-splitter",
  technology          = "logistics-3",
  order               = "c",
  loader_ingredients  = {
	  {"fast-transport-belt-loader", 1},
	  tiers["t3"]["loader"]["gears"],
	  {name = "lubricant", type = "fluid", amount = 20},
  },
  loader_category     = "crafting-with-fluid",
  beltbox_ingredients = {
	  {"fast-transport-belt-beltbox", 1},
	  tiers["t3"]["beltbox"]["plates"],
	  tiers["t3"]["beltbox"]["gears"],
	  {name = "lubricant", type = "fluid", amount = 100},
  },
  beltbox_category    = "crafting-with-fluid",
  beltbox_technology  = "deadlock-stacking-3",
})

end