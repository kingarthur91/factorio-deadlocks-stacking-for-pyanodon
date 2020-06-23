local shared = require("migrations.shared")

function create_all(stackable_items, stage_prefix, create_function)
    for mod, items in pairs(stackable_items) do
        if mods[mod] then
            for _, item in pairs(items) do
                local icon = item.icon
                local icon_size = item.icon_size or 32
                local item_type = item.type or "item"
                if icon == nil then
                    icon = "__DeadlocksStackingForPyanadon__/graphics/icons/stacked-" .. item.item .. ".png"
                end
                if item.tech then
                    create_function(item.item, icon, item.tech, icon_size, item_type)
                else
                    create_function(item.item, icon, stage_prefix .. item.stage, icon_size, item_type)
                end
            end
        end
    end
end

if deadlock_stacking then
    create_all(shared.STACKABLES, shared.STACKING_PREFIX, deadlock.add_stack)
end

if deadlock_crating then
    create_all(
        shared.STACKABLES,
        shared.CRATING_PREFIX,
        function(item, icon, tech)
            deadlock_crating.create(item, tech)
        end
    )
end
