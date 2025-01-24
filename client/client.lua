local Core = exports.vorp_core:GetCore()

if Config.MoneyStackEnable then
    RegisterCommand(Config.MoneyStackCommand, function(source, args)
        local amount = tonumber(args[1])

        if amount >= Config.MinimumMoneyStack and amount <= Config.MaximumMoneyStack then
            TriggerServerEvent("Zeus_Stack_Server:MoneyStack", amount)
        else
            Core.NotifyLeft(Config.Language.Warning, Config.Language.InvalidAmonut .. " " .. "$" .. Config.MinimumMoneyStack .. "," .. " " .. Config.Language.Maximum .. " " .. "$" .. Config.MaximumMoneyStack, "scoretimer_textures", "scoretimer_generic_cross", Config.Language.NotificationTime, "COLOR_RED")
            if Config.Debug then
                print("Invalid amount")
            end
        end
    end, false)
end

if Config.GoldStackEnable then
    RegisterCommand(Config.GoldStackCommand, function(source, args)
        local amount = tonumber(args[1])

        if amount >= Config.MinimumGoldStack and amount <= Config.MaximumGoldStack then
            TriggerServerEvent("Zeus_Stack_Server:GoldStack", amount)
        else
            Core.NotifyLeft(Config.Language.Warning, Config.Language.InvalidAmonut .. " " .. Config.MinimumGoldStack .. " " .. "~COLOR_NET_PLAYER23~Gold~COLOR_WHITE~" .. "," .. " " .. Config.Language.Maximum .. " " .. Config.MaximumGoldStack .. " " .. "~COLOR_NET_PLAYER23~Gold", "scoretimer_textures", "scoretimer_generic_cross", Config.Language.NotificationTime, "COLOR_RED")
            if Config.Debug then
                print("Invalid amount")
            end
        end
    end, false)
end