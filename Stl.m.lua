-- 🌀 УНИВЕРСАЛЬНОЕ МЕНЮ BY ROBANIK
local BUTTON_IMAGE_ID = "rbxassetid://107781958606208"
local player = game.Players.LocalPlayer

-- 🔑 Ключи (можно добавить несколько)
local VALID_KEYS = {
    "STRR",
}

-- 🔗 Ссылка на получение ключа
local GET_KEY_LINK = "https://dsc.gg/robanik-cheats"

local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.ResetOnSpawn = false

-- Окно ввода ключа
local KeyFrame = Instance.new("Frame")
KeyFrame.Parent = ScreenGui
KeyFrame.Size = UDim2.new(0, 300, 0, 200)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 12)

local KeyLabel = Instance.new("TextLabel", KeyFrame)
KeyLabel.Size = UDim2.new(1, 0, 0, 40)
KeyLabel.BackgroundTransparency = 1
KeyLabel.Text = "Введите ключ:"
KeyLabel.Font = Enum.Font.GothamBold
KeyLabel.TextSize = 18
KeyLabel.TextColor3 = Color3.fromRGB(255,255,255)

local KeyBox = Instance.new("TextBox", KeyFrame)
KeyBox.Size = UDim2.new(0.8, 0, 0, 35)
KeyBox.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyBox.PlaceholderText = "Ваш ключ..."
KeyBox.Text = ""
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16
KeyBox.BackgroundColor3 = Color3.fromRGB(35,35,35)
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0,8)

local SubmitBtn = Instance.new("TextButton", KeyFrame)
SubmitBtn.Size = UDim2.new(0.6, 0, 0, 35)
SubmitBtn.Position = UDim2.new(0.2, 0, 0.65, 0)
SubmitBtn.Text = "Подтвердить"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 16
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
SubmitBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0,8)

local GetKeyBtn = Instance.new("TextButton", KeyFrame)
GetKeyBtn.Size = UDim2.new(0.6, 0, 0, 35)
GetKeyBtn.Position = UDim2.new(0.2, 0, 0.82, 0)
GetKeyBtn.Text = "Get Key"
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 16
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
GetKeyBtn.TextColor3 = Color3.fromRGB(0,0,0)
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0,8)

-- Главное меню
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Visible = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)

-- Шапка меню
local HeaderLabel = Instance.new("TextLabel", MainFrame)
HeaderLabel.Size = UDim2.new(1, 0, 0, 40)
HeaderLabel.Position = UDim2.new(0, 10, 0, 10)
HeaderLabel.BackgroundTransparency = 1
HeaderLabel.TextColor3 = Color3.fromRGB(255,255,255)
HeaderLabel.Font = Enum.Font.GothamBold
HeaderLabel.TextSize = 16
HeaderLabel.Text = "BY ROBANIK | STEAL A BRAINROT"

-- Вкладки
local TabScroll = Instance.new("ScrollingFrame")
TabScroll.Parent = MainFrame
TabScroll.Size = UDim2.new(1, -20, 0, 40)
TabScroll.Position = UDim2.new(0, 10, 0, 60)
TabScroll.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabScroll.ScrollBarThickness = 6
TabScroll.CanvasSize = UDim2.new(0,0,0,0)
TabScroll.ScrollBarImageColor3 = Color3.fromRGB(0,170,255)
TabScroll.BorderSizePixel = 0
Instance.new("UICorner", TabScroll).CornerRadius = UDim.new(0, 10)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.Parent = TabScroll

local ContentFrame = Instance.new("Frame")
ContentFrame.Parent = MainFrame
ContentFrame.Size = UDim2.new(1, -20, 1, -110)
ContentFrame.Position = UDim2.new(0, 10, 0, 110)
ContentFrame.BackgroundTransparency = 1

-- Хранилища
local Pages = {}
local CurrentPage = nil

-- 📌 Функция добавления вкладки
local function AddTab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 120, 1, 0)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.BackgroundTransparency = 1
    btn.Parent = TabScroll

    wait()
    TabScroll.CanvasSize = UDim2.new(0, UIListLayout.AbsoluteContentSize.X + 10, 0, 0)

    local page = Instance.new("ScrollingFrame", ContentFrame)
    page.Size = UDim2.new(1,0,1,0)
    page.CanvasSize = UDim2.new(0,0,0,0)
    page.ScrollBarThickness = 6
    page.Visible = false
    page.BackgroundTransparency = 1
    Pages[name] = page

    btn.MouseButton1Click:Connect(function()
        if CurrentPage then CurrentPage.Visible = false end
        page.Visible = true
        CurrentPage = page
    end)

    if not CurrentPage then
        page.Visible = true
        CurrentPage = page
    end
end

