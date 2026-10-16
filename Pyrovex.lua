
-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")

-- NEON HUB V2 | UI ONLY
-- Roblox Studio > LocalScript
-- Place in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubV2"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local C = {
    bg = Color3.fromRGB(8, 7, 13),
    panel = Color3.fromRGB(16, 11, 23),
    card = Color3.fromRGB(24, 15, 32),
    pink = Color3.fromRGB(255, 25, 145),
    purple = Color3.fromRGB(153, 45, 255),
    white = Color3.fromRGB(248, 241, 255),
    muted = Color3.fromRGB(151, 133, 164),
}

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

local function round(o, n)
    new("UICorner", {
        CornerRadius = UDim.new(0, n)
    }, o)
end

local function outline(o, color, thickness)
    new("UIStroke", {
        Color = color or C.purple,
        Thickness = thickness or 1,
        Transparency = 0.1,
    }, o)
end

local function gradient(o)
    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.purple),
            ColorSequenceKeypoint.new(1, C.pink),
        }),
        Rotation = 25,
    }, o)
end

local function label(parent, text, size, pos, font, color)
    return new("TextLabel", {
        BackgroundTransparency = 1,
        Text = text,
        TextSize = size,
        Position = pos,
        Size = UDim2.new(1, 0, 0, size + 9),
        Font = font or Enum.Font.Gotham,
        TextColor3 = color or C.white,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, parent)
end

-- Gradient border shell
local shell = new("Frame", {
    Name = "Shell",
    Size = UDim2.fromOffset(390, 255),
    Position = UDim2.new(0.5, -195, 0.5, -127),
    BackgroundColor3 = C.purple,
    BorderSizePixel = 0,
}, gui)
round(shell, 17)
gradient(shell)

local main = new("Frame", {
    Name = "Main",
    Position = UDim2.fromOffset(2, 2),
    Size = UDim2.new(1, -4, 1, -4),
    BackgroundColor3 = C.bg,
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, shell)
round(main, 15)

-- Header
local header = new("Frame", {
    Size = UDim2.new(1, 0, 0, 61),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(header, 14)

local logo = new("Frame", {
    Position = UDim2.fromOffset(12, 11),
    Size = UDim2.fromOffset(39, 39),
    BackgroundColor3 = Color3.fromRGB(55, 9, 68),
    BorderSizePixel = 0,
}, header)
round(logo, 12)
outline(logo, C.pink, 1.5)

local logoText = new("TextLabel", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    Text = "N",
    TextColor3 = C.white,
    TextSize = 23,
    Font = Enum.Font.GothamBlack,
}, logo)

label(header, "Neon Hub", 17, UDim2.fromOffset(61, 10),
    Enum.Font.GothamBold)
local sub = label(header, "CUSTOM INTERFACE", 9,
    UDim2.fromOffset(62, 34), Enum.Font.Gotham, C.muted)

local close = new("TextButton", {
    Position = UDim2.new(1, -43, 0, 13),
    Size = UDim2.fromOffset(30, 30),
    BackgroundColor3 = Color3.fromRGB(59, 8, 29),
    Text = "×",
    TextSize = 23,
    Font = Enum.Font.GothamBold,
    TextColor3 = C.pink,
    AutoButtonColor = true,
}, header)
round(close, 9)
outline(close, C.pink, 1)

-- Sidebar
local sidebar = new("Frame", {
    Position = UDim2.fromOffset(10, 70),
    Size = UDim2.fromOffset(106, 174),
    BackgroundColor3 = C.panel,
    BorderSizePixel = 0,
}, main)
round(sidebar, 12)

label(sidebar, "  NAVIGATION", 9, UDim2.fromOffset(5, 8),
    Enum.Font.GothamBold, C.muted)

local function tabButton(text, y)
    local b = new("TextButton", {
        Position = UDim2.fromOffset(6, y),
        Size = UDim2.new(1, -12, 0, 36),
        BackgroundColor3 = C.card,
        Text = text,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.muted,
        AutoButtonColor = false,
    }, sidebar)
    round(b, 9)
    return b
end

local mainTab = tabButton("⌂   Main", 31)
local miscTab = tabButton("⚙   Misc", 73)

-- Main content
local content = new("Frame", {
    Position = UDim2.fromOffset(127, 73),
    Size = UDim2.new(1, -139, 1, -85),
    BackgroundTransparency = 1,
}, main)

local pageTitle = label(content, "MAIN FEATURES", 15,
    UDim2.fromOffset(0, 0), Enum.Font.GothamBold, C.white)

local line = new("Frame", {
    Position = UDim2.fromOffset(0, 25),
    Size = UDim2.new(1, -2, 0, 2),
    BackgroundColor3 = C.pink,
    BorderSizePixel = 0,
}, content)
gradient(line)

local function featureCard(y, iconText, titleText, descText)
    local card = new("Frame", {
        Position = UDim2.fromOffset(0, y),
        Size = UDim2.new(1, -2, 0, 63),
        BackgroundColor3 = C.card,
        BorderSizePixel = 0,
    }, content)
    round(card, 11)
    outline(card, Color3.fromRGB(54, 28, 67), 1)

    local iconBox = new("Frame", {
        Position = UDim2.fromOffset(9, 12),
        Size = UDim2.fromOffset(37, 37),
        BackgroundColor3 = Color3.fromRGB(45, 15, 61),
        BorderSizePixel = 0,
    }, card)
    round(iconBox, 10)

    new("TextLabel", {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Text = iconText,
        TextSize = 19,
        Font = Enum.Font.GothamBold,
        TextColor3 = C.pink,
    }, iconBox)

    label(card, titleText, 12, UDim2.fromOffset(55, 12),
        Enum.Font.GothamBold)
    label(card, descText, 9, UDim2.fromOffset(55, 33),
        Enum.Font.Gotham, C.muted)
end

featureCard(35, "✦", "Main Section", "Feature slots coming soon")
featureCard(106, "⚙", "Misc Section", "Extra options coming soon")

-- Footer
local footer = label(main, "●  UI READY", 9,
    UDim2.new(0, 12, 1, -20), Enum.Font.GothamBold, C.purple)
footer.Size = UDim2.new(1, -24, 0, 12)

-- Tab behavior
local function selectTab(which)
    if which == "Main" then
        pageTitle.Text = "MAIN FEATURES"
        mainTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        mainTab.TextColor3 = C.white
        miscTab.BackgroundColor3 = C.card
        miscTab.TextColor3 = C.muted
    else
        pageTitle.Text = "MISC OPTIONS"
        miscTab.BackgroundColor3 = Color3.fromRGB(55, 13, 65)
        miscTab.TextColor3 = C.white
        mainTab.BackgroundColor3 = C.card
        mainTab.TextColor3 = C.muted
    end
end

mainTab.MouseButton1Click:Connect(function()
    selectTab("Main")
end)

miscTab.MouseButton1Click:Connect(function()
    selectTab("Misc")
end)

selectTab("Main")

-- Mini N button
local mini = new("TextButton", {
    Name = "MiniN",
    Size = UDim2.fromOffset(46, 46),
    Position = UDim2.new(0, 18, 0.5, -23),
    BackgroundColor3 = C.bg,
    Text = "N",
    TextSize = 22,
    Font = Enum.Font.GothamBlack,
    TextColor3 = C.white,
    Visible = false,
    AutoButtonColor = false,
}, gui)
round(mini, 14)
outline(mini, C.pink, 2)

local miniGrad = new("UIGradient", {
    Color = ColorSequence.new(C.purple, C.pink),
    Rotation = 45,
}, mini:FindFirstChildOfClass("UIStroke"))

close.MouseButton1Click:Connect(function()
    shell.Visible = false
    mini.Visible = true
end)

-- Click mini to restore; drag it to reposition
local dragging, moved = false, false
local startPos, startInput

mini.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        moved = false
        startInput = input.Position
        startPos = mini.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - startInput
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then
            moved = true
        end
        mini.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        if dragging then
            dragging = false
            if not moved then
                shell.Visible = true
                mini.Visible = false
            end
        end
    end
end)

-- Drag main UI by its header
local mainDrag, mainStart, mainPos = false, nil, nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = true
        mainStart = input.Position
        mainPos = shell.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if mainDrag and (
        input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement
    ) then
        local delta = input.Position - mainStart
        shell.Position = UDim2.new(
            mainPos.X.Scale, mainPos.X.Offset + delta.X,
            mainPos.Y.Scale, mainPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
        mainDrag = false
    end
end)

print("Neon Hub V2 loaded")
