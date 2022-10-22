local colors = {red="@@RED@@",blue="@@BLUE@@",cyan="@@CYAN@@",white="@@WHITE@@"}
local cmds = {
    [1] = {
        name = "drop",
        description = "Starts dropping",
        options = "false",
    },
    [2] = {
        name = "stop",
        description = "Stops dropping",
        options = "false",
    },
    [3] = {
        name = "cdrop",
        description = "Drop the chosen amount",
        options = {
            [1] =  {
                description = "Amount to drop.",
                question = "Choose amount to drop: ",
            },
        },
    },
    [4] = {
        name = "mask",
        description = "Takes on mask on alts",
        options = {
            [1] = {
                description = "Mask off or on.",
                question = "Mask on/off: ",
            },
        },
    },
    [5] = {
        name = "money",
        description = "Makes bots show wallet.",
        options = {
            [1] = {
                description = "Show/hide wallet",
                question = "Show or hide wallet: ",
            },
        },
    },
    [6] = {
        name = "advert",
        description = "Makes bot repeat message that you set with 'advertnew'",
        options = {
            [1] = {
                description = "On/off self explainable",
                question = "Advert on or off: ",
            },
        },
    },
    [7] = {
        name = "advertnew",
        description = "Choose message to be send with 'advert'",
        options = {
            [1] = {
                description = "Message to send",
                question = "Message: ",
            },
        },
    },
    [8] = {
        name = "fps",
        description = "Choose the amount of fps on the alts",
        options = {
            [1] = {
                description = "Amount off fps",
                question = "Amount of fps: ",
            },
        },
    },
    [8] = {
        name = "host",
        description = "Setups alts at chosen host location (spot/line/random/around)",
        options = {
            [1] = {
                description = "Location to set alts at.",
                question = "Location: ",
            },
        },
    },
    [8] = {
        name = "setup",
        description = "Setups alts at chosen location (bank/admin/club/train)",
        options = {
            [1] = {
                description = "Location to set alts at.",
                question = "Location: ",
            },
        },
    },
    [9] = {
        name = "bring",
        description = "Brings selected user to selected place",
        options = {
            [1] = {
                description = "User or display of user to bring",
                question = "Type user to bring: ",
            },
            [2] = {
                description = "Place to bring user",
                question = "Location to bring user ( leave empty for host ): "
            }
        }
    },
    [10] = {
        name = "dropped",
        description = "tries to say how much is dropped ( on alts ) recommend just checking console name",
        options = "false",
    },
    [11] = {
        name = "delcash",
        description = "deletes cash on the alts",
        options = {
            [1] = {
                description = "Choose if you want to delete cash on alts ( saves cpu usage )",
                question = "Delete cash (on/off): "
            }
        }
    },
    [12] = {
        name = "ground",
        description = "puts the alts underground",
        options = "false",
    },
    [13] = {
        name = "airlock",
        description = "locks the alts in air",
        options = "false",
    },
    [14] = {
        name = "unlock",
        description = "unlocks the alts",
        options = "false",
    },
    [15] = {
        name = "unlock",
        description = "unlocks the alts",
        options = {
            [1] = {
                description = "User to stomp",
                question = "User: "
            }
        },
    },
    [16] = {
        name = "load",
        description = "loads crash on crasher ids",
        options = {
            [1] = {
                description = "crash to load ( swagmode, encrypt )",
                question = "mode: "
            }
        },
    },
}   
local prefix = ""
rconsolename("IKU CONSOLE")
rconsoleprint("Enter your prefix: ")
prefix = rconsoleinput():gsub(" ","")
rconsolename("IKU CONSOLE - prefix: "..prefix.. " - cash dropped: ".."setting up")
rconsoleclear()

-- functions 
local function cprint(msg)
    rconsoleprint(msg.."\n")
end
local function setcolor(color)
    rconsoleprint(color)
end
local function getCash()
    local total = 0
    for i,v in next, game:GetService("Workspace").Ignored.Drop:GetChildren() do
        if v:IsA("Part") and v.Name == "MoneyDrop" then
            text = string.gsub(v.BillboardGui.TextLabel.Text,"[$,]","")
            total = total + tonumber(text)
        end
    end
    return total
