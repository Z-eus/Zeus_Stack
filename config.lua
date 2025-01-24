Config = {}

Config.Debug = false -- Dont make true on Live Server

Config.CloseInventory = false -- Close Inventory after using the stack item

Config.MoneyStackEnable = true
Config.MoneyStackCommand = "stackmoney"
Config.MoneyStackItemRequired = false -- Require item to make stack
Config.GiveBackRequiredMoneyStackItem = true -- After using the stack, does it give you the stack item to stack it back?
Config.MinimumRequiredMoneyStackItem = 1 -- How many stack item require to stack?
Config.RequiredMoneyStackItem = "moneyclip" -- Add item to your DB
Config.MoneyStackItem = "moneystack" -- Add item to your DB
Config.MinimumMoneyStack = 100    -- Minimum number to be stackable
Config.MaximumMoneyStack = 5000   -- Maximum number to be stackable

Config.GoldStackEnable = true
Config.GoldStackCommand = "stackgold"
Config.GoldStackItemRequired = false -- Require item to make stack
Config.GiveBackRequiredGoldStackItem = true -- After using the stack, does it give you the stack item to stack it back?
Config.MinimumRequiredGoldStackItem = 1 -- How many stack item require to stack?
Config.RequiredGoldStackItem = "goldbag" -- Add item to your DB
Config.GoldStackItem = "goldstack" -- Add item to your DB
Config.MinimumGoldStack = 10     -- Minimum number to be stackable
Config.MaximumGoldStack = 100    -- Maximum number to be stackable

Config.Webhook = true
Config.WebhookName = "Zeus Stack"
Config.WebhookLogo = "IMAGE_URL"
Config.WebhookColor = "3447003" -- Blue (Decimal)
Config.WebhookLink = "WEBHOOK_URL"

Config.Language = {
    NotificationTime = 2500, -- 1000ms = 1 Second
    Successful = "Successful",
    Warning = "Warning",
    InvalidAmonut = "Invalid amount, you can stack minimum",
    Maximum = "maximum",
    YouStacked = "You stacked",
    YouCantStack = "You can't stack more than you have",
    YouCantCarryMoney = "You can't carry more stacks of money",
    YouCantCarryGold = "You can't carry more stacks of gold",
    YouNeedMoneyStackItem = "You need a money clip to stack money",
    YouNeedGoldStackItem = "You need a gold bag to stack gold",
    YouUsed = "You used",
    FromMoneyStack = "from the money stack!",
    FromGoldStack = "from the gold stack!",
    StackedMoney = "Stacked Money:",
    NoStackedMoney = "There is no money stored!",
    StackedGold = "Stacked Gold:",
    NoStackedGold = "There is no gold stored!",
    Gold = "Gold",

    WebhookTitle = "Zeus Stack",
    Stacked = "Stacked",
    Used = "Used"
}