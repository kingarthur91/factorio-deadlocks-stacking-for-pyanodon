function create_all(stackable_items, stage_prefix, create_function, filterForFinalFixes)
    for mod, items in pairs(stackable_items) do
        if mods[mod] then
            for _, item in pairs(items) do
                if not filterForFinalFixes or item.inFinalFixes then
                    local icon = item.icon
                    if icon == nil then
                        icon = "__DeadlocksStackingForPyanadon__/graphics/icons/stacked-" .. item.item .. ".png"
                    end

                    local item_type = item.type or "item"

                    if item.tech then
                        create_function(item.item, icon, item.tech, 32, item_type)
                    else
                        create_function(item.item, icon, stage_prefix .. item.stage, 32, item_type)
                    end
                end
            end
        end
    end
end