-- 📌 Функция добавления кнопки
local function AddButton(tabName, text, callback)
    local page = Pages[tabName]
    if not page then return warn("Вкладка "..tabName.." не найдена!") end

    local btn = Instance.new("TextButton", page)
    btn.Size = UDim2.new(0, 200, 0, 40)
    btn.Position = UDim2.new(0, 20, 0, (#page:GetChildren()-1)*50)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.BackgroundColor3 = Color3.fromRGB(0,170,255)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)

    page.CanvasSize = UDim2.new(0,0,0,(#page:GetChildren()-1)*50+60)

    btn.MouseButton1Click:Connect(callback)
end

-- Кнопка открытия меню (после ввода ключа)
local OpenButton = Instance.new("ImageButton")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 60, 0, 60)
OpenButton.Position = UDim2.new(0, 20, 0.5, -30)
OpenButton.BackgroundTransparency = 1
OpenButton.Image = BUTTON_IMAGE_ID
OpenButton.ScaleType = Enum.ScaleType.Fit
OpenButton.Visible = false
Instance.new("UICorner", OpenButton).CornerRadius = UDim.new(1, 0)

local menuOpen = false
OpenButton.MouseButton1Click:Connect(function()
    menuOpen = not menuOpen
    MainFrame.Visible = menuOpen
end)

-- Проверка ключа
SubmitBtn.MouseButton1Click:Connect(function()
    local input = KeyBox.Text
    for _, key in ipairs(VALID_KEYS) do
        if input == key then
            KeyFrame.Visible = false
            OpenButton.Visible = true
            return
        end
    end
    KeyLabel.Text = "❌ Неверный ключ!"
    KeyLabel.TextColor3 = Color3.fromRGB(255,100,100)
end)

-- 📌 Кнопка Get Key (копирует ссылку)
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(GET_KEY_LINK)
    KeyLabel.Text = "✔️ Ссылка скопирована!"
    KeyLabel.TextColor3 = Color3.fromRGB(100,255,100)
end)

-- 📌 Аватар игрока внизу слева
local PlayerFrame = Instance.new("Frame", MainFrame)
PlayerFrame.Size = UDim2.new(0,200,0,50)
PlayerFrame.Position = UDim2.new(0,10,1,-60)
PlayerFrame.BackgroundTransparency = 1

local Avatar = Instance.new("ImageLabel", PlayerFrame)
Avatar.Size = UDim2.new(0,40,0,40)
Avatar.Position = UDim2.new(0,0,0.5,-20)
Avatar.BackgroundTransparency = 0
Avatar.BackgroundColor3 = Color3.fromRGB(255,255,255)
Avatar.Image = "rbxthumb://type=AvatarHeadShot&id="..player.UserId.."&w=420&h=420"
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1,0)

local NameLabel = Instance.new("TextLabel", PlayerFrame)
NameLabel.Size = UDim2.new(1,-50,1,0)
NameLabel.Position = UDim2.new(0,50,0,0)
NameLabel.BackgroundTransparency = 1
NameLabel.Font = Enum.Font.GothamBold
NameLabel.TextSize = 18
NameLabel.TextColor3 = Color3.fromRGB(255,255,255)
NameLabel.TextXAlignment = Enum.TextXAlignment.Left
NameLabel.Text = player.Name

-- 📌 Пример вкладок
AddTab("CAMERA")

--------------------------------------------

AddButton("CAMERA", "FREECAM", function()
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

local camera = workspace.CurrentCamera
local controllingCamera = false

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- ==== GUI ====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 140)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BackgroundTransparency = 0.1
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local function CreateButton(text, size, pos, color)
    local btn = Instance.new("TextButton")
    btn.Size = size
    btn.Position = pos
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = color
    btn.Parent = Frame
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    return btn
end

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -30, 0, 30)
Title.Position = UDim2.new(0, 10, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "FREECAM [BY ROBANIK]"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Frame

local CloseBtn = CreateButton("X", UDim2.new(0, 30, 0, 30), UDim2.new(1, -35, 0, 5), Color3.fromRGB(50, 50, 50))
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
local Button = CreateButton("FreeCam", UDim2.new(0.8, 0, 0.3, 0), UDim2.new(0.1, 0, 0.45, 0), Color3.fromRGB(50, 100, 200))
local UpBtn = CreateButton("Up", UDim2.new(0.35, 0, 0.2, 0), UDim2.new(0.1, 0, 0.8, 0), Color3.fromRGB(80, 160, 80))
local DownBtn = CreateButton("Down", UDim2.new(0.35, 0, 0.2, 0), UDim2.new(0.55, 0, 0.8, 0), Color3.fromRGB(160, 80, 80))

-- ==== FreeCam управление ====
local camSpeed = 1
local camPos, camRot
local moveDir = Vector3.new()
local lookDelta = Vector2.new()
local upPressed, downPressed = false, false
local yaw, pitch = 0, 0

-- Анти-убийство
humanoid.HealthChanged:Connect(function()
    if controllingCamera then
        humanoid.Health = humanoid.MaxHealth
    end
end)

-- Закрыть меню
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = not ScreenGui.Enabled
end)

