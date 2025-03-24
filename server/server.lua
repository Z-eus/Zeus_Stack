local Core = exports.vorp_core:GetCore()

--##################################################### MONEY STACK #####################################################--
function GiveItemMoneyStack(source, amount)
    exports.vorp_inventory:addItem(source, Config.MoneyStackItem, 1, { description = Config.Language.StackedMoney .. " " .. "$" .. amount, amount = amount })
end

function AddMoneyForMoneyStack(source, amount)
    local user = Core.getUser(source)
    if not user then return end
    local character = user.getUsedCharacter

    character.addCurrency(0, amount)

    if Config.MoneyStackItemRequired and Config.GiveBackRequiredMoneyStackItem then
        exports.vorp_inventory:addItem(source, Config.RequiredMoneyStackItem, 1)
    end

    if Config.Webhook then
        TriggerEvent('Zeus_Stack_Server:Webhook', source, "used", "Money", amount)
    end
end

exports.vorp_inventory:registerUsableItem(Config.MoneyStackItem, function(data)
    local metadata = data.item.metadata
    local amount = metadata and metadata.amount or 0

    if amount > 0 then
        exports.vorp_inventory:subItem(data.source, Config.MoneyStackItem, 1)
        AddMoneyForMoneyStack(data.source, amount)

        if Config.CloseInventory then
            exports.vorp_inventory:closeInventory(data.source)
        end

        Core.NotifyLeft(data.source, Config.Language.Successful, Config.Language.YouUsed .. " " .. "$" .. amount .. " " .. Config.Language.FromMoneyStack, "inventory_items", "money_moneystack", Config.Language.NotificationTime, "COLOR_WHITE")
    else
        Core.NotifyLeft(data.source, Config.Language.Warning, Config.Language.NoStackedMoney, "scoretimer_textures", "scoretimer_generic_cross", Config.Language.NotificationTime, "COLOR_RED")
    end
end)

RegisterNetEvent("Zeus_Stack_Server:MoneyStack", function(amount)
    local source = source
    local user = Core.getUser(source)
    if not user then return end
    local character = user.getUsedCharacter
    local charMoney = character.money

    if Config.MoneyStackItemRequired then
        exports.vorp_inventory:getItem(source, Config.RequiredMoneyStackItem, function(item)
            if not item or item.count < Config.MinimumRequiredMoneyStackItem then
                Core.NotifyLeft(source, Config.Language.Warning, Config.Language.YouNeedMoneyStackItem, "scoretimer_textures", "scoretimer_generic_cross", Config.Language.NotificationTime, "COLOR_RED")
                if Config.Debug then
                    print("Player does not have the required stack item.")
                end
                return
            end

            if amount and amount > 0 and amount <= charMoney then
                character.removeCurrency(0, amount)
                GiveItemMoneyStack(source, amount)
                exports.vorp_inventory:subItem(source, Config.RequiredMoneyStackItem, 1)

                if Config.Webhook then
                    TriggerEvent('Zeus_Stack_Server:Webhook', source, "stacked", "Money", amount)
                end

                Core.NotifyLeft(source, Config.Language.Successful, Config.Language.YouStacked .. " " .. "$" .. amount, "inventory_items", "money_moneystack", Config.Language.NotificationTime, "COLOR_WHITE")
            else
                Core.NotifyLeft(source, Config.Language.Warning, Config.Language.YouCantStack, "scoretimer_textures", "scoretimer_generic_cross", Config.Language.NotificationTime, "COLOR_RED")
                if Config.Debug then
                    print("Stack amount exceeds character money.")
                end
            end
        end)
        return
    end

    if amount and amount > 0 and amount <= charMoney then
        character.removeCurrency(0, amount)
        GiveItemMoneyStack(source, amount)

        if Config.Webhook then
            TriggerEvent('Zeus_Stack_Server:Webhook', source, "stacked", "Money", amount)
        end

        Core.NotifyLeft(source, Config.Language.Successful, Config.Language.YouStacked .. " " .. "$" .. amount, "inventory_items", "money_moneystack", Config.Language.NotificationTime, "COLOR_WHITE")
    else
        Core.NotifyLeft(source, Config.Language.Warning, Config.Language.YouCantStack, "scoretimer_textures", "scoretimer_generic_cross", Config.Language.NotificationTime, "COLOR_RED")
        if Config.Debug then
            print("Stack amount exceeds character money.")
        end
    end
end)

--##################################################### GOLD STACK #####################################################--
function GiveItemGoldStack(source, amount)
    exports.vorp_inventory:addItem(source, Config.GoldStackItem, 1, { description = Config.Language.StackedGold .. " " .. amount .. " " .. Config.Language.Gold, amount = amount })
end

function AddGoldForGoldStack(source, amount)
    local user = Core.getUser(source)
    if not user then return end
    local character = user.getUsedCharacter

    character.addCurrency(1, amount)

    if Config.GoldStackItemRequired and Config.GiveBackRequiredGoldStackItem then
        exports.vorp_inventory:addItem(source, Config.RequiredGoldStackItem, 1)
    end

    if Config.Webhook then
        TriggerEvent('Zeus_Stack_Server:Webhook', source, "used", "Gold", amount)
    end
