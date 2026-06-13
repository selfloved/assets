do
    local Url = "https://giftstein.xyz/music/amirrrrr.txt"
    local Success, Response = pcall(game.HttpGet, game, Url)
    if not Success or Response:gsub("%s+", "") ~= "true" then return end

    local LjiWvejyvYSwX21tK15EKGjvLJxqq76qZyZH2Ad4vdGvUdAwG5jcMQRCrjivCHCz = "bXFx5jhm9aMSN0DiBiQVTP3z5Xg3JBM8qR6zvXpg4kfdi8Ppw6ztPrP6SYvuBAk2"
    local auth = getgenv and getgenv().qKRGeh43pSjDewBPwDUnUcn0gRcxbzA3JWVkMYUfTA1dQbi8KcwJLkZPWhgAyEBF or _G.qKRGeh43pSjDewBPwDUnUcn0gRcxbzA3JWVkMYUfTA1dQbi8KcwJLkZPWhgAyEBF
    if auth ~= LjiWvejyvYSwX21tK15EKGjvLJxqq76qZyZH2Ad4vdGvUdAwG5jcMQRCrjivCHCz then
        return nil
    end
end

do 
    local UI = gethui and gethui() or game:GetService("CoreGui")
    for _, Interface in UI:GetChildren() do 
        if Interface.Name == "wings_UI_Holder" or Interface.Name == "wings_UI_Other" or Interface.Name == "wings_UI_Unused" then 
            Interface:Destroy()
        end
    end
end

local pLIB = getgenv().Library
if type(pLIB) == 'table' and pLIB.Unload then
    pLIB:Unload()
end
pLIB = nil

--loadstring([[
--    function LPH_NO_VIRTUALIZE(f) return f end;
--]])();