end
local function say(msg)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end
local function loadcmds()
    rconsoleclear()
    setcolor(colors.red)
    rconsoleprint([[

        $$$$$$\ $$\   $$\ $$\   $$\        $$$$$$\   $$$$$$\  $$\   $$\  $$$$$$\   $$$$$$\  $$\       $$$$$$$$\ 
        \_$$  _|$$ | $$  |$$ |  $$ |      $$  __$$\ $$  __$$\ $$$\  $$ |$$  __$$\ $$  __$$\ $$ |      $$  _____|
          $$ |  $$ |$$  / $$ |  $$ |      $$ /  \__|$$ /  $$ |$$$$\ $$ |$$ /  \__|$$ /  $$ |$$ |      $$ |      
          $$ |  $$$$$  /  $$ |  $$ |      $$ |      $$ |  $$ |$$ $$\$$ |\$$$$$$\  $$ |  $$ |$$ |      $$$$$\    
          $$ |  $$  $$<   $$ |  $$ |      $$ |      $$ |  $$ |$$ \$$$$ | \____$$\ $$ |  $$ |$$ |      $$  __|   
          $$ |  $$ |\$$\  $$ |  $$ |      $$ |  $$\ $$ |  $$ |$$ |\$$$ |$$\   $$ |$$ |  $$ |$$ |      $$ |      
        $$$$$$\ $$ | \$$\ \$$$$$$  |      \$$$$$$  | $$$$$$  |$$ | \$$ |\$$$$$$  | $$$$$$  |$$$$$$$$\ $$$$$$$$\ 
        \______|\__|  \__| \______/        \______/  \______/ \__|  \__| \______/  \______/ \________|\________|                                                                                                                                                                                                                                                                                                                                                                                                               
        report any errors to shadow.#8649
        credits: shadow.#8649

]])                                                                                                                                                                                                                                                                                                               
    local amountofcmds = 0
    for _ in ipairs(cmds) do
        amountofcmds = amountofcmds + 1
    end
    setcolor(colors.blue)
    cprint("- other cmds -")
    setcolor(colors.cyan)
    cprint("cmds - clears console and shows commands again.")
    setcolor(colors.blue)
    cprint("- main cmds -")
    setcolor(colors.white)
    for i=1,amountofcmds do
        options = ""
        if cmds[i].options ~= "false" then
            for _,name in next, cmds[i].options do
                options = options..name.description.." "
            end
        end
        if options == "" then
            cprint(i.." - " .. cmds[i].description)
        else
            cprint(i.." - " .. cmds[i].description .. " - Options: "..options)    
        end
    end
end
loadcmds()
local function requestinput()
    rconsoleprint("Choose command number: ")
    a = rconsoleinput()
    if a == "cmds" then
        return "cmds" 
    end
    if a == "" then
        cprint("Please type a number" )
        return "error"
    end
        local suc,err = pcall(function()
            test = tonumber(a)
            if test == nil then
                cprint("Not a number.")
                return "error"
            end
        end)
    if err then return "error" end
    local amountofcmds = 0
    for _ in ipairs(cmds) do
        amountofcmds = amountofcmds + 1
    end
    if tonumber(a) > amountofcmds then
        print("yessir")
        cprint("Not a valid command.")
        return "error"
    end
    return a
end
local function processcmd(cmd)
    if cmd == "cmds" then loadcmds() end
    if cmd == "error" then return end
    local var = ""
    local suc,err  = pcall(function()
        a = tonumber(cmd)
        if a == nil then
            var = "error"
            return
        end
    end)
    if var == "error" then return "error" end
    local command
    local str = " "
    for i,v in next, cmds do
        if i == tonumber(cmd) then
            command = v
            str = command.name.." "
            break
        end
    end
    repeat wait() until command ~= nil
    if command.options ~= "false" then
        local optionamount = 0
        for _ in ipairs(command.options) do
            optionamount = optionamount + 1
        end
        for i = 1,optionamount do    
            rconsoleprint(command.options[i].question) 
            a = rconsoleinput()
            str = str..a.." "
        end
    end
    say(prefix..str)
end
game:GetService("RunService").Stepped:Connect(function()
    rconsolename("IKU CONSOLE - prefix: "..prefix.. " - cash dropped: "..getCash())
    wait(1)
end)
while true do
a = requestinput()
processcmd(a)
end