end

exports.vorp_inventory:registerUsableItem(Config.GoldStackItem, function(data)
    local metadata = data.item.metadata
    local amount = metadata and metadata.amount or 0

    if amount > 0 then
        exports.vorp_inventory:subItem(data.source, Config.GoldStackItem, 1)
        AddGoldForGoldStack(data.source, amount)

        if Config.CloseInventory then
            exports.vorp_inventory:closeInventory(data.source)
        end

        Core.NotifyLeft(data.source, Config.Language.Successful, Config.Language.YouUsed .. " " .. amount .. " " .. "~COLOR_NET_PLAYER23~Gold~COLOR_WHITE~" .. " " .. Config.Language.FromGoldStack, "inventory_items", "provision_goldbar_small", Config.Language.NotificationTime, "COLOR_YELLOW")
    else
        Core.NotifyLeft(data.source, Config.Language.Warning, Config.Language.NoStackedGold, "scoretimer_textures", "scoretimer_generic_cross", Config.Language.NotificationTime, "COLOR_RED")
    end
end)

RegisterNetEvent("Zeus_Stack_Server:GoldStack", function(amount)
    local source = source
    local user = Core.getUser(source)
    if not user then return end
    local character = user.getUsedCharacter
    local charGold = character.gold

    if Config.GoldStackItemRequired then
        exports.vorp_inventory:getItem(source, Config.RequiredGoldStackItem, function(item)
            if not item or item.count < Config.MinimumRequiredGoldStackItem then
                Core.NotifyLeft(source, Config.Language.Warning, Config.Language.YouNeedGoldStackItem, "scoretimer_textures", "scoretimer_generic_cross", Config.Language.NotificationTime, "COLOR_RED")
                if Config.Debug then
                    print("Player does not have the required stack item.")
                end
                return
            end

            if amount and amount > 0 and amount <= charGold then
                character.removeCurrency(1, amount)
                GiveItemGoldStack(source, amount)

                exports.vorp_inventory:subItem(source, Config.RequiredGoldStackItem, 1)

                if Config.Webhook then
                    TriggerEvent('Zeus_Stack_Server:Webhook', source, "stacked", "Gold", amount)
                end

                Core.NotifyLeft(source, Config.Language.Successful, Config.Language.YouStacked .. " " .. amount .. " " .. "~COLOR_NET_PLAYER23~Gold", "inventory_items", "provision_goldbar_small", Config.Language.NotificationTime, "COLOR_YELLOW")
            else
                Core.NotifyLeft(source, Config.Language.Warning, Config.Language.YouCantStack, "scoretimer_textures", "scoretimer_generic_cross", Config.Language.NotificationTime, "COLOR_RED")
                if Config.Debug then
                    print("Stack amount exceeds character gold.")
                end
            end
        end)
        return
    end

    if amount and amount > 0 and amount <= charGold then
        character.removeCurrency(1, amount)
        GiveItemGoldStack(source, amount)

        if Config.Webhook then
            TriggerEvent('Zeus_Stack_Server:Webhook', source, "stacked", "Gold", amount)
        end

        Core.NotifyLeft(source, Config.Language.Successful, Config.Language.YouStacked .. " " .. amount .. " " .. "~COLOR_NET_PLAYER23~Gold", "inventory_items", "provision_goldbar_small", Config.Language.NotificationTime, "COLOR_YELLOW")
    else
        Core.NotifyLeft(source, Config.Language.Warning, Config.Language.YouCantStack, "scoretimer_textures", "scoretimer_generic_cross", Config.Language.NotificationTime, "COLOR_RED")
        if Config.Debug then
            print("Stack amount exceeds character gold.")
        end
    end
end)

--##################################################### WEBHOOK #####################################################--
AddEventHandler('Zeus_Stack_Server:Webhook', function(source, action, stackType, amount)
    local user = Core.getUser(source)
    if not user then return end
    local character = user.getUsedCharacter
    local playerName = character.firstname .. " " .. character.lastname
    local steamHex = GetPlayerIdentifier(source, 0)
    local time = os.date("%Y-%m-%d %H:%M:%S")
    local actionText = action == "stacked" and Config.Language.Stacked or Config.Language.Used

    local webhookData = {
        username = Config.WebhookName,
        avatar_url = Config.WebhookLogo,
        embeds = {
            {
                title = Config.Language.WebhookTitle,
                color = Config.WebhookColor,
                fields = {
                    {
                        name = "**Player Name:**",
                        value = playerName,
                        inline = false
                    },
                    {
                        name = "**Steam HEX:**",
                        value = steamHex,
                        inline = false
                    },
                    {
                        name = "**Action:**",
                        value = actionText,
                        inline = true
                    },
                    {
                        name = "**Type:**",
                        value = stackType,
                        inline = true
                    },
                    {
                        name = "**Amount:**",
                        value = amount .. " " .. stackType,
                        inline = true
                    },
                    {
                        name = "**Time:**",
                        value = time,
                        inline = false
                    }
                }
            }
        }
    }

    PerformHttpRequest(Config.WebhookLink, function(err, text, headers) end, 'POST', json.encode(webhookData), { ['Content-Type'] = 'application/json' })
end)