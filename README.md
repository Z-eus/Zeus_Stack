# Zeus Stack

**Zeus_Stack**

The **Zeus_Stack** script introduces an advanced and customizable stacking system to your RedM server. Players can stack and manage in-game currency like money and gold through item interactions, while you have full control over stacking limits, required items, and more. This script adds depth and realism to the server's economy with easy-to-use commands and a powerful webhook integration.

**Features;**

- Stack money/gold in customizable amounts(You can configure minimum-maximum amount)

- Flexible stack limits for both money and gold, set by configurable values, allowing server owners to tweak the stacking system to their liking.
Prevent players from stacking amounts beyond their available resources with automatic checks for insufficient gold or money.

- Both money and gold stacking can have item requirements, such as a money clip or gold bag, to ensure players have the necessary tools for stacking. Configurable options to enable or disable these requirements or required item limit, as well as whether the items are returned after use.

- Webhook Integration: Detailed log of stack actions, including player names, actions (stacked or used), item types, and amounts, using webhooks. The webhooks provide transparency and give administrators an overview of in-game economic activities.

- Easily adjustable language strings for notifications, warnings, and success messages, allowing server owners to localize the experience for their players.

## Installation
- Throw it into your `resources` folder
- Run `items.sql` -- (It is not necessary to run the SQL File. The SQL file adds the required items by default. You can add the items to your database one by one.)
- Add `ensure Zeus_Stack` to your `server.cfg`

## NOTE
- Dependency `VORP Core` & `VORP Inventory`
- Optimized
- Almost everything can be configured in `config.lua`

## Showcase
[Video](https://youtu.be/G43Nso-RgIk)