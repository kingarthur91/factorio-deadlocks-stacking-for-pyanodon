local shared = require("shared")

function reapply_research(force, research)
    if force.technologies[research] and force.technologies[research].researched then
        for _, effect in pairs(force.technologies[research].effects) do
            if effect.type == "unlock-recipe" then
                force.recipes[effect.recipe].enabled = true
            end
        end
        force.print({"info-message.dsfp-tech-migration", force.technologies[research].localised_name}, {r = 1, g = 0.75, b = 0, a = 1})
    end
end

local techs = {}

for mod, items in pairs(shared.STACKABLES) do
    if game.active_mods[mod] then
        for _, item in pairs(items) do
            if item.tech then
                techs[item.tech] = true
            else
                if game.active_mods["deadlock-beltboxes-loaders"] then
                    techs[shared.STACKING_PREFIX .. item.stage] = true
                end
                if game.active_mods["DeadlockCrating"] then
                    techs[shared.CRATING_PREFIX .. item.stage] = true
                end
            end
        end
    end
end

for _, force in pairs(game.forces) do
    force.reset_technologies()
    force.reset_recipes()
    for tech, _ in pairs(techs) do
        reapply_research(force, tech)
    end
end