-- Кнопки вверх/вниз
UpBtn.MouseButton1Down:Connect(function() upPressed = true end)
UpBtn.MouseButton1Up:Connect(function() upPressed = false end)
DownBtn.MouseButton1Down:Connect(function() downPressed = true end)
DownBtn.MouseButton1Up:Connect(function() downPressed = false end)

-- ==== Джойстик + камера для телефона ====
local joystickCenter = nil
local joystickRadius = 50
local movingTouch = nil
local joystickVisual = Instance.new("Frame")
joystickVisual.Size = UDim2.new(0, joystickRadius*2, 0, joystickRadius*2)
joystickVisual.BackgroundTransparency = 0.5
joystickVisual.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
joystickVisual.Visible = false
joystickVisual.Parent = ScreenGui
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1,0)
corner.Parent = joystickVisual

UserInputService.TouchStarted:Connect(function(touch)
    if touch.Position.X < workspace.CurrentCamera.ViewportSize.X/2 then
        -- Левая половина → джойстик
        if not movingTouch then
            movingTouch = touch
            joystickCenter = touch.Position
            joystickVisual.Position = UDim2.new(0, joystickCenter.X - joystickRadius, 0, joystickCenter.Y - joystickRadius)
            joystickVisual.Visible = true
        end
    else
        -- Правая половина → камера
        lookDelta = Vector2.new()
    end
end)

UserInputService.TouchMoved:Connect(function(touch)
    if movingTouch and touch == movingTouch then
        local offset = touch.Position - joystickCenter
        if offset.Magnitude > joystickRadius then
            offset = offset.Unit * joystickRadius
        end
        moveDir = Vector3.new(offset.X/joystickRadius, 0, offset.Y/joystickRadius)
    elseif touch.Position.X > workspace.CurrentCamera.ViewportSize.X/2 then
        lookDelta = Vector2.new(-touch.Delta.X, -touch.Delta.Y)
    end
end)

UserInputService.TouchEnded:Connect(function(touch)
    if movingTouch and touch == movingTouch then
        moveDir = Vector3.new()
        movingTouch = nil
        joystickCenter = nil
        joystickVisual.Visible = false
    end
end)

-- Основной цикл
RunService.RenderStepped:Connect(function(dt)
    if controllingCamera then
        if lookDelta.Magnitude > 0 then
            yaw = yaw + lookDelta.X * 0.2
            pitch = math.clamp(pitch + lookDelta.Y * 0.2, -80, 80)
            lookDelta = Vector2.new()
        end

        camRot = CFrame.Angles(0, math.rad(yaw), 0) * CFrame.Angles(math.rad(pitch), 0, 0)
        local move = Vector3.new()
        if moveDir.Magnitude > 0 then
            move = (camRot.RightVector * moveDir.X + camRot.LookVector * -moveDir.Z)
        end
        if upPressed then move = move + Vector3.new(0,1,0) end
        if downPressed then move = move - Vector3.new(0,1,0) end
        if move.Magnitude > 0 then
            camPos = camPos + move.Unit * camSpeed
        end

        camera.CFrame = CFrame.new(camPos) * camRot

        -- Персонаж сзади камеры
        local followOffset = camRot.LookVector * -5 + Vector3.new(0,2,0)
        hrp.CFrame = CFrame.new(camPos + followOffset, camPos + camRot.LookVector * 5)
    end
end)

-- Кнопка FreeCam
Button.MouseButton1Click:Connect(function()
    if not controllingCamera then
        hrp.Anchored = true
        humanoid.PlatformStand = true
        camera.CameraSubject = nil  
        camera.CameraType = Enum.CameraType.Scriptable  

        camPos = hrp.Position - hrp.CFrame.LookVector * 5 + Vector3.new(0,2,0)
        local lookAt = hrp.Position + hrp.CFrame.LookVector * 10
        camRot = CFrame.new(camPos, lookAt) - camPos

        local dir = (lookAt - camPos).Unit
        yaw = math.deg(math.atan2(-dir.X, -dir.Z))
        pitch = math.deg(math.asin(dir.Y))

        controllingCamera = true  
        Button.Text = "Back"  
    else  
        camera.CameraSubject = humanoid  
        camera.CameraType = Enum.CameraType.Custom  

        hrp.Anchored = false  
        humanoid.PlatformStand = false  

        controllingCamera = false  
        Button.Text = "FreeCam"  
    end
end)
end)