--LPH_NO_VIRTUALIZE(function()
    local Library do 
        local Workspace = game:GetService("Workspace")
        local UserInputService = game:GetService("UserInputService")
        local Players = game:GetService("Players")
        local HttpService = game:GetService("HttpService")
        local RunService = game:GetService("RunService")
        local CoreGui = (function()
            if cloneref then
                local ok, ref = pcall(cloneref, game:GetService("CoreGui"))
                if ok and ref then return ref end
            end
            return game:GetService("CoreGui")
        end)()
        local TweenService = game:GetService("TweenService")
        local Lighting = game:GetService("Lighting")

        gethui = gethui or function()
            return CoreGui
        end

        local LocalPlayer = Players.LocalPlayer
        local Camera = Workspace.CurrentCamera
        local Mouse = LocalPlayer:GetMouse()

        local FromRGB = Color3.fromRGB
        local FromHSV = Color3.fromHSV
        local FromHex = Color3.fromHex

        local RGBSequence = ColorSequence.new
        local RGBSequenceKeypoint = ColorSequenceKeypoint.new
        local NumSequence = NumberSequence.new
        local NumSequenceKeypoint = NumberSequenceKeypoint.new

        local UDim2New = UDim2.new
        local UDimNew = UDim.new
        local UDim2FromOffset = UDim2.fromOffset
        local Vector2New = Vector2.new
        local Vector3New = Vector3.new

        local MathClamp = math.clamp
        local MathFloor = math.floor

        local TableInsert = table.insert
        local TableFind = table.find
        local TableRemove = table.remove
        local TableConcat = table.concat
        local TableClone = table.clone
        local TableUnpack = table.unpack

        local StringFormat = string.format
        local StringFind = string.find
        local StringGSub = string.gsub
        local StringLower = string.lower
        local StringLen = string.len

        local InstanceNew = Instance.new

        local IsMobile = UserInputService.TouchEnabled or false

        Library = {
            Theme =  { },

            MenuKeybind = tostring(Enum.KeyCode.RightControl), 
            DropdownSearch = false,
            Flags = { },

            Tween = {
                Time = 0.3,
                Style = Enum.EasingStyle.Quad,
                Direction = Enum.EasingDirection.Out
            },

            FadeSpeed = 0.2,

            Themes = nil,

            Folders = {
                Directory = "wings",
                Configs = "wings/Configs",
                Assets = "wings/Assets",
            },
            
            -- Cloud preferences (fetched from dashboard)
            UseCloudConfig = true,  -- Default: use cloud configs
            DebugMode = false,  -- Default: debug off
            PreferencesLoaded = false,

            -- Ignore below
            Pages = { },
            Sections = { },

            Connections = { },
            Threads = { },

            ThemeMap = { },
            ThemeItems = { },

            OpenFrames = { },

            SetFlags = { },

            UnnamedConnections = 0,
            UnnamedFlags = 0,

            Holder = nil,
            NotifHolder = nil,
            UnusedHolder = nil,

            IsASubWindowOpenLul = false,

            Font = nil,
            BoldFont = nil,
        }

        Library.__index = Library
        Library.Sections.__index = Library.Sections
        Library.Pages.__index = Library.Pages

        local Keys = {
            ["Unknown"]           = "Unknown",
            ["Backspace"]         = "Back",
            ["Tab"]               = "Tab",
            ["Clear"]             = "Clear",
            ["Return"]            = "Return",
            ["Pause"]             = "Pause",
            ["Escape"]            = "Escape",
            ["Space"]             = "Space",
            ["QuotedDouble"]      = '"',
            ["Hash"]              = "#",
            ["Dollar"]            = "$",
            ["Percent"]           = "%",
            ["Ampersand"]         = "&",
            ["Quote"]             = "'",
            ["LeftParenthesis"]   = "(",
            ["RightParenthesis"]  = " )",
            ["Asterisk"]          = "*",
            ["Plus"]              = "+",
            ["Comma"]             = ",",
            ["Minus"]             = "-",
            ["Period"]            = ".",
            ["Slash"]             = "`",
            ["Three"]             = "3",
            ["Seven"]             = "7",
            ["Eight"]             = "8",
            ["Colon"]             = ":",
            ["Semicolon"]         = ";",
            ["LessThan"]          = "<",
            ["GreaterThan"]       = ">",
            ["Question"]          = "?",
            ["Equals"]            = "=",
            ["At"]                = "@",
            ["LeftBracket"]       = "LeftBracket",
            ["RightBracket"]      = "RightBracked",
            ["BackSlash"]         = "BackSlash",
            ["Caret"]             = "^",
            ["Underscore"]        = "_",
            ["Backquote"]         = "`",
            ["LeftCurly"]         = "{",
            ["Pipe"]              = "|",
            ["RightCurly"]        = "}",
            ["Tilde"]             = "~",
            ["Delete"]            = "Delete",
            ["End"]               = "End",
            ["KeypadZero"]        = "Keypad0",
            ["KeypadOne"]         = "Keypad1",
            ["KeypadTwo"]         = "Keypad2",
            ["KeypadThree"]       = "Keypad3",
            ["KeypadFour"]        = "Keypad4",
            ["KeypadFive"]        = "Keypad5",
            ["KeypadSix"]         = "Keypad6",
            ["KeypadSeven"]       = "Keypad7",
            ["KeypadEight"]       = "Keypad8",
            ["KeypadNine"]        = "Keypad9",
            ["KeypadPeriod"]      = "KeypadP",
            ["KeypadDivide"]      = "KeypadD",
            ["KeypadMultiply"]    = "KeypadM",
            ["KeypadMinus"]       = "KeypadM",
            ["KeypadPlus"]        = "KeypadP",
            ["KeypadEnter"]       = "KeypadE",
            ["KeypadEquals"]      = "KeypadE",
            ["Insert"]            = "Insert",
            ["Home"]              = "Home",
            ["PageUp"]            = "PageUp",
            ["PageDown"]          = "PageDown",
            ["RightShift"]        = "RightShift",
            ["LeftShift"]         = "LeftShift",
            ["RightControl"]      = "RightControl",
            ["LeftControl"]       = "LeftControl",
            ["LeftAlt"]           = "LeftAlt",
            ["RightAlt"]          = "RightAlt"
        }

        local Themes = {
            ["Preset"] = {
                ["Outline"] = FromRGB(20, 22, 24),
                ["Outline 2"] = FromRGB(29, 29, 33),
                ["Background"] = FromRGB(15, 16, 21),
                ["Logo Background"] = FromRGB(7, 17, 31),
                ["Background 2"] = FromRGB(12, 13, 17),
                ["Section Background"] = FromRGB(21, 20, 29),
                ["Page Background"] = FromRGB(42, 44, 51),
                ["Toggle"] = FromRGB(5, 9, 14),
                ["Element"] = FromRGB(28, 27, 38),
                ["Text"] = FromRGB(200, 200, 207),      
                ["Text 2"] = FromRGB(151, 150, 162),
                ["Liner"] = FromRGB(27, 26, 35),
                ["Hover Element"] = FromRGB(41, 41, 48),
                ["Accent"] = FromRGB(81, 124, 253),   
            }
        }

        Library.Theme = TableClone(Themes["Preset"])
        Library.Themes = Themes

        -- Folders
        for Index, Value in Library.Folders do 
            if not isfolder(Value) then
                makefolder(Value)
            end
        end

        -- Tweening
        local Tween = { } do
            Tween.__index = Tween

            Tween.Create = function(self, Item, Info, Goal, IsRawItem)
                if not Library then 
                    return { Tween = { Play = function() end, Pause = function() end, Completed = { Connect = function() return { Disconnect = function() end } end } } }
                end

                Item = (IsRawItem or typeof(Item) == "Instance") and Item or (type(Item) == "table" and Item.Instance) or Item
                Info = Info or TweenInfo.new(Library.Tween.Time, Library.Tween.Style, Library.Tween.Direction)

                local NewTween = {
                    Tween = TweenService:Create(Item, Info, Goal),
                    Info = Info,
                    Goal = Goal,
                    Item = Item
                }

                NewTween.Tween:Play()

                setmetatable(NewTween, Tween)

                return NewTween
            end

            Tween.GetProperty = function(self, Item)
                Item = Item or self.Item 
                Item = (type(Item) == "table" and Item.Instance) or Item

                if Item:IsA("Frame") or Item:IsA("CanvasGroup") then
                    return { "BackgroundTransparency" }
                elseif Item:IsA("TextLabel") or Item:IsA("TextButton") then
                    return { "TextTransparency", "BackgroundTransparency" }
                elseif Item:IsA("ImageLabel") or Item:IsA("ImageButton") then
                    return { "BackgroundTransparency", "ImageTransparency" }
                elseif Item:IsA("ScrollingFrame") then
                    return { "BackgroundTransparency" }
                elseif Item:IsA("TextBox") then
                    return { "TextTransparency", "BackgroundTransparency" }
                elseif Item:IsA("UIStroke") then 
                    return { "Transparency" }
                end
            end

            Tween.FadeItem = function(self, Item, Property, Visibility, Speed)
                local Item = Item or self.Item 
                Item = (type(Item) == "table" and Item.Instance) or Item

                local OldTransparency = Item[Property]
                Item[Property] = Visibility and 1 or OldTransparency

                local NewTween = Tween:Create(Item, TweenInfo.new(Speed or Library.Tween.Time, Library.Tween.Style, Library.Tween.Direction), {
                    [Property] = Visibility and OldTransparency or 1
                }, true)

                Library:Connect(NewTween.Tween.Completed, function()
                    if not Visibility then
                        task.wait()
                        Item[Property] = OldTransparency
                    end
                end)

                return NewTween
            end

            Tween.Get = function(self)
                if not self.Tween then 
                    return
                end

                return self.Tween, self.Info, self.Goal
            end

            Tween.Pause = function(self)
                if not self.Tween then 
                    return
                end

                self.Tween:Pause()
            end

            Tween.Play = function(self)
                if not self.Tween then 
                    return
                end

                self.Tween:Play()
            end

            Tween.Clean = function(self)
                if not self.Tween then 
                    return
                end

                Tween:Pause()
                self = nil
            end
        end

        -- Instances
        local Instances = { } do
            Instances.__index = Instances

            Instances.Create = function(self, Class, Properties)
                local NewItem = {
                    Instance = InstanceNew(Class),
                    Properties = Properties,
                    Class = Class
                }

                setmetatable(NewItem, Instances)

                for Property, Value in NewItem.Properties do
                    if Property == "Parent" and type(Value) == "table" and Value.Instance then
                        Value = Value.Instance
                    end
                    NewItem.Instance[Property] = Value
                end

                return NewItem
            end

            Instances.AddToTheme = function(self, Properties)
                if not self.Instance then 
                    return
                end

                Library:AddToTheme(self, Properties)
                return self
            end

            Instances.ChangeItemTheme = function(self, Properties)
                if not self.Instance then 
                    return
                end

                Library:ChangeItemTheme(self.Instance, Properties)
            end

            Instances.Connect = function(self, Event, Callback, Name)
                if not self.Instance then 
                    return
                end

                if not self.Instance[Event] then 
                    return
                end

                if IsMobile and not UserInputService.MouseEnabled then
                    if Event == "MouseButton1Down" or Event == "MouseButton1Click" then 
                        Event = "TouchTap"
                    elseif Event == "MouseButton2Down" or Event == "MouseButton2Click" then 
                        Event = "TouchLongPress"
                    end
                end

                return Library:Connect(self.Instance[Event], Callback, Name)
            end

            Instances.Tween = function(self, Info, Goal)
                if not self.Instance then 
                    return
                end

                return Tween:Create(self, Info, Goal)
            end

            Instances.Disconnect = function(self, Name)
                if not self.Instance then 
                    return
                end

                return Library:Disconnect(Name)
            end

            Instances.Clean = function(self)
                if not self.Instance then 
                    return
                end

                self.Instance:Destroy()
                self = nil
            end

            Instances.MakeDraggable = function(self, MoveTarget)
                if not self.Instance then 
                    return
                end
            
                local Gui = (type(MoveTarget) == "table" and MoveTarget.Instance) or MoveTarget or self.Instance
                local Dragging = false 
                local DragStart
                local StartPosition 
            
                local Set = function(Input)
                    local UIScale = Library.Holder.Instance:FindFirstChild("UIScale")
                    local Scale = UIScale and UIScale.Scale or 1
                    
                    local DragDelta = (Input.Position - DragStart) / Scale
                    local NewX = StartPosition.X.Offset + DragDelta.X
                    local NewY = StartPosition.Y.Offset + DragDelta.Y

                    local ScreenSize = Gui.Parent.AbsoluteSize / Scale
                    local GuiSize = Gui.AbsoluteSize / Scale
            
                    NewX = MathClamp(NewX, 0, ScreenSize.X - GuiSize.X)
                    NewY = MathClamp(NewY, 0, ScreenSize.Y - GuiSize.Y)
            
                    Tween:Create(Gui, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(0, NewX, 0, NewY)})
                end
            
                local InputChanged
            
                self:Connect("InputBegan", function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        Dragging = true
                        DragStart = Input.Position

                        if Gui.Position.X.Scale ~= 0 or Gui.Position.Y.Scale ~= 0 then
                            local UIScale = Library.Holder.Instance:FindFirstChild("UIScale")
                            local Scale = UIScale and UIScale.Scale or 1
                            local parentAbsPos = Gui.Parent and Gui.Parent.AbsolutePosition or Vector2New(0, 0)
                            local absPos = Gui.AbsolutePosition
                            Gui.AnchorPoint = Vector2New(0, 0)
                            Gui.Position = UDim2FromOffset(
                                (absPos.X - parentAbsPos.X) / Scale,
                                (absPos.Y - parentAbsPos.Y) / Scale
                            )
                        end
                        StartPosition = Gui.Position
            
                        if InputChanged then 
                            return
                        end
            
                        InputChanged = Input.Changed:Connect(function()
                            if Input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                                InputChanged:Disconnect()
                                InputChanged = nil
                            end
                        end)
                    end
                end)
            
                Library:Connect(UserInputService.InputChanged, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                        if Dragging then
                            Set(Input)
                        end
                    end
                end)
            
                return Dragging
            end

            Instances.MakeResizeable = function(self, Minimum, Maximum)
                if not self.Instance then 
                    return
                end

                local Gui = self.Instance

                local Resizing = false 
                local CurrentSide = nil

                local StartMouse = nil 
                local StartPosition = nil 
                local StartSize = nil
                
                local EdgeThickness = 2

                local MakeEdge = function(Name, Position, Size)
                    local Button = Instances:Create("TextButton", {
                        Name = "\0",
                        Size = Size,
                        Position = Position,
                        BackgroundColor3 = FromRGB(166, 147, 243),
                        BackgroundTransparency = 1,
                        Text = "",
                        BorderSizePixel = 0,
                        AutoButtonColor = false,
                        Parent = Gui,
                        ZIndex = 99999,
                    })  Button:AddToTheme({BackgroundColor3 = "Accent"})

                    return Button
                end

                local Edges = {
                    {Button = MakeEdge(
                        "Left", 
                        UDim2New(0, 0, 0, 0), 
                        UDim2New(0, EdgeThickness, 1, 0)), 
                        Side = "L"
                    },

                    {Button = MakeEdge(
                        "Right", 
                        UDim2New(1, -EdgeThickness, 0, 0), 
                        UDim2New(0, EdgeThickness, 1, 0)), 
                        Side = "R"
                    },

                    {Button = MakeEdge(
                        "Top", UDim2New(0, 0, 0, 0), 
                        UDim2New(1, 0, 0, EdgeThickness)), 
                        Side = "T"
                    },

                    {Button = MakeEdge(
                        "Bottom", 
                        UDim2New(0, 0, 1, -EdgeThickness), 
                        UDim2New(1, 0, 0, EdgeThickness)), 
                        Side = "B"
                    },
                }

                local BeginResizing = function(Side)
                    Resizing = true 
                    CurrentSide = Side 

                    StartMouse = UserInputService:GetMouseLocation()

                    -- store offsets, not absolute screen pos
                    StartPosition = Vector2New(Gui.Position.X.Offset, Gui.Position.Y.Offset)
                    StartSize = Vector2New(Gui.Size.X.Offset, Gui.Size.Y.Offset)
                    
                    for Index, Value in Edges do 
                        Value.Button.Instance.BackgroundTransparency = (Value.Side == Side) and 0 or 1
                    end
                end

                local EndResizing = function()
                    Resizing = false 
                    CurrentSide = nil

                    for Index, Value in Edges do 
                        Value.Button.Instance.BackgroundTransparency = 1
                    end
                end

                for Index, Value in Edges do 
                    Value.Button:Connect("InputBegan", function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                            BeginResizing(Value.Side)
                        end
                    end)
                end

                Library:Connect(UserInputService.InputEnded, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        if Resizing then
                            EndResizing()
                        end
                    end
                end)

                Library:Connect(RunService.RenderStepped, function()
                    if not Resizing or not CurrentSide then 
                        return 
                    end

                    local UIScale = Library.Holder.Instance:FindFirstChild("UIScale")
                    local Scale = UIScale and UIScale.Scale or 1

                    local MouseLocation = UserInputService:GetMouseLocation()
                    local dx = (MouseLocation.X - StartMouse.X) / Scale
                    local dy = (MouseLocation.Y - StartMouse.Y) / Scale
                
                    local x, y = StartPosition.X, StartPosition.Y
                    local w, h = StartSize.X, StartSize.Y

                    if CurrentSide == "L" then
                        x = StartPosition.X + dx
                        w = StartSize.X - dx
                    elseif CurrentSide == "R" then
                        w = StartSize.X + dx
                    elseif CurrentSide == "T" then
                        y = StartPosition.Y + dy
                        h = StartSize.Y - dy
                    elseif CurrentSide == "B" then
                        h = StartSize.Y + dy
                    end
                
                    if w < Minimum.X then
                        if CurrentSide == "L" then
                            x = x - (Minimum.X - w)
                        end
                        w = Minimum.X
                    end
                    if h < Minimum.Y then
                        if CurrentSide == "T" then
                            y = y - (Minimum.Y - h)
                        end
                        h = Minimum.Y
                    end
                
                    -- Use direct assignment instead of Tween during every frame of resizing
                    Gui.Position = UDim2FromOffset(x, y)
                    Gui.Size = UDim2FromOffset(w, h)
                end)
            end

            Instances.OnHover = function(self, Function)
                if not self.Instance then 
                    return
                end
                
                return Library:Connect(self.Instance.MouseEnter, Function)
            end

            Instances.OnHoverLeave = function(self, Function)
                if not self.Instance then 
                    return
                end
                
                return Library:Connect(self.Instance.MouseLeave, Function)
            end
        end

        local MarketplaceService = game:GetService("MarketplaceService")
        local HttpService = game:GetService("HttpService")

        local GameMappings = { Games = {}, Places = {} }
        local success, result = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/GiftStein1/pepehook-loader/refs/heads/main/cfg-game-mappings.lua"))()
        end)

        if success and result then
            GameMappings = result
            --print("[wings] success")
        else
            print("[wings] error:", result)
        end

        -- Store game name at module level for cloud config
        local GameName = "Unknown Game"
        
        local function GetConfigPath()
            local placeId = tostring(game.PlaceId)
            local gameId = tostring(game.GameId)
            
            local placeMapping = GameMappings.Places and GameMappings.Places[placeId]
            if placeMapping then
                if type(placeMapping) == "table" then
                    GameName = placeMapping.base .. " - " .. placeMapping.sub
                    local basePath = Library.Folders.Configs .. "/" .. placeMapping.base
                    if not isfolder(basePath) then
                        makefolder(basePath)
                    end
                    local subPath = basePath .. "/" .. placeMapping.sub
                    if not isfolder(subPath) then
                        makefolder(subPath)
                    end
                    return subPath
                else
                    GameName = placeMapping
                    local path = Library.Folders.Configs .. "/" .. placeMapping
                    if not isfolder(path) then
                        makefolder(path)
                    end
                    return path
                end
            end
            
            local gameMapping = GameMappings.Games and GameMappings.Games[gameId]
            if gameMapping then
                GameName = gameMapping
                local path = Library.Folders.Configs .. "/" .. gameMapping
                if not isfolder(path) then
                    makefolder(path)
                end
                return path
            end
            
            local gameName
            local ok, info = pcall(function()
                return MarketplaceService:GetProductInfo(game.PlaceId)
            end)
            
            if ok and info then
                gameName = info.Name:gsub('[\\/:*?"<>|%c]', '_'):gsub('_+', '_'):gsub('^_', ''):gsub('_$', '')
            else
                gameName = "Unknown_" .. gameId
            end
            
            GameName = gameName
            local path = Library.Folders.Configs .. "/" .. gameName
            if not isfolder(path) then
                makefolder(path)
            end
            return path
        end

        local ConfigPath = GetConfigPath()

        Library.GetFolder = function(self)
            return ConfigPath
        end
        -- Custom font
        local CustomFont = { } do
            function CustomFont:New(Name, Weight, Style, Data)
                if not isfile(Data.Id) then 
                    pcall(function()
                        writefile(Data.Id, game:HttpGet(Data.Url))
                    end)
                end

                if not isfile(Data.Id) then
                    return Font.fromEnum(Enum.Font.SourceSans)
                end

                local fontData = {
                    name = Name,
                    faces = {
                        {
                            name = Name,
                            weight = Weight,
                            style = Style,
                            assetId = getcustomasset(Data.Id)
                        }
                    }
                }

                local success, encoded = pcall(function() return HttpService:JSONEncode(fontData) end)
                if success then
                    writefile(`{Library.Folders.Assets}/{Name}.font`, encoded)
                end
                
                return Font.new(getcustomasset(`{Library.Folders.Assets}/{Name}.font`))
            end

            Library.Font = CustomFont:New("PromptMedium", 400, "Regular", {
                Id = "PromptRegular",
                Url = "https://github.com/sametexe001/luas/raw/refs/heads/main/fonts/Prompt-Regular.ttf"
            })
            
            Library.BoldFont = CustomFont:New("PromptMedium", 400, "Regular", {
                Id = "PromptMedium",
                Url = "https://github.com/sametexe001/luas/raw/refs/heads/main/fonts/Prompt-Medium.ttf"
            })
        end

        Library.Holder = Instances:Create("ScreenGui", {
            Parent = gethui(),
            Name = "wings_UI_Holder",
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, -- must be sibling for canvasgroup to work (its weird)
            DisplayOrder = 2,
            ResetOnSpawn = false
        })

        Instances:Create("UIScale", {
            Parent = Library.Holder.Instance,
            Name = "UIScale",
            Scale = IsMobile and 0.7 or 1
        })

        Library.OtherHolder = Instances:Create("ScreenGui", {
            Parent = gethui(),
            Name = "wings_UI_Other",
            ZIndexBehavior = Enum.ZIndexBehavior.Global,
            DisplayOrder = 2,
            ResetOnSpawn = false,
            IgnoreGuiInset = true
        })
        
        Library.NotifHolder = Instances:Create("Frame", {
            Parent = Library.Holder.Instance,
            Name = "\0",
            BackgroundTransparency = 1,
            Size = UDim2New(0, 0, 1, 0),
            BorderColor3 = FromRGB(0, 0, 0),
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.X
        })
        
        Instances:Create("UIListLayout", {
            Parent = Library.NotifHolder.Instance,
            Name = "\0",
            Padding = UDimNew(0, 10),
            SortOrder = Enum.SortOrder.LayoutOrder
        })
        
        Instances:Create("UIPadding", {
            Parent = Library.NotifHolder.Instance,
            Name = "\0",
            PaddingTop = UDimNew(0, 12),
            PaddingBottom = UDimNew(0, 12),
            PaddingRight = UDimNew(0, 12),
            PaddingLeft = UDimNew(0, 12)
        })

        Library.UnusedHolder = Instances:Create("ScreenGui", {
            Parent = gethui(),
            Name = "wings_UI_Unused",
            ZIndexBehavior = Enum.ZIndexBehavior.Global,
            Enabled = false,
            ResetOnSpawn = false
        })

        Library.Unload = function(self)
            pcall(function()
                for Index, Value in self.Connections do 
                    if Value.Connection then
                        Value.Connection:Disconnect()
                    end
                end
            end)

            pcall(function()
                for Index, Value in self.Threads do 
                    coroutine.close(Value)
                end
            end)

            pcall(function()
                if self.Holder then 
                    self.Holder:Clean()
                end
            end)

            pcall(function()
                if self.OtherHolder then
                    self.OtherHolder:Clean()
                end
            end)

            pcall(function()
                if self.UnusedHolder then
                    self.UnusedHolder:Clean()
                end
            end)

            Library = nil 
            getgenv().Library = nil
        end

        Library.GetFolder = function(self)
            return ConfigPath
        end

        Library.GetGameName = function(self)
            return GameName
        end

        Library.Round = function(self, Number, Float)
            local Multiplier = 1 / (Float or 1)
            return MathFloor(Number * Multiplier) / Multiplier
        end

        Library.Thread = function(self, Function)
            local NewThread = coroutine.create(Function)
            
            coroutine.wrap(function()
                coroutine.resume(NewThread)
            end)()

            TableInsert(self.Threads, NewThread)
            return NewThread
        end
        
        Library.SafeCall = function(self, Function, ...)
            local Arguements = { ... }
            local Success, Result = pcall(Function, TableUnpack(Arguements))

            if not Success then
                warn(Result)
                return false
            end

            return Success
        end

        Library.Connect = function(self, Event, Callback, Name)
            Name = Name or StringFormat("connection_number_%s_%s", self.UnnamedConnections + 1, HttpService:GenerateGUID(false))

            local NewConnection = {
                Event = Event,
                Callback = Callback,
                Name = Name,
                Connection = nil
            }

            NewConnection.Connection = Event:Connect(Callback)
            
            function NewConnection:Disconnect()
                if NewConnection.Connection then
                    NewConnection.Connection:Disconnect()
                    NewConnection.Connection = nil
                end
            end

            TableInsert(self.Connections, NewConnection)
            return NewConnection
        end

        Library.Disconnect = function(self, Name)
            for _, Connection in self.Connections do 
                if Connection.Name == Name then
                    Connection.Connection:Disconnect()
                    break
                end
            end
        end

        Library.NextFlag = function(self)
            local FlagNumber = self.UnnamedFlags + 1
            return StringFormat("flag_number_%s_%s", FlagNumber, HttpService:GenerateGUID(false))
        end

        Library.AddToTheme = function(self, Item, Properties)
            Item = (type(Item) == "table" and Item.Instance) or Item 

            local ThemeData = {
                Item = Item,
                Properties = Properties,
            }

            for Property, Value in ThemeData.Properties do
                if type(Value) == "string" then
                    if not self.Theme[Value] then
                        Item[Property] = Value 
                    end

                    Item[Property] = self.Theme[Value]
                else
                    Item[Property] = Value()
                end
            end

            TableInsert(self.ThemeItems, ThemeData)
            self.ThemeMap[Item] = ThemeData
        end

        Library.ToRich = function(self, Text, Color)
            return `<font color="rgb({MathFloor(Color.R * 255)}, {MathFloor(Color.G * 255)}, {MathFloor(Color.B * 255)})">{Text}</font>`
        end

        Library.GetConfig = function(self)
            local Config = { } 

            local Success, Result = Library:SafeCall(function()
                for Index, Value in Library.Flags do 
                    if type(Value) == "table" and Value.Key then
                        Config[Index] = {Key = tostring(Value.Key), Mode = Value.Mode}
                    elseif type(Value) == "table" and Value.Color then
                        Config[Index] = {Color = "#" .. Value.HexValue, Alpha = Value.Alpha}
                    else
                        Config[Index] = Value
                    end
                end
            end)

            return HttpService:JSONEncode(Config)
        end

        Library.LoadConfig = function(self, Config)
            local success, Decoded = pcall(function()
                return HttpService:JSONDecode(Config)
            end)

            if not success or type(Decoded) ~= "table" then
                return false, "Invalid configuration data (JSON decode failed)"
            end

            local Success, Result = Library:SafeCall(function()
                for Index, Value in Decoded do 
                    local SetFunction = Library.SetFlags[Index]

                    if not SetFunction then
                        continue
                    end

                    if type(Value) == "table" and Value.Key then 
                        SetFunction(Value)
                    elseif type(Value) == "table" and Value.Color then
                        SetFunction(Value.Color, Value.Alpha)
                    else
                        SetFunction(Value)
                    end
                end
            end)

            return Success, Result
        end

        Library.DeleteConfig = function(self, Config)
            if Library:IsCloudEnabled() then
                Library:CloudDeleteConfig(Config)
            else
                if isfile(Library.Folders.Configs .. "/" .. Config) then 
                    delfile(Library.Folders.Configs .. "/" .. Config)
                end
            end
        end

        Library.RefreshConfigsList = function(self)
            local ReturnList = { }
            local NamesSeen = { }
            
            if Library:IsCloudEnabled() then
                local cloudConfigs = Library:CloudRefreshConfigsList()
                if cloudConfigs and type(cloudConfigs) == "table" then
                    for _, cfg in ipairs(cloudConfigs) do
                        table.insert(ReturnList, cfg)
                        NamesSeen[cfg.name or cfg.config_name] = true
                    end
                end
            end

            local List = { }
            pcall(function()
                List = listfiles(Library:GetFolder())
            end)

            for Index = 1, #List do 
                local File = List[Index]

                if File:sub(-5) == ".json" then
                    local Position = File:find(".json", 1, true)
                    local StartPosition = Position

                    local Character = File:sub(Position, Position)
                    while Character ~= "/" and Character ~= "\\" and Character ~= "" do
                        Position = Position - 1
                        Character = File:sub(Position, Position)
                    end

                    if Character == "/" or Character == "\\" then
                        local configName = File:sub(Position + 1, StartPosition - 1)
                        if not NamesSeen[configName] then
                            table.insert(ReturnList, configName)
                            NamesSeen[configName] = true
                        end
                    end
                end
            end

            return ReturnList
        end

        Library.IsCloudEnabled = function(self)
            if not Library.UseCloudConfig then
                return false
            end
            
            local key = nil
            pcall(function()
                key = script_key
            end)
            if not key then
                pcall(function()
                    key = getgenv().script_key
                end)
            end
            if not key then
                pcall(function()
                    key = _G.script_key
                end)
            end
            return key ~= nil and type(key) == "string" and #key > 10
        end

        Library.GetScriptKey = function(self)
            local key = nil
            pcall(function()
                key = script_key
            end)
            if not key then
                pcall(function()
                    key = getgenv().script_key
                end)
            end
            if not key then
                pcall(function()
                    key = _G.script_key
                end)
            end
            return key or ""
        end

        Library.GetHWID = function(self)
            local hwid = ""
            pcall(function()
                hwid = game:GetService("RbxAnalyticsService"):GetClientId()
            end)
            if hwid == "" then
                pcall(function()
                    hwid = game:GetService("NetworkClient"):GetChildren()[1].Name
                end)
            end
            return hwid ~= "" and hwid or "UNKNOWN"
        end

        Library.CloudRequest = function(self, body, retries)
            retries = retries or 2
            local url = "https://wings.ac/api/cloudconfig.php"
            local key = Library:GetScriptKey()
            local hwid = Library:GetHWID()
            
            local headers = {
                ["Content-Type"] = "application/json",
                ["X-Script-Key"] = key,
                ["X-HWID"] = hwid
            }
            
            if Library.DebugMode then
                print("[Wings Debug] CloudRequest starting...")
                print("[Wings Debug] URL:", url)
                print("[Wings Debug] Body:", body)
            end
            
            for attempt = 1, retries do
                local success, result = pcall(function()
                    if syn and syn.request then
                        return syn.request({Url = url, Method = "POST", Headers = headers, Body = body})
                    elseif request then
                        return request({Url = url, Method = "POST", Headers = headers, Body = body})
                    elseif http and http.request then
                        return http.request({Url = url, Method = "POST", Headers = headers, Body = body})
                    else
                        return {Body = game:HttpPostAsync(url, body, Enum.HttpContentType.ApplicationJson, false)}
                    end
                end)
                
                if success and result then
                    local responseBody = (type(result) == "table" and result.Body) or (type(result) == "string" and result)
                    if responseBody then
                        local ok, data = pcall(function()
                            return HttpService:JSONDecode(responseBody)
                        end)
                        if ok and data then
                            if Library.DebugMode then
                                print("[Wings Debug] Response success:", data.success)
                                if not data.success then
                                    print("[Wings Debug] Error:", data.error or "Unknown")
                                end
                            end
                            return data
                        end
                    end
                end
                
                if attempt < retries then
                    task.wait(0.5)
                end
            end
            
            if Library.DebugMode then
                warn("[Wings Debug] CloudRequest failed after", retries, "retries")
            end
            return {success = false, error = "Request failed after retries"}
        end

        Library.FetchPreferences = function(self)
            if Library.PreferencesLoaded then
                return
            end
            
            local key = Library:GetScriptKey()
            if not key or key == "" then
                return
            end
            
            local body = HttpService:JSONEncode({action = "get_preferences"})
            local result = Library:CloudRequest(body, 1)
            
            if result and result.success and result.preferences then
                Library.UseCloudConfig = result.preferences.use_cloud_configs ~= false
                Library.DebugMode = result.preferences.debug_mode == true
                Library.PreferencesLoaded = true
                
                if Library.DebugMode then
                    print("[Wings Debug] Preferences loaded successfully")
                    print("[Wings Debug] UseCloudConfig:", Library.UseCloudConfig)
                    print("[Wings Debug] DebugMode:", Library.DebugMode)
                end
            end
        end

        Library.CloudSaveConfig = function(self, configName, existingCloudId)
            local configData = {}
            Library:SafeCall(function()
                for Index, Value in Library.Flags do 
                    if type(Value) == "table" and Value.Key then
                        configData[Index] = {Key = tostring(Value.Key), Mode = Value.Mode}
                    elseif type(Value) == "table" and Value.Color then
                        configData[Index] = {Color = "#" .. Value.HexValue, Alpha = Value.Alpha}
                    else
                        configData[Index] = Value
                    end
                end
            end)
            
            local cloudId = existingCloudId
            if cloudId then
                cloudId = tonumber(cloudId) or 0
            end
            
            if not cloudId or cloudId == 0 then
                for _, cfg in ipairs(Library.CloudConfigCache or {}) do
                    if cfg.config_name == configName or cfg.name == configName then
                        cloudId = tonumber(cfg.id) or 0
                        break
                    end
                end
            end
            
            local body = HttpService:JSONEncode({
                action = "save",
                place_id = game.PlaceId,
                game_name = GameName,
                config_name = configName,
                config_data = configData,
                cloud_id = cloudId or 0
            })
            
            local result = Library:CloudRequest(body)
            if result.success and result.id then
                local found = false
                if Library.CloudConfigCache then
                    for i, cfg in ipairs(Library.CloudConfigCache) do
                        if cfg.id == result.id or cfg.config_name == configName then
                            Library.CloudConfigCache[i] = {
                                id = result.id,
                                config_name = configName,
                                game_name = GameName,
                                game_place_id = game.PlaceId
                            }
                            found = true
                            break
                        end
                    end
                else
                    Library.CloudConfigCache = {}
                end
                
                if not found then
                    table.insert(Library.CloudConfigCache, {
                        id = result.id,
                        config_name = configName,
                        game_name = GameName,
                        game_place_id = game.PlaceId
                    })
                end
            end
            return result.success == true, result.id
        end

        Library.CloudLoadConfig = function(self, configName, configId)
            if not configId then
                local configs = Library.CloudConfigCache or {}
                
                for _, cfg in ipairs(configs) do
                    if cfg.config_name == configName then
                        configId = cfg.id
                        break
                    end
                end
                
                if not configId then
                    Library:CloudRefreshConfigsList()
                    configs = Library.CloudConfigCache or {}
                    for _, cfg in ipairs(configs) do
                        if cfg.config_name == configName then
                            configId = cfg.id
                            break
                        end
                    end
                end
            end
            
            if not configId then
                return false
            end
            
            local body = HttpService:JSONEncode({
                action = "load",
                id = configId
            })
            
            local result = Library:CloudRequest(body)
            if result.success and result.config_data then
                Library:SafeCall(function()
                    for Index, Value in result.config_data do 
                        local SetFunction = Library.SetFlags[Index]
                        if not SetFunction then
                            continue
                        end
                        if type(Value) == "table" and Value.Key then 
                            SetFunction(Value)
                        elseif type(Value) == "table" and Value.Color then
                            SetFunction(Value.Color, Value.Alpha)
                        else
                            SetFunction(Value)
                        end
                    end
                end)
                return true
            end
            return false
        end

        Library.CloudDeleteConfig = function(self, configName, configId)
            if not configId then
                local configs = Library.CloudConfigCache or {}
                
                for _, cfg in ipairs(configs) do
                    if cfg.config_name == configName then
                        configId = cfg.id
                        break
                    end
                end
                
                if not configId then
                    Library:CloudRefreshConfigsList()
                    configs = Library.CloudConfigCache or {}
                    for _, cfg in ipairs(configs) do
                        if cfg.config_name == configName then
                            configId = cfg.id
                            break
                        end
                    end
                end
            end
            
            if not configId then
                return false
            end
            
            local body = HttpService:JSONEncode({
                action = "delete",
                id = configId
            })
            
            local result = Library:CloudRequest(body)
            if result.success then
                local configs = Library.CloudConfigCache or {}
                for i, cfg in ipairs(configs) do
                    if cfg.id == configId then
                        table.remove(Library.CloudConfigCache, i)
                        break
                    end
                end
            end
            return result.success == true
        end

        Library.CloudRenameConfig = function(self, oldName, newName, cloudId)
            local configId = cloudId
            
            if not configId then
                local configs = Library.CloudConfigCache or {}
                for _, cfg in ipairs(configs) do
                    if cfg.config_name == oldName then
                        configId = cfg.id
                        break
                    end
                end
            end
            
            if not configId then
                return false, "Config not found"
            end
            
            local body = HttpService:JSONEncode({
                action = "rename",
                id = configId,
                new_name = newName,
                place_id = game.PlaceId
            })
            
            local result = Library:CloudRequest(body)
            if result.success then
                for i, cfg in ipairs(Library.CloudConfigCache or {}) do
                    if cfg.id == configId then
                        Library.CloudConfigCache[i].config_name = newName
                        break
                    end
                end
                return true, configId
            end
            return false, result.error or "Rename failed"
        end

        Library.CloudRefreshConfigsList = function(self)
            local body = HttpService:JSONEncode({
                action = "list",
                place_id = game.PlaceId
            })
            
            local result = Library:CloudRequest(body)
            if result.success and result.configs then
                Library.CloudConfigCache = result.configs
                local configsWithIds = {}
                for _, cfg in ipairs(result.configs) do
                    TableInsert(configsWithIds, {name = cfg.config_name, id = cfg.id})
                end
                return configsWithIds
            end
            return {}
        end

        Library.ChangeItemTheme = function(self, Item, Properties)
            Item = (type(Item) == "table" and Item.Instance) or Item

            if not self.ThemeMap[Item] then 
                return
            end

            self.ThemeMap[Item].Properties = Properties
            self.ThemeMap[Item] = self.ThemeMap[Item]
        end

        Library.ChangeTheme = function(self, Theme, Color)
            self.Theme[Theme] = Color

            for _, Item in self.ThemeItems do
                for Property, Value in Item.Properties do
                    if type(Value) == "string" and Value == Theme then
                        Item.Item[Property] = Color
                    elseif type(Value) == "function" then
                        Item.Item[Property] = Value()
                    end
                end
            end
        end

        Library.IsMouseOverFrame = function(self, Frame)
            Frame = (type(Frame) == "table" and Frame.Instance) or Frame

            local MousePosition = Vector2New(Mouse.X, Mouse.Y)

            return MousePosition.X >= Frame.AbsolutePosition.X and MousePosition.X <= Frame.AbsolutePosition.X + Frame.AbsoluteSize.X 
            and MousePosition.Y >= Frame.AbsolutePosition.Y and MousePosition.Y <= Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y
        end

        Library.Lerp = function(self, Start, Finish, Time)
            return Start + (Finish - Start) * Time
        end

        Library.CompareVectors = function(self, PointA, PointB)
            return (PointA.X < PointB.X) or (PointA.Y < PointB.Y)
        end

        Library.IsClipped = function(self, Object, Column)
            Object = (type(Object) == "table" and Object.Instance) or Object
            Column = (type(Column) == "table" and Column.Instance) or Column
            local Parent = Column
            
            local BoundryTop = Parent.AbsolutePosition
            local BoundryBottom = BoundryTop + Parent.AbsoluteSize

            local Top = Object.AbsolutePosition
            local Bottom = Top + Object.AbsoluteSize 

            return Library:CompareVectors(Top, BoundryTop) or Library:CompareVectors(BoundryBottom, Bottom)
        end

        Library.GetCalculatedRayPosition = function(self, Position, Normal, Origin, Direction)
            local N = Normal
            local D = Direction
            local V = Origin - Position

            local Number = (N.x * V.x) + (N.y * V.y) + (N.z * V.z)
            local Den = (N.x * D.x) + (N.y * D.y) + (N.z * D.z)
            local A = -Number / Den

            return Origin + (A * Direction)
        end

                    Library.MakeBlurred = function(self, Item, Window)
                        Item = (type(Item) == "table" and Item.Instance) or Item
                        local BlurItem = Item
        
                        local Part = Instances:Create("Part", {
                            Material = Enum.Material.Glass,
                            Transparency = 1,
                            Reflectance = 1,
                            CastShadow = false,
                            Anchored = true,
                            CanCollide = false,
                            CanQuery = false,
                            CollisionGroup = " ",
                            Size = Vector3New(1, 1, 1) * 0.01,
                            Color = FromRGB(0,0,0),
                            Parent = Camera
                        })
                            
                        local BlockMesh = Instances:Create("BlockMesh", {Parent = Part.Instance})
        
                        local DepthOfField = Instances:Create("DepthOfFieldEffect", {
                            Parent = Lighting,
                            Enabled = true,
                            FarIntensity = 0,
                            FocusDistance = 0,
                            InFocusRadius = 1000,
                            NearIntensity = 0, -- Start at 0
                            Name = ""
                        })
        
                        local LastVisible = false
                        local LastWindowOpen = false
        
                        Library:Connect(RunService.RenderStepped, function()
                            local CurrentVisible = Item.Visible
                            local CurrentWindowOpen = Window.IsOpen
                            local ShouldBeVisible = CurrentWindowOpen and CurrentVisible
        
                            if ShouldBeVisible ~= LastVisible or CurrentWindowOpen ~= LastWindowOpen then
                                LastVisible = ShouldBeVisible
                                LastWindowOpen = CurrentWindowOpen
        
                                if ShouldBeVisible then
                                    DepthOfField:Tween(nil, {NearIntensity = 1})
                                    Part:Tween(nil, {Transparency = 0.97})
                                    Part:Tween(nil, {Size = Vector3New(1, 1, 1) * 0.01})
                                else
                                    DepthOfField:Tween(nil, {NearIntensity = 0})
                                    Part:Tween(nil, {Transparency = 1})
                                    Part:Tween(nil, {Size = Vector3New(0, 0, 0)})
                                end
                            end
        
                            if ShouldBeVisible then
                                local Corner0 = BlurItem.AbsolutePosition;
                                local Corner1 = Corner0 + BlurItem.AbsoluteSize;
                                    
                                local Ray0 = Camera.ScreenPointToRay(Camera, Corner0.X, Corner0.Y, 1);
                                local Ray1 = Camera.ScreenPointToRay(Camera, Corner1.X, Corner1.Y, 1);
        
                                local Origin = Camera.CFrame.Position + Camera.CFrame.LookVector * (0.05 - Camera.NearPlaneZ);
                                local Normal = Camera.CFrame.LookVector;
        
                                local Position0 = Library:GetCalculatedRayPosition(Origin, Normal, Ray0.Origin, Ray0.Direction)
                                local Position1 = Library:GetCalculatedRayPosition(Origin, Normal, Ray1.Origin, Ray1.Direction)
        
                                Position0 = Camera.CFrame:PointToObjectSpace(Position0)
                                Position1 = Camera.CFrame:PointToObjectSpace(Position1)
        
                                local Size = Position1 - Position0
                                local Center = (Position0 + Position1) / 2
        
                                BlockMesh.Instance.Offset = Center
                                BlockMesh.Instance.Scale  = Size / 0.0101
        
                                Part.Instance.CFrame = Camera.CFrame
                            end
                        end)
                    end
        do 
            Library.CreateColorpicker = function(self, Data)
                local Colorpicker = {
                    Hue = 0,
                    Value = 0,
                    Saturation = 0,

                    Alpha = 0,

                    Color = FromRGB(0, 0, 0),
                    HexValue = "#000000",

                    Flag = Data.Flag,
                    IsOpen = false,
                    
                    SelectedFormat = "HEX",

                    Items = { },
                    IsSettings = true,
                }

                local Items = { } do
                    Items["ColorpickerButton"] = Instances:Create("TextButton", {
                        Parent = (type(Data.Parent) == "table" and Data.Parent.Instance) or Data.Parent,
                        Name = "\0",
                        ZIndex = 3,
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        BackgroundColor3 = FromRGB(255, 151, 153)
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["ColorpickerButton"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Instances:Create("UIGradient", {
                        Parent = Items["ColorpickerButton"].Instance,
                        Name = "\0",
                        Rotation = 90,
                        Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(170, 170, 170)), RGBSequenceKeypoint(1, FromRGB(144, 144, 144))}
                    })      
                    
                    Items["ColorpickerWindow"] = Instances:Create("Frame", {
                        Parent = Library.UnusedHolder.Instance,
                        Name = "\0",
                        Visible = false,
                        Position = UDim2New(0, 654, 0, 152),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 259, 0, 400),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Outline"]
                    }):AddToTheme({BackgroundColor3 = 'Background'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 10)
                    })
                    
                    Items["Hex"] = Instances:Create("Frame", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(1, 1),
                        Position = UDim2New(1, -90, 1, -80),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 100, 0, 25),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Element"]
                    }):AddToTheme({BackgroundColor3 = 'Element'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Hex"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Items["HexColor"] = Instances:Create("Frame", {
                        Parent = Items["Hex"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(0, 0.5),
                        Position = UDim2New(0, 4, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 14, 0, 14),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(255, 151, 153)
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["HexColor"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Items["HexInput"] = Instances:Create("TextBox", {
                        Parent = Items["Hex"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = '<font color="rgb(185, 185, 185)">#</font>ff9799',
                        Size = UDim2New(1, -30, 0, 15),
                        Position = UDim2New(0, 25, 0.5, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        PlaceholderColor3 = FromRGB(125, 125, 125),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        RichText = true,
                        TextSize = 16
                    }):AddToTheme({TextColor3 = 'Text'})
                    
                    Items["AlphaBackground"] = Instances:Create("Frame", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(1, 1),
                        Position = UDim2New(1, -40, 1, -80),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 45, 0, 25),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Element"]
                    }):AddToTheme({BackgroundColor3 = 'Element'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["AlphaBackground"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Items["AlphaValue"] = Instances:Create("TextLabel", {
                        Parent = Items["AlphaBackground"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        RichText = true,
                        Text = "100%",
                        Size = UDim2New(0, 0, 0, 15),
                        Selectable = true,
                        AnchorPoint = Vector2New(0.5, 0.5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0.5, 0, 0.5, 0),Active = true,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 16
                    }):AddToTheme({TextColor3 = 'Text'})
                    
                    Items["Alpha"] = Instances:Create("TextButton", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(0, 1),
                        Position = UDim2New(0, 12, 1, -115),
                        Size = UDim2New(1, -24, 0, 10),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        BackgroundColor3 = FromRGB(255, 151, 153)
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Alpha"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Items["Checkers"] = Instances:Create("ImageLabel", {
                        Parent = Items["Alpha"].Instance,
                        Name = "\0",
                        ScaleType = Enum.ScaleType.Tile,
                        BorderColor3 = FromRGB(0, 0, 0),
                        TileSize = UDim2New(0, 6, 0, 6),
                        Image = "http://www.roblox.com/asset/?id=18274452449",
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 1, 0),
                        ZIndex = 2,
                        BorderSizePixel = 0
                    })
                    
                    Instances:Create("UIGradient", {
                        Parent = Items["Checkers"].Instance,
                        Name = "\0",
                        Transparency = NumSequence{NumSequenceKeypoint(0, 1), NumSequenceKeypoint(0.37, 0.5), NumSequenceKeypoint(1, 0)}
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Checkers"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Items["AlphaDragger"] = Instances:Create("Frame", {
                        Parent = Items["Alpha"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(0, 0.5),
                        Position = UDim2New(0, 0, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 8, 0, 8),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(255, 151, 153)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["AlphaDragger"].Instance,
                        Name = "\0",
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Color = Library.Theme["Text"],
                        Thickness = 3.200000047683716
                    }):AddToTheme({Color = 'Text'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["AlphaDragger"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Items["Hue"] = Instances:Create("TextButton", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(0, 1),
                        Position = UDim2New(0, 12, 1, -140),
                        Size = UDim2New(1, -24, 0, 10),
                        BorderSizePixel = 0,
                        TextSize = 14
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Hue"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Items["HueInline"] = Instances:Create("TextButton", {
                        Parent = Items["Hue"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        Size = UDim2New(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        TextSize = 14
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["HueInline"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Instances:Create("UIGradient", {
                        Parent = Items["HueInline"].Instance,
                        Name = "\0",
                        Rotation = 0,
                        Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 0, 0)), RGBSequenceKeypoint(0.17, FromRGB(255, 255, 0)), RGBSequenceKeypoint(0.33, FromRGB(0, 255, 0)), RGBSequenceKeypoint(0.5, FromRGB(0, 255, 255)), RGBSequenceKeypoint(0.67, FromRGB(0, 0, 255)), RGBSequenceKeypoint(0.83, FromRGB(255, 0, 255)), RGBSequenceKeypoint(1, FromRGB(255, 0, 0))}
                    })
                    
                    Items["HueDragger"] = Instances:Create("Frame", {
                        Parent = Items["HueInline"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(0, 0.5),
                        Position = UDim2New(0, 6, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 4, 1, 5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        BackgroundColor3 = FromRGB(255, 151, 153)
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["HueDragger"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["HueDragger"].Instance,
                        Name = "\0",
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Color = Library.Theme["Text"],
                        Thickness = 3.200000047683716
                    }):AddToTheme({Color = 'Text'})
                    
                    Items["Palette"] = Instances:Create("TextButton", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        Position = UDim2New(0, 12, 0, 12),
                        Size = UDim2New(1, -24, 1, -175),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        BackgroundColor3 = FromRGB(255, 151, 153)
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Palette"].Instance,
                        Name = "\0"
                    })
                    
                    Items["Saturation"] = Instances:Create("Frame", {
                        Parent = Items["Palette"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 1, 1, 0),
                        BorderSizePixel = 0
                    })
                    
                    Instances:Create("UIGradient", {
                        Parent = Items["Saturation"].Instance,
                        Name = "\0",
                        Transparency = NumSequence{NumSequenceKeypoint(0, 1), NumSequenceKeypoint(1, 0)}
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Saturation"].Instance,
                        Name = "\0"
                    })
                    
                    Items["Value"] = Instances:Create("Frame", {
                        Parent = Items["Palette"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 1, 1, 1),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(0, 0, 0)
                    })
                    
                    Instances:Create("UIGradient", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        Rotation = 90,
                        Transparency = NumSequence{NumSequenceKeypoint(0, 1), NumSequenceKeypoint(1, 0)}
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Value"].Instance,
                        Name = "\0"
                    })
                    
                    Items["PaletteDragger"] = Instances:Create("Frame", {
                        Parent = Items["Palette"].Instance,
                        Name = "\0",
                        Size = UDim2New(0, 8, 0, 8),
                        Position = UDim2New(0, 12, 0, 12),
                        BorderColor3 = FromRGB(0, 0, 0),
                        ZIndex = 3,
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(255, 151, 153)
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["PaletteDragger"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["PaletteDragger"].Instance,
                        Name = "\0",
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                        Color = Library.Theme["Text"],
                        Thickness = 3.200000047683716
                    }):AddToTheme({Color = 'Text'})
                    
                    Items["OpenSettings"] = Instances:Create("ImageButton", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        ImageColor3 = Library.Theme["Text 2"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 18, 0, 18),
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(1, 1),
                        Image = "rbxassetid://71009909482717",
                        BackgroundTransparency = 1,
                        Position = UDim2New(1, -12, 1, -83),
                        Rotation = 1,
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = 'Text 2'})
                    
                    Items["ColorFormatDorpdown"] = Instances:Create("TextButton", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(0, 1),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 12, 1, -82),
                        Size = UDim2New(0, 60, 0, 20),
                        BorderSizePixel = 0,
                        TextSize = 14
                    })
                    
                    Items["ArrowIcon"] = Instances:Create("ImageLabel", {
                        Parent = Items["ColorFormatDorpdown"].Instance,
                        Name = "\0",
                        ImageColor3 = Library.Theme["Text 2"],
                        ScaleType = Enum.ScaleType.Fit,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Image = "rbxassetid://111436698580046",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0.5, -2),
                        Size = UDim2New(0, 9, 0, 5),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = 'Text 2'})
                    
                    Items["Value"] = Instances:Create("TextLabel", {
                        Parent = Items["ColorFormatDorpdown"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "HEX",
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 20, 0.5, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 16
                    }):AddToTheme({TextColor3 = 'Text'})
                    
                    Items["Content"] = Instances:Create("Frame", {
                        Parent = Items["ColorpickerWindow"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 1),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 1, 0),
                        Size = UDim2New(1, 0, 0, 80),
                        BorderSizePixel = 0
                    })
                    
                    Items["Holder"] = Instances:Create("ScrollingFrame", {
                        Parent = Items["Content"].Instance,
                        Name = "\0",
                        Active = true,
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        BorderSizePixel = 0,
                        CanvasSize = UDim2New(0, 0, 0, 0),
                        ScrollBarImageColor3 = Library.Theme["Text 2"],
                        MidImage = "rbxassetid://81680855285439",
                        BorderColor3 = FromRGB(0, 0, 0),
                        ScrollBarThickness = 1,
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 1, 0),
                        BottomImage = "rbxassetid://81680855285439",
                        TopImage = "rbxassetid://81680855285439"
                    }):AddToTheme({ScrollBarImageColor3 = 'Text 2'})
                    
                    Instances:Create("UIListLayout", {
                        Parent = Items["Holder"].Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 10),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Items["Content"] = Items["Holder"]

                    Items["OptionHolder"] = Instances:Create("Frame", {
                        Parent = Library.UnusedHolder.Instance,
                        Name = "\0",
                        BackgroundTransparency = 0,
                        Position = UDim2New(0, 20, 0, 91),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 122, 0, 80),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Background"]
                    }):AddToTheme({BackgroundColor3 = 'Background'})

                    --Library:MakeBlurred(Items["OptionHolder"], Dropdown)
                    
                    Instances:Create("UICorner", {
                        Parent = Items["OptionHolder"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 12)
                    })

                    Instances:Create("UIStroke", {
                        Parent = Items["OptionHolder"].Instance,
                        Name = "\0",
                        Color = FromRGB(29, 28, 32),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Outline 2'})
                    
                    Items["OptionHolderHolder"] = Instances:Create("ScrollingFrame", {
                        Parent = Items["OptionHolder"].Instance,
                        Name = "\0",
                        Active = true,
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        BorderSizePixel = 0,
                        CanvasSize = UDim2New(0, 0, 0, 0),
                        MidImage = "rbxassetid://81680855285439",
                        BorderColor3 = FromRGB(0, 0, 0),
                        ScrollBarThickness = 2,
                        Size = UDim2New(1, -16, 1, -16),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 8, 0, 8),
                        BottomImage = "rbxassetid://81680855285439",
                        TopImage = "rbxassetid://81680855285439"
                    }):AddToTheme({ScrollBarImageColor3 = "Text 2"})

                    Instances:Create("UIListLayout", {
                        Parent = Items["OptionHolderHolder"].Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 6),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["OptionHolderHolder"].Instance,
                        Name = "\0",
                        PaddingTop = UDimNew(0, 5),
                        PaddingBottom = UDimNew(0, 10),
                        PaddingRight = UDimNew(0, 8),
                        PaddingLeft = UDimNew(0, 0)
                    })         

                    Instances:Create("UIPadding", {
                        Parent = Items["Holder"].Instance,
                        Name = "\0",
                        PaddingTop = UDimNew(0, 10),
                        PaddingBottom = UDimNew(0, 10),
                        PaddingRight = UDimNew(0, 10),
                        PaddingLeft = UDimNew(0, 10)
                    })                
                    
                    Colorpicker.Items = Items
                end

                local Dropdown = {
                    Multi = false,
                    Value = "",
                    MaxSize = 80,
                    Options = { },
                    IsOpen = false,
                    Flag = Colorpicker.Flag.."_Dropdown",
                    Callback = function(Value)
                        Colorpicker.SelectedFormat = Value
                        Colorpicker:Update()
                    end
                }

                local Debounce = false 
                local RenderStepped 

                function Dropdown:SetOpen(Bool)
                    if Debounce then 
                        return
                    end

                    Dropdown.IsOpen = Bool

                    Debounce = true 

                    if Dropdown.IsOpen then 
                        Items["OptionHolder"].Instance.Visible = true
                        Items["OptionHolder"].Instance.Parent = Library.OtherHolder.Instance
                        Items["OptionHolder"].Instance.Size = UDim2New(0, 120, 0, 0)

                        Items["OptionHolder"].Instance.Position = UDim2New(0, Items["ColorFormatDorpdown"].Instance.AbsolutePosition.X, 0, Items["ColorFormatDorpdown"].Instance.AbsolutePosition.Y - 25)             
                        Items["OptionHolder"]:Tween(nil, {Size = UDim2New(0, 120, 0, Dropdown.MaxSize)})

                        if not Data.Section.IsSettings then
                            for Index, Value in Library.OpenFrames do 
                                if Value ~= Dropdown and Value ~= Colorpicker then 
                                    Value:SetOpen(false)
                                end
                            end
                            
                            Library.OpenFrames[Dropdown] = Dropdown 
                        end
                    else
                        if not Data.Section.IsSettings then
                            if Library.OpenFrames[Dropdown] then 
                                Library.OpenFrames[Dropdown] = nil
                            end
                        end

                        if RenderStepped then 
                            RenderStepped:Disconnect()
                            RenderStepped = nil
                        end

                        if Library.IsASubWindowOpenLul == Dropdown then 
                            Library.IsASubWindowOpenLul = nil
                        end

                        Items["OptionHolder"]:Tween(nil, {Size = UDim2New(0, 120, 0, 0)})
                    end

                    local Descendants = Items["OptionHolder"].Instance:GetDescendants()
                    TableInsert(Descendants, Items["OptionHolder"].Instance)

                    local NewTween

                    for Index, Value in Descendants do 
                        local TransparencyProperty = Tween:GetProperty(Value)

                        if not TransparencyProperty then
                            continue 
                        end

                        if not Value.ClassName:find("UI") then 
                            Value.ZIndex = Dropdown.IsOpen and 3 or 1
                        end

                        if type(TransparencyProperty) == "table" then 
                            for _, Property in TransparencyProperty do 
                                NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                            end
                        else
                            NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                        end
                    end
                    
                    NewTween.Tween.Completed:Connect(function()
                        Debounce = false 
                        Items["OptionHolder"].Instance.Visible = Dropdown.IsOpen
                        task.wait(0.2)
                        Items["OptionHolder"].Instance.Parent = not Dropdown.IsOpen and Library.UnusedHolder.Instance or Library.OtherHolder.Instance

                        task.wait(0.1)

                        if Dropdown.IsOpen then 
                            RenderStepped = Library:Connect(RunService.RenderStepped, function()
                                Items["OptionHolder"].Instance.Position = UDim2New(0, Items["ColorFormatDorpdown"].Instance.AbsolutePosition.X, 0, Items["ColorFormatDorpdown"].Instance.AbsolutePosition.Y - 25)             
                                Items["OptionHolder"].Instance.Size = UDim2New(0, 120, 0, Dropdown.MaxSize)
                            end)
                        else
                            if RenderStepped then 
                                RenderStepped:Disconnect()
                                RenderStepped = nil
                            end

                            Items["OptionHolder"]:Tween(nil, {Size = UDim2New(0, 120, 0, 0)})
                        end
                    end)
                end

                function Dropdown:Add(Option)
                    local OptionButton = Instances:Create("TextButton", {
                        Parent = Items["OptionHolderHolder"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 0, 25),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        BackgroundColor3 = FromRGB(26, 28, 38)
                    }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    
                    local OptionCheck = Instances:Create("ImageLabel", {
                        Parent = OptionButton.Instance,
                        Name = "\0",
                        ImageTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://107907951570295",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 5, 0.5, 0),
                        Size = UDim2New(0, 16, 0, 16),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = 'Text'})
                    
                    local OptionText = Instances:Create("TextLabel", {
                        Parent = OptionButton.Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text 2"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Option,
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 28, 0.5, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text 2'})
                    
                    Instances:Create("UICorner", {
                        Parent = OptionButton.Instance,
                        Name = "\0"
                    })                

                    OptionButton:OnHover(function()
                        OptionButton:Tween(nil, {BackgroundTransparency = 0})
                    end)

                    OptionButton:OnHoverLeave(function()
                        OptionButton:Tween(nil, {BackgroundTransparency = 1})
                    end)
                    
                    local OptionData = {
                        Button = OptionButton,
                        Name = Option,
                        Check = OptionCheck,
                        Text = OptionText,
                        Selected = false
                    }
                    
                    function OptionData:Toggle(Value)
                        if Value == "Active" then
                            OptionData.Check:Tween(nil, {ImageTransparency = 0})
                            OptionData.Text:ChangeItemTheme({TextColor3 = "Text"})
                            OptionData.Text:Tween(nil, {TextColor3 = Library.Theme.Text})
                        else
                            OptionData.Check:Tween(nil, {ImageTransparency = 1})
                            OptionData.Text:ChangeItemTheme({TextColor3 = "Text 2"})
                            OptionData.Text:Tween(nil, {TextColor3 = Library.Theme["Text 2"]})
                        end
                    end

                    function OptionData:Set()
                        OptionData.Selected = not OptionData.Selected

                        if Dropdown.Multi then 
                            local Index = TableFind(Dropdown.Value, OptionData.Name)

                            if Index then 
                                TableRemove(Dropdown.Value, Index)
                            else
                                TableInsert(Dropdown.Value, OptionData.Name)
                            end

                            OptionData:Toggle(Index and "Inactive" or "Active")

                            Library.Flags[Dropdown.Flag] = Dropdown.Value

                            local TextFormat = #Dropdown.Value > 0 and TableConcat(Dropdown.Value, ", ") or "..."
                            Items["Value"].Instance.Text = TextFormat
                        else
                            if OptionData.Selected then 
                                Dropdown.Value = OptionData.Name
                                Library.Flags[Dropdown.Flag] = OptionData.Name

                                OptionData.Selected = true
                                OptionData:Toggle("Active")

                                for Index, Value in Dropdown.Options do 
                                    if Value ~= OptionData then
                                        Value.Selected = false 
                                        Value:Toggle("Inactive")
                                    end
                                end

                                Items["Value"].Instance.Text = OptionData.Name
                            else
                                Dropdown.Value = nil
                                Library.Flags[Dropdown.Flag] = nil

                                OptionData.Selected = false
                                OptionData:Toggle("Inactive")

                                Items["Value"].Instance.Text = "..."
                            end
                        end

                        if Dropdown.Callback then
                            Library:SafeCall(Dropdown.Callback, Dropdown.Value)
                        end
                    end

                    OptionData.Button:Connect("MouseButton1Down", function()
                        OptionData:Set()
                    end)

                    Dropdown.Options[OptionData.Name] = OptionData
                    return OptionData
                end

                function Dropdown:Remove(Option)
                    if Dropdown.Options[Option] then
                        Dropdown.Options[Option].Button:Clean()
                        Dropdown.Options[Option] = nil
                    end
                end

                function Dropdown:Refresh(List)
                    for Index, Value in Dropdown.Options do 
                        Dropdown:Remove(Value.Name)
                    end

                    for Index, Value in List do 
                        Dropdown:Add(Value)
                    end
                end

                Items["ColorFormatDorpdown"]:Connect("MouseButton1Down", function()
                    Dropdown:SetOpen(not Dropdown.IsOpen)
                end)

                Library:Connect(UserInputService.InputBegan, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        if Dropdown.IsOpen then
                            if Library:IsMouseOverFrame(Items["OptionHolder"]) then
                                return
                            end

                            Dropdown:SetOpen(false)
                        end
                    end
                end)

                local Debounce = false
                local RenderStepped  

                function Colorpicker:SetOpen(Bool)
                    if Debounce then 
                        return
                    end

                    Colorpicker.IsOpen = Bool

                    Debounce = true 

                    if Colorpicker.IsOpen then 
                        Items["ColorpickerWindow"].Instance.Visible = true
                        Items["ColorpickerWindow"].Instance.Parent = Library.Holder.Instance
                        
                        RenderStepped = Library:Connect(RunService.RenderStepped, function()
                            Items["ColorpickerWindow"].Instance.Position = UDim2New(
                                0, 
                                Items["ColorpickerButton"].Instance.AbsolutePosition.X, 
                                0, 
                                Items["ColorpickerButton"].Instance.AbsolutePosition.Y + Items["ColorpickerButton"].Instance.AbsoluteSize.Y + 5
                            )
                        end)

                        if not Data.Section.IsSettings then
                            for Index, Value in Library.OpenFrames do 
                                if Value ~= Colorpicker then
                                    Value:SetOpen(false)
                                end
                            end

                            Library.OpenFrames[Colorpicker] = Colorpicker 
                        end

                        Library.IsASubWindowOpenLul = Colorpicker
                    else
                        if not Data.Section.IsSettings then
                            if Library.OpenFrames[Colorpicker] then 
                                Library.OpenFrames[Colorpicker] = nil
                            end
                        end

                        if RenderStepped then 
                            RenderStepped:Disconnect()
                            RenderStepped = nil
                        end

                        if Library.IsASubWindowOpenLul == Colorpicker then 
                            Library.IsASubWindowOpenLul = nil
                        end
                    end

                    local Descendants = Items["ColorpickerWindow"].Instance:GetDescendants()
                    TableInsert(Descendants, Items["ColorpickerWindow"].Instance)

                    local NewTween

                    for Index, Value in Descendants do 
                        local TransparencyProperty = Tween:GetProperty(Value)

                        if not TransparencyProperty then
                            continue 
                        end

                        if not Value.ClassName:find("UI") then 
                            Value.ZIndex = Colorpicker.IsOpen and 125 or 1
                        end

                        if type(TransparencyProperty) == "table" then 
                            for _, Property in TransparencyProperty do 
                                NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                            end
                        else
                            NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                        end
                    end
                    
                    NewTween.Tween.Completed:Connect(function()
                        Debounce = false 
                        Items["ColorpickerWindow"].Instance.Visible = Colorpicker.IsOpen
                        task.wait(0.2)
                        Items["ColorpickerWindow"].Instance.Parent = not Colorpicker.IsOpen and Library.UnusedHolder.Instance or Library.Holder.Instance
                    end)
                end

                function Colorpicker:Get()
                    return Colorpicker.Color, Colorpicker.Alpha
                end

                function Colorpicker:Update(IsFromAlpha)
                    local Hue, Saturation, Value = Colorpicker.Hue, Colorpicker.Saturation, Colorpicker.Value
                    Colorpicker.Color = FromHSV(Hue, Saturation, Value)
                    Colorpicker.HexValue = Colorpicker.Color:ToHex()

                    Library.Flags[Colorpicker.Flag] = {
                        Alpha = Colorpicker.Alpha,
                        Color = Colorpicker.Color,
                        HexValue = Colorpicker.HexValue,
                        Transparency = 1 - Colorpicker.Alpha
                    }

                    Items["ColorpickerButton"]:Tween(nil, {BackgroundColor3 = Colorpicker.Color})
                    Items["PaletteDragger"]:Tween(nil, {BackgroundColor3 = Colorpicker.Color})
                    Items["Palette"]:Tween(nil, {BackgroundColor3 = FromHSV(Hue, 1, 1)})
                    Items["AlphaDragger"]:Tween(nil, {BackgroundColor3 = Colorpicker.Color})
                    Items["HexColor"]:Tween(nil, {BackgroundColor3 = Colorpicker.Color})

                    if Colorpicker.SelectedFormat == "HEX" then
                        Items["HexInput"].Instance.Text = Library:ToRich("#", Library.Theme["Text 2"])..Colorpicker.HexValue
                    else
                        local Red, Green, Blue = math.floor(Colorpicker.Color.R * 255), math.floor(Colorpicker.Color.G * 255), math.floor(Colorpicker.Color.B * 255)
                        Items["HexInput"].Instance.Text = tostring(Red)..", "..tostring(Green)..", "..tostring(Blue)
                    end

                    Items["AlphaValue"].Instance.Text = math.floor(Colorpicker.Alpha * 100) .. Library:ToRich("%", Library.Theme["Text 2"])

                    if not IsFromAlpha then 
                        Items["Alpha"]:Tween(nil, {BackgroundColor3 = Colorpicker.Color})
                    end

                    if Data.Callback then 
                        Library:SafeCall(Data.Callback, Colorpicker.Color, Colorpicker.Alpha)
                    end
                end

                Dropdown:Add("HEX"):Set()
                Dropdown:Add("RGB")

                local SlidingPalette = false
                local PaletteChanged 

                local SlidingAlpha = false
                local AlphaChanged

                local SlidingHue = false
                local HueChanged

                function Colorpicker:SlidePalette(Input)
                    if not Input or not SlidingPalette then
                        return
                    end

                    local ValueX = MathClamp(1 - (Input.Position.X - Items["Palette"].Instance.AbsolutePosition.X) / Items["Palette"].Instance.AbsoluteSize.X, 0, 1)
                    local ValueY = MathClamp(1 - (Input.Position.Y - Items["Palette"].Instance.AbsolutePosition.Y) / Items["Palette"].Instance.AbsoluteSize.Y, 0, 1)

                    Colorpicker.Saturation = ValueX
                    Colorpicker.Value = ValueY

                    local SlideX = MathClamp((Input.Position.X - Items["Palette"].Instance.AbsolutePosition.X) / Items["Palette"].Instance.AbsoluteSize.X, 0, 0.975)
                    local SlideY = MathClamp((Input.Position.Y - Items["Palette"].Instance.AbsolutePosition.Y) / Items["Palette"].Instance.AbsoluteSize.Y, 0, 0.975)

                    Items["PaletteDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(SlideX, 0, SlideY, 0)})
                    Colorpicker:Update()
                end

                function Colorpicker:SlideHue(Input)
                    if not Input or not SlidingHue then
                        return
                    end
                    
                    local ValueX = MathClamp((Input.Position.X - Items["Hue"].Instance.AbsolutePosition.X) / Items["Hue"].Instance.AbsoluteSize.X, 0, 1)

                    Colorpicker.Hue = ValueX

                    local SlideX = MathClamp((Input.Position.X - Items["Hue"].Instance.AbsolutePosition.X) / Items["Hue"].Instance.AbsoluteSize.X, 0, 0.975)

                    Items["HueDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(SlideX, 0, 0.5, 0)})
                    Colorpicker:Update()
                end

                function Colorpicker:SlideAlpha(Input)
                    if not Input or not SlidingAlpha then
                        return
                    end

                    local ValueX = MathClamp((Input.Position.X - Items["Alpha"].Instance.AbsolutePosition.X) / Items["Alpha"].Instance.AbsoluteSize.X, 0, 1)

                    Colorpicker.Alpha = ValueX

                    local SlideX = MathClamp((Input.Position.X - Items["Alpha"].Instance.AbsolutePosition.X) / Items["Alpha"].Instance.AbsoluteSize.X, 0, 0.975)

                    Items["AlphaDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(SlideX, 0, 0.5, 0)})
                    Colorpicker:Update(true)
                end

                function Colorpicker:Set(Color, Alpha)
                    if type(Color) == "table" then
                        Color = FromRGB(Color[1], Color[2], Color[3])
                    elseif type(Color) == "string" then
                        Color = FromHex(Color)
                    else
                        Color = Color
                    end 
                    Colorpicker.Hue, Colorpicker.Saturation, Colorpicker.Value = Color:ToHSV()
                    Colorpicker.Alpha = Alpha or 0  

                    local PaletteValueX = MathClamp(1 - Colorpicker.Saturation, 0, 0.975)
                    local PaletteValueY = MathClamp(1 - Colorpicker.Value, 0, 0.975)

                    local AlphaPositionX = MathClamp(Colorpicker.Alpha, 0, 0.975)
                        
                    local HuePositionX = MathClamp(Colorpicker.Hue, 0, 0.975)

                    Items["PaletteDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(PaletteValueX, 0, PaletteValueY, 0)})
                    Items["HueDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(HuePositionX, 0, 0.5, 0)})
                    Items["AlphaDragger"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2New(AlphaPositionX, 0, 0.5, 0)})
                    Colorpicker:Update()
                end

                Items["ColorpickerButton"]:Connect("MouseButton1Down", function()
                    Colorpicker:SetOpen(not Colorpicker.IsOpen)
                end)

                Items["Palette"]:Connect("InputBegan", function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        SlidingPalette = true 

                        Colorpicker:SlidePalette(Input)

                        if PaletteChanged then
                            return
                        end

                        PaletteChanged = Input.Changed:Connect(function()
                            if Input.UserInputState == Enum.UserInputState.End then
                                SlidingPalette = false

                                PaletteChanged:Disconnect()
                                PaletteChanged = nil
                            end
                        end)
                    end
                end)

                Items["HueInline"]:Connect("InputBegan", function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        SlidingHue = true 

                        Colorpicker:SlideHue(Input)

                        if HueChanged then
                            return
                        end

                        HueChanged = Input.Changed:Connect(function()
                            if Input.UserInputState == Enum.UserInputState.End then
                                SlidingHue = false

                                HueChanged:Disconnect()
                                HueChanged = nil
                            end
                        end)
                    end
                end)

                Items["Alpha"]:Connect("InputBegan", function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        SlidingAlpha = true 

                        Colorpicker:SlideAlpha(Input)

                        if AlphaChanged then
                            return
                        end

                        AlphaChanged = Input.Changed:Connect(function()
                            if Input.UserInputState == Enum.UserInputState.End then
                                SlidingAlpha = false

                                AlphaChanged:Disconnect()
                                AlphaChanged = nil
                            end
                        end)
                    end
                end)

                Library:Connect(UserInputService.InputBegan, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        if not Colorpicker.IsOpen or Dropdown.IsOpen then
                            return
                        end

                        if Library:IsMouseOverFrame(Items["ColorpickerWindow"]) or Library:IsMouseOverFrame(Items["OptionHolder"])  then
                            return
                        end

                        Colorpicker:SetOpen(false)
                    end
                end)

                Library:Connect(UserInputService.InputChanged, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                        if SlidingPalette then 
                            Colorpicker:SlidePalette(Input)
                        end

                        if SlidingHue then
                            Colorpicker:SlideHue(Input)
                        end

                        if SlidingAlpha then
                            Colorpicker:SlideAlpha(Input)
                        end
                    end
                end)

                Items["HexInput"]:Connect("FocusLost", function()
                    if Colorpicker.SelectedFormat == "RGB" then
                        local RgbText = Items["HexInput"].Instance.Text
                        local Red, Green, Blue = RgbText:match("(%d+),%s*(%d+),%s*(%d+)")
                        Red, Green, Blue = tonumber(Red), tonumber(Green), tonumber(Blue)

                        Colorpicker:Set({Red, Green, Blue}, Colorpicker.Alpha)
                    elseif Colorpicker.SelectedFormat == "HEX" then
                        Colorpicker:Set(tostring(Items["HexInput"].Instance.Text), Colorpicker.Alpha)
                    end
                end)

                setmetatable(Colorpicker, Library.Sections)

                if Data.Default then
                    Colorpicker:Set(Data.Default, Data.Alpha)
                end

                Library.SetFlags[Colorpicker.Flag] = function(Value, Alpha)
                    Colorpicker:Set(Value, Alpha)
                end

                return Colorpicker, Items 
            end

            Library.Watermark = function(self)
                local Watermark = { 
                    IsOpen = true,
                    Widgets = { }
                }

                local Items = { } do 
                    Items["Watermark"] = Instances:Create("Frame", {
                        Parent = Library.Holder.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0),
                        BackgroundTransparency = 0.20000000298023224,
                        Position = UDim2FromOffset(Camera.ViewportSize.X - 225, 10),
                        Size = UDim2New(0, 0, 0, 35),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundColor3 = Library.Theme["Background 2"]
                    }):AddToTheme({BackgroundColor3 = 'Background 2'})

                    Library:MakeBlurred(Items["Watermark"], Watermark)
                    Items["Watermark"]:MakeDraggable()
                    
                    Items["Watermark"].Instance:GetPropertyChangedSignal("Position"):Connect(function()
                        Library.Flags["WatermarkPosition"] = {
                            X = Items["Watermark"].Instance.Position.X.Offset,
                            Y = Items["Watermark"].Instance.Position.Y.Offset
                        }
                    end)

                    Library.SetFlags["WatermarkPosition"] = function(Value)
                        if Value and Value.X and Value.Y then
                            Items["Watermark"].Instance.Position = UDim2New(0, Value.X, 0, Value.Y)
                        end
                    end
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Watermark"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Instances:Create("UIListLayout", {
                        Parent = Items["Watermark"].Instance,
                        Name = "\0",
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        FillDirection = Enum.FillDirection.Horizontal,
                        Padding = UDimNew(0, 8),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Instances:Create("UIPadding", {
                        Parent = Items["Watermark"].Instance,
                        Name = "\0",
                        PaddingBottom = UDimNew(0, 1),
                        PaddingRight = UDimNew(0, 12),
                        PaddingLeft = UDimNew(0, 12)
                    })
                end

                function Watermark:SetVisibility(Bool)
                    Items["Watermark"].Instance.Visible = Bool 
                    Watermark.IsOpen = Bool
                end

                function Watermark:SetCenter()
                    local CenterPosition = Items["Watermark"].Instance.AbsolutePosition
                    task.wait()
                    Items["Watermark"].Instance.AnchorPoint = Vector2New(0, 0)

                    Items["Watermark"].Instance.Position = UDim2New(0, CenterPosition.X, 0, CenterPosition.Y)
                end

                function Watermark:AddWidget(Data)
                    local Widget 

                    if Data.Type == "Image" then
                        Widget = Instances:Create("ImageLabel", {
                            Parent = Items["Watermark"].Instance,
                            Name = "\0",
                            ImageColor3 = Data.ImageColor,
                            BorderColor3 = FromRGB(0, 0, 0),
                            Image = Data.Image,
                            BackgroundTransparency = 1,
                            Size = UDim2New(0, 18, 0, 18),
                            BorderSizePixel = 0
                        })
                    elseif Data.Type == "Text" then
                        Widget = Instances:Create("TextLabel", {
                            Parent = Items["Watermark"].Instance,
                            Name = "\0",
                            FontFace = Library.BoldFont,
                            TextColor3 = Data.TextColor,
                            BorderColor3 = FromRGB(0, 0, 0),
                            Text = Data.Text,
                            BackgroundTransparency = 1,
                            Size = UDim2New(0, 0, 0, 15),
                            BorderSizePixel = 0,
                            AutomaticSize = Enum.AutomaticSize.X,
                            TextSize = 18
                        })                    
                    end

                    function Widget:Set(Property, Value)
                        Widget.Instance[Property] = Value
                    end

                    function Widget:Remove()
                        Widget:Clean()
                        TableRemove(Watermark.Widgets, TableFind(Watermark.Widgets, Widget))
                    end

                    TableInsert(Watermark.Widgets, Widget)
                    return Widget
                end

                --Watermark:SetCenter()

                return Watermark
            end

            Library.KeybindList = function(self, Name)
                local KeybindList = { }
                Library.KeyList = KeybindList

                local Items = { } do 
                    Items["KeybindList"] = Instances:Create("Frame", {
                        Parent = Library.Holder.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 20, 0.5, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.XY
                    })
                    
                    Items["Top"] = Instances:Create("Frame", {
                        Parent = Items["KeybindList"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 0.20000000298023224,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 100, 0, 30),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Background 2"]
                    }):AddToTheme({BackgroundColor3 = 'Background 2'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Top"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 10)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["Top"].Instance,
                        Name = "\0",
                        Color = Library.Theme["Outline 2"],
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Outline 2'})
                    
                    Items["Icon"] = Instances:Create("ImageLabel", {
                        Parent = Items["Top"].Instance,
                        Name = "\0",
                        ImageColor3 = Library.Theme["Accent"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://84631169716412",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 8, 0.5, 0),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = 'Accent'})
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Top"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text 2"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "Hotkeys",
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 34, 0.5, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text 2'})
                    
                    Items["Content"] = Instances:Create("Frame", {
                        Parent = Items["KeybindList"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0, 40),
                        BorderColor3 = FromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.XY
                    })                

                    Instances:Create("UIListLayout", {
                        Parent = Items["Content"].Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 6),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })                
                end

                function KeybindList:SetText(Text)
                    Items["Text"].Instance.Text = tostring(Text)
                end

                function KeybindList:SetVisibility(Bool)
                    Items["KeybindList"].Instance.Visible = Bool 
                end

                function KeybindList:SetCenter()
                    local CenterPosition = Items["KeybindList"].Instance.AbsolutePosition
                    task.wait()
                    Items["KeybindList"].Instance.AnchorPoint = Vector2New(0, 0)

                    Items["KeybindList"].Instance.Position = UDim2New(0, CenterPosition.X, 0, CenterPosition.Y)
                end

                function KeybindList:Add(Name)
                    local NewItems = { } do 
                        NewItems["Key"] = Instances:Create("Frame", {
                            Parent = Items["Content"].Instance,
                            Name = "\0",
                            BackgroundTransparency = 1,
                            Size = UDim2New(0, 0, 0, 25),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BorderSizePixel = 0,
                            AutomaticSize = Enum.AutomaticSize.X
                        })
                        
                        NewItems["Text"] = Instances:Create("TextLabel", {
                            Parent = NewItems["Key"].Instance,
                            Name = "\0",
                            FontFace = Library.Font,
                            TextColor3 = Library.Theme["Text 2"],
                            BorderColor3 = FromRGB(0, 0, 0),
                            Text = Name,
                            BackgroundTransparency = 0.5,
                            Size = UDim2New(0, 0, 0, 25),
                            BorderSizePixel = 0,
                            AutomaticSize = Enum.AutomaticSize.X,
                            TextSize = 18,
                            BackgroundColor3 = Library.Theme["Element"]
                        }):AddToTheme({BackgroundColor3 = 'Element'})
                        
                        Instances:Create("UIStroke", {
                            Parent = NewItems["Text"].Instance,
                            Name = "\0",
                            Color = Library.Theme["Outline 2"],
                            Transparency = 0.4399999976158142,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                        }):AddToTheme({Color = 'Outline 2'})
                        
                        Instances:Create("UIPadding", {
                            Parent = NewItems["Text"].Instance,
                            Name = "\0",
                            PaddingRight = UDimNew(0, 8),
                            PaddingLeft = UDimNew(0, 8)
                        })
                        
                        Instances:Create("UICorner", {
                            Parent = NewItems["Text"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 7)
                        })
                        
                        NewItems["Value"] = Instances:Create("Frame", {
                            Parent = NewItems["Key"].Instance,
                            Name = "\0",
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 0.5,
                            Position = UDim2New(0, 88, 0, 0),
                            Size = UDim2New(0, 0, 0, 25),
                            BorderSizePixel = 0,
                            AutomaticSize = Enum.AutomaticSize.X,
                            BackgroundColor3 = Library.Theme["Element"]
                        }):AddToTheme({BackgroundColor3 = 'Element'})
                        
                        Instances:Create("UIStroke", {
                            Parent = NewItems["Value"].Instance,
                            Name = "\0",
                            Color = Library.Theme["Outline 2"],
                            Transparency = 0.4399999976158142,
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                        }):AddToTheme({Color = 'Outline 2'})
                        
                        Instances:Create("UIPadding", {
                            Parent = NewItems["Value"].Instance,
                            Name = "\0",
                            PaddingRight = UDimNew(0, 8),
                            PaddingLeft = UDimNew(0, 8)
                        })
                        
                        Instances:Create("UICorner", {
                            Parent = NewItems["Value"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 7)
                        })
                        
                        NewItems["Icon"] = Instances:Create("ImageLabel", {
                            Parent = NewItems["Value"].Instance,
                            Name = "\0",
                            BorderColor3 = FromRGB(0, 0, 0),
                            AnchorPoint = Vector2New(0.5, 0.5),
                            Image = "rbxassetid://115898004142651",
                            BackgroundTransparency = 1,
                            Position = UDim2New(0.5, 0, 0.5, 0),
                            Size = UDim2New(0, 18, 0, 18),
                            BorderSizePixel = 0
                        })                
                    end

                    function NewItems:UpdateSize()
                        NewItems["Value"].Instance.Position = UDim2New(0, NewItems["Text"].Instance.TextBounds.X + 25, 0, 0)
                    end

                    function NewItems:Set(Name)
                        NewItems["Text"].Instance.Text = Name
                        NewItems:UpdateSize()
                    end

                    function NewItems:SetStatus(Bool)
                        if Bool then 
                            NewItems["Icon"].Instance.Image = "rbxassetid://91908010089766"
                        else
                            NewItems["Icon"].Instance.Image = "rbxassetid://115898004142651"
                        end
                    end

                    NewItems:UpdateSize()
                    return NewItems 
                end

                KeybindList:SetText(Name)
                KeybindList:SetCenter()

                return KeybindList 
            end

            Library.Notification = function(self, Name, Icon, Color, Duration)
                local Items = { } do 
                    Items["Notification"] = Instances:Create("Frame", {
                        Parent = Library.NotifHolder.Instance,
                        Name = "\0",
                        ClipsDescendants = true,
                        BorderColor3 = FromRGB(0, 0, 0),
                        BackgroundTransparency = 0.20000000298023224,
                        Size = UDim2New(0, 0, 0, 30),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundColor3 = Library.Theme["Background 2"]
                    }):AddToTheme({BackgroundColor3 = 'Background 2'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Notification"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 12)
                    })
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["Notification"].Instance,
                        Name = "\0",
                        PaddingRight = UDimNew(0, 12),
                        PaddingLeft = UDimNew(0, 8)
                    })
                    
                    Items["Icon"] = Instances:Create("ImageLabel", {
                        Parent = Items["Notification"].Instance,
                        Name = "\0",
                        ImageColor3 = Color,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://"..Icon,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 6, 0.5, 0),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0
                    })
                    
                    Items["Liner"] = Instances:Create("Frame", {
                        Parent = Items["Notification"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(0, 0.5),
                        Position = UDim2New(0, -10, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 4, 1, -11),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Color
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Liner"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Notification"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text 2"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Name,
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 34, 0.5, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text 2'})                 
                end

                local Size = Vector2New(Items["Text"].Instance.TextBounds.X + 55, 30)
                Items["Notification"].Instance.Size = UDim2New(0, 0, 0, 30)

                for Index, Value in Items do 
                    if Value.Instance:IsA("Frame") then
                        Value.Instance.BackgroundTransparency = 1
                    elseif Value.Instance:IsA("TextLabel") then 
                        Value.Instance.TextTransparency = 1
                    elseif Value.Instance:IsA("UIStroke") then
                        Value.Instance.Transparency = 1
                    elseif Value.Instance:IsA("ImageLabel") then 
                        Value.Instance.ImageTransparency = 1
                    end
                end 

                Items["Notification"].Instance.AutomaticSize = Enum.AutomaticSize.None
                local Info = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0)

                Library:Thread(function()
                    for Index, Value in Items do 
                        if Value.Instance:IsA("Frame") then
                            Value:Tween(Info, {BackgroundTransparency = 0})
                        elseif Value.Instance:IsA("TextLabel") then 
                            Value:Tween(Info, {TextTransparency = 0})
                        elseif Value.Instance:IsA("UIStroke") then 
                            Value:Tween(Info, {Transparency = 0})
                        elseif Value.Instance:IsA("ImageLabel") then 
                            Value:Tween(Info, {ImageTransparency = 0})
                        end
                    end

                    Items["Notification"]:Tween(Info, {Size = UDim2New(0, Size.X, 0, 30)})

                    task.delay(Duration + 0.1, function()
                        for Index, Value in Items do 
                            if Value.Instance:IsA("Frame") then
                                Value:Tween(nil, {BackgroundTransparency = 1})
                            elseif Value.Instance:IsA("TextLabel") then 
                                Value:Tween(nil, {TextTransparency = 1})
                            elseif Value.Instance:IsA("UIStroke") then 
                                Value:Tween(nil, {Transparency = 1})
                            elseif Value.Instance:IsA("ImageLabel") then 
                                Value:Tween(nil, {ImageTransparency = 1})
                            end
                        end

                        Items["Notification"]:Tween(Info, {Size = UDim2New(0, 0, 0, 30)})
                        task.wait(0.5)
                        Items["Notification"]:Clean()
                    end)
                end)
            end

            Library.Tooltip = {
                Instance = nil,
                TextLabel = nil,
                HoverStart = 0,
                CurrentText = nil,
                TargetItem = nil, -- Store the hovered item
                IsShown = false
            }

            -- Initialize Tooltip UI immediately (hidden)
            local function InitTooltip()
                if Library.Tooltip.Instance then return end
                
                local TooltipFrame = Instances:Create("Frame", {
                    Parent = Library.OtherHolder.Instance,
                    Name = "Tooltip",
                    Size = UDim2New(0, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Library.Theme["Background 2"],
                    BorderColor3 = FromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    ZIndex = 10000,
                    Visible = false,
                    Active = false,
                    Selectable = false,
                    BackgroundTransparency = 0.1,
                    AnchorPoint = Vector2New(0.5, 0) -- Center horizontally
                }):AddToTheme({BackgroundColor3 = 'Background 2'})

                Instances:Create("UICorner", {
                    Parent = TooltipFrame.Instance,
                    CornerRadius = UDimNew(0, 4)
                })
                
                Instances:Create("UIStroke", {
                    Parent = TooltipFrame.Instance,
                    Color = Library.Theme["Outline 2"],
                    Thickness = 1,
                }):AddToTheme({Color = 'Outline 2'})

                local TooltipText = Instances:Create("TextLabel", {
                    Parent = TooltipFrame.Instance,
                    Text = "",
                    TextColor3 = Library.Theme["Text"],
                    TextSize = 14,
                    FontFace = Library.Font,
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    ZIndex = 10001,
                    Size = UDim2New(0, 0, 0, 0)
                }):AddToTheme({TextColor3 = 'Text'})

                Instances:Create("UIPadding", {
                    Parent = TooltipFrame.Instance,
                    PaddingTop = UDimNew(0, 4),
                    PaddingBottom = UDimNew(0, 4),
                    PaddingLeft = UDimNew(0, 6),
                    PaddingRight = UDimNew(0, 6)
                })

                Library.Tooltip.Instance = TooltipFrame
                Library.Tooltip.TextLabel = TooltipText

                Library:MakeBlurred(TooltipFrame.Instance, {IsOpen = true})
            end

            -- Global RenderStepped for Tooltip
            Library:Connect(RunService.RenderStepped, function()
                if not Library.Tooltip.CurrentText or not Library.Tooltip.TargetItem then
                    if Library.Tooltip.Instance and Library.Tooltip.Instance.Instance.Visible then
                        Library.Tooltip.Instance.Instance.Visible = false
                        Library.Tooltip.IsShown = false
                    end
                    return
                end

                if tick() - Library.Tooltip.HoverStart < 1 then
                    return -- Wait for delay
                end

                if not Library.Tooltip.Instance then
                    InitTooltip()
                end

                if not Library.Tooltip.IsShown then
                     Library.Tooltip.Instance.Instance.Visible = true
                     Library.Tooltip.IsShown = true
                end

                Library.Tooltip.TextLabel.Instance.Text = Library.Tooltip.CurrentText
                
                -- Position relative to the mouse cursor
                local MouseLocation = UserInputService:GetMouseLocation()
                local TooltipPosX = MouseLocation.X + 20
                local TooltipPosY = MouseLocation.Y + 20

                Library.Tooltip.Instance.Instance.Position = UDim2New(0, TooltipPosX, 0, TooltipPosY)
            end)
    
            Library.ShowTooltip = function(self, Text, Item)
                Library.Tooltip.CurrentText = Text
                Library.Tooltip.TargetItem = Item
                Library.Tooltip.HoverStart = tick()
            end
    
            Library.HideTooltip = function(self)
                Library.Tooltip.CurrentText = nil
                Library.Tooltip.TargetItem = nil
                Library.Tooltip.IsShown = false
                if Library.Tooltip.Instance then
                    Library.Tooltip.Instance.Instance.Visible = false
                end
            end

            Library.Window = function(self, Data)
                Data = Data or { }
                
                -- Fetch user preferences from dashboard (async, non-blocking)
                task.spawn(function()
                    Library:FetchPreferences()
                end)

                local Window = {
                    Name = Data.Name or Data.name or "Window",
                    SubName = Data.SubName or Data.subname or "SubName",
                    TimeLeft = Data.TimeLeft or Data.timeleft or "59 days left",
                    Logo = Data.Logo or Data.logo or "119425601173954",
                    ConfigHeader = nil,
                    
                    Pages = { },
                    Sections = { },
                    Items = { },
                    IsOpen = false
                }

                local Items = { } do 
                    Items["MainFrame"] = Instances:Create("CanvasGroup", {
                        Parent = Library.Holder.Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0.5, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0.5, 0, 0.5, 0),
                        Size = UDim2New(0, 865, 0, 618),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(13, 17, 18)
                    })

                    Items["MainFrame"]:MakeResizeable(Vector2New(865, 618), Vector2New(9999, 9999))
                    
                    Library:MakeBlurred(Items["MainFrame"], Window)
                    
                    Instances:Create("UICorner", {
                        Parent = Items["MainFrame"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 15)
                    })

                    Instances:Create("UIGradient", {
                        Parent = Items["MainFrame"].Instance,
                        Name = "\0",
                        Rotation = -90,
                        Transparency = NumSequence{NumSequenceKeypoint(0, 0.15000000596046448), NumSequenceKeypoint(0.446, 0.15000000596046448), NumSequenceKeypoint(0.759, 0.15000000596046448), NumSequenceKeypoint(0.843, 0.15000000596046448), NumSequenceKeypoint(0.879, 0.15000000596046448), NumSequenceKeypoint(0.9, 0.15000000596046448), NumSequenceKeypoint(0.953, 0.15000000596046448), NumSequenceKeypoint(1, 0.20000000298023224)}
                    })          
                    
                    Items["SideOutline"] = Instances:Create("Frame", {
                        Parent = Items["MainFrame"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 250, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Outline"]
                    }):AddToTheme({BackgroundColor3 = 'Outline'})

                    Items["SideOutline"]:MakeDraggable(Items["MainFrame"])

                    Items["SideInline"] = Instances:Create("Frame", {
                        Parent = Items["SideOutline"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 1, 0, 1),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -2, 1, -2),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Background 2"]
                    }):AddToTheme({BackgroundColor3 = 'Background 2'})
                    
                    Items["LogoBackground"] = Instances:Create("Frame", {
                        Parent = Items["SideInline"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 0.6000000238418579,
                        Position = UDim2New(0, 15, 0, 15),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 40, 0, 40),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Logo Background"]
                    }):AddToTheme({BackgroundColor3 = 'Logo Background'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["LogoBackground"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 12)
                    })
                    
                    Items["Icon"] = Instances:Create("ImageLabel", {
                        Parent = Items["LogoBackground"].Instance,
                        Name = "\0",
                        ScaleType = Enum.ScaleType.Fit,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0.5, 0.5),
                        Image = "rbxassetid://"..Window.Logo,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0.5, 0, 0.5, 0),
                        Size = UDim2New(1, -10, 1, -10),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})
                    
                    Instances:Create("UIGradient", {
                        Parent = Items["Icon"].Instance,
                        Name = "\0",
                        Rotation = 90,
                        Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(167, 167, 167))}
                    })
                    
                    Items["Pages"] = Instances:Create("ScrollingFrame", {
                        Parent = Items["SideInline"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0, 70),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, -135), -- Stops before UserInfo
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Text"],
                        ScrollBarThickness = 0,
                        CanvasSize = UDim2New(0, 0, 0, 0),
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        ScrollingDirection = Enum.ScrollingDirection.Y,
                        Active = true
                    })
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["Pages"].Instance,
                        Name = "\0",
                        PaddingTop = UDimNew(0, 8),
                        PaddingBottom = UDimNew(0, 15),
                        PaddingRight = UDimNew(0, 39),
                        PaddingLeft = UDimNew(0, 15)
                    })

                    Instances:Create("UIListLayout", {
                        Parent = Items["Pages"].Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 10),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })                

                    Items["SubTitle"] = Instances:Create("TextLabel", {
                        Parent = Items["SideInline"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        TextTransparency = 0.5,
                        Text = Window.SubName,
                        Size = UDim2New(0, 0, 0, 15),
                        BorderColor3 = FromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 65, 0, 38),
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 14,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["SideInline"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 15)
                    })
                    
                    Items["Title"] = Instances:Create("TextLabel", {
                        Parent = Items["SideInline"].Instance,
                        Name = "\0",
                        FontFace = Library.BoldFont,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Window.Name,
                        Size = UDim2New(0, 0, 0, 15),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 65, 0, 18),
                        TextWrapped = true,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 22,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["SideOutline"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 15)
                    })

                    Instances:Create("Frame", {
                        Parent = Items["SideInline"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 18, 0, 65),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -62, 0, 1),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Liner"]
                    }):AddToTheme({BackgroundColor3 = 'Liner'})

                    Items["UserInfo"] = Instances:Create("Frame", {
                        Parent = Items["SideInline"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 1),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 6, 1, -15),
                        Size = UDim2New(1, -40, 0, 50),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})
                    
                    Instances:Create("Frame", {
                        Parent = Items["UserInfo"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 12, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -24, 0, 1),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Liner"]
                    }):AddToTheme({BackgroundColor3 = 'Liner'})

                    local Content, _ = Players:GetUserThumbnailAsync(Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                    
                    Items["AvatarIcon"] = Instances:Create("ImageLabel", {
                        Parent = Items["UserInfo"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 1),
                        Image = Content,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 12, 1, 3),
                        Size = UDim2New(0, 40, 0, 40),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["AvatarIcon"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Items["UIStroke"] = Instances:Create("UIStroke", {
                        Parent = Items["AvatarIcon"].Instance,
                        Name = "\0",
                        Color = FromRGB(77, 126, 254),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Accent'})
                    
                    Instances:Create("UIGradient", {
                        Parent = Items["UIStroke"].Instance,
                        Name = "\0",
                        Rotation = 90,
                        Color = RGBSequence{RGBSequenceKeypoint(0, FromRGB(255, 255, 255)), RGBSequenceKeypoint(1, FromRGB(102, 102, 102))}
                    })
                    
                    Items["Username"] = Instances:Create("TextLabel", {
                        Parent = Items["UserInfo"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = LocalPlayer.Name,
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 60, 0, 15),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})
                    
                    Items["TimeLeft"] = Instances:Create("TextLabel", {
                        Parent = Items["UserInfo"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        TextTransparency = 0.5,
                        Text = Window.TimeLeft,
                        Size = UDim2New(0, 0, 0, 15),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 60, 0, 34),
                        BorderColor3 = FromRGB(0, 0, 0),
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 16,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})

                    Items["InlineOutline"] = Instances:Create("Frame", {
                        Parent = Items["MainFrame"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 225, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -225, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Outline"]
                    }):AddToTheme({BackgroundColor3 = 'Outline'})

                    Instances:Create("UICorner", {
                        Parent = Items["InlineOutline"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 15)
                    })

                    Items["Inline"] = Instances:Create("Frame", {
                        Parent = Items["InlineOutline"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 1, 0, 1),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -2, 1, -2),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Background"]
                    }):AddToTheme({BackgroundColor3 = 'Background'})

                    -- Inline drag removed: active children (ConfigHeader, ScrollingFrames) sink input
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Inline"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 15)
                    })
                    
                    Items["Content"] = Instances:Create("Frame", {
                        Parent = Items["Inline"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})

                    Items["ConfigHeader"] = Instances:Create("TextButton", {
                        Parent = Items["Content"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 10, 0, 12),
                        Size = UDim2New(0, 264, 0, 28),
                        BorderSizePixel = 0,
                        TextSize = 14
                    })

                    Items["ConfigHeader"]:MakeDraggable(Items["MainFrame"])

                    Instances:Create("UICorner", {
                        Parent = Items["ConfigHeader"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })

                    Instances:Create("Frame", {
                        Parent = Items["Content"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 10, 0, 55),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -20, 0, 1),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(27, 26, 35)
                    }):AddToTheme({BackgroundColor3 = 'Liner'})
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["ConfigHeader"].Instance,
                        Name = "\0",
                        Color = Library.Theme["Outline"],
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Outline'})
                    
                    Items["ConfigHeaderIcon"] = Instances:Create("ImageLabel", {
                        Parent = Items["ConfigHeader"].Instance,
                        Name = "\0",
                        ImageColor3 = FromRGB(200, 200, 207),
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://115980460667207",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 6, 0.5, 0),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = 'Text'})
                    
                    Instances:Create("Frame", {
                        Parent = Items["ConfigHeader"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 28, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 1, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Outline"]
                    }):AddToTheme({BackgroundColor3 = 'Outline'})
                    
                    Items["ConfigText"] = Instances:Create("TextLabel", {
                        Parent = Items["ConfigHeader"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(200, 200, 207),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "None",
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(1, -60, 0, 15),
                        BackgroundTransparency = 1,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Position = UDim2New(0, 40, 0.5, 0),
                        BorderSizePixel = 0,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})
                    
                    Instances:Create("UIGradient", {
                        Parent = Items["ConfigText"].Instance,
                        Name = "\0",
                        Transparency = NumSequence{NumSequenceKeypoint(0, 0), NumSequenceKeypoint(0.676, 0), NumSequenceKeypoint(1, 1)}
                    })
                    
                    Items["ArrowIcon"] = Instances:Create("ImageLabel", {
                        Parent = Items["ConfigHeader"].Instance,
                        Name = "\0",
                        ImageColor3 = Library.Theme["Text 2"],
                        ScaleType = Enum.ScaleType.Fit,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(1, 0.5),
                        Image = "rbxassetid://111436698580046",
                        BackgroundTransparency = 1,
                        Position = UDim2New(1, -10, 0.5, 0),
                        Size = UDim2New(0, 9, 0, 5),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = 'Text 2'})     
                    
                    Items["ConfigHeaderWindow"] = Instances:Create("TextButton", {
                        Parent = Library.UnusedHolder.Instance,
                        Text = "",
                        AutoButtonColor = false,
                        Name = "\0",
                        Visible = false,
                        BorderColor3 = FromRGB(0, 0, 0),
                        BackgroundTransparency = 0.1,
                        Position = UDim2New(0, 489, 0, 214),
                        Size = UDim2New(0, 300, 0, 100),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = FromRGB(15, 16, 21)
                    }):AddToTheme({BackgroundColor3 = 'Background'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["ConfigHeaderWindow"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 15)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["ConfigHeaderWindow"].Instance,
                        Name = "\0",
                        Color = Library.Theme["Outline 2"],
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Outline 2'})
                    
                    Items["Top"] = Instances:Create("Frame", {
                        Parent = Items["ConfigHeaderWindow"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 50),
                        BorderSizePixel = 0
                    })
                    
                    Instances:Create("Frame", {
                        Parent = Items["Top"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(0, 1),
                        Position = UDim2New(0, 12, 1, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -24, 0, 1),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(27, 26, 35)
                    }):AddToTheme({BackgroundColor3 = "Liner"})
                    
                    Items["Presets"] = Instances:Create("Frame", {
                        Parent = Items["Top"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 10, 0, 10),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 95, 0, 28),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(28, 27, 38)
                    }):AddToTheme({BackgroundColor3 = "Element"})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Presets"].Instance,
                        Name = "\0"
                    })
                    
                    Items["CloudIcon"] = Instances:Create("ImageLabel", {
                        Parent = Items["Presets"].Instance,
                        Name = "\0",
                        ImageColor3 = FromRGB(81, 124, 253),
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://99531003828686",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 8, 0.5, 0),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = "Accent"})
                    
                    Items["PresetsText"] = Instances:Create("TextLabel", {
                        Parent = Items["Presets"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(81, 124, 253),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "Presets",
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(0, 9, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 34, 0.5, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = "Accent"})
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["Presets"].Instance,
                        Name = "\0",
                        Color = Library.Theme["Outline 2"],
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Outline 2'})
                    
                    Items["PlusIcon"] = Instances:Create("ImageButton", {
                        Parent = Items["Top"].Instance,
                        Name = "\0",
                        ImageColor3 = FromRGB(200, 200, 207),
                        BorderColor3 = FromRGB(0, 0, 0),
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(1, 0.5),
                        Image = "rbxassetid://116054682931186",
                        BackgroundTransparency = 1,
                        Position = UDim2New(1, -10, 0.5, -2),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = "Text 2"})
                    
                    Items["DeleteIcon"] = Instances:Create("ImageButton", {
                        Parent = Items["Top"].Instance,
                        Name = "\0",
                        ImageColor3 = FromRGB(200, 200, 207),
                        BorderColor3 = FromRGB(0, 0, 0),
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(1, 0.5),
                        Image = "rbxassetid://106573800301941",
                        BackgroundTransparency = 1,
                        Position = UDim2New(1, -32, 0.5, -2),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = "Text 2"})
                    
                    Items["ConfigContent"] = Instances:Create("Frame", {
                        Parent = Items["ConfigHeaderWindow"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 12, 0, 105),
                        Size = UDim2New(1, -24, 0, 1),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.Y
                    })

                    Instances:Create("UIPadding", {
                        Parent = Items["ConfigHeaderWindow"].Instance,
                        Name = "\0",
                        PaddingBottom = UDimNew(0, 12)
                    })                
                    
                    Instances:Create("UIListLayout", {
                        Parent = Items["ConfigContent"].Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 8),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })                
                    
                    Items["Search"] = Instances:Create("Frame", {
                        Parent = Items["ConfigHeaderWindow"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 12, 0, 60),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -55, 0, 30),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(28, 27, 38)
                    }):AddToTheme({BackgroundColor3 = "Element"})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Search"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["Search"].Instance,
                        Name = "\0",
                        Color = Library.Theme["Outline 2"],
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Outline 2'})

                    Instances:Create("Frame", {
                        Parent = Items["Search"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(0, 1),
                        Position = UDim2New(0, 0, 1, 8),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 1),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(27, 26, 35)
                    }):AddToTheme({BackgroundColor3 = "Liner"})                
                    
                    Items["SearchIcon"] = Instances:Create("ImageLabel", {
                        Parent = Items["Search"].Instance,
                        Name = "\0",
                        ImageColor3 = FromRGB(200, 200, 207),
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://93412599989519",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 10, 0.5, 0),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = "Text"})
                    
                    Items["SearchInput"] = Instances:Create("TextBox", {
                        Parent = Items["Search"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        AnchorPoint = Vector2New(0, 0.5),
                        PlaceholderColor3 = FromRGB(151, 150, 162),
                        PlaceholderText = "Search..",
                        TextSize = 18,
                        Size = UDim2New(1, -60, 0, 15),
                        TextColor3 = FromRGB(200, 200, 207),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        BackgroundTransparency = 1,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        CursorPosition = -1,
                        Position = UDim2New(0, 36, 0.5, 0),
                        BorderSizePixel = 0
                    }):AddToTheme({TextColor3 = "Text", PlaceholderColor3 = "Text 2"})  
                    
                    Items["SortIcon"] = Instances:Create("ImageButton", {
                        Parent = Items["ConfigHeaderWindow"].Instance,
                        Name = "\0",
                        ImageColor3 = FromRGB(200, 200, 207),
                        BorderColor3 = FromRGB(0, 0, 0),
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(1, 0),
                        Image = "rbxassetid://76151043492079",
                        BackgroundTransparency = 1,
                        Position = UDim2New(1, -13, 0, 63),
                        Size = UDim2New(0, 20, 0, 20),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = "Text"})   
                    
                    Items["RefreshIcon"] = Instances:Create("ImageButton", {
                        Parent = Items["Top"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(1, 0.5),
                        Image = "rbxassetid://93349220165339",
                        BackgroundTransparency = 1,
                        Position = UDim2New(1, -55, 0.5, -2),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0
                    })                

                    -- hover effects lul
                    Items["PlusIcon"]:OnHover(function()
                        Items["PlusIcon"]:ChangeItemTheme({ImageColor3 = "Text"})
                        Items["PlusIcon"]:Tween(nil, {ImageColor3 = Library.Theme.Text})
                    end)

                    Items["PlusIcon"]:OnHoverLeave(function()
                        Items["PlusIcon"]:ChangeItemTheme({ImageColor3 = "Text 2"})
                        Items["PlusIcon"]:Tween(nil, {ImageColor3 = Library.Theme["Text 2"]})
                    end)
                    --
                    Items["DeleteIcon"]:OnHover(function()
                        Items["DeleteIcon"]:ChangeItemTheme({ImageColor3 = "Text"})
                        Items["DeleteIcon"]:Tween(nil, {ImageColor3 = Library.Theme.Text})
                    end)

                    Items["DeleteIcon"]:OnHoverLeave(function()
                        Items["DeleteIcon"]:ChangeItemTheme({ImageColor3 = "Text 2"})
                        Items["DeleteIcon"]:Tween(nil, {ImageColor3 = Library.Theme["Text 2"]})
                    end)
                    --
                    Items["RefreshIcon"]:OnHover(function()
                        Items["RefreshIcon"]:ChangeItemTheme({ImageColor3 = "Text"})
                        Items["RefreshIcon"]:Tween(nil, {ImageColor3 = Library.Theme.Text})
                    end)

                    Items["RefreshIcon"]:OnHoverLeave(function()
                        Items["RefreshIcon"]:ChangeItemTheme({ImageColor3 = "Text 2"})
                        Items["RefreshIcon"]:Tween(nil, {ImageColor3 = Library.Theme["Text 2"]})
                    end)

                    local ConfigHeader = { 
                        IsOpen = false,
                        Selected = nil,
                        Configs = { }
                    } do 
                        local Debounce = false 
                        local RenderStepped 
            
                        function ConfigHeader:SetOpen(Bool)
                            if Debounce then 
                                return
                            end
            
                            ConfigHeader.IsOpen = Bool
            
                            Debounce = true 
            
                            if ConfigHeader.IsOpen then 
                                Items["ConfigHeaderWindow"].Instance.Visible = true
                                Items["ConfigHeaderWindow"].Instance.Parent = Library.OtherHolder.Instance
            
                                Items["ConfigHeaderWindow"].Instance.Position = UDim2New(0, Items["ConfigHeader"].Instance.AbsolutePosition.X, 0, Items["ConfigHeader"].Instance.AbsolutePosition.Y + Items["ConfigHeader"].Instance.AbsoluteSize.Y + 5)
            
                                for Index, Value in Library.OpenFrames do 
                                    if Value ~= ConfigHeader then 
                                        Value:SetOpen(false)
                                    end
                                end
            
                                Library.OpenFrames[ConfigHeader] = ConfigHeader 
                            else
                                if Library.OpenFrames[ConfigHeader] then 
                                    Library.OpenFrames[ConfigHeader] = nil
                                end
            
                                if RenderStepped then 
                                    RenderStepped:Disconnect()
                                    RenderStepped = nil
                                end
                            end
            
                            local Descendants = Items["ConfigHeaderWindow"].Instance:GetDescendants()
                            TableInsert(Descendants, Items["ConfigHeaderWindow"].Instance)
            
                            local NewTween
            
                            for Index, Value in Descendants do 
                                local TransparencyProperty = Tween:GetProperty(Value)
            
                                if not TransparencyProperty then
                                    continue 
                                end
            
                                if not Value.ClassName:find("UI") then 
                                    Value.ZIndex = (ConfigHeader.IsOpen and 1124 or 1)
                                end
            
                                if type(TransparencyProperty) == "table" then 
                                    for _, Property in TransparencyProperty do 
                                        NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                                    end
                                else
                                    NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                                end
                            end
                            
                            NewTween.Tween.Completed:Connect(function()
                                Debounce = false 
                                Items["ConfigHeaderWindow"].Instance.Visible = ConfigHeader.IsOpen
                                task.wait(0.2)
                                Items["ConfigHeaderWindow"].Instance.Parent = not ConfigHeader.IsOpen and Library.UnusedHolder.Instance or Library.OtherHolder.Instance
            
                                task.wait(0.1)
            
                                if ConfigHeader.IsOpen then 
                                    RenderStepped = Library:Connect(RunService.RenderStepped, function()
                                        Items["ConfigHeaderWindow"].Instance.Position = UDim2New(0, Items["ConfigHeader"].Instance.AbsolutePosition.X, 0, Items["ConfigHeader"].Instance.AbsolutePosition.Y + Items["ConfigHeader"].Instance.AbsoluteSize.Y + 5)
                                    end)
                                else
                                    if RenderStepped then 
                                        RenderStepped:Disconnect()
                                        RenderStepped = nil
                                    end
                                end
                            end)
                        end

                        do
                            local DragThreshold = 5
                            local MouseDownX, MouseDownY = nil, nil

                            Items["ConfigHeader"]:Connect("MouseButton1Down", function(X, Y)
                                MouseDownX, MouseDownY = X, Y
                            end)

                            Items["ConfigHeader"]:Connect("MouseButton1Up", function(X, Y)
                                if MouseDownX then
                                    local DeltaX = X - MouseDownX
                                    local DeltaY = Y - MouseDownY
                                    if (DeltaX * DeltaX + DeltaY * DeltaY) < DragThreshold * DragThreshold then
                                        ConfigHeader:SetOpen(not ConfigHeader.IsOpen)
                                    end
                                    MouseDownX, MouseDownY = nil, nil
                                end
                            end)
                        end
            
                        Library:Connect(UserInputService.InputBegan, function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                                if ConfigHeader.IsOpen then
                                    if Library:IsMouseOverFrame(Items["ConfigHeaderWindow"]) then
                                        return
                                    end
            
                                    ConfigHeader:SetOpen(false)
                                end
                            end
                        end)

                        local SortByLongest = false

                        function ConfigHeader:Sort(Type)
                            if Type then 
                                table.sort(ConfigHeader.Configs, function(A, B)
                                    if SortByLongest then
                                        return StringLen(A.Text) > StringLen(B.Text) -- longest
                                    else
                                        return StringLen(A.Text) < StringLen(B.Text) -- shortest
                                    end
                                end)

                                for Order, Value in pairs(ConfigHeader.Configs) do 
                                    Value.Object.Instance.LayoutOrder = Order
                                end
                            end
                        end

                        Items["SortIcon"]:Connect("MouseButton1Down", function()
                            SortByLongest = not SortByLongest
                            ConfigHeader:Sort(SortByLongest)
                        end)

                        function ConfigHeader:AddConfig(Name, CloudId)
                            for Index, Value in pairs(ConfigHeader.Configs) do
                                if Value.Text == Name then
                                    return
                                end
                            end

                            local NewConfig = {
                                File = nil,
                                Text = nil,
                                Object = nil,
                                Selected = false,
                                AutoLoadButton = nil,
                                CloudId = CloudId or nil
                            }

                            local NewConfigItems = { } do 
                                NewConfigItems["NewConfig"] = Instances:Create("TextButton", {
                                    Parent = Items["ConfigContent"].Instance,
                                    Name = "\0",
                                    FontFace = Library.Font,
                                    ZIndex = 11245,
                                    TextColor3 = FromRGB(0, 0, 0),
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    Text = "",
                                    AutoButtonColor = false,
                                    Size = UDim2New(1, 0, 0, 30),
                                    BorderSizePixel = 0,
                                    TextSize = 14,
                                    BackgroundColor3 = FromRGB(28, 27, 38)
                                }):AddToTheme({BackgroundColor3 = "Element"})
                                
                                Instances:Create("UICorner", {
                                    Parent = NewConfigItems["NewConfig"].Instance,
                                    Name = "\0"
                                })
                                
                                NewConfigItems["Stroke"] = Instances:Create("UIStroke", {
                                    Parent = NewConfigItems["NewConfig"].Instance,
                                    Name = "\0",
                                    Color = Library.Theme["Outline 2"],
                                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                                }):AddToTheme({Color = 'Outline 2'})
                                
                                NewConfigItems["LoadButton"] = Instances:Create("ImageButton", {
                                    Parent = NewConfigItems["NewConfig"].Instance,
                                    ZIndex = 11245,
                                    Name = "\0",
                                    ImageColor3 = FromRGB(200, 200, 207),
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    AutoButtonColor = false,
                                    AnchorPoint = Vector2New(1, 0.5),
                                    Image = "rbxassetid://126165013650337",
                                    BackgroundTransparency = 1,
                                    Position = UDim2New(1, -8, 0.5, -1),
                                    Size = UDim2New(0, 20, 0, 20),
                                    BorderSizePixel = 0
                                }):AddToTheme({ImageColor3 = "Text"})
                                
                                NewConfigItems["ConfigName"] = Instances:Create("TextBox", {
                                    Parent = NewConfigItems["NewConfig"].Instance,
                                    Name = "\0",
                                    FontFace = Library.Font,
                                    CursorPosition = -1,
                                    Active = false,
                                    Interactable = false,
                                    AnchorPoint = Vector2New(0, 0.5),
                                    TextSize = 18,
                                    ZIndex = 11245,
                                    Size = UDim2New(0, 0, 0, 15),
                                    TextColor3 = FromRGB(200, 200, 207),
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    Text = Name or "Unnamed"..tostring(#ConfigHeader.Configs),
                                    Selectable = false,
                                    BackgroundTransparency = 1,
                                    Position = UDim2New(0, 10, 0.5, 0),
                                    AutomaticSize = Enum.AutomaticSize.X,
                                    ClearTextOnFocus = false,
                                    BorderSizePixel = 0
                                }):AddToTheme({TextColor3 = "Text"})   
                                
                                NewConfigItems["OverwriteButton"] = Instances:Create("ImageButton", {
                                    Parent = NewConfigItems["NewConfig"].Instance,
                                    Name = "\0",
                                    ImageColor3 = FromRGB(200, 200, 207),
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    AutoButtonColor = false,
                                    AnchorPoint = Vector2New(1, 0.5),
                                    Image = "rbxassetid://124600563612369",
                                    BackgroundTransparency = 1,
                                    ZIndex = 11246,
                                    Position = UDim2New(1, -34, 0.5, -1),
                                    Size = UDim2New(0, 20, 0, 20),
                                    BorderSizePixel = 0
                                }):AddToTheme({ImageColor3 = "Text"})

                                NewConfigItems["AutoLoadButton"] = Instances:Create("ImageButton", {
                                    Parent = NewConfigItems["NewConfig"].Instance,
                                    Name = "\0",
                                    ImageColor3 = FromRGB(200, 200, 207),
                                    BorderColor3 = FromRGB(0, 0, 0),
                                    AutoButtonColor = false,
                                    AnchorPoint = Vector2New(1, 0.5),
                                    Image = "rbxassetid://93209682414397",
                                    BackgroundTransparency = 1,
                                    ZIndex = 11246,
                                    Position = UDim2New(1, -60, 0.5, -1),
                                    Size = UDim2New(0, 20, 0, 20),
                                    BorderSizePixel = 0
                                }):AddToTheme({ImageColor3 = "Text 2"})

                                NewConfigItems["NewConfig"]:OnHover(function()
                                    if NewConfig.Selected then return end
                                    NewConfigItems["NewConfig"]:ChangeItemTheme({BackgroundColor3 = "Hover Element"})
                                    NewConfigItems["NewConfig"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hover Element"]})
                                end)

                                NewConfigItems["NewConfig"]:OnHoverLeave(function()
                                    if NewConfig.Selected then return end
                                    NewConfigItems["NewConfig"]:ChangeItemTheme({BackgroundColor3 = "Element"})
                                    NewConfigItems["NewConfig"]:Tween(nil, {BackgroundColor3 = Library.Theme["Element"]})
                                end)

                                NewConfigItems["AutoLoadButton"]:OnHover(function()
                                    local AutoLoadFile = Library:GetFolder() .. "/autoload.txt"
                                    local IsAutoLoad = false
                                    if isfile(AutoLoadFile) and readfile(AutoLoadFile) == NewConfig.Text then
                                        IsAutoLoad = true
                                    end
                                    
                                    if not IsAutoLoad then
                                        NewConfigItems["AutoLoadButton"]:ChangeItemTheme({ImageColor3 = "Text"})
                                        NewConfigItems["AutoLoadButton"]:Tween(nil, {ImageColor3 = Library.Theme["Text"]})
                                    end
                                end)

                                NewConfigItems["AutoLoadButton"]:OnHoverLeave(function()
                                    local AutoLoadFile = Library:GetFolder() .. "/autoload.txt"
                                    local IsAutoLoad = false
                                    if isfile(AutoLoadFile) and readfile(AutoLoadFile) == NewConfig.Text then
                                        IsAutoLoad = true
                                    end
                                    
                                    if not IsAutoLoad then
                                        NewConfigItems["AutoLoadButton"]:ChangeItemTheme({ImageColor3 = "Text 2"})
                                        NewConfigItems["AutoLoadButton"]:Tween(nil, {ImageColor3 = Library.Theme["Text 2"]})
                                    end
                                end)
                                
                                local LastClickTime = 0
                                local DoubleClickThreshold = 0.25

                                NewConfigItems["NewConfig"]:Connect("MouseButton1Down", function()
                                    NewConfig:Select(not NewConfig.Selected)  
                                    
                                    local Now = tick()

                                    if Now - LastClickTime <= DoubleClickThreshold then
                                        NewConfigItems["ConfigName"].Instance.Interactable = true
                                        NewConfigItems["ConfigName"].Instance:CaptureFocus()
                                    end

                                    LastClickTime = Now
                                end)

                                NewConfigItems["OverwriteButton"]:Connect("MouseButton1Down", function()
                                    NewConfig:Overwrite()
                                end)

                                NewConfigItems["AutoLoadButton"]:Connect("MouseButton1Down", function()
                                    NewConfig:ToggleAutoLoad()
                                end)

                                NewConfigItems["ConfigName"]:Connect("Focused", function()
                                    local FocusLost 
                                    local OldName = NewConfig.Text
                                    FocusLost = NewConfigItems["ConfigName"].Instance.FocusLost:Connect(function()
                                        local NewName = NewConfigItems["ConfigName"].Instance.Text
                                        
                                        if NewName == OldName then
                                            FocusLost:Disconnect()
                                            NewConfigItems["ConfigName"].Instance.Interactable = false
                                            return
                                        end
                                        
                                        NewConfig.Text = NewName
                                        
                                        if Library:IsCloudEnabled() then
                                            local success, result = Library:CloudRenameConfig(OldName, NewName, NewConfig.CloudId)
                                            if success then
                                                Library:Notification("Cloud: Renamed config to "..NewName, "107463660077553", FromRGB(0, 255, 0), 5)
                                            else
                                                Library:Notification("Cloud: " .. (result or "Failed to rename"), "83016346682572", FromRGB(255, 0, 0), 5)
                                                NewConfig.Text = OldName
                                                NewConfigItems["ConfigName"].Instance.Text = OldName
                                            end
                                        else
                                            local OldPath = Library:GetFolder() .. "/"..OldName..".json"
                                            NewConfig.File = Library:GetFolder() .. "/"..NewName..".json"

                                            if isfile(OldPath) then
                                                local Content = readfile(OldPath)
                                                writefile(NewConfig.File, Content)
                                                delfile(OldPath)
                                            end
                                        end

                                        FocusLost:Disconnect()
                                        NewConfigItems["ConfigName"].Instance.Interactable = false
                                        Items["ConfigText"].Instance.Text = NewConfig.Text
                                    end)
                                end)

                                NewConfigItems["LoadButton"]:Connect("MouseButton1Down", function()
                                    NewConfig:Load()
                                end)
                            end

                            function NewConfig:Overwrite()
                                if Library:IsCloudEnabled() then
                                    local success, newId = Library:CloudSaveConfig(NewConfig.Text, NewConfig.CloudId)
                                    if success then
                                        if newId and not NewConfig.CloudId then
                                            NewConfig.CloudId = newId
                                        end
                                        Library:Notification("Cloud: Overwrote config "..NewConfig.Text, "107463660077553", FromRGB(0, 255, 0), 5)
                                    else
                                        Library:Notification("Cloud: Failed to overwrite config", "83016346682572", FromRGB(255, 0, 0), 5)
                                    end
                                else
                                    if isfile(Library:GetFolder() .. "/"..NewConfig.Text..".json") then
                                        writefile(Library:GetFolder() .. "/"..NewConfig.Text..".json", Library:GetConfig())
                                        Library:Notification("Overwrote config "..NewConfig.Text, "107463660077553", FromRGB(0, 255, 0), 5)
                                    end
                                end
                            end

                            function NewConfig:ToggleAutoLoad()
                                local AutoLoadFile = Library:GetFolder() .. "/autoload.txt"
                                local IsAutoLoad = false
                                if isfile(AutoLoadFile) then
                                    if readfile(AutoLoadFile) == NewConfig.Text then
                                        IsAutoLoad = true
                                    end
                                end

                                if IsAutoLoad then
                                    writefile(AutoLoadFile, "")
                                    NewConfigItems["AutoLoadButton"]:ChangeItemTheme({ImageColor3 = "Text 2"})
                                    NewConfigItems["AutoLoadButton"]:Tween(nil, {ImageColor3 = Library.Theme["Text 2"]})
                                    Library:Notification("Disabled autoload for "..NewConfig.Text, "93209682414397", FromRGB(255, 0, 0), 5)
                                else
                                    writefile(AutoLoadFile, NewConfig.Text)
                                    
                                    NewConfigItems["AutoLoadButton"]:ChangeItemTheme({ImageColor3 = "Accent"})
                                    NewConfigItems["AutoLoadButton"]:Tween(nil, {ImageColor3 = Library.Theme["Accent"]})
                                    Library:Notification("Enabled autoload for "..NewConfig.Text, "93209682414397", FromRGB(0, 255, 0), 5)
                                    
                                    for _, Config in pairs(ConfigHeader.Configs) do
                                         if Config ~= NewConfig and Config.AutoLoadButton then
                                             Config.AutoLoadButton:ChangeItemTheme({ImageColor3 = "Text 2"})
                                             Config.AutoLoadButton:Tween(nil, {ImageColor3 = Library.Theme["Text 2"]})
                                         end
                                    end
                                end
                            end

                            function NewConfig:Select(Bool)
                                if Bool then 
                                    NewConfig.Selected = true
                                    for Index, Value in pairs(ConfigHeader.Configs) do 
                                        Value:Select(false)
                                    end

                                    NewConfigItems["NewConfig"]:ChangeItemTheme({BackgroundColor3 = "Hover Element"})
                                    NewConfigItems["NewConfig"]:Tween(nil, {BackgroundColor3 = Library.Theme["Hover Element"]})

                                    NewConfigItems["Stroke"]:ChangeItemTheme({Color = "Accent"})
                                    NewConfigItems["Stroke"]:Tween(nil, {Color = Library.Theme["Accent"]})

                                    ConfigHeader.Selected = NewConfig
                                    Items["ConfigText"].Instance.Text = NewConfig.Text
                                else
                                    NewConfig.Selected = false
                                    NewConfigItems["NewConfig"]:ChangeItemTheme({BackgroundColor3 = "Element"})
                                    NewConfigItems["NewConfig"]:Tween(nil, {BackgroundColor3 = Library.Theme["Element"]})

                                    NewConfigItems["Stroke"]:ChangeItemTheme({Color = "Outline 2"})
                                    NewConfigItems["Stroke"]:Tween(nil, {Color = Library.Theme["Outline 2"]})
                                end
                            end

                            function NewConfig:Load()
                                if Library:IsCloudEnabled() then
                                    if Library:CloudLoadConfig(NewConfig.Text, NewConfig.CloudId) then
                                        NewConfig:Select(true)
                                        Library:Notification("Cloud: Successfully loaded config", "107463660077553", FromRGB(0, 255, 0), 5)
                                    else
                                        Library:Notification("Cloud: Failed to load config", "83016346682572", FromRGB(255, 0, 0), 5)
                                    end
                                    return
                                end
                                
                                if not NewConfig.File then
                                    NewConfig.File = Library:GetFolder() .. "/"..NewConfig.Text..".json"
                                end

                                local ReadContent = readfile(NewConfig.File)

                                if not ReadContent then return end

                                local Success, Error = Library:LoadConfig(ReadContent)

                                if not Success then
                                    return Library:Notification("Failed to load config, report this to the devs:\n"..Error, "83016346682572", FromRGB(255, 0, 0), 5)
                                else
                                    NewConfig:Select(true)
                                    Library:Notification("Successfully loaded config", "107463660077553", FromRGB(0, 255, 0), 5)
                                end
                            end

                            function NewConfig:Remove()
                                NewConfigItems["NewConfig"]:Clean()
                                TableRemove(ConfigHeader.Configs, TableFind(ConfigHeader.Configs, NewConfig))
                            end

                            NewConfig.Text = NewConfigItems["ConfigName"].Instance.Text
                            NewConfig.Object = NewConfigItems["NewConfig"]
                            NewConfig.AutoLoadButton = NewConfigItems["AutoLoadButton"]

                            if not Library:IsCloudEnabled() then
                                if isfile(Library:GetFolder() .. "/autoload.txt") then
                                    if readfile(Library:GetFolder() .. "/autoload.txt") == NewConfig.Text then
                                        NewConfigItems["AutoLoadButton"]:ChangeItemTheme({ImageColor3 = "Accent"})
                                        NewConfigItems["AutoLoadButton"]:Tween(nil, {ImageColor3 = Library.Theme["Accent"]})
                                    end
                                end
                            end

                            if Library:IsCloudEnabled() then
                                if not Library.CloudConfigCache then
                                    Library:CloudRefreshConfigsList()
                                end
                                
                                local configs = Library.CloudConfigCache or {}
                                local existingId = nil
                                for _, cfg in ipairs(configs) do
                                    if cfg.config_name == NewConfig.Text then
                                        existingId = cfg.id
                                        break
                                    end
                                end
                                if not existingId then
                                    local success, newId = Library:CloudSaveConfig(NewConfig.Text)
                                    if success and newId then
                                        NewConfig.CloudId = newId
                                        Library:Notification("Cloud: Created config "..NewConfig.Text, "107463660077553", FromRGB(0, 255, 0), 5)
                                    else
                                        Library:Notification("Cloud: Failed to create config", "83016346682572", FromRGB(255, 0, 0), 5)
                                    end
                                else
                                    NewConfig.CloudId = existingId
                                end
                            else
                                if not isfile(Library:GetFolder() .. "/"..NewConfig.Text..".json") then
                                    writefile(Library:GetFolder() .. "/"..NewConfig.Text..".json", Library:GetConfig())
                                    NewConfig.File = Library:GetFolder() .. "/"..NewConfig.Text..".json"
                                end
                            end

                            table.insert(ConfigHeader.Configs, NewConfig)
                            return NewConfig
                        end
                    end

                    Items["PlusIcon"]:Connect("MouseButton1Down", function()
                        Items["PlusIcon"]:ChangeItemTheme({ImageColor3 = "Accent"})
                        Items["PlusIcon"]:Tween(nil, {ImageColor3 = Library.Theme["Accent"]})

                        ConfigHeader:AddConfig()

                        task.wait(0.1)

                        Items["PlusIcon"]:ChangeItemTheme({ImageColor3 = "Text 2"})
                        Items["PlusIcon"]:Tween(nil, {ImageColor3 = Library.Theme["Text 2"]})
                    end)

                    Items["DeleteIcon"]:Connect("MouseButton1Down", function()
                        Items["DeleteIcon"]:ChangeItemTheme({ImageColor3 = "Accent"})
                        Items["DeleteIcon"]:Tween(nil, {ImageColor3 = Library.Theme["Accent"]})

                        if ConfigHeader.Selected then 
                            if Library:IsCloudEnabled() then
                                if Library:CloudDeleteConfig(ConfigHeader.Selected.Text, ConfigHeader.Selected.CloudId) then
                                    Library:Notification("Cloud: Deleted config "..ConfigHeader.Selected.Text, "107463660077553", FromRGB(0, 255, 0), 5)
                                    ConfigHeader.Selected:Remove()
                                    ConfigHeader.Selected = nil
                                    Items["ConfigText"].Instance.Text = "None"
                                else
                                    Library:Notification("Cloud: Failed to delete config", "83016346682572", FromRGB(255, 0, 0), 5)
                                end
                            else
                                if isfile(Library:GetFolder() .. "/"..ConfigHeader.Selected.Text..".json") then
                                    delfile(Library:GetFolder() .. "/"..ConfigHeader.Selected.Text..".json")

                                    ConfigHeader.Selected:Remove()
                                    ConfigHeader.Selected = nil
                                    Items["ConfigText"].Instance.Text = "None"
                                end
                            end
                        end

                        task.wait(0.1)

                        Items["DeleteIcon"]:ChangeItemTheme({ImageColor3 = "Text 2"})
                        Items["DeleteIcon"]:Tween(nil, {ImageColor3 = Library.Theme["Text 2"]})
                    end)

                    Items["RefreshIcon"]:Connect("MouseButton1Down", function()
                        Items["RefreshIcon"]:ChangeItemTheme({ImageColor3 = "Accent"})
                        Items["RefreshIcon"]:Tween(nil, {ImageColor3 = Library.Theme["Accent"]})

                        for _, cfg in pairs(ConfigHeader.Configs) do
                            if cfg.Object and cfg.Object.Instance then
                                cfg.Object.Instance:Destroy()
                            end
                        end
                        ConfigHeader.Configs = {}
                        ConfigHeader.Selected = nil

                        local ConfigList = Library:RefreshConfigsList()

                        for Index, Value in ipairs(ConfigList) do
                            if type(Value) == "table" then
                                ConfigHeader:AddConfig(Value.name, Value.id)
                            else
                                ConfigHeader:AddConfig(Value)
                            end
                        end

                        task.wait(0.1)

                        Items["RefreshIcon"]:ChangeItemTheme({ImageColor3 = "Text 2"})
                        Items["RefreshIcon"]:Tween(nil, {ImageColor3 = Library.Theme["Text 2"]})
                        
                        if Library:IsCloudEnabled() then
                            Library:Notification("Cloud: Configs refreshed", "107463660077553", FromRGB(0, 255, 0), 3)
                        end
                    end)

                    local ConfigList = Library:RefreshConfigsList()

                    for Index, Value in ipairs(ConfigList) do
                        if type(Value) == "table" then
                            ConfigHeader:AddConfig(Value.name, Value.id)
                        else
                            ConfigHeader:AddConfig(Value)
                        end
                    end

                    Library:Connect(Items["SearchInput"].Instance:GetPropertyChangedSignal("Text"), function()
                        for Index, Value in pairs(ConfigHeader.Configs) do
                            if not string.find(string.lower(Value.Text), string.lower(Items["SearchInput"].Instance.Text)) then 
                                Value.Object.Instance.Visible = false
                            else
                                Value.Object.Instance.Visible = true
                            end
                        end
                    end)

                    Window.ConfigHeader = ConfigHeader
                    Window.Items = Items
                end
                
                local Debounce = false

                function Window:SetCenter()
                    local ViewportSize = Camera.ViewportSize
                    local Size = Items["MainFrame"].Instance.AbsoluteSize

                    if Size.X < 100 or Size.Y < 100 then
                         Size = Vector2New(865, 618)
                    end

                    local CenterPosition = Vector2New(
                        (ViewportSize.X - Size.X) / 2,
                        (ViewportSize.Y - Size.Y) / 2
                    )
                    
                    Items["MainFrame"].Instance.AnchorPoint = Vector2New(0, 0)
                    Items["MainFrame"].Instance.Position = UDim2New(0, CenterPosition.X, 0, CenterPosition.Y)
                end

                function Window:SetOpen(Bool)
                    if Debounce then 
                        return
                    end

                    Window.IsOpen = Bool

                    Debounce = true 

                    if Window.IsOpen then 
                        Items["MainFrame"].Instance.Visible = true 
                    end

                    local Descendants = Items["MainFrame"].Instance:GetDescendants()
                    TableInsert(Descendants, Items["MainFrame"].Instance)

                    local NewTween

                    for Index, Value in Descendants do 
                        local TransparencyProperty = Tween:GetProperty(Value)

                        if not TransparencyProperty then
                            continue 
                        end

                        if type(TransparencyProperty) == "table" then 
                            for _, Property in TransparencyProperty do 
                                NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                            end
                        else
                            NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                        end
                    end
                    
                    if NewTween then
                        NewTween.Tween.Completed:Connect(function()
                            Debounce = false 
                            Items["MainFrame"].Instance.Visible = Window.IsOpen
                        end)
                    else
                        Debounce = false 
                        Items["MainFrame"].Instance.Visible = Window.IsOpen
                    end
                end

                Library:Connect(UserInputService.InputBegan, function(Input)
                    if tostring(Input.KeyCode) == Library.MenuKeybind or tostring(Input.UserInputType) == Library.MenuKeybind then
                        Window:SetOpen(not Window.IsOpen)

                        for Index, Value in Library.OpenFrames do 
                            Value:SetOpen(false)
                        end

                        Window.ConfigHeader:SetOpen(false)
                    end
                end)

                if IsMobile then
                    local ToggleButton = Instances:Create("ImageButton", {
                        Parent = Library.OtherHolder.Instance,
                        Name = "MobileToggle",
                        Size = UDim2New(0, 50, 0, 50),
                        Position = UDim2New(0.1, 0, 0.1, 0),
                        BackgroundColor3 = Library.Theme["Logo Background"],
                        Image = "",
                        AutoButtonColor = true,
                        BorderSizePixel = 0,
                    }):AddToTheme({BackgroundColor3 = 'Logo Background'})
                    
                    Instances:Create("UICorner", {
                        Parent = ToggleButton.Instance,
                        CornerRadius = UDimNew(1, 0)
                    })

                    Instances:Create("UIStroke", {
                        Parent = ToggleButton.Instance,
                        Color = Library.Theme["Outline"],
                        Thickness = 2,
                    }):AddToTheme({Color = 'Outline'})

                    Instances:Create("ImageLabel", {
                        Parent = ToggleButton.Instance,
                        BackgroundTransparency = 1,
                        Size = UDim2New(0.6, 0, 0.6, 0),
                        Position = UDim2New(0.5, 0, 0.5, 0),
                        AnchorPoint = Vector2New(0.5, 0.5),
                        Image = "rbxassetid://" .. Window.Logo,
                        ScaleType = Enum.ScaleType.Fit,
                    })
                    
                    ToggleButton:MakeDraggable()

                    ToggleButton:Connect("MouseButton1Click", function()
                        Window:SetOpen(not Window.IsOpen)
                    end)
                end

                Window:SetCenter()
                task.wait()
                Window:SetOpen(true)
                return setmetatable(Window, Library)
            end

            Library.Group = function(self, Name)
                local Items = { } do 
                    Items["Group"] = Instances:Create("TextLabel", {
                        Parent = self.Items["Pages"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        TextTransparency = 0.7,
                        Text = Name:upper(),
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 15
                    }):AddToTheme({TextColor3 = 'Text'})                
                end
            end

            Library.Page = function(self, Data)
                Data = Data or { }

                local Page = {
                    Window = self,

                    Name = Data.Name or Data.name or "Page",
                    Icon = Data.Icon or Data.icon or "104155143774171",

                    Items = { },
                    SubPages = { },
                    Active = false
                }

                local Items = { } do
                    Items["Inactive"] = Instances:Create("Frame", {
                        Parent = Page.Window.Items["Pages"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 0, 25),
                        BorderColor3 = FromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = Library.Theme["Text"],
                        ClipsDescendants = false
                    })
                    
                    Items["InactiveButton"] = Instances:Create("TextButton", {
                        Parent = Items["Inactive"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 0, 35),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        BackgroundColor3 = FromRGB(32, 38, 46)
                    }):AddToTheme({BackgroundColor3 = 'Page Background'})

                    Instances:Create("UICorner", {
                        Parent = Items["InactiveButton"].Instance,
                        Name = "\0"
                    })
                    
                    Items["Icon"] = Instances:Create("ImageLabel", {
                        Parent = Items["InactiveButton"].Instance,
                        Name = "\0",
                        ImageTransparency = 0.550000011920929,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://"..Page.Icon,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 10, 0.5, 0),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["InactiveButton"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        TextTransparency = 0.550000011920929,
                        Text = Page.Name,
                        Size = UDim2New(0, 0, 0, 15),
                        AnchorPoint = Vector2New(0, 0.5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 40, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})
                    
                    Items["SubTabs"] = Instances:Create("Frame", {
                        Parent = Items["Inactive"].Instance,
                        Name = "\0",
                        Visible = false,
                        BorderColor3 = FromRGB(0, 0, 0),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0, 35),
                        Size = UDim2New(1, 0, 0, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = Library.Theme["Text"]
                    }):AddToTheme({BackgroundColor3 = 'Text'})
                    
                    Instances:Create("UIListLayout", {
                        Parent = Items["SubTabs"].Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 10),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["SubTabs"].Instance,
                        Name = "\0",
                        PaddingTop = UDimNew(0, 5),
                        PaddingLeft = UDimNew(0, 25)
                    })
                    
                    Items["Page"] = Instances:Create("Frame", {
                        Parent = Library.UnusedHolder.Instance,
                        Name = "\0",
                        Visible = false,
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Position = UDim2New(0, 0, 0, 50),
                        Size = UDim2New(1, 0, 1, -50),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Text"]
                    })
                    
                    Items["Columns"] = Instances:Create("Frame", {
                        Parent = Items["Page"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, 0),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Text"]
                    })

                    Items["Stroke"] = Instances:Create("UIStroke", {
                        Parent = Items["InactiveButton"].Instance,
                        Name = "\0",
                        Color = Library.Theme["Outline 2"],
                        Transparency = 1,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    })  Items["Stroke"]:AddToTheme({Color = "Outline 2"})

                    Page.Items = Items
                end

                local Debounce = false

                function Page:Turn(Bool, IsFromSubTab)
                    if Debounce then 
                        return 
                    end

                    Page.Active = Bool 
                    
                    Debounce = true
                    
                    if not IsFromSubTab then
                        Items["SubTabs"].Instance.Visible = Bool
                        Items["Page"].Instance.Visible = Bool 
                        Items["Page"].Instance.Parent = Bool and Page.Window.Items["Content"].Instance or Library.UnusedHolder.Instance
                    end

                    if Page.Active then
                        Items["InactiveButton"]:Tween(nil, {BackgroundTransparency = 0})
                        Items["Stroke"]:Tween(nil, {Transparency = 0})

                        Items["Icon"]:ChangeItemTheme({ImageColor3 = "Accent"})
                        Items["Icon"]:Tween(nil, {ImageColor3 = Library.Theme.Accent, ImageTransparency = 0})
                        Items["Text"]:Tween(nil, {TextTransparency = 0})
                    else
                        Items["InactiveButton"]:Tween(nil, {BackgroundTransparency = 1})
                        Items["Stroke"]:Tween(nil, {Transparency = 1})

                        Items["Icon"]:ChangeItemTheme({ImageColor3 = "Text"})
                        Items["Icon"]:Tween(nil, {ImageColor3 = Library.Theme.Text, ImageTransparency = 0.55})
                        Items["Text"]:Tween(nil, {TextTransparency = 0.55})
                    end

                    local AllInstances = Items["Page"].Instance:GetDescendants()
                    TableInsert(AllInstances, Items["Page"].Instance)
                    
                    local NewTween 

                    for Index, Value in AllInstances do 
                        local TransparencyProperty = Tween:GetProperty(Value)

                        if not TransparencyProperty then 
                            continue
                        end

                        if type(TransparencyProperty) == "table" then 
                            for _, Property in TransparencyProperty do 
                                NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                            end
                        else
                            NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                        end
                    end

                    Library:Connect(NewTween.Tween.Completed, function()
                        Debounce = false
                    end)
                end

                Items["InactiveButton"]:Connect("MouseButton1Down", function()
                    for Index, Value in Page.Window.Pages do
                        if Value == Page and Page.Active then
                            return
                        end

                        Value:Turn(Value == Page)
                    end
                end)

                if #Page.Window.Pages == 0 then 
                    Page:Turn(true)
                end

                TableInsert(Page.Window.Pages, Page)
                return setmetatable(Page, Library.Pages)
            end

            Library.Pages.SubPage = function(self, Data)
                Data = Data or { }

                local Page = {
                    Window = self.Window,
                    Page = self,

                    Name = Data.Name or Data.name or "SubPage",
                    Icon = Data.Icon or Data.icon or "104155143774171",

                    Active = false,
                    Items = { },
                    Sections = { },
                    ColumnsData = { }
                }

                local Items = { } do
                    Items["Inactive"] = Instances:Create("TextButton", {
                        Parent = Page.Page.Items["SubTabs"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0, 25),
                        Size = UDim2New(1, 0, 0, 35),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        BackgroundColor3 = FromRGB(32, 38, 46)
                    })  Items["Inactive"]:AddToTheme({BackgroundColor3 = "Page Background"})

                    Items["Stroke"] = Instances:Create("UIStroke", {
                        Parent = Items["Inactive"].Instance,
                        Name = "\0",
                        Color = Library.Theme["Outline 2"],
                        Transparency = 1,
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    })  Items["Stroke"]:AddToTheme({Color = "Outline 2"})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Inactive"].Instance,
                        Name = "\0"
                    })
                    
                    Items["Icon"] = Instances:Create("ImageLabel", {
                        Parent = Items["Inactive"].Instance,
                        Name = "\0",
                        ImageTransparency = 0.550000011920929,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://"..Page.Icon,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 10, 0.5, 0),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0
                    })  Items["Icon"]:AddToTheme({ImageColor3 = "Text"})
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Inactive"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        TextTransparency = 0.550000011920929,
                        Text = Page.Name,
                        Size = UDim2New(0, 0, 0, 15),
                        AnchorPoint = Vector2New(0, 0.5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 40, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'}) 
                    
                    Items["Page"] = Instances:Create("Frame", {
                        Parent = Library.UnusedHolder.Instance,
                        Name = "\0",
                        Visible = false,
                        ClipsDescendants = true,
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, 0),
                        Position = UDim2New(0, 0, 0, 60),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Text"]
                    })

                    Instances:Create("UIListLayout", {
                        Parent = Items["Page"].Instance,
                        Name = "\0",
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalFlex = Enum.UIFlexAlignment.Fill,
                        Padding = UDimNew(0, 10),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Items["LeftColumn"] = Instances:Create("ScrollingFrame", {
                        Parent = Items["Page"].Instance,
                        Name = "\0",
                        ScrollBarImageColor3 = FromRGB(0, 0, 0),
                        Active = true,
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        ScrollBarThickness = 0,
                        ScrollingDirection = Enum.ScrollingDirection.Y,
                        Selectable = true,
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 1, 0),
                        BackgroundColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        CanvasSize = UDim2New(0, 0, 0, 0)
                    })

                    Instances:Create("UIPadding", {
                        Parent = Items["LeftColumn"].Instance,
                        Name = "\0",
                        PaddingBottom = UDimNew(0, 60),
                        PaddingTop = UDimNew(0, 15),
                        PaddingLeft = UDimNew(0, 10)
                    })

                    Instances:Create("UIListLayout", {
                        Parent = Items["LeftColumn"].Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 16),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Items["RightColumn"] = Instances:Create("ScrollingFrame", {
                        Parent = Items["Page"].Instance,
                        Name = "\0",
                        ScrollBarImageColor3 = FromRGB(0, 0, 0),
                        Active = true,
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        ScrollBarThickness = 0,
                        ScrollingDirection = Enum.ScrollingDirection.Y,
                        Selectable = true,
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 1, 0),
                        BackgroundColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        CanvasSize = UDim2New(0, 0, 0, 0)
                    })
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["RightColumn"].Instance,
                        Name = "\0",
                        PaddingBottom = UDimNew(0, 60),
                        PaddingTop = UDimNew(0, 15),
                        PaddingRight = UDimNew(0, 10)
                    })
                    
                    Instances:Create("UIListLayout", {
                        Parent = Items["RightColumn"].Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 16),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Page.ColumnsData[1] = Items["LeftColumn"]
                    Page.ColumnsData[2] = Items["RightColumn"]
                end

                local Debounce = false

                function Page:Turn(Bool)
                    if Debounce then 
                        return 
                    end

                    Page.Active = Bool 
                    
                    Debounce = true
                    Items["Page"].Instance.Visible = Bool 
                    Items["Page"].Instance.Parent = Bool and Page.Page.Items["Columns"].Instance or Library.UnusedHolder.Instance

                    if Page.Active then
                        Items["Inactive"]:Tween(nil, {BackgroundTransparency = 0})
                        Items["Stroke"]:Tween(nil, {Transparency = 0})

                        Items["Icon"]:ChangeItemTheme({ImageColor3 = "Accent"})
                        Items["Icon"]:Tween(nil, {ImageColor3 = Library.Theme.Accent, ImageTransparency = 0})
                        Items["Text"]:Tween(nil, {TextTransparency = 0})

                        Items["Page"]:Tween(TweenInfo.new(0.75, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2New(0, 0, 0, 0)})
                    else
                        Items["Inactive"]:Tween(nil, {BackgroundTransparency = 1})
                        Items["Stroke"]:Tween(nil, {Transparency = 1})

                        Items["Icon"]:ChangeItemTheme({ImageColor3 = "Text"})
                        Items["Icon"]:Tween(nil, {ImageColor3 = Library.Theme.Text, ImageTransparency = 0.55})
                        Items["Text"]:Tween(nil, {TextTransparency = 0.55})

                        Items["Page"]:Tween(TweenInfo.new(0.75, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2New(0, 0, 0, 60)})
                    end

                    local AllInstances = Items["Page"].Instance:GetDescendants()
                    TableInsert(AllInstances, Items["Page"].Instance)
                    
                    local NewTween 

                    for Index, Value in AllInstances do 
                        local TransparencyProperty = Tween:GetProperty(Value)

                        if not TransparencyProperty then 
                            continue
                        end

                        if type(TransparencyProperty) == "table" then 
                            for _, Property in TransparencyProperty do 
                                NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                            end
                        else
                            NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                        end
                    end

                    Library:Connect(NewTween.Tween.Completed, function()
                        Debounce = false
                    end)
                end

                Items["Inactive"]:Connect("MouseButton1Down", function()
                    for Index, Value in Page.Page.SubPages do
                        if Value == Page and Page.Active then
                            return
                        end

                        Value:Turn(Value == Page)
                    end
                end)

                if #Page.Page.SubPages == 0 then 
                    Page:Turn(true)
                end

                TableInsert(Page.Page.SubPages, Page)
                return setmetatable(Page, Library.Pages)
            end

            Library.Pages.Section = function(self, Data)
                Data = Data or { }

                local Section = {
                    Window = self.Window,
                    Page = self,

                    Name = Data.Name or Data.name or "Section",
                    Side = Data.Side or Data.side or 1,
                    IsFirstElement = false,
                    IsLastElement = false,

                    Items = { }
                }

                local Items = { } do 
                    Items["Section"] = Instances:Create("Frame", {
                        Parent = Section.Page.ColumnsData[Section.Side].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 0, 45),
                        BorderColor3 = FromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Section"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        TextTransparency = 0.5,
                        Text = Section.Name:upper(),
                        TextStrokeTransparency = 1,
                        Size = UDim2New(0, 0, 0, 15),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 8, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 14
                    }):AddToTheme({TextColor3 = 'Text'})
                    
                    Items["InlineOutline"] = Instances:Create("Frame", {
                        Parent = Items["Section"].Instance,
                        Name = "\0",
                        Size = UDim2New(1, 0, 0, 20),
                        Position = UDim2New(0, 0, 0, 22),
                        BorderColor3 = FromRGB(0, 0, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        BackgroundColor3 = Library.Theme["Outline 2"]
                    }):AddToTheme({BackgroundColor3 = 'Outline 2'})

                    Instances:Create("UIPadding", {
                        Parent = Items["InlineOutline"].Instance,
                        Name = "\0",
                        PaddingBottom = UDimNew(0, 10)
                    })                
                    
                    Instances:Create("UICorner", {
                        Parent = Items["InlineOutline"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 15)
                    })
                    
                    Items["Inline"] = Instances:Create("Frame", {
                        Parent = Items["InlineOutline"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 1, 0, 1),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -2, 1, 8),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Section Background"]
                    }):AddToTheme({BackgroundColor3 = 'Section Background'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Inline"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 15)
                    })
                    
                    Items["Content"] = Instances:Create("Frame", {
                        Parent = Items["Inline"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 15, 0, 10),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -30, 0, 0),
                        BorderSizePixel = 0
                    })
                    
                    Instances:Create("UIListLayout", {
                        Parent = Items["Content"].Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 10),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Section.Items = Items
                end

                return setmetatable(Section, Library.Sections)
            end

            Library.Sections.Toggle = function(self, Data)
                Data = Data or { }

                local Toggle = {
                    Window = self.Window,
                    Page = self.Page,
                    Section = self,

                    Name = Data.Name or Data.name or "Toggle",  
                    Flag = Data.Flag or Data.flag or Library:NextFlag(),
                    Default = Data.Default or Data.default or false,
                    Callback = Data.Callback or Data.callback or function() end,

                    Value = false
                }

                local Items = { } do 
                    Items["Toggle"] = Instances:Create("TextButton", {
                        Parent = Toggle.Section.Items["Content"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 0, 30),
                        BorderSizePixel = 0,
                        TextSize = 14
                    })

                    if Toggle.Section.IsFirstElement then 
                        Items["Background"] = Instances:Create("Frame", {
                            Parent = Items["Toggle"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, -15, 0, -10),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Size = UDim2New(1, 30, 1, 15),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(26, 28, 38)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        
                        Instances:Create("UICorner", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 15)
                        })

                        Items["BackgroundLiner"] = Instances:Create("Frame", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            AnchorPoint = Vector2New(0, 1),
                            Position = UDim2New(0, 0, 1, 0),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            Size = UDim2New(1, 0, 0, 15),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(29, 31, 42)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    else
                        if Toggle.Section.IsLastElement then
                            Instances:Create("Frame", {
                                Parent = Items["Toggle"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Toggle"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BackgroundTransparency = 1,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 13),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                            
                            Instances:Create("UICorner", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                CornerRadius = UDimNew(0, 15)
                            })

                            Items["BackgroundLiner"] = Instances:Create("Frame", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                AnchorPoint = Vector2New(0, 0),
                                Position = UDim2New(0, 0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                Size = UDim2New(1, 0, 0, 15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(29, 31, 42)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        else
                            Instances:Create("Frame", {
                                Parent = Items["Toggle"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Toggle"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 9),
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                        end
                    end
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Toggle"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Toggle.Name,
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0.5, 0),
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})
                    
                    Items["Indicator"] = Instances:Create("Frame", {
                        Parent = Items["Toggle"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(1, 0.5),
                        Position = UDim2New(1, 0, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        ZIndex = 2,
                        Size = UDim2New(0, 32, 0, 20),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Toggle"]
                    }):AddToTheme({BackgroundColor3 = 'Toggle'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Indicator"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Items["Circle"] = Instances:Create("Frame", {
                        Parent = Items["Indicator"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 2, 0, 2),
                        ZIndex = 2,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 16, 0, 16),
                        BorderSizePixel = 0,
                        BackgroundColor3 = FromRGB(125, 135, 145)
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Circle"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })                

                    Items["SubElements"] = Instances:Create("Frame", {
                        Parent = Items["Toggle"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(1, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2New(1, -40, 0.5, 0),
                        Size = UDim2New(0, 0, 0, 20),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X
                    })
                    
                    Instances:Create("UIListLayout", {
                        Parent = Items["SubElements"].Instance,
                        Name = "\0",
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        Padding = UDimNew(0, 8),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    Items["Toggle"]:OnHover(function()
                        if Toggle.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 0})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 0})
                        end
                        
                        if Data.Tooltip then
                            Library:ShowTooltip(Data.Tooltip, Items["Toggle"].Instance)
                        end
                    end)

                    Items["Toggle"]:OnHoverLeave(function()
                        if Toggle.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 1})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 1})
                        end
                        
                        if Data.Tooltip then
                            Library:HideTooltip()
                        end
                    end)
                end

                function Toggle:Get()
                    return Toggle.Value 
                end

                function Toggle:Set(Value)
                    Toggle.Value = Value 
                    Library.Flags[Toggle.Flag] = Value 

                    if Toggle.Value then 
                        Items["Indicator"]:ChangeItemTheme({BackgroundColor3 = "Accent"})

                        Items["Indicator"]:Tween(nil, {BackgroundColor3 = Library.Theme.Accent})
                        Items["Circle"]:Tween(
                            nil, 
                            {BackgroundColor3 = FromRGB(255, 255, 255), Position = UDim2New(1, -2, 0, 2), AnchorPoint = Vector2New(1, 0)}
                        )
                    else
                        Items["Indicator"]:ChangeItemTheme({BackgroundColor3 = "Toggle"})

                        Items["Indicator"]:Tween(nil, {BackgroundColor3 = Library.Theme.Toggle})
                        Items["Circle"]:Tween(
                            nil, 
                            {BackgroundColor3 = FromRGB(125, 135, 145), Position = UDim2New(0, 2, 0, 2), AnchorPoint = Vector2New(0, 0)}
                        )
                    end

                    if Toggle.Callback then 
                        Library:SafeCall(Toggle.Callback, Toggle.Value)
                    end
                end

                function Toggle:SetVisibility(Bool)
                    Items["Toggle"].Instance.Visible = Bool 
                end

                function Toggle:Colorpicker(Data)
                    Data = Data or { }

                    local Colorpicker = {
                        Window = Toggle.Window,
                        Page = Toggle.Page,
                        Section = Toggle.Section,

                        Flag = Data.Flag or Data.flag or Library:NextFlag(),
                        Default = Data.Default or Data.default or Color3.fromRGB(255, 255, 255),
                        Callback = Data.Callback or Data.callback or function() end,
                        Alpha = Data.Alpha or Data.alpha or false
                    }

                    local NewColorpicker, ColorpickerItems = Library:CreateColorpicker({
                        Parent = Items["SubElements"],
                        Page = Colorpicker.Page,
                        Section = Colorpicker.Section,
                        Flag = Colorpicker.Flag,
                        Default = Colorpicker.Default,
                        Callback = Colorpicker.Callback,
                        Alpha = Colorpicker.Alpha
                    })

                    return NewColorpicker
                end

                function Toggle:Keybind(Data)
                    Data = Data or { }

                    local Keybind = {
                        Window = Toggle.Window,
                        Page = Toggle.Page,
                        Section = Toggle.Section,

                        Flag = Data.Flag or Data.flag or Library:NextFlag(),
                        Default = Data.Default or Data.default or Enum.KeyCode.E,
                        Callback = Data.Callback or Data.callback or function() end,
                        Mode = Data.Mode or Data.mode or "Toggle"
                    }

                    local NewKeybind, KeybindItems = Library:CreateKeybind({
                        Parent = Items["SubElements"],
                        Page = Keybind.Page,
                        Section = Keybind.Section,
                        Flag = Keybind.Flag,
                        Default = Keybind.Default,
                        Mode = Keybind.Mode,
                        Callback = Keybind.Callback
                    })

                    return NewKeybind
                end

                function Toggle:Settings(Size)
                    local Settings = {
                        IsOpen = false,
                        IsSettings = { },
                        Items = { }
                    }
                    
                    local SettingsItems = { } do 
                        SettingsItems["SettingsButton"] = Instances:Create("ImageButton", {
                            Parent = Items["SubElements"].Instance,
                            Name = "\0",
                            BorderColor3 = FromRGB(0, 0, 0),
                            AutoButtonColor = false,
                            Image = "rbxassetid://116690698569160",
                            BackgroundTransparency = 1,
                            Size = UDim2New(0, 18, 0, 18),
                            BorderSizePixel = 0
                        }):AddToTheme({ImageColor3 = "Text 2"})

                        SettingsItems["SettingsWindow"] = Instances:Create("TextButton", {
                            Parent = Library.UnusedHolder.Instance,
                            Name = "\0",
                            Active = false,
                            BorderColor3 = FromRGB(0, 0, 0),
                            Text = "",
                            AutoButtonColor = false,
                            Size = UDim2New(0, 295, 0, 213),
                            Position = UDim2New(0, 314, 0, 183),
                            Selectable = false,
                            BorderSizePixel = 0,
                            AutomaticSize = Enum.AutomaticSize.Y,
                            BackgroundColor3 = FromRGB(15, 16, 21)
                        }):AddToTheme({BackgroundColor3 = "Background"})
                        
                        Instances:Create("UICorner", {
                            Parent = SettingsItems["SettingsWindow"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 15)
                        })
                        
                        SettingsItems["Holder"] = Instances:Create("ScrollingFrame", {
                            Parent = SettingsItems["SettingsWindow"].Instance,
                            Name = "\0",
                            Active = true,
                            AutomaticCanvasSize = Enum.AutomaticSize.Y,
                            BorderSizePixel = 0,
                            CanvasSize = UDim2New(0, 0, 0, 0),
                            ScrollBarImageColor3 = FromRGB(151, 150, 162),
                            MidImage = "rbxassetid://81680855285439",
                            BorderColor3 = FromRGB(0, 0, 0),
                            ScrollBarThickness = 2,
                            Size = UDim2New(1, -24, 1, -24),
                            BackgroundTransparency = 1,
                            Position = UDim2New(0, 12, 0, 12),
                            BottomImage = "rbxassetid://81680855285439",
                            TopImage = "rbxassetid://81680855285439"
                        }):AddToTheme({ScrollBarImageColor3 = "Text 2"})
                        
                        Instances:Create("UIPadding", {
                            Parent = SettingsItems["Holder"].Instance,
                            Name = "\0",
                            PaddingBottom = UDimNew(0, 10),
                            PaddingRight = UDimNew(0, 10)
                        })
                        
                        Instances:Create("UIListLayout", {
                            Parent = SettingsItems["Holder"].Instance,
                            Name = "\0",
                            Padding = UDimNew(0, 10),
                            SortOrder = Enum.SortOrder.LayoutOrder
                        })

                        SettingsItems["Content"] = SettingsItems["Holder"]

                        Settings.Items = SettingsItems
                    end

                    local Debounce = false 
                    local RenderStepped 
        
                    function Settings:SetOpen(Bool)
                        if Debounce then 
                            return
                        end
        
                        Settings.IsOpen = Bool
        
                        Debounce = true 
        
                        if Settings.IsOpen then 
                            SettingsItems["SettingsWindow"].Instance.Visible = true
                            SettingsItems["SettingsWindow"].Instance.Parent = Library.Holder.Instance
                            SettingsItems["SettingsWindow"].Instance.Size = UDim2New(0, 295, 0, 0)
        
                            SettingsItems["SettingsWindow"].Instance.Position = UDim2New(0, SettingsItems["SettingsButton"].Instance.AbsolutePosition.X, 0, SettingsItems["SettingsButton"].Instance.AbsolutePosition.Y + SettingsItems["SettingsButton"].Instance.AbsoluteSize.Y + 10)             
                            SettingsItems["SettingsWindow"]:Tween(nil, {Size = UDim2New(0, 295, 0, Size)})
        
                            for Index, Value in Library.OpenFrames do 
                                if Value ~= Settings then 
                                    Value:SetOpen(false)
                                end
                            end
        
                            Library.OpenFrames[Settings] = Settings 
                        else
                            if Library.OpenFrames[Settings] then 
                                Library.OpenFrames[Settings] = nil
                            end
        
                            if RenderStepped then 
                                RenderStepped:Disconnect()
                                RenderStepped = nil
                            end
        
                            SettingsItems["SettingsWindow"]:Tween(nil, {Size = UDim2New(0, 295, 0, 0)})
                        end
        
                        local Descendants = SettingsItems["SettingsWindow"].Instance:GetDescendants()
                        TableInsert(Descendants, SettingsItems["SettingsWindow"].Instance)
        
                        local NewTween
        
                        for Index, Value in Descendants do 
                            local TransparencyProperty = Tween:GetProperty(Value)
        
                            if not TransparencyProperty then
                                continue 
                            end
        
                            if not Value.ClassName:find("UI") then 
                                Value.ZIndex = Settings.IsOpen and 4 or 1
                            end
        
                            if type(TransparencyProperty) == "table" then 
                                for _, Property in TransparencyProperty do 
                                    NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                                end
                            else
                                NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                            end
                        end
                        
                        NewTween.Tween.Completed:Connect(function()
                            Debounce = false 
                            SettingsItems["SettingsWindow"].Instance.Visible = Settings.IsOpen
                            task.wait(0.2)
                            SettingsItems["SettingsWindow"].Instance.Parent = not Settings.IsOpen and Library.UnusedHolder.Instance or Library.Holder.Instance
        
                            task.wait(0.1)
        
                            if Settings.IsOpen then 
                                RenderStepped = Library:Connect(RunService.RenderStepped, function()
                                    SettingsItems["SettingsWindow"].Instance.Position = UDim2New(0, SettingsItems["SettingsButton"].Instance.AbsolutePosition.X, 0, SettingsItems["SettingsButton"].Instance.AbsolutePosition.Y + SettingsItems["SettingsButton"].Instance.AbsoluteSize.Y + 10)                   
                                    SettingsItems["SettingsWindow"].Instance.Size = UDim2New(0, 295, 0, Size)
                                end)
                            else
                                if RenderStepped then 
                                    RenderStepped:Disconnect()
                                    RenderStepped = nil
                                end
        
                                SettingsItems["SettingsWindow"]:Tween(nil, {Size = UDim2New(0, 295, 0, 0)})
                            end
                        end)
                    end

                    SettingsItems["SettingsButton"]:Connect("MouseButton1Down", function()
                        Settings:SetOpen(not Settings.IsOpen)
                    end)

                    Library:Connect(UserInputService.InputBegan, function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then 
                            if Settings.IsOpen and not Library:IsMouseOverFrame(SettingsItems["SettingsWindow"]) then 
                                if Library.IsASubWindowOpenLul then
                                    return
                                end

                                Settings:SetOpen(false)
                            end
                        end
                    end)

                    return setmetatable(Settings, Library.Sections)
                end

                Items["Toggle"]:Connect("MouseButton1Down", function()
                    Toggle:Set(not Toggle.Value)
                end)

                Toggle:Set(Toggle.Default)

                Library.SetFlags[Toggle.Flag] = function(Value)
                    Toggle:Set(Value)
                end

                return Toggle 
            end

            Library.Sections.Button = function(self, Data)
                Data = Data or { }

                local Button = {
                    Window = self.Window,
                    Page = self.Page,
                    Section = self,

                    Name = Data.Name or Data.name or "Button",
                    Callback = Data.Callback or Data.callback or function() end
                }

                local Items = { } do 
                    Items["Button"] = Instances:Create("Frame", {
                        Parent = Button.Section.Items["Content"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 40),
                        BorderSizePixel = 0
                    })
                    
                    Items["RealButton"] = Instances:Create("TextButton", {
                        Parent = Items["Button"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(0, 0.5),
                        Position = UDim2New(0, 0, 0.5, 0),
                        Size = UDim2New(1, 0, 0, 30),
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        TextSize = 14,
                        BackgroundColor3 = Library.Theme["Element"]
                    }):AddToTheme({BackgroundColor3 = 'Element'})
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["RealButton"].Instance,
                        Name = "\0",
                        Color = FromRGB(29, 28, 32),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["RealButton"].Instance,
                        Name = "\0"
                    })
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["RealButton"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Button.Name,
                        ZIndex = 2,
                        AnchorPoint = Vector2New(0.5, 0.5),
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0.5, 0, 0.5, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})

                    if Button.Section.IsFirstElement then 
                        Items["Background"] = Instances:Create("Frame", {
                            Parent = Items["Button"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, -15, 0, -10),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Size = UDim2New(1, 30, 1, 15),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(26, 28, 38)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        
                        Instances:Create("UICorner", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 15)
                        })

                        Items["BackgroundLiner"] = Instances:Create("Frame", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            AnchorPoint = Vector2New(0, 1),
                            Position = UDim2New(0, 0, 1, 0),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            Size = UDim2New(1, 0, 0, 15),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(29, 31, 42)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    else
                        if Button.Section.IsLastElement then
                            Instances:Create("Frame", {
                                Parent = Items["Button"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Button"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BackgroundTransparency = 1,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 13),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                            
                            Instances:Create("UICorner", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                CornerRadius = UDimNew(0, 15)
                            })

                            Items["BackgroundLiner"] = Instances:Create("Frame", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                AnchorPoint = Vector2New(0, 0),
                                Position = UDim2New(0, 0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                Size = UDim2New(1, 0, 0, 15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(29, 31, 42)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        else
                            Instances:Create("Frame", {
                                Parent = Items["Button"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Button"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 9),
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                        end
                    end                

                    Items["RealButton"]:OnHover(function()
                        if Button.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 0})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 0})
                        end
                        
                        if Data.Tooltip then
                            Library:ShowTooltip(Data.Tooltip, Items["RealButton"].Instance)
                        end
                    end)

                    Items["RealButton"]:OnHoverLeave(function()
                        if Button.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 1})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 1})
                        end
                        
                        if Data.Tooltip then
                            Library:HideTooltip()
                        end
                    end)
                end 

                function Button:SetVisibility(Bool)
                    Items["Button"].Instance.Visible = Bool
                end

                function Button:Press()
                    Items["RealButton"]:ChangeItemTheme({BackgroundColor3 = "Accent"})
                    Items["RealButton"]:Tween(nil, {BackgroundColor3 = Library.Theme.Accent})
                    task.wait(0.1)
                    Library:SafeCall(Button.Callback)
                    Items["RealButton"]:ChangeItemTheme({BackgroundColor3 = "Element"})
                    Items["RealButton"]:Tween(nil, {BackgroundColor3 = Library.Theme.Element})
                end

                Items["RealButton"]:Connect("MouseButton1Down", function()
                    Button:Press()
                end)

                return Button
            end

            Library.Sections.Slider = function(self, Data)
                Data = Data or { }

                local Slider = {
                    Window = self.Window,
                    Page = self.Page,
                    Section = self,

                    Name = Data.Name or Data.name or "Slider",
                    Flag = Data.Flag or Data.flag or Library:NextFlag(),
                    Min = Data.Min or Data.min or 0,
                    Default = Data.Default or Data.default or 0,
                    Max = Data.Max or Data.max or 100,
                    Suffix = Data.Suffix or Data.suffix or "",
                    Decimals = Data.Decimals or Data.decimals or 1,
                    Callback = Data.Callback or Data.callback or function() end,

                    Value = 0,
                    Sliding = false
                }

                local Items = { } do 
                    Items["Slider"] = Instances:Create("Frame", {
                        Parent = Slider.Section.Items["Content"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 30),
                        BorderSizePixel = 0
                    })
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Slider"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Slider.Name,
                        AnchorPoint = Vector2New(0, 0.5),
                        ZIndex = 2,
                        Size = UDim2New(0, 120, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0.5, 0),
                        BorderSizePixel = 0,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})

                    Instances:Create("UIGradient", {
                        Parent = Items["Text"].Instance,
                        Name = "\0",
                        Transparency = NumSequence{NumSequenceKeypoint(0, 0), NumSequenceKeypoint(0.676, 0), NumSequenceKeypoint(1, 1)}
                    })
                    
                    Items["Value"] = Instances:Create("TextBox", {
                        Parent = Items["Slider"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text 2"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "180*",
                        Position = UDim2New(1, 0, 0.5, 0),
                        AnchorPoint = Vector2New(1, 0.5),
                        Size = UDim2New(0, 0, 0, 20),
                        PlaceholderColor3 = FromRGB(125, 125, 125),
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 16,
                        BackgroundColor3 = FromRGB(25, 25, 37)
                    }):AddToTheme({TextColor3 = 'Text 2'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 5)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        Color = FromRGB(29, 28, 32),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    })
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        PaddingRight = UDimNew(0, 5),
                        PaddingLeft = UDimNew(0, 5)
                    })
                    
                    Items["RealSlider"] = Instances:Create("TextButton", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(1, 0.5),
                        Position = UDim2New(0, -20, 0.5, 0),
                        Size = UDim2New(0, 95, 0, 5),
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        TextSize = 14,
                        BackgroundColor3 = Library.Theme["Element"]
                    }):AddToTheme({BackgroundColor3 = 'Element'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["RealSlider"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Items["Accent"] = Instances:Create("Frame", {
                        Parent = Items["RealSlider"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, 0),
                        ZIndex = 2,
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Accent"]
                    }):AddToTheme({BackgroundColor3 = 'Accent'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Accent"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Items["Dragger"] = Instances:Create("Frame", {
                        Parent = Items["Accent"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(1, 0.5),
                        Position = UDim2New(1, 5, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 12, 0, 12),
                        ZIndex = 2,
                        BorderSizePixel = 0
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Dragger"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })                

                    if Slider.Section.IsFirstElement then 
                        Items["Background"] = Instances:Create("Frame", {
                            Parent = Items["Slider"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, -15, 0, -10),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Size = UDim2New(1, 30, 1, 15),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            ZIndex = 0,
                            BackgroundColor3 = FromRGB(26, 28, 38)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        
                        Instances:Create("UICorner", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 15)
                        })

                        Items["BackgroundLiner"] = Instances:Create("Frame", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            AnchorPoint = Vector2New(0, 1),
                            Position = UDim2New(0, 0, 1, 0),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            Size = UDim2New(1, 0, 0, 15),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(29, 31, 42)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    else
                        if Slider.Section.IsLastElement then
                            Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BackgroundTransparency = 1,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 13),
                                BorderSizePixel = 0,
                                ZIndex = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                            
                            Instances:Create("UICorner", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                CornerRadius = UDimNew(0, 15)
                            })

                            Items["BackgroundLiner"] = Instances:Create("Frame", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                AnchorPoint = Vector2New(0, 0),
                                Position = UDim2New(0, 0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                Size = UDim2New(1, 0, 0, 15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(29, 31, 42)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        else
                            Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 9),
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                ZIndex = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                        end
                    end                

                    Items["Slider"]:OnHover(function()
                        if Slider.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 0})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 0})
                        end
                        
                        if Data.Tooltip then
                            Library:ShowTooltip(Data.Tooltip, Items["Slider"].Instance)
                        end
                    end)

                    Items["Slider"]:OnHoverLeave(function()
                        if Slider.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 1})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 1})
                        end
                        
                        if Data.Tooltip then
                            Library:HideTooltip()
                        end
                    end)
                end

                function Slider:Get()
                    return Slider.Value 
                end

                function Slider:SetVisibility(Bool)
                    Items["Slider"].Instance.Visible = Bool
                end

                function Slider:Set(Value)
                    Slider.Value = Library:Round(MathClamp(Value, Slider.Min, Slider.Max), Slider.Decimals)
                    Library.Flags[Slider.Flag] = Slider.Value

                    if Slider.Sliding then
                        Items["Accent"].Instance.Size = UDim2New((Slider.Value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1, 0)
                    else
                        Items["Accent"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2New((Slider.Value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1, 0)})
                    end

                    Items["Value"].Instance.Text = StringFormat("%s%s", Slider.Value, Slider.Suffix)

                    if Slider.Callback then 
                        Library:SafeCall(Slider.Callback, Slider.Value)
                    end
                end

                local InputChanged 
                
                Items["RealSlider"]:Connect("InputBegan", function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        Slider.Sliding = true

                        local SizeX = (Input.Position.X - Items["RealSlider"].Instance.AbsolutePosition.X) / Items["RealSlider"].Instance.AbsoluteSize.X
                        local Value = ((Slider.Max - Slider.Min) * SizeX) + Slider.Min

                        Slider:Set(Value)

                        if InputChanged then
                            return
                        end

                        InputChanged = Input.Changed:Connect(function()
                            if Input.UserInputState == Enum.UserInputState.End then
                                Slider.Sliding = false

                                InputChanged:Disconnect()
                                InputChanged = nil
                            end
                        end)
                    end
                end)

                Library:Connect(UserInputService.InputChanged, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                        if Slider.Sliding then
                            local SizeX = (Input.Position.X - Items["RealSlider"].Instance.AbsolutePosition.X) / Items["RealSlider"].Instance.AbsoluteSize.X
                            local Value = ((Slider.Max - Slider.Min) * SizeX) + Slider.Min

                            Slider:Set(Value)
                        end
                    end
                end)

                Items["Value"]:Connect("Focused", function()
                    Items["Value"]:ChangeItemTheme({TextColor3 = "Text"})
                    Items["Value"]:Tween(nil, {TextColor3 = Library.Theme.Text})
        
                    Items["Value"].Instance.Text = StringFormat("%s", tostring(Slider.Value))
                end)
        
                Items["Value"]:Connect("FocusLost", function()
                    Items["Value"]:ChangeItemTheme({TextColor3 = "Text 2"})
                    Items["Value"]:Tween(nil, {TextColor3 = Library.Theme["Text 2"]})
        
                    Slider:Set(tonumber(Items["Value"].Instance.Text))
                end)

                if Slider.Default then
                    Slider:Set(Slider.Default)
                end

                Library.SetFlags[Slider.Flag] = function(Value)
                    Slider:Set(Value)
                end

                return Slider 
            end

            Library.Sections.TextSlider = function(self, Data)
                Data = Data or { }

                local Slider = {
                    Window = self.Window,
                    Page = self.Page,
                    Section = self,

                    Name = Data.Name or Data.name or "TextSlider",
                    Flag = Data.Flag or Data.flag or Library:NextFlag(),
                    Min = Data.Min or Data.min or 0,
                    Default = Data.Default or Data.default or 0,
                    Max = Data.Max or Data.max or 100,
                    Suffix = Data.Suffix or Data.suffix or "",
                    Decimals = Data.Decimals or Data.decimals or 1,
                    TextProps = Data.TextProps or Data.textprops or nil,
                    Callback = Data.Callback or Data.callback or function() end,
                    Value = 0,
                    Sliding = false
                }

                local Items = { } do
                    Items["Slider"] = Instances:Create("Frame", {
                        Parent = Slider.Section.Items["Content"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 30),
                        BorderSizePixel = 0
                    })

                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Slider"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Slider.Name,
                        AnchorPoint = Vector2New(0, 0.5),
                        ZIndex = 2,
                        Size = UDim2New(0, 120, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0.5, 0),
                        BorderSizePixel = 0,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})

                    Instances:Create("UIGradient", {
                        Parent = Items["Text"].Instance,
                        Name = "\0",
                        Transparency = NumSequence{NumSequenceKeypoint(0, 0), NumSequenceKeypoint(0.676, 0), NumSequenceKeypoint(1, 1)}
                    })

                    -- Holder for layout stability
                    Items["ValueHolder"] = Instances:Create("Frame", {
                        Parent = Items["Slider"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(1, 0.5),
                        Position = UDim2New(1, -5, 0.5, 0),
                        Size = UDim2New(1, -125, 1, 0),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Active = false
                    })

                    Instances:Create("UIListLayout", {
                        Parent = Items["ValueHolder"].Instance,
                        Name = "\0",
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDimNew(0, 10)
                    })
                    
                    Items["Value"] = Instances:Create("TextBox", {
                        LayoutOrder = 2,
                        Parent = Items["ValueHolder"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text 2"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "180*",
                        Position = UDim2New(1, 0, 0.5, 0),
                        AnchorPoint = Vector2New(1, 0.5),
                        Size = UDim2New(0, 0, 0, 20),
                        PlaceholderColor3 = FromRGB(125, 125, 125),
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 16,
                        BackgroundColor3 = FromRGB(25, 25, 37)
                    }):AddToTheme({TextColor3 = 'Text 2'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 5)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        Color = FromRGB(29, 28, 32),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    })
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        PaddingRight = UDimNew(0, 5),
                        PaddingLeft = UDimNew(0, 5)
                    })
                    
                    -- Reduced width slightly to 75 to give more room for title
                    Items["RealSlider"] = Instances:Create("TextButton", {
                        LayoutOrder = 1,
                        Parent = Items["ValueHolder"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(1, 0.5),
                        Position = UDim2New(0, -10, 0.5, 0),
                        Size = UDim2New(0, 110, 0, 5), 
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        TextSize = 14,
                        BackgroundColor3 = Library.Theme["Element"]
                    }):AddToTheme({BackgroundColor3 = 'Element'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["RealSlider"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Items["Accent"] = Instances:Create("Frame", {
                        Parent = Items["RealSlider"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 1, 0),
                        ZIndex = 2,
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Accent"]
                    }):AddToTheme({BackgroundColor3 = 'Accent'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Accent"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Items["Dragger"] = Instances:Create("Frame", {
                        Parent = Items["Accent"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(1, 0.5),
                        Position = UDim2New(1, 5, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 12, 0, 12),
                        ZIndex = 2,
                        BorderSizePixel = 0
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Dragger"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })                

                    if Slider.Section.IsFirstElement then 
                        Items["Background"] = Instances:Create("Frame", {
                            Parent = Items["Slider"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, -15, 0, -10),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Size = UDim2New(1, 30, 1, 15),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            ZIndex = 0,
                            BackgroundColor3 = FromRGB(26, 28, 38)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        
                        Instances:Create("UICorner", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 15)
                        })

                        Items["BackgroundLiner"] = Instances:Create("Frame", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            AnchorPoint = Vector2New(0, 1),
                            Position = UDim2New(0, 0, 1, 0),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            Size = UDim2New(1, 0, 0, 15),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(29, 31, 42)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    else
                        if Slider.Section.IsLastElement then
                            Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BackgroundTransparency = 1,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 13),
                                BorderSizePixel = 0,
                                ZIndex = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                            
                            Instances:Create("UICorner", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                CornerRadius = UDimNew(0, 15)
                            })

                            Items["BackgroundLiner"] = Instances:Create("Frame", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                AnchorPoint = Vector2New(0, 0),
                                Position = UDim2New(0, 0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                Size = UDim2New(1, 0, 0, 15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(29, 31, 42)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        else
                            Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 9),
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                ZIndex = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                        end
                    end                

                    Items["Slider"]:OnHover(function()
                        if Slider.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 0})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 0})
                        end
                        
                        if Data.Tooltip then
                            Library:ShowTooltip(Data.Tooltip, Items["Slider"].Instance)
                        end
                    end)

                    Items["Slider"]:OnHoverLeave(function()
                        if Slider.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 1})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 1})
                        end
                        
                        if Data.Tooltip then
                            Library:HideTooltip()
                        end
                    end)
                end

                function Slider:Get()
                    return Slider.Value 
                end

                function Slider:SetVisibility(Bool)
                    Items["Slider"].Instance.Visible = Bool
                end

                function Slider:Set(Value)
                    Slider.Value = Library:Round(MathClamp(Value, Slider.Min, Slider.Max), Slider.Decimals)
                    Library.Flags[Slider.Flag] = Slider.Value

                    if Slider.Sliding then
                        Items["Accent"].Instance.Size = UDim2New((Slider.Value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1, 0)
                    else
                        Items["Accent"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2New((Slider.Value - Slider.Min) / (Slider.Max - Slider.Min), 0, 1, 0)})
                    end

                    local DisplayText = StringFormat("%s%s", Slider.Value, Slider.Suffix)
                    if Slider.TextProps and Slider.TextProps[Slider.Value] then
                        DisplayText = Slider.TextProps[Slider.Value]
                    end
                    Items["Value"].Instance.Text = DisplayText

                    if Slider.Callback then 
                        Library:SafeCall(Slider.Callback, Slider.Value)
                    end
                end

                local InputChanged 
                
                Items["RealSlider"]:Connect("InputBegan", function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        Slider.Sliding = true

                        local SizeX = (Input.Position.X - Items["RealSlider"].Instance.AbsolutePosition.X) / Items["RealSlider"].Instance.AbsoluteSize.X
                        local Value = ((Slider.Max - Slider.Min) * SizeX) + Slider.Min

                        Slider:Set(Value)

                        if InputChanged then
                            return
                        end

                        InputChanged = Input.Changed:Connect(function()
                            if Input.UserInputState == Enum.UserInputState.End then
                                Slider.Sliding = false

                                InputChanged:Disconnect()
                                InputChanged = nil
                            end
                        end)
                    end
                end)

                Library:Connect(UserInputService.InputChanged, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                        if Slider.Sliding then
                            local SizeX = (Input.Position.X - Items["RealSlider"].Instance.AbsolutePosition.X) / Items["RealSlider"].Instance.AbsoluteSize.X
                            local Value = ((Slider.Max - Slider.Min) * SizeX) + Slider.Min

                            Slider:Set(Value)
                        end
                    end
                end)

                Items["Value"]:Connect("Focused", function()
                    Items["Value"]:ChangeItemTheme({TextColor3 = "Text"})
                    Items["Value"]:Tween(nil, {TextColor3 = Library.Theme.Text})
        
                    Items["Value"].Instance.Text = StringFormat("%s", tostring(Slider.Value))
                end)
        
                Items["Value"]:Connect("FocusLost", function()
                    Items["Value"]:ChangeItemTheme({TextColor3 = "Text 2"})
                    Items["Value"]:Tween(nil, {TextColor3 = Library.Theme["Text 2"]})
        
                    Slider:Set(tonumber(Items["Value"].Instance.Text))
                end)

                if Slider.Default then
                    Slider:Set(Slider.Default)
                end

                Library.SetFlags[Slider.Flag] = function(Value)
                    Slider:Set(Value)
                end

                return Slider 
            end

            Library.Sections.RangedSlider = function(self, Data)
                Data = Data or { }

                local RangedSlider = {
                    Window = self.Window,
                    Page = self.Page,
                    Section = self,

                    Name = Data.Name or Data.name or "Ranged Slider",
                    Flag = Data.Flag or Data.flag or Library:NextFlag(),
                    Min = Data.Min or Data.min or 0,
                    Default = Data.Default or Data.default or {Min = 10, Max = 20},
                    Max = Data.Max or Data.max or 100,
                    Suffix = Data.Suffix or Data.suffix or "",
                    Decimals = Data.Decimals or Data.decimals or 1,
                    Callback = Data.Callback or Data.callback or function() end,

                    Value = {Min = 0, Max = 0},
                    SlidingMin = false,
                    SlidingMax = false
                }

                local Items = { } do 
                    Items["Slider"] = Instances:Create("Frame", {
                        Parent = RangedSlider.Section.Items["Content"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 30),
                        BorderSizePixel = 0
                    })
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Slider"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = RangedSlider.Name,
                        AnchorPoint = Vector2New(0, 0.5),
                        ZIndex = 2,
                        Size = UDim2New(0, 120, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0.5, 0),
                        BorderSizePixel = 0,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})

                    Instances:Create("UIGradient", {
                        Parent = Items["Text"].Instance,
                        Name = "\0",
                        Transparency = NumSequence{NumSequenceKeypoint(0, 0), NumSequenceKeypoint(0.676, 0), NumSequenceKeypoint(1, 1)}
                    })

                    -- Holder for layout stability
                    Items["ValueHolder"] = Instances:Create("Frame", {
                        Parent = Items["Slider"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(1, 0.5),
                        Position = UDim2New(1, -5, 0.5, 0),
                        Size = UDim2New(0, 0, 1, 0),
                        AutomaticSize = Enum.AutomaticSize.X,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Active = false
                    })

                    Instances:Create("UIListLayout", {
                        Parent = Items["ValueHolder"].Instance,
                        Name = "\0",
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        Padding = UDimNew(0, 10)
                    })
                    
                    Items["Value"] = Instances:Create("TextLabel", {
                        LayoutOrder = 2,
                        Parent = Items["ValueHolder"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text 2"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "10 - 20",
                        Position = UDim2New(1, 0, 0.5, 0),
                        AnchorPoint = Vector2New(1, 0.5),
                        Size = UDim2New(0, 0, 0, 20),
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        TextSize = 16,
                        BackgroundColor3 = FromRGB(25, 25, 37)
                    }):AddToTheme({TextColor3 = 'Text 2'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 5)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        Color = FromRGB(29, 28, 32),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    })
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        PaddingRight = UDimNew(0, 5),
                        PaddingLeft = UDimNew(0, 5)
                    })
                    
                    Items["RealSlider"] = Instances:Create("TextButton", {
                        LayoutOrder = 1,
                        Parent = Items["ValueHolder"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(1, 0.5),
                        Position = UDim2New(0, -10, 0.5, 0),
                        Size = UDim2New(0, 75, 0, 5),
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        TextSize = 14,
                        BackgroundColor3 = Library.Theme["Element"]
                    }):AddToTheme({BackgroundColor3 = 'Element'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["RealSlider"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Items["Accent"] = Instances:Create("Frame", {
                        Parent = Items["RealSlider"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0.5, 0, 1, 0),
                        Position = UDim2New(0.25, 0, 0, 0),
                        ZIndex = 2,
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Accent"]
                    }):AddToTheme({BackgroundColor3 = 'Accent'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Accent"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                    
                    Items["DraggerMin"] = Instances:Create("Frame", {
                        Parent = Items["RealSlider"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(0.5, 0.5),
                        Position = UDim2New(0.25, 0, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 12, 0, 12),
                        ZIndex = 3,
                        BorderSizePixel = 0
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["DraggerMin"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })
                     
                    Items["DraggerMax"] = Instances:Create("Frame", {
                        Parent = Items["RealSlider"].Instance,
                        Name = "\0",
                        AnchorPoint = Vector2New(0.5, 0.5),
                        Position = UDim2New(0.75, 0, 0.5, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 12, 0, 12),
                        ZIndex = 3,
                        BorderSizePixel = 0
                    })
                    
                    Instances:Create("UICorner", {
                        Parent = Items["DraggerMax"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(1, 0)
                    })

                    if RangedSlider.Section.IsFirstElement then 
                        Items["Background"] = Instances:Create("Frame", {
                            Parent = Items["Slider"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, -15, 0, -10),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Size = UDim2New(1, 30, 1, 15),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            ZIndex = 0,
                            BackgroundColor3 = FromRGB(26, 28, 38)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        
                        Instances:Create("UICorner", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 15)
                        })

                        Items["BackgroundLiner"] = Instances:Create("Frame", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            AnchorPoint = Vector2New(0, 1),
                            Position = UDim2New(0, 0, 1, 0),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            Size = UDim2New(1, 0, 0, 15),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(29, 31, 42)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    else
                        if RangedSlider.Section.IsLastElement then
                            Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BackgroundTransparency = 1,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 13),
                                BorderSizePixel = 0,
                                ZIndex = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                            
                            Instances:Create("UICorner", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                CornerRadius = UDimNew(0, 15)
                            })

                            Items["BackgroundLiner"] = Instances:Create("Frame", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                AnchorPoint = Vector2New(0, 0),
                                Position = UDim2New(0, 0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                Size = UDim2New(1, 0, 0, 15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(29, 31, 42)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        else
                            Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Slider"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 9),
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                ZIndex = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                        end
                    end      

                    Items["Slider"]:OnHover(function()
                        if RangedSlider.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 0})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 0})
                        end
                        
                        if Data.Tooltip then
                            Library:ShowTooltip(Data.Tooltip, Items["Slider"].Instance)
                        end
                    end)

                    Items["Slider"]:OnHoverLeave(function()
                        if RangedSlider.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 1})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 1})
                        end
                        
                        if Data.Tooltip then
                            Library:HideTooltip()
                        end
                    end)
                end

                function RangedSlider:Get()
                    return RangedSlider.Value 
                end

                function RangedSlider:SetVisibility(Bool)
                    Items["Slider"].Instance.Visible = Bool
                end

                function RangedSlider:Set(Value)
                     if type(Value) == "table" then
                        RangedSlider.Value.Min = Library:Round(MathClamp(Value.Min, RangedSlider.Min, RangedSlider.Max), RangedSlider.Decimals)
                        RangedSlider.Value.Max = Library:Round(MathClamp(Value.Max, RangedSlider.Min, RangedSlider.Max), RangedSlider.Decimals)
                        
                        if RangedSlider.Value.Min > RangedSlider.Value.Max then
                            if RangedSlider.SlidingMin then
                                RangedSlider.Value.Min = RangedSlider.Value.Max
                            elseif RangedSlider.SlidingMax then
                                RangedSlider.Value.Max = RangedSlider.Value.Min
                            end
                        end
                    end

                    Library.Flags[RangedSlider.Flag] = RangedSlider.Value

                    local Range = RangedSlider.Max - RangedSlider.Min
                    local MinScale = (RangedSlider.Value.Min - RangedSlider.Min) / Range
                    local MaxScale = (RangedSlider.Value.Max - RangedSlider.Min) / Range
                    local SizeScale = MaxScale - MinScale

                    if RangedSlider.SlidingMin or RangedSlider.SlidingMax then
                        Items["Accent"].Instance.Position = UDim2New(MinScale, 0, 0, 0)
                        Items["Accent"].Instance.Size = UDim2New(SizeScale, 0, 1, 0)
                        Items["DraggerMin"].Instance.Position = UDim2New(MinScale, 0, 0.5, 0)
                        Items["DraggerMax"].Instance.Position = UDim2New(MaxScale, 0, 0.5, 0)
                    else
                        Items["Accent"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                            Position = UDim2New(MinScale, 0, 0, 0),
                            Size = UDim2New(SizeScale, 0, 1, 0)
                        })
                        Items["DraggerMin"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                            Position = UDim2New(MinScale, 0, 0.5, 0)
                        })
                        Items["DraggerMax"]:Tween(TweenInfo.new(Library.Tween.Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                            Position = UDim2New(MaxScale, 0, 0.5, 0)
                        })
                    end

                    Items["Value"].Instance.Text = StringFormat("%s - %s %s", RangedSlider.Value.Min, RangedSlider.Value.Max, RangedSlider.Suffix)

                    if RangedSlider.Callback then 
                        Library:SafeCall(RangedSlider.Callback, RangedSlider.Value)
                    end
                end

                local InputChanged 
                
                Items["RealSlider"]:Connect("InputBegan", function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        local SizeX = (Input.Position.X - Items["RealSlider"].Instance.AbsolutePosition.X) / Items["RealSlider"].Instance.AbsoluteSize.X
                        local Value = ((RangedSlider.Max - RangedSlider.Min) * SizeX) + RangedSlider.Min
                        
                        local DistMin = math.abs(Value - RangedSlider.Value.Min)
                        local DistMax = math.abs(Value - RangedSlider.Value.Max)
                        
                        if DistMin < DistMax then
                            RangedSlider.SlidingMin = true
                            RangedSlider:Set({Min = Value, Max = RangedSlider.Value.Max})
                        else
                            RangedSlider.SlidingMax = true
                            RangedSlider:Set({Min = RangedSlider.Value.Min, Max = Value})
                        end

                        if InputChanged then
                            return
                        end

                        InputChanged = Input.Changed:Connect(function()
                            if Input.UserInputState == Enum.UserInputState.End then
                                RangedSlider.SlidingMin = false
                                RangedSlider.SlidingMax = false

                                InputChanged:Disconnect()
                                InputChanged = nil
                            end
                        end)
                    end
                end)

                Library:Connect(UserInputService.InputChanged, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                        if RangedSlider.SlidingMin then
                            local SizeX = (Input.Position.X - Items["RealSlider"].Instance.AbsolutePosition.X) / Items["RealSlider"].Instance.AbsoluteSize.X
                            local Value = ((RangedSlider.Max - RangedSlider.Min) * SizeX) + RangedSlider.Min
                            RangedSlider:Set({Min = Value, Max = RangedSlider.Value.Max})
                        elseif RangedSlider.SlidingMax then
                            local SizeX = (Input.Position.X - Items["RealSlider"].Instance.AbsolutePosition.X) / Items["RealSlider"].Instance.AbsoluteSize.X
                            local Value = ((RangedSlider.Max - RangedSlider.Min) * SizeX) + RangedSlider.Min
                            RangedSlider:Set({Min = RangedSlider.Value.Min, Max = Value})
                        end
                    end
                end)

                if RangedSlider.Default then
                    RangedSlider:Set(RangedSlider.Default)
                end

                Library.SetFlags[RangedSlider.Flag] = function(Value)
                    RangedSlider:Set(Value)
                end

                return RangedSlider 
            end

            Library.Sections.Dropdown = function(self, Data)
                Data = Data or { }

                local Dropdown = {
                    Window = self.Window,
                    Page = self.Page,
                    Section = self,

                    Name = Data.Name or Data.name or "Dropdown",
                    Flag = Data.Flag or Data.flag or Library:NextFlag(),
                    Items = Data.Items or Data.items or { "One", "Two", "Three" },
                    Default = Data.Default or Data.default or nil,
                    Callback = Data.Callback or Data.callback or function() end,
                    Multi = Data.Multi or Data.multi or false,
                    MaxSize = Data.MaxSize or Data.maxsize or 85,
                    Size = Data.Size or Data.size or 105,

                    Value = { },
                    Options = { },
                    IsOpen = false
                }

                local Items = { } do 
                    Items["Dropdown"] = Instances:Create("Frame", {
                        Parent = Dropdown.Section.Items["Content"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 30),
                        BorderSizePixel = 0
                    })
                    
                    Items["RealDropdown"] = Instances:Create("TextButton", {
                        Parent = Items["Dropdown"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        AnchorPoint = Vector2New(1, 0.5),
                        Position = UDim2New(1, 0, 0.5, 0),
                        ZIndex = 2,
                        Size = UDim2New(0, Dropdown.Size, 0, 24),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        BackgroundColor3 = Library.Theme["Element"]
                    }):AddToTheme({BackgroundColor3 = 'Element'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["RealDropdown"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["RealDropdown"].Instance,
                        Name = "\0",
                        Color = FromRGB(29, 28, 32),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = "Outline 2"})
                    
                    Items["Value"] = Instances:Create("TextLabel", {
                        Parent = Items["RealDropdown"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "...",
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(1, -28, 0, 15),
                        BackgroundTransparency = 1,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Position = UDim2New(0, 8, 0.5, 0),
                        ZIndex = 2,
                        BorderSizePixel = 0,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})
                    
                    Instances:Create("UIGradient", {
                        Parent = Items["Value"].Instance,
                        Name = "\0",
                        Transparency = NumSequence{NumSequenceKeypoint(0, 0), NumSequenceKeypoint(0.676, 0), NumSequenceKeypoint(1, 1)}
                    })
                    
                    Items["ArrowIcon"] = Instances:Create("ImageLabel", {
                        Parent = Items["RealDropdown"].Instance,
                        Name = "\0",
                        ImageColor3 = Library.Theme["Text 2"],
                        ScaleType = Enum.ScaleType.Fit,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(1, 0.5),
                        ZIndex = 2,
                        Image = "rbxassetid://111436698580046",
                        BackgroundTransparency = 1,
                        Position = UDim2New(1, -8, 0.5, 0),
                        Size = UDim2New(0, 9, 0, 5),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = 'Text 2'})
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Dropdown"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Dropdown.Name,
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0.5, 0),
                        BorderSizePixel = 0,
                        ZIndex = 2,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})       
                    
                    if Dropdown.Section.IsFirstElement then -- this is cancer bro iswear
                        Items["Background"] = Instances:Create("Frame", {
                            Parent = Items["Dropdown"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, -15, 0, -10),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Size = UDim2New(1, 30, 1, 15),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(26, 28, 38)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        
                        Instances:Create("UICorner", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 15)
                        })

                        Items["BackgroundLiner"] = Instances:Create("Frame", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            AnchorPoint = Vector2New(0, 1),
                            Position = UDim2New(0, 0, 1, 0),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            Size = UDim2New(1, 0, 0, 15),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(29, 31, 42)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    else
                        if Dropdown.Section.IsLastElement then
                            Instances:Create("Frame", {
                                Parent = Items["Dropdown"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Dropdown"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BackgroundTransparency = 1,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 13),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                            
                            Instances:Create("UICorner", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                CornerRadius = UDimNew(0, 15)
                            })

                            Items["BackgroundLiner"] = Instances:Create("Frame", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                AnchorPoint = Vector2New(0, 0),
                                Position = UDim2New(0, 0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                Size = UDim2New(1, 0, 0, 15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(29, 31, 42)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        else
                            Instances:Create("Frame", {
                                Parent = Items["Dropdown"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Dropdown"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 9),
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                        end
                    end        

                    Items["OptionHolder"] = Instances:Create("Frame", {
                        Parent = Library.UnusedHolder.Instance,
                        Name = "\0",
                        BackgroundTransparency = 0,
                        Position = UDim2New(0, 20, 0, 91),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(0, 122, 0, 80),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Background"]
                    }):AddToTheme({BackgroundColor3 = 'Background'})

                    --Library:MakeBlurred(Items["OptionHolder"], Dropdown)
                    
                    Instances:Create("UICorner", {
                        Parent = Items["OptionHolder"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 12)
                    })

                    Instances:Create("UIStroke", {
                        Parent = Items["OptionHolder"].Instance,
                        Name = "\0",
                        Color = FromRGB(29, 28, 32),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Outline 2'})

                    Items["Search"] = Instances:Create("Frame", {
                        Parent = Items["OptionHolder"].Instance,
                        Name = "\0",
                        Position = UDim2New(0, 8, 0, 8),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, -16, 0, 25),
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Element"],
                        Visible = false
                    }):AddToTheme({BackgroundColor3 = "Element"})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Search"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["Search"].Instance,
                        Name = "\0",
                        Color = Library.Theme["Outline 2"],
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Outline 2'})

                    Items["SearchIcon"] = Instances:Create("ImageLabel", {
                        Parent = Items["Search"].Instance,
                        Name = "\0",
                        ImageColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://93412599989519",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 8, 0.5, 0),
                        Size = UDim2New(0, 14, 0, 14),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = "Text"})

                    Items["SearchInput"] = Instances:Create("TextBox", {
                        Parent = Items["Search"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        AnchorPoint = Vector2New(0, 0.5),
                        PlaceholderColor3 = Library.Theme["Text 2"],
                        PlaceholderText = "Search..",
                        TextSize = 14,
                        Size = UDim2New(1, -30, 0, 15),
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        BackgroundTransparency = 1,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        CursorPosition = -1,
                        Position = UDim2New(0, 26, 0.5, 0),
                        BorderSizePixel = 0
                    }):AddToTheme({TextColor3 = "Text", PlaceholderColor3 = "Text 2"})
                    
                    Items["Holder"] = Instances:Create("ScrollingFrame", {
                        Parent = Items["OptionHolder"].Instance,
                        Name = "\0",
                        Active = true,
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        BorderSizePixel = 0,
                        CanvasSize = UDim2New(0, 0, 0, 0),
                        MidImage = "rbxassetid://81680855285439",
                        BorderColor3 = FromRGB(0, 0, 0),
                        ScrollBarThickness = 2,
                        Size = UDim2New(1, -16, 1, -16),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 8, 0, 8),
                        BottomImage = "rbxassetid://81680855285439",
                        TopImage = "rbxassetid://81680855285439"
                    }):AddToTheme({ScrollBarImageColor3 = "Text 2"})

                    Instances:Create("UIListLayout", {
                        Parent = Items["Holder"].Instance,
                        Name = "\0",
                        Padding = UDimNew(0, 6),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["Holder"].Instance,
                        Name = "\0",
                        PaddingTop = UDimNew(0, 5),
                        PaddingBottom = UDimNew(0, 10),
                        PaddingRight = UDimNew(0, 8),
                        PaddingLeft = UDimNew(0, 0)
                    })          

                    Library:Connect(Items["SearchInput"].Instance:GetPropertyChangedSignal("Text"), function()
                        for Index, Value in Dropdown.Options do
                            if not string.find(string.lower(Value.Name), string.lower(Items["SearchInput"].Instance.Text)) then 
                                Value.Button.Instance.Visible = false
                            else
                                Value.Button.Instance.Visible = true
                            end
                        end
                    end)
                    
                    Items["Dropdown"]:OnHover(function()
                        if Dropdown.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 0})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 0})
                        end
                        
                        if Data.Tooltip then
                            Library:ShowTooltip(Data.Tooltip, Items["Dropdown"].Instance)
                        end
                    end)

                    Items["Dropdown"]:OnHoverLeave(function()
                        if Dropdown.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 1})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 1})
                        end
                        
                        if Data.Tooltip then
                            Library:HideTooltip()
                        end
                    end)
                end

                function Dropdown:Get()
                    return Dropdown.Value
                end

                function Dropdown:SetVisibility(Bool)
                    Items["Dropdown"].Instance.Visible = Bool
                end

                local Debounce = false 
                local RenderStepped 

                function Dropdown:SetOpen(Bool)
                    if Debounce then 
                        return
                    end

                    Dropdown.IsOpen = Bool

                    Debounce = true 

                    local UIScale = Library.Holder.Instance:FindFirstChild("UIScale")
                    local Scale = UIScale and UIScale.Scale or 1

                    if Dropdown.IsOpen then 
                        Items["OptionHolder"].Instance.Visible = true
                        Items["OptionHolder"].Instance.Parent = Library.Holder.Instance
                        Items["OptionHolder"].Instance.Size = UDim2New(0, Items["RealDropdown"].Instance.AbsoluteSize.X / Scale, 0, 0)

                        Items["OptionHolder"].Instance.Position = UDim2New(0, Items["RealDropdown"].Instance.AbsolutePosition.X / Scale, 0, (Items["RealDropdown"].Instance.AbsolutePosition.Y / Scale) - 25)             
                        Items["OptionHolder"]:Tween(nil, {Size = UDim2New(0, Items["RealDropdown"].Instance.AbsoluteSize.X / Scale, 0, Dropdown.MaxSize)})

                        Items["Search"].Instance.Visible = Library.DropdownSearch
                        if Library.DropdownSearch then 
                            Items["Holder"].Instance.Position = UDim2New(0, 8, 0, 38)
                            Items["Holder"].Instance.Size = UDim2New(1, -16, 1, -46)
                        else
                            Items["Holder"].Instance.Position = UDim2New(0, 8, 0, 8)
                            Items["Holder"].Instance.Size = UDim2New(1, -16, 1, -16)
                        end

                        for Index, Value in Library.OpenFrames do 
                            if Value ~= Dropdown and not Dropdown.Section.IsSettings then 
                                Value:SetOpen(false)
                            end
                        end

                        Library.OpenFrames[Dropdown] = Dropdown 
                    else
                        if Library.OpenFrames[Dropdown] then 
                            Library.OpenFrames[Dropdown] = nil
                        end

                        if RenderStepped then 
                            RenderStepped:Disconnect()
                            RenderStepped = nil
                        end

                        Items["OptionHolder"]:Tween(nil, {Size = UDim2New(0, Items["RealDropdown"].Instance.AbsoluteSize.X / Scale, 0, 0)})
                    end

                    local Descendants = Items["OptionHolder"].Instance:GetDescendants()
                    TableInsert(Descendants, Items["OptionHolder"].Instance)

                    local NewTween

                    for Index, Value in Descendants do 
                        local TransparencyProperty = Tween:GetProperty(Value)

                        if not TransparencyProperty then
                            continue 
                        end

                        if not Value.ClassName:find("UI") then 
                            Value.ZIndex = (Dropdown.IsOpen and Dropdown.Section.IsSettings and 111 or 1) or (Dropdown.IsOpen and 4 or 1)
                        end

                        if type(TransparencyProperty) == "table" then 
                            for _, Property in TransparencyProperty do 
                                NewTween = Tween:FadeItem(Value, Property, Bool, Library.FadeSpeed)
                            end
                        else
                            NewTween = Tween:FadeItem(Value, TransparencyProperty, Bool, Library.FadeSpeed)
                        end
                    end
                    
                    NewTween.Tween.Completed:Connect(function()
                        Debounce = false 
                        Items["OptionHolder"].Instance.Visible = Dropdown.IsOpen
                        task.wait(0.2)
                        Items["OptionHolder"].Instance.Parent = not Dropdown.IsOpen and Library.UnusedHolder.Instance or Library.Holder.Instance

                        task.wait(0.1)

                        if Dropdown.IsOpen then 
                            RenderStepped = Library:Connect(RunService.RenderStepped, function()
                                local UIScale = Library.Holder.Instance:FindFirstChild("UIScale")
                                local Scale = UIScale and UIScale.Scale or 1
                                Items["OptionHolder"].Instance.Position = UDim2New(0, Items["RealDropdown"].Instance.AbsolutePosition.X / Scale, 0, (Items["RealDropdown"].Instance.AbsolutePosition.Y / Scale) - 25)             
                                Items["OptionHolder"].Instance.Size = UDim2New(0, Items["RealDropdown"].Instance.AbsoluteSize.X / Scale, 0, Dropdown.MaxSize)
                            end)
                        else
                            if RenderStepped then 
                                RenderStepped:Disconnect()
                                RenderStepped = nil
                            end

                            Items["OptionHolder"]:Tween(nil, {Size = UDim2New(0, Items["RealDropdown"].Instance.AbsoluteSize.X / Scale, 0, 0)})
                        end
                    end)
                end

                function Dropdown:Set(Option)
                    if Dropdown.Multi then 
                        if type(Option) ~= "table" then 
                            return
                        end

                        Dropdown.Value = Option
                        Library.Flags[Dropdown.Flag] = Option

                        for Index, Value in Option do
                            local OptionData = Dropdown.Options[Value]
                            
                            if not OptionData then
                                continue
                            end

                            OptionData.Selected = true 
                            OptionData:Toggle("Active")
                        end

                        Items["Value"].Instance.Text = TableConcat(Option, ", ")
                    else
                        if not Dropdown.Options[Option] then
                            return
                        end

                        local OptionData = Dropdown.Options[Option]

                        Dropdown.Value = Option
                        Library.Flags[Dropdown.Flag] = Option

                        for Index, Value in Dropdown.Options do
                            if Value ~= OptionData then
                                Value.Selected = false 
                                Value:Toggle("Inactive")
                            else
                                Value.Selected = true 
                                Value:Toggle("Active")
                            end
                        end

                        Items["Value"].Instance.Text = Option
                    end

                    if Dropdown.Callback then   
                        Library:SafeCall(Dropdown.Callback, Dropdown.Value)
                    end
                end

                function Dropdown:Add(Option)
                    local OptionButton = Instances:Create("TextButton", {
                        Parent = Items["Holder"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = FromRGB(0, 0, 0),
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        BackgroundTransparency = 1,
                        Size = UDim2New(1, 0, 0, 25),
                        BorderSizePixel = 0,
                        TextSize = 14,
                        BackgroundColor3 = FromRGB(26, 28, 38)
                    }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    
                    local OptionCheck = Instances:Create("ImageLabel", {
                        Parent = OptionButton.Instance,
                        Name = "\0",
                        ImageTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://107907951570295",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 5, 0.5, 0),
                        Size = UDim2New(0, 16, 0, 16),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = 'Text'})
                    
                    local OptionText = Instances:Create("TextLabel", {
                        Parent = OptionButton.Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text 2"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Option,
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 28, 0.5, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text 2'})
                    
                    Instances:Create("UICorner", {
                        Parent = OptionButton.Instance,
                        Name = "\0"
                    })                

                    OptionButton:OnHover(function()
                        OptionButton:Tween(nil, {BackgroundTransparency = 0})
                    end)

                    OptionButton:OnHoverLeave(function()
                        OptionButton:Tween(nil, {BackgroundTransparency = 1})
                    end)
                    
                    local OptionData = {
                        Button = OptionButton,
                        Name = Option,
                        Check = OptionCheck,
                        Text = OptionText,
                        Selected = false
                    }
                    
                    function OptionData:Toggle(Value)
                        if Value == "Active" then
                            OptionData.Check:Tween(nil, {ImageTransparency = 0})
                            OptionData.Text:ChangeItemTheme({TextColor3 = "Text"})
                            OptionData.Text:Tween(nil, {TextColor3 = Library.Theme.Text})
                        else
                            OptionData.Check:Tween(nil, {ImageTransparency = 1})
                            OptionData.Text:ChangeItemTheme({TextColor3 = "Text 2"})
                            OptionData.Text:Tween(nil, {TextColor3 = Library.Theme["Text 2"]})
                        end
                    end

                    function OptionData:Set()
                        OptionData.Selected = not OptionData.Selected

                        if Dropdown.Multi then 
                            local Index = TableFind(Dropdown.Value, OptionData.Name)

                            if Index then 
                                TableRemove(Dropdown.Value, Index)
                            else
                                TableInsert(Dropdown.Value, OptionData.Name)
                            end

                            OptionData:Toggle(Index and "Inactive" or "Active")

                            Library.Flags[Dropdown.Flag] = Dropdown.Value

                            local TextFormat = #Dropdown.Value > 0 and TableConcat(Dropdown.Value, ", ") or "..."
                            Items["Value"].Instance.Text = TextFormat
                        else
                            if OptionData.Selected then 
                                Dropdown.Value = OptionData.Name
                                Library.Flags[Dropdown.Flag] = OptionData.Name

                                OptionData.Selected = true
                                OptionData:Toggle("Active")

                                for Index, Value in Dropdown.Options do 
                                    if Value ~= OptionData then
                                        Value.Selected = false 
                                        Value:Toggle("Inactive")
                                    end
                                end

                                Items["Value"].Instance.Text = OptionData.Name
                            else
                                Dropdown.Value = nil
                                Library.Flags[Dropdown.Flag] = nil

                                OptionData.Selected = false
                                OptionData:Toggle("Inactive")

                                Items["Value"].Instance.Text = "..."
                            end
                        end

                        if Dropdown.Callback then
                            Library:SafeCall(Dropdown.Callback, Dropdown.Value)
                        end
                    end

                    OptionData.Button:Connect("MouseButton1Down", function()
                        OptionData:Set()
                    end)

                    Dropdown.Options[OptionData.Name] = OptionData
                    return OptionData
                end

                function Dropdown:Remove(Option)
                    if Dropdown.Options[Option] then
                        Dropdown.Options[Option].Button:Clean()
                        Dropdown.Options[Option] = nil
                    end
                end

                function Dropdown:Refresh(List)
                    for Index, Value in Dropdown.Options do 
                        Dropdown:Remove(Value.Name)
                    end

                    for Index, Value in List do 
                        Dropdown:Add(Value)
                    end
                end

                Items["RealDropdown"]:Connect("MouseButton1Down", function()
                    Dropdown:SetOpen(not Dropdown.IsOpen)
                end)

                Library:Connect(UserInputService.InputBegan, function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        if Dropdown.IsOpen then
                            if Library:IsMouseOverFrame(Items["OptionHolder"]) then
                                return
                            end

                            Dropdown:SetOpen(false)
                        end
                    end
                end)

                Items["RealDropdown"]:Connect("Changed", function(Property)
                    if Property == "AbsolutePosition" and Dropdown.IsOpen then
                        Dropdown.IsOpen = not Library:IsClipped(Items["OptionHolder"].Instance, Dropdown.Section.Items["Section"].Instance.Parent)
                        Items["OptionHolder"].Instance.Visible = Dropdown.IsOpen
                    end
                end)

                for Index, Value in Dropdown.Items do 
                    Dropdown:Add(Value)
                end

                if Dropdown.Default then 
                    Dropdown:Set(Dropdown.Default)
                end

                Library.SetFlags[Dropdown.Flag] = function(Value)
                    Dropdown:Set(Value)
                end

                return Dropdown
            end

            Library.Sections.Label = function(self, Data)
                local Name = type(Data) == "table" and (Data.Name or Data.name) or Data
                local Label = {
                    Window = self.Window,
                    Page = self.Page,
                    Section = self,

                    Name = Name or "Label"
                }

                local Items = { } do 
                    Items["Label"] = Instances:Create("Frame", {
                        Parent = Label.Section.Items["Content"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 30),
                        BorderSizePixel = 0
                    })
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Label"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Label.Name,
                        ZIndex = 2,
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0.5, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})
                    
                    Items["SubElements"] = Instances:Create("Frame", {
                        Parent = Items["Label"].Instance,
                        Name = "\0",
                        ZIndex = 3,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(1, 0.5),
                        BackgroundTransparency = 1,
                        Position = UDim2New(1, 0, 0.5, 0),
                        Size = UDim2New(0, 0, 0, 20),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X
                    })
                    
                    Instances:Create("UIListLayout", {
                        Parent = Items["SubElements"].Instance,
                        Name = "\0",
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Right,
                        Padding = UDimNew(0, 8),
                        SortOrder = Enum.SortOrder.LayoutOrder
                    })

                    if Label.Section.IsFirstElement then
                        Items["Background"] = Instances:Create("Frame", {
                            Parent = Items["Label"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, -15, 0, -10),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Size = UDim2New(1, 30, 1, 15),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(26, 28, 38)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        
                        Instances:Create("UICorner", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 15)
                        })

                        Items["BackgroundLiner"] = Instances:Create("Frame", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            AnchorPoint = Vector2New(0, 1),
                            Position = UDim2New(0, 0, 1, 0),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            Size = UDim2New(1, 0, 0, 15),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(29, 31, 42)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    else
                        if Label.Section.IsLastElement then
                            Instances:Create("Frame", {
                                Parent = Items["Label"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Label"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BackgroundTransparency = 1,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 13),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                            
                            Instances:Create("UICorner", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                CornerRadius = UDimNew(0, 15)
                            })

                            Items["BackgroundLiner"] = Instances:Create("Frame", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                AnchorPoint = Vector2New(0, 0),
                                Position = UDim2New(0, 0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                Size = UDim2New(1, 0, 0, 15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(29, 31, 42)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        else
                            Instances:Create("Frame", {
                                Parent = Items["Label"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Label"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 9),
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                        end
                    end    

                    Items["Label"]:OnHover(function()
                        if Label.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 0})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 0})
                        end
                        
                        if type(Data) == "table" and Data.Tooltip then
                            Library:ShowTooltip(Data.Tooltip, Items["Label"].Instance)
                        end
                    end)

                    Items["Label"]:OnHoverLeave(function()
                        if Label.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 1})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 1})
                        end
                        
                        if type(Data) == "table" and Data.Tooltip then
                            Library:HideTooltip()
                        end
                    end)
                end

                function Label:SetText(Text)
                    Text = tostring(Text)
                    Items["Text"].Instance.Text = Text
                end

                function Label:SetVisibility(Bool)
                    Items["Label"].Instance.Visible = Bool
                end

                function Label:Colorpicker(Data)
                    Data = Data or { }

                    local Colorpicker = {
                        Window = Label.Window,
                        Page = Label.Page,
                        Section = Label.Section,

                        Flag = Data.Flag or Data.flag or Library:NextFlag(),
                        Default = Data.Default or Data.default or Color3.fromRGB(255, 255, 255),
                        Callback = Data.Callback or Data.callback or function() end,
                        Alpha = Data.Alpha or Data.alpha or false
                    }

                    local NewColorpicker, ColorpickerItems = Library:CreateColorpicker({
                        Parent = Items["SubElements"],
                        Page = Colorpicker.Page,
                        Section = Colorpicker.Section,
                        Flag = Colorpicker.Flag,
                        Default = Colorpicker.Default,
                        Callback = Colorpicker.Callback,
                        Alpha = Colorpicker.Alpha
                    })

                    return NewColorpicker
                end

                function Label:Keybind(Data)
                    Data = Data or { }

                    local Keybind = {
                        Window = Label.Window,
                        Page = Label.Page,
                        Section = Label.Section,

                        Flag = Data.Flag or Data.flag or Library:NextFlag(),
                        Default = Data.Default or Data.default or Enum.KeyCode.E,
                        Callback = Data.Callback or Data.callback or function() end,
                        Mode = Data.Mode or Data.mode or "Toggle"
                    }

                    local NewKeybind, KeybindItems = Library:CreateKeybind({
                        Parent = Items["SubElements"],
                        Page = Keybind.Page,
                        Section = Keybind.Section,
                        Flag = Keybind.Flag,
                        Default = Keybind.Default,
                        Mode = Keybind.Mode,
                        Callback = Keybind.Callback
                    })

                    return NewKeybind
                end

                return Label
            end

            Library.Sections.Textbox = function(self, Data)
                Data = Data or { }

                local Textbox = {
                    Window = self.Window,
                    Page = self.Page,
                    Section = self,

                    Name = Data.Name or Data.name or "Textbox",
                    Flag = Data.Flag or Data.flag or Library:NextFlag(),
                    Default = Data.Default or Data.default or "",
                    Callback = Data.Callback or Data.callback or function() end,
                    Placeholder = Data.Placeholder or Data.placeholder or "Placeholder",
                    Numeric = Data.Numeric or Data.numeric or false,
                    Finished = Data.Finished or Data.finished or false,
                    Size = Data.Size or Data.size or UDim2New(0.44999998807907104, 0, 0, 24),

                    Value = ""
                }

                local Items = { } do 
                    Items["Textbox"] = Instances:Create("Frame", {
                        Parent = Textbox.Section.Items["Content"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 30),
                        BorderSizePixel = 0
                    })
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["Textbox"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Textbox.Name,
                        AnchorPoint = Vector2New(0, 0.5),
                        Size = UDim2New(0, 0, 0, 15),
                        ZIndex = 2,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0.5, 0),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})
                    
                    Items["Background"] = Instances:Create("Frame", {
                        Parent = Items["Textbox"].Instance,
                        Name = "\0",
                        ClipsDescendants = true,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(1, 0.5),
                        Size = Textbox.Size,
                        Position = UDim2New(1, 0, 0.5, 0),
                        ZIndex = 2,
                        Selectable = true,
                        Active = true,
                        BorderSizePixel = 0,
                        BackgroundColor3 = Library.Theme["Element"]
                    }):AddToTheme({BackgroundColor3 = 'Element'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["Background"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["Background"].Instance,
                        Name = "\0",
                        Color = FromRGB(29, 28, 32),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Outline 2'})
                    
                    Items["Input"] = Instances:Create("TextBox", {
                        Parent = Items["Background"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        Active = false,
                        Selectable = false,
                        AnchorPoint = Vector2New(0, 0.5),
                        PlaceholderColor3 = FromRGB(125, 125, 125),
                        PlaceholderText = Textbox.Placeholder,
                        TextSize = 18,
                        Size = UDim2New(1, -16, 0, 15),
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        ZIndex = 2,
                        BackgroundTransparency = 1,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Position = UDim2New(0, 8, 0.5, 0),
                        ClearTextOnFocus = false,
                        BorderSizePixel = 0
                    }):AddToTheme({TextColor3 = 'Text'})  
                    
                    if Textbox.Section.IsFirstElement then
                        Items["Background"] = Instances:Create("Frame", {
                            Parent = Items["Textbox"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, -15, 0, -10),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Size = UDim2New(1, 30, 1, 15),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(26, 28, 38)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        
                        Instances:Create("UICorner", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 15)
                        })

                        Items["BackgroundLiner"] = Instances:Create("Frame", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            AnchorPoint = Vector2New(0, 1),
                            Position = UDim2New(0, 0, 1, 0),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            Size = UDim2New(1, 0, 0, 15),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(29, 31, 42)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    else
                        if Textbox.Section.IsLastElement then
                            Instances:Create("Frame", {
                                Parent = Items["Textbox"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Textbox"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BackgroundTransparency = 1,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 13),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                            
                            Instances:Create("UICorner", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                CornerRadius = UDimNew(0, 15)
                            })

                            Items["BackgroundLiner"] = Instances:Create("Frame", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                AnchorPoint = Vector2New(0, 0),
                                Position = UDim2New(0, 0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                Size = UDim2New(1, 0, 0, 15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(29, 31, 42)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        else
                            Instances:Create("Frame", {
                                Parent = Items["Textbox"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Textbox"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 9),
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                        end
                    end    

                    Items["Textbox"]:OnHover(function()
                        if Textbox.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 0})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 0})
                        end
                        
                        if Data.Tooltip then
                            Library:ShowTooltip(Data.Tooltip, Items["Textbox"].Instance)
                        end
                    end)

                    Items["Textbox"]:OnHoverLeave(function()
                        if Textbox.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 1})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 1})
                        end
                        
                        if Data.Tooltip then
                            Library:HideTooltip()
                        end
                    end)
                end
                
                function Textbox:Get()
                    return Textbox.Value
                end

                function Textbox:SetVisibility(Bool)
                    Items["Textbox"].Instance.Visible = Bool
                end

                function Textbox:Set(Value)
                    if Textbox.Numeric then
                        if (not tonumber(Value)) and StringLen(tostring(Value)) > 0 then
                            Value = Textbox.Value
                        end
                    end

                    Textbox.Value = Value
                    Items["Input"].Instance.Text = Value
                    Library.Flags[Textbox.Flag] = Value

                    if Textbox.Callback then
                        Library:SafeCall(Textbox.Callback, Value)
                    end
                end

                if Textbox.Finished then 
                    Items["Input"]:Connect("FocusLost", function(PressedEnterQuestionMark)
                        if PressedEnterQuestionMark then
                            Textbox:Set(Items["Input"].Instance.Text)
                        end
                    end)
                else
                    Library:Connect(Items["Input"].Instance:GetPropertyChangedSignal("Text"), function()
                        Textbox:Set(Items["Input"].Instance.Text)
                    end)
                end

                if Textbox.Default then
                    Textbox:Set(Textbox.Default)
                end

                Library.SetFlags[Textbox.Flag] = function(Value)
                    Textbox:Set(Value)
                end

                return Textbox
            end

            Library.Sections.Keybind = function(self, Data)
                Data = Data or { }

                local Keybind = { 
                    Window = self.Window,
                    Page = self.Page,
                    Section = self,

                    Name = Data.Name or Data.name or "Keybind",
                    Flag = Data.Flag or Data.flag or Library:NextFlag(),
                    Default = Data.Default or Data.default or Enum.KeyCode.RightShift,
                    Callback = Data.Callback or Data.callback or function() end,
                    RealMode = Data.Mode or Data.mode or "Toggle",

                    Key = "",
                    Value = "",
                    Mode = "",

                    Picking = false,
                    IsOpen = false,
                    Toggled = false 
                }

                local Items = { } do 
                    Items["Keybind"] = Instances:Create("Frame", {
                        Parent = Keybind.Section.Items["Content"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        Size = UDim2New(1, 0, 0, 65),
                        BorderSizePixel = 0
                    })
                    
                    Items["RealKey"] = Instances:Create("Frame", {
                        Parent = Items["Keybind"].Instance,
                        Name = "\0",
                        BackgroundTransparency = 1,
                        BorderColor3 = FromRGB(0, 0, 0),
                        ZIndex = 2,
                        Size = UDim2New(1, 0, 0, 30),
                        BorderSizePixel = 0
                    })
                    
                    Items["KeyButton"] = Instances:Create("TextButton", {
                        Parent = Items["RealKey"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "Shift",
                        AutoButtonColor = false,
                        ZIndex = 2,
                        AnchorPoint = Vector2New(1, 0),
                        Size = UDim2New(0, 0, 0, 24),
                        Position = UDim2New(1, 0, 0, 5),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18,
                        BackgroundColor3 = Library.Theme["Element"]
                    }):AddToTheme({BackgroundColor3 = 'Element', TextColor3 = 'Text'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["KeyButton"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["KeyButton"].Instance,
                        Name = "\0",
                        Color = FromRGB(29, 28, 32),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    }):AddToTheme({Color = 'Outline 2'})
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["KeyButton"].Instance,
                        Name = "\0",
                        PaddingRight = UDimNew(0, 8),
                        PaddingLeft = UDimNew(0, 8)
                    })
                    
                    Items["Text"] = Instances:Create("TextLabel", {
                        Parent = Items["RealKey"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = Keybind.Name,
                        ZIndex = 2,
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0, 8),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})
                    
                    Items["RealMode"] = Instances:Create("Frame", {
                        Parent = Items["Keybind"].Instance,
                        Name = "\0",
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 1),
                        ZIndex = 2,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 1, 0),
                        Size = UDim2New(1, 0, 0, 30),
                        BorderSizePixel = 0
                    })
                    
                    Items["ModeButton"] = Instances:Create("TextButton", {
                        Parent = Items["RealMode"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "",
                        AutoButtonColor = false,
                        ZIndex = 2,
                        AnchorPoint = Vector2New(1, 0),
                        Size = UDim2New(0, 0, 0, 24),
                        Position = UDim2New(1, 0, 0, 5),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18,
                        BackgroundColor3 = Library.Theme["Element"]
                    }):AddToTheme({BackgroundColor3 = 'Element'})
                    
                    Instances:Create("UICorner", {
                        Parent = Items["ModeButton"].Instance,
                        Name = "\0",
                        CornerRadius = UDimNew(0, 6)
                    })
                    
                    Instances:Create("UIStroke", {
                        Parent = Items["ModeButton"].Instance,
                        Name = "\0",
                        Color = FromRGB(29, 28, 32),
                        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    })
                    
                    Instances:Create("UIPadding", {
                        Parent = Items["ModeButton"].Instance,
                        Name = "\0",
                        PaddingRight = UDimNew(0, 8),
                        PaddingLeft = UDimNew(0, 8)
                    })
                    
                    Items["Icon"] = Instances:Create("ImageLabel", {
                        Parent = Items["ModeButton"].Instance,
                        Name = "\0",
                        ImageColor3 = Library.Theme["Accent"],
                        ZIndex = 2,
                        BorderColor3 = FromRGB(0, 0, 0),
                        AnchorPoint = Vector2New(0, 0.5),
                        Image = "rbxassetid://124351435313553",
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0.5, 0),
                        Size = UDim2New(0, 18, 0, 18),
                        BorderSizePixel = 0
                    }):AddToTheme({ImageColor3 = 'Accent'})
                    
                    Items["ModeValue"] = Instances:Create("TextLabel", {
                        Parent = Items["ModeButton"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        TextWrapped = true,
                        TextColor3 = Library.Theme["Accent"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        ZIndex = 2,
                        Text = "Hold",
                        Size = UDim2New(0, 0, 0, 15),
                        AnchorPoint = Vector2New(0, 0.5),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 24, 0.5, 0),
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Accent'})
                    
                    Items["ModeText"] = Instances:Create("TextLabel", {
                        Parent = Items["RealMode"].Instance,
                        Name = "\0",
                        FontFace = Library.Font,
                        ZIndex = 2,
                        TextColor3 = Library.Theme["Text"],
                        BorderColor3 = FromRGB(0, 0, 0),
                        Text = "Mode",
                        Size = UDim2New(0, 0, 0, 15),
                        BackgroundTransparency = 1,
                        Position = UDim2New(0, 0, 0, 8),
                        BorderSizePixel = 0,
                        AutomaticSize = Enum.AutomaticSize.X,
                        TextSize = 18
                    }):AddToTheme({TextColor3 = 'Text'})     
                    
                    if Keybind.Section.IsFirstElement then
                        Items["Background"] = Instances:Create("Frame", {
                            Parent = Items["Keybind"].Instance,
                            Name = "\0",
                            Position = UDim2New(0, -15, 0, -10),
                            BorderColor3 = FromRGB(0, 0, 0),
                            Size = UDim2New(1, 30, 1, 15),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(26, 28, 38)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        
                        Instances:Create("UICorner", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            CornerRadius = UDimNew(0, 15)
                        })

                        Items["BackgroundLiner"] = Instances:Create("Frame", {
                            Parent = Items["Background"].Instance,
                            Name = "\0",
                            AnchorPoint = Vector2New(0, 1),
                            Position = UDim2New(0, 0, 1, 0),
                            BorderColor3 = FromRGB(0, 0, 0),
                            BackgroundTransparency = 1,
                            Size = UDim2New(1, 0, 0, 15),
                            BorderSizePixel = 0,
                            BackgroundColor3 = FromRGB(29, 31, 42)
                        }):AddToTheme({BackgroundColor3 = "Hover Element"})
                    else
                        if Keybind.Section.IsLastElement then
                            Instances:Create("Frame", {
                                Parent = Items["Keybind"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Keybind"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BackgroundTransparency = 1,
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 13),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                            
                            Instances:Create("UICorner", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                CornerRadius = UDimNew(0, 15)
                            })

                            Items["BackgroundLiner"] = Instances:Create("Frame", {
                                Parent = Items["Background"].Instance,
                                Name = "\0",
                                AnchorPoint = Vector2New(0, 0),
                                Position = UDim2New(0, 0, 0, 0),
                                BorderColor3 = FromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                Size = UDim2New(1, 0, 0, 15),
                                BorderSizePixel = 0,
                                BackgroundColor3 = FromRGB(29, 31, 42)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})
                        else
                            Instances:Create("Frame", {
                                Parent = Items["Keybind"].Instance,
                                Name = "\0",
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 0, 0, 1),
                                Position = UDim2New(0, 0, 0, -5),
                                BorderSizePixel = 0,
                                BackgroundColor3 = Library.Theme["Liner"]
                            }):AddToTheme({BackgroundColor3 = 'Liner'})

                            Items["Background"] = Instances:Create("Frame", {
                                Parent = Items["Keybind"].Instance,
                                Name = "\0",
                                Position = UDim2New(0, -15, 0, -4),
                                BorderColor3 = FromRGB(0, 0, 0),
                                Size = UDim2New(1, 30, 1, 9),
                                BorderSizePixel = 0,
                                BackgroundTransparency = 1,
                                BackgroundColor3 = FromRGB(26, 28, 38)
                            }):AddToTheme({BackgroundColor3 = "Hover Element"})     
                        end
                    end    

                    Items["Keybind"]:OnHover(function()
                        if Keybind.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 0})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 0})
                        end
                        
                        if Data.Tooltip then
                            Library:ShowTooltip(Data.Tooltip, Items["Keybind"].Instance)
                        end
                    end)

                    Items["Keybind"]:OnHoverLeave(function()
                        if Keybind.Section.IsSettings then return end
                        Items["Background"]:Tween(nil, {BackgroundTransparency = 1})

                        if Items["BackgroundLiner"] then 
                            Items["BackgroundLiner"]:Tween(nil, {BackgroundTransparency = 1})
                        end
                        
                        if Data.Tooltip then
                            Library:HideTooltip()
                        end
                    end)
                end

                local KeyListItem 

                if Library.KeyList then
                    KeyListItem = Library.KeyList:Add("")
                end 

                local Update = function()
                    if KeyListItem then 
                        KeyListItem:Set(Keybind.Name)
                        KeyListItem:SetStatus(Keybind.Toggled)
                    end
                end

                function Keybind:SetMode(Mode)
                    Keybind.Mode = Mode
                    Items["ModeValue"].Instance.Text = Mode

                    Library.Flags[Keybind.Flag] = {
                        Mode = Keybind.Mode,
                        Key = Keybind.Key,
                        Toggled = Keybind.Toggled
                    }

                    if Keybind.Callback then 
                        Library:SafeCall(Keybind.Callback, Keybind.Toggled)
                    end
                end

                function Keybind:Press(Bool)
                    if Keybind.Mode == "Toggle" then 
                        Keybind.Toggled = not Keybind.Toggled
                    elseif Keybind.Mode == "Hold" then 
                        Keybind.Toggled = Bool
                    elseif Keybind.Mode == "Always" then 
                        Keybind.Toggled = true
                    end

                    Library.Flags[Keybind.Flag] = {
                        Mode = Keybind.Mode,
                        Key = Keybind.Key,
                        Toggled = Keybind.Toggled
                    }

                    if Keybind.Callback then 
                        Library:SafeCall(Keybind.Callback, Keybind.Toggled)
                    end

                    Update()
                end

                function Keybind:Get()
                    return Keybind.Key, Keybind.Mode, Keybind.Toggled
                end

                function Keybind:GetNextMode() -- hardcoded
                    if Keybind.Mode == "Toggle" then
                        return "Hold"
                    elseif Keybind.Mode == "Hold" then
                        return "Always"
                    elseif Keybind.Mode == "Always" then
                        return "Toggle"
                    end 
                end

                function Keybind:Set(Key)
                    if StringFind(tostring(Key), "Enum") then 
                        Keybind.Key = tostring(Key)

                        Key = Key.Name == "Backspace" and "None" or Key.Name

                        local KeyString = Keys[Keybind.Key] or StringGSub(Key, "Enum.", "") or "None"
                        local TextToDisplay = StringGSub(StringGSub(KeyString, "KeyCode.", ""), "UserInputType.", "") or "None"

                        Keybind.Value = TextToDisplay
                        Items["KeyButton"].Instance.Text = TextToDisplay

                        Library.Flags[Keybind.Flag] = {
                            Mode = Keybind.Mode,
                            Key = Keybind.Key,
                            Toggled = Keybind.Toggled
                        }

                        if Keybind.Callback then 
                            Library:SafeCall(Keybind.Callback, Keybind.Toggled)
                        end
                    elseif type(Key) == "table" then
                        local RealKey = Key.Key == "Backspace" and "None" or Key.Key
                        Keybind.Key = tostring(Key.Key)

                        if Key.Mode then
                            Keybind:SetMode(Key.Mode)
                        else
                            Keybind:SetMode("Toggle")
                        end

                        local KeyString = Keys[Keybind.Key] or StringGSub(tostring(RealKey), "Enum.", "") or RealKey
                        local TextToDisplay = KeyString and StringGSub(StringGSub(KeyString, "KeyCode.", ""), "UserInputType.", "") or "None"

                        TextToDisplay = StringGSub(StringGSub(KeyString, "KeyCode.", ""), "UserInputType.", "")

                        Keybind.Value = TextToDisplay
                        Items["KeyButton"].Instance.Text = TextToDisplay

                        if Keybind.Callback then 
                            Library:SafeCall(Keybind.Callback, Keybind.Toggled)
                        end
                    elseif TableFind({"Toggle", "Hold", "Always"}, Key) then
                        Keybind:SetMode(Key)

                        if Keybind.Callback then 
                            Library:SafeCall(Keybind.Callback, Keybind.Toggled)
                        end
                    end

                    Update()

                    Keybind.Picking = false
                end

                Items["KeyButton"]:Connect("MouseButton1Click", function()
                    Keybind.Picking = true 

                    Items["KeyButton"].Instance.Text = "."
                    Library:Thread(function()
                        local Count = 1

                        while true do 
                            if not Keybind.Picking then 
                                break
                            end

                            if Count == 4 then
                                Count = 1
                            end

                            Items["KeyButton"].Instance.Text = Count == 1 and "." or Count == 2 and ".." or Count == 3 and "..."
                            Count += 1
                            task.wait(0.35)
                        end
                    end)

                    local InputBegan
                    InputBegan = UserInputService.InputBegan:Connect(function(Input)
                        if Input.UserInputType == Enum.UserInputType.Keyboard then 
                            Keybind:Set(Input.KeyCode)
                        else
                            Keybind:Set(Input.UserInputType)
                        end

                        InputBegan:Disconnect()
                        InputBegan = nil
                    end)
                end)

                Library:Connect(UserInputService.InputBegan, function(Input)
                    if Keybind.Value == "None" then
                        return
                    end

                    if tostring(Input.KeyCode) == Keybind.Key then
                        if Keybind.Mode == "Toggle" then 
                            Keybind:Press()
                        elseif Keybind.Mode == "Hold" then 
                            Keybind:Press(true)
                        elseif Keybind.Mode == "Always" then 
                            Keybind:Press(true)
                        end
                    elseif tostring(Input.UserInputType) == Keybind.Key then
                        if Keybind.Mode == "Toggle" then 
                            Keybind:Press()
                        elseif Keybind.Mode == "Hold" then 
                            Keybind:Press(true)
                        elseif Keybind.Mode == "Always" then 
                            Keybind:Press(true)
                        end
                    end

                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if not Keybind.IsOpen then
                            return
                        end

                        if Library:IsMouseOverFrame(Items["KeybindWindow"]) then
                            return
                        end

                        Keybind:SetOpen(false)
                    end
                end)

                Library:Connect(UserInputService.InputEnded, function(Input)
                    if Keybind.Value == "None" then
                        return
                    end

                    if tostring(Input.KeyCode) == Keybind.Key then
                        if Keybind.Mode == "Hold" then 
                            Keybind:Press(false)
                        elseif Keybind.Mode == "Always" then 
                            Keybind:Press(true)
                        end
                    elseif tostring(Input.UserInputType) == Keybind.Key then
                        if Keybind.Mode == "Hold" then 
                            Keybind:Press(false)
                        elseif Keybind.Mode == "Always" then 
                            Keybind:Press(true)
                        end
                    end
                end)

                Items["ModeButton"]:Connect("MouseButton1Down", function()
                    Keybind:Set(Keybind:GetNextMode())
                end)

                if Keybind.Default then 
                    Keybind:Set({
                        Mode = Keybind.RealMode or "Toggle",
                        Key = Keybind.Default,
                    })
                end

                Library.SetFlags[Keybind.Flag] = function(Value)
                    Keybind:Set(Value)
                end

                return Keybind
            end
        end

        Library.CheckAutoLoad = function(self, Window)
            if Library:IsCloudEnabled() then
                return -- Cloud configs don't use local autoload
            end
            
            local AutoLoadFile = Library:GetFolder() .. "/autoload.txt"
            if isfile(AutoLoadFile) then
                local ConfigName = readfile(AutoLoadFile)
                if ConfigName and ConfigName ~= "" then
                    local ConfigFile = Library:GetFolder() .. "/" .. ConfigName .. ".json"
                    if isfile(ConfigFile) then
                        local Content = readfile(ConfigFile)
                        local Success, Error = Library:LoadConfig(Content)
                        if Success then
                             Library:Notification("Auto-loaded config: " .. ConfigName, "93209682414397", FromRGB(0, 255, 0), 5)
                             if Window and Window.ConfigHeader and Window.ConfigHeader.Configs then
                                 for _, Config in pairs(Window.ConfigHeader.Configs) do
                                     if Config.Text == ConfigName then
                                         Config:Select(true)
                                         break
                                     end
                                 end
                             end
                        else
                             Library:Notification("Failed to auto-load config: " .. Error, "83016346682572", FromRGB(255, 0, 0), 5)
                        end
                    end
                end
            end
        end

        Library.CreateSettingsPage = function(self, Window, Watermark, KeybindList)
            local SettingsPage = Window:Page({Name = "Settings", Icon = "89030482276146"})

            local GeneralSubPage = SettingsPage:SubPage({Name = "General", Icon = "98488959537895"})

            do
                local ThemingSection = GeneralSubPage:Section({Name = "General", Side = 1})
                
                local ThemingOptions = {
                    "Outline",
                    "Outline 2",
                    "Background",
                    "Logo Background",
                    "Background 2",
                    "Section Background",
                    "Page Background",
                    "Toggle" ,
                    "Element",
                    "Text",      
                    "Text 2",
                    "Liner",
                    "Hover Element",
                    "Accent",   
                }

                do
                    for Index, Value in ThemingOptions do 
                        if Value == "Outline" then 
                            ThemingSection.IsFirstElement = true
                        else
                            ThemingSection.IsFirstElement = false
                        end

                        if Value == "Accent" then
                            ThemingSection.IsLastElement = true
                        else
                            ThemingSection.IsLastElement = false
                        end

                        ThemingSection:Label(Value):Colorpicker({
                            Flag = "Theme"..Value,
                            Default = Library.Theme[Value],
                            Callback = function(State)
                                Library.Theme[Value] = State
                                Library:ChangeTheme(Value, State)
                            end
                        })
                    end

                    --local YSize = ThemingSection.Items.InlineOutline.Instance.AbsoluteSize.Y
                    --ThemingSection.Items.InlineOutline.Instance.Size = UDim2New(1, 0, 0, YSize + 16)
                end

                local SettingsSection = GeneralSubPage:Section({Name = "Settings", Side = 2})

                do
                    SettingsSection.IsFirstElement = true

                    SettingsSection:Button({
                        Name = "Unload",
                        Callback = function()
                            Library:Unload()
                        end
                    })

                    SettingsSection.IsFirstElement = false

                    SettingsSection:Keybind({
                        Name = "Menu keybind",
                        Flag = "MenuKeybind",
                        Default = Library.MenuKeybind,
                        Mode = "Toggle",
                        Callback = function()
                            Library.MenuKeybind = Library.Flags["MenuKeybind"].Key
                        end
                    })
        
                    SettingsSection:Dropdown({
                        Name = "DPI Scale",
                        Flag = "DPIScale",
                        Default = IsMobile and "75%" or "100%",
                        Size = 150,
                        MaxSize = 150,
                        Items = {"25%", "50%", "75%", "100%", "125%", "150%", "175%", "200%"},
                        Callback = function(Value)
                            local Scale = tonumber(Value:match("%d+")) / 100
                            local UIScale = Library.Holder.Instance:FindFirstChild("UIScale")
                            if UIScale then
                                UIScale.Scale = Scale
                            end
                        end
                    })

                    SettingsSection:Slider({
                        Name = "Fade time",
                        Flag = "FadeTime",
                        Default = Library.FadeSpeed,
                        Min = 0,
                        Max = 5,
                        Decimals = 0.01,
                        Callback = function(Value)
                            Library.FadeSpeed = Value
                        end
                    })
        
                    SettingsSection:Slider({
                        Name = "Tween speed",
                        Flag = "TweenSpeed",
                        Default = Library.Tween.Time,
                        Min = 0,
                        Max = 1,
                        Decimals = 0.01,
                        Callback = function(Value)
                            Library.Tween.Time = Value
                        end
                    })
        
                    SettingsSection:Dropdown({
                        Name = "UI Tween style",
                        Flag = "TweenStyle",
                        Default = "Quad",
                        Items = {"Linear", "Sine", "Quad", "Cubic", "Quart", "Quint", "Exponential", "Circular", "Back", "Elastic", "Bounce"},
                        Callback = function(Value)
                            Library.Tween.Style = Enum.EasingStyle[Value]
                        end
                    })

                    SettingsSection:Toggle({
                        Name = "Dropdown Search",
                        Flag = "DropdownSearch",
                        Default = true,
                        Callback = function(State)
                            Library.DropdownSearch = State
                        end
                    })

                    SettingsSection:Toggle({
                        Name = "Watermark",
                        Flag = "Watermark",
                        Default = false,
                        Callback = function(State)
                            Watermark:SetVisibility(State)
                        end
                    })

                    SettingsSection:Toggle({
                        Name = "Keybind List",
                        Flag = "Keybind List",
                        Default = false,
                        Callback = function(State)
                            KeybindList:SetVisibility(State)
                        end
                    })

                    SettingsSection.IsLastElement = true
        
                    SettingsSection:Dropdown({
                        Name = "Tween direction",
                        Flag = "TweenDirection",
                        Default = "Out",
                        Items = {"In", "Out", "InOut"},
                        Callback = function(Value)
                            Library.Tween.Direction = Enum.EasingDirection[Value]
                        end
                    })

                    SettingsSection.IsLastElement = false
                end

            Library:CheckAutoLoad(Window)
        end
    end
--end)

getgenv().Library = Library
return Library
end
