local WeaponService = require("Weapon Service")

local new_profile_name = ""
local show_profile_editor = false

local scene_manager = sdk.get_native_singleton("via.SceneManager")
local scene = nil
local initialized = false

local Weapon_Vars = json.load_file("DWP\\Saved.json") or {
  Selected_Profile = "1",
  No_Ammo_Cost = false,
  No_Recoil = false,
  No_Spread = false,
  Extra_Wince = false,
  Always_Focus = false,
 -- BM4_Slug = false,
 -- SKUL_Slug = false,
 -- M870_Slug = false,
 -- STKR_Slug = false,
--  OG_WINCE = false,
 -- No_Reticles = false,
  Extra_Break = false,
  Headshots_Kill = false,
 -- CQBR_Smg = false,
 -- Kil7_HG = false,
 -- BRB_HG = false,
 -- HNDC_HG = false,
 -- Harpoon_DMG = false,
 -- Durable_Knives = false,
 -- Free_Knife_Repairs = false,
  Weapon_Profiles = {
    ["1"] = "None"
  }
}

local Selected_Weapon = 1
local Available_Weapons = {
  [1]  = "Matilda",                     -- HG
  [2]  = "M19",                         -- HG
  [3]  = "JMB Hp3",                     -- HG
  [4]  = "Quickdraw Army",              -- HG
  [5]  = "MUP",                         -- HG
  [6]  = "Broom Hc",                    -- HG
  [7]  = "SLS 60",                      -- HG
  [8]  = "W-870",                       -- SG
  [9]  = "MQ 11",                       -- SMG
  [10] = "LE 5",                        -- SMG
  [11] = "Lightning Hawk",              -- MAG
  [12] = "Samurai Edge (Original Model)",  -- HG
  [13] = "Samurai Edge (Chris Model)",     -- HG
  [14] = "Samurai Edge (Jill Model)",      -- HG
  [15] = "Samurai Edge (Albert Model)",    -- HG
  [16] = "Chemical Flamethrower",       -- FLAM
  [17] = "Spark Shot",                  -- SPARK
  [18] = "Minigun"                      -- MINI
}

local FireBullet_Types = {

  [0] = "Camera",
  [1] = "Muzzle",
  [2] = "PossiblyMuzzle",
  [3] = "AlongMuzzle",
  [4] = "None",

}

local function SetWeapon_DMGValues()
    -- load weapon profile from json files
    local path = Weapon_Vars.Weapon_Profiles[Weapon_Vars.Selected_Profile]
    WeaponService.set_weapon_profile(path)

    -- apply additional custom settings

    -----/// Main Tree ///-----

    if Weapon_Vars.No_Recoil then
        WeaponService.Weapons.VP70.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.VP70.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.VP70.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.VP70.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.M1911.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.M1911.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.M1911.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.M1911.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.BHP.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.BHP.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.BHP.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.BHP.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.ARMY.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.ARMY.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.ARMY.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.ARMY.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.USP.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.USP.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.USP.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.USP.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.BROOM.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.BROOM.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.BROOM.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.BROOM.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.SLS.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.SLS.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.SLS.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.SLS.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.M870.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.M870.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.M870.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.M870.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.MQ11.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.MQ11.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.MQ11.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.MQ11.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.MP5.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.MP5.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.MP5.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.MP5.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.DE50.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.DE50.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.DE50.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.DE50.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.FLAME.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.FLAME.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.FLAME.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.FLAME.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.SPARK.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.SPARK.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.SPARK.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.SPARK.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.MINI.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.MINI.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.MINI.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.MINI.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.SAM.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.SAM.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.SAM.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.SAM.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.SAMC.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.SAMC.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.SAMC.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.SAMC.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.SAMJ.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.SAMJ.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.SAMJ.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.SAMJ.Stats.RecoilVerticalMax = 0.0

        WeaponService.Weapons.SAMW.Stats.RecoilHorizontalMin = 0.0
        WeaponService.Weapons.SAMW.Stats.RecoilHorizontalMax = 0.0
        WeaponService.Weapons.SAMW.Stats.RecoilVerticalMin = 0.0
        WeaponService.Weapons.SAMW.Stats.RecoilVerticalMax = 0.0

    end

    if Weapon_Vars.No_Spread then
        -- Existing code for VP70
        WeaponService.Weapons.VP70.Stats.Slur = 0.0
        WeaponService.Weapons.VP70.Stats.SlurFit = 0.0

        -- Code for M1911
        WeaponService.Weapons.M1911.Stats.Slur = 0.0
        WeaponService.Weapons.M1911.Stats.SlurFit = 0.0

        -- Code for BHP
        WeaponService.Weapons.BHP.Stats.Slur = 0.0
        WeaponService.Weapons.BHP.Stats.SlurFit = 0.0

        -- Code for ARMY
        WeaponService.Weapons.ARMY.Stats.Slur = 0.0
        WeaponService.Weapons.ARMY.Stats.SlurFit = 0.0

        -- Code for USP
        WeaponService.Weapons.USP.Stats.Slur = 0.0
        WeaponService.Weapons.USP.Stats.SlurFit = 0.0

        -- Code for BROOM
        WeaponService.Weapons.BROOM.Stats.Slur = 0.0
        WeaponService.Weapons.BROOM.Stats.SlurFit = 0.0

        -- Code for SLS
        WeaponService.Weapons.SLS.Stats.Slur = 0.0
        WeaponService.Weapons.SLS.Stats.SlurFit = 0.0
        WeaponService.Weapons.SLS.Stats.Slur_EX = 0.0
        WeaponService.Weapons.SLS.Stats.SlurFit_EX = 0.0

        -- Code for M870
        WeaponService.Weapons.M870.Stats.Slur = 0.0
        WeaponService.Weapons.M870.Stats.SlurFit = 0.0

        -- Code for MQ11
        WeaponService.Weapons.MQ11.Stats.Slur = 0.0
        WeaponService.Weapons.MQ11.Stats.SlurFit = 0.0

        -- Code for MP5
        WeaponService.Weapons.MP5.Stats.Slur = 0.0
        WeaponService.Weapons.MP5.Stats.SlurFit = 0.0

        -- Code for DE50
        WeaponService.Weapons.DE50.Stats.Slur = 0.0
        WeaponService.Weapons.DE50.Stats.SlurFit = 0.0

        -- Code for FLAME
        WeaponService.Weapons.FLAME.Stats.Slur = 0.0
        WeaponService.Weapons.FLAME.Stats.SlurFit = 0.0

        -- Code for SPARK
        WeaponService.Weapons.SPARK.Stats.Slur = 0.0
        WeaponService.Weapons.SPARK.Stats.SlurFit = 0.0

        -- Code for MINI
        WeaponService.Weapons.MINI.Stats.Slur = 0.0
        WeaponService.Weapons.MINI.Stats.SlurFit = 0.0

        -- Code for SAM
        WeaponService.Weapons.SAM.Stats.Slur = 0.0
        WeaponService.Weapons.SAM.Stats.SlurFit = 0.0

        -- Code for SAMC
        WeaponService.Weapons.SAMC.Stats.Slur = 0.0
        WeaponService.Weapons.SAMC.Stats.SlurFit = 0.0

        -- Code for SAMJ
        WeaponService.Weapons.SAMJ.Stats.Slur = 0.0
        WeaponService.Weapons.SAMJ.Stats.SlurFit = 0.0

        -- Code for SAMW
        WeaponService.Weapons.SAMW.Stats.Slur = 0.0
        WeaponService.Weapons.SAMW.Stats.SlurFit = 0.0

    end

    if Weapon_Vars.Always_Focus then
        -- Existing code for VP70
        WeaponService.Weapons.VP70.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.VP70.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.VP70.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.VP70.Stats.WatchSubFocus = 1000.0

        -- Code for M1911
        WeaponService.Weapons.M1911.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.M1911.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.M1911.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.M1911.Stats.WatchSubFocus = 1000.0

        -- Code for BHP
        WeaponService.Weapons.BHP.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.BHP.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.BHP.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.BHP.Stats.WatchSubFocus = 1000.0

        -- Code for ARMY
        WeaponService.Weapons.ARMY.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.ARMY.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.ARMY.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.ARMY.Stats.WatchSubFocus = 1000.0

        -- Code for USP
        WeaponService.Weapons.USP.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.USP.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.USP.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.USP.Stats.WatchSubFocus = 1000.0

        -- Code for BROOM
        WeaponService.Weapons.BROOM.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.BROOM.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.BROOM.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.BROOM.Stats.WatchSubFocus = 1000.0

        -- Code for SLS
        WeaponService.Weapons.SLS.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.SLS.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.SLS.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.SLS.Stats.WatchSubFocus = 1000.0

        -- Code for M870
        WeaponService.Weapons.M870.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.M870.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.M870.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.M870.Stats.WatchSubFocus = 1000.0

        -- Code for MQ11
        WeaponService.Weapons.MQ11.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.MQ11.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.MQ11.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.MQ11.Stats.WatchSubFocus = 1000.0

        -- Code for MP5
        WeaponService.Weapons.MP5.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.MP5.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.MP5.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.MP5.Stats.WatchSubFocus = 1000.0

        -- Code for DE50
        WeaponService.Weapons.DE50.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.DE50.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.DE50.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.DE50.Stats.WatchSubFocus = 1000.0

        -- Code for FLAME
        WeaponService.Weapons.FLAME.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.FLAME.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.FLAME.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.FLAME.Stats.WatchSubFocus = 1000.0

        -- Code for SPARK
        WeaponService.Weapons.SPARK.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.SPARK.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.SPARK.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.SPARK.Stats.WatchSubFocus = 1000.0

        -- Code for MINI
        WeaponService.Weapons.MINI.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.MINI.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.MINI.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.MINI.Stats.WatchSubFocus = 1000.0

        -- Code for SAM
        WeaponService.Weapons.SAM.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.SAM.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.SAM.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.SAM.Stats.WatchSubFocus = 1000.0

        -- Code for SAMC
        WeaponService.Weapons.SAMC.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.SAMC.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.SAMC.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.SAMC.Stats.WatchSubFocus = 1000.0

        -- Code for SAMJ
        WeaponService.Weapons.SAMJ.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.SAMJ.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.SAMJ.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.SAMJ.Stats.WatchSubFocus = 1000.0

        -- Code for SAMW
        WeaponService.Weapons.SAMW.Stats.HoldAddFocus = 1000.0
        WeaponService.Weapons.SAMW.Stats.MoveSubFocus = 1000.0
        WeaponService.Weapons.SAMW.Stats.ShootSubFocus = 1000.0
        WeaponService.Weapons.SAMW.Stats.WatchSubFocus = 1000.0

    end

    if Weapon_Vars.Extra_Wince then
        -- Existing code for VP70
        WeaponService.Weapons.VP70.Stats.WinceRate = 10.0

        -- Code for M1911
        WeaponService.Weapons.M1911.Stats.WinceRate = 10.0

        -- Code for BHP
        WeaponService.Weapons.BHP.Stats.WinceRate = 10.0

        -- Code for ARMY
        WeaponService.Weapons.ARMY.Stats.WinceRate = 10.0

        -- Code for USP
        WeaponService.Weapons.USP.Stats.WinceRate = 10.0

        -- Code for BROOM
        WeaponService.Weapons.BROOM.Stats.WinceRate = 10.0

        -- Code for SLS
        WeaponService.Weapons.SLS.Stats.WinceRate = 10.0

        -- Code for M870
        WeaponService.Weapons.M870.Stats.WinceRate = 10.0

        -- Code for MQ11
        WeaponService.Weapons.MQ11.Stats.WinceRate = 10.0

        -- Code for MP5
        WeaponService.Weapons.MP5.Stats.WinceRate = 10.0

        -- Code for DE50
        WeaponService.Weapons.DE50.Stats.WinceRate = 10.0

        -- Code for FLAME
        WeaponService.Weapons.FLAME.Stats.WinceRate = 10.0

        -- Code for SPARK
        WeaponService.Weapons.SPARK.Stats.WinceRate = 10.0

        -- Code for MINI
        WeaponService.Weapons.MINI.Stats.WinceRate = 10.0

        -- Code for SAM
        WeaponService.Weapons.SAM.Stats.WinceRate = 10.0

        -- Code for SAMC
        WeaponService.Weapons.SAMC.Stats.WinceRate = 10.0

        -- Code for SAMJ
        WeaponService.Weapons.SAMJ.Stats.WinceRate = 10.0

        -- Code for SAMW
        WeaponService.Weapons.SAMW.Stats.WinceRate = 10.0

    end

    if Weapon_Vars.Extra_Break then
        -- Code for VP70
        WeaponService.Weapons.VP70.Stats.BreakRate = 10.0

        -- Code for M1911
        WeaponService.Weapons.M1911.Stats.BreakRate = 10.0

        -- Code for BHP
        WeaponService.Weapons.BHP.Stats.BreakRate = 10.0

        -- Code for ARMY
        WeaponService.Weapons.ARMY.Stats.BreakRate = 10.0

        -- Code for USP
        WeaponService.Weapons.USP.Stats.BreakRate = 10.0

        -- Code for BROOM
        WeaponService.Weapons.BROOM.Stats.BreakRate = 10.0

        -- Code for SLS
        WeaponService.Weapons.SLS.Stats.BreakRate = 10.0
        WeaponService.Weapons.SLS.Stats.BreakRate_EX = 10.0

        -- Code for M870
        WeaponService.Weapons.M870.Stats.BreakRate = 10.0

        -- Code for MQ11
        WeaponService.Weapons.MQ11.Stats.BreakRate = 10.0

        -- Code for MP5
        WeaponService.Weapons.MP5.Stats.BreakRate = 10.0

        -- Code for DE50
        WeaponService.Weapons.DE50.Stats.BreakRate = 10.0

        -- Code for FLAME
        WeaponService.Weapons.FLAME.Stats.BreakRate = 10.0

        -- Code for SPARK
        WeaponService.Weapons.SPARK.Stats.BreakRate = 10.0

        -- Code for MINI
        WeaponService.Weapons.MINI.Stats.BreakRate = 10.0

        -- Code for SAM
        WeaponService.Weapons.SAM.Stats.BreakRate = 10.0

        -- Code for SAMC
        WeaponService.Weapons.SAMC.Stats.BreakRate = 10.0

        -- Code for SAMJ
        WeaponService.Weapons.SAMJ.Stats.BreakRate = 10.0

        -- Code for SAMW
        WeaponService.Weapons.SAMW.Stats.BreakRate = 10.0

    end

    if Weapon_Vars.Headshots_Kill then
        -- Existing code for VP70
        WeaponService.Weapons.VP70.Stats.CritRate = 100
        WeaponService.Weapons.VP70.Stats.CritRateFit = 100

        -- Code for M1911
        WeaponService.Weapons.M1911.Stats.CritRate = 100
        WeaponService.Weapons.M1911.Stats.CritRateFit = 100

        -- Code for BHP
        WeaponService.Weapons.BHP.Stats.CritRate = 100
        WeaponService.Weapons.BHP.Stats.CritRateFit = 100

        -- Code for ARMY
        WeaponService.Weapons.ARMY.Stats.CritRate = 100
        WeaponService.Weapons.ARMY.Stats.CritRateFit = 100

        -- Code for USP
        WeaponService.Weapons.USP.Stats.CritRate = 100
        WeaponService.Weapons.USP.Stats.CritRateFit = 100

        -- Code for BROOM
        WeaponService.Weapons.BROOM.Stats.CritRate = 100
        WeaponService.Weapons.BROOM.Stats.CritRateFit = 100

        -- Code for SLS
        WeaponService.Weapons.SLS.Stats.CritRate = 100
        WeaponService.Weapons.SLS.Stats.CritRateFit = 100
        WeaponService.Weapons.SLS.Stats.CritRate_EX = 100
        WeaponService.Weapons.SLS.Stats.CritRateFit_EX = 100

        -- Code for M870
        WeaponService.Weapons.M870.Stats.CritRate = 100
        WeaponService.Weapons.M870.Stats.CritRateFit = 100

        -- Code for MQ11
        WeaponService.Weapons.MQ11.Stats.CritRate = 100
        WeaponService.Weapons.MQ11.Stats.CritRateFit = 100

        -- Code for MP5
        WeaponService.Weapons.MP5.Stats.CritRate = 100
        WeaponService.Weapons.MP5.Stats.CritRateFit = 100

        -- Code for DE50
        WeaponService.Weapons.DE50.Stats.CritRate = 100
        WeaponService.Weapons.DE50.Stats.CritRateFit = 100

        -- Code for MINI
        WeaponService.Weapons.MINI.Stats.CritRate = 100
        WeaponService.Weapons.MINI.Stats.CritRateFit = 100

        -- Code for SAM
        WeaponService.Weapons.SAM.Stats.CritRate = 100
        WeaponService.Weapons.SAM.Stats.CritRateFit = 100

        -- Code for SAMC
        WeaponService.Weapons.SAMC.Stats.CritRate = 100
        WeaponService.Weapons.SAMC.Stats.CritRateFit = 100

        -- Code for SAMJ
        WeaponService.Weapons.SAMJ.Stats.CritRate = 100
        WeaponService.Weapons.SAMJ.Stats.CritRateFit = 100

        -- Code for SAMW
        WeaponService.Weapons.SAMW.Stats.CritRate = 100
        WeaponService.Weapons.SAMW.Stats.CritRateFit = 100

    end

    if Weapon_Vars.No_Ammo_Cost then
      WeaponService.Weapons.VP70.Stats.InfiniteAmmo = true
      WeaponService.Weapons.M1911.Stats.InfiniteAmmo = true
      WeaponService.Weapons.BHP.Stats.InfiniteAmmo = true
      WeaponService.Weapons.ARMY.Stats.InfiniteAmmo = true
      WeaponService.Weapons.USP.Stats.InfiniteAmmo = true
      WeaponService.Weapons.BROOM.Stats.InfiniteAmmo = true
      WeaponService.Weapons.SLS.Stats.InfiniteAmmo = true
      WeaponService.Weapons.M870.Stats.InfiniteAmmo = true
      WeaponService.Weapons.MQ11.Stats.InfiniteAmmo = true
      WeaponService.Weapons.MP5.Stats.InfiniteAmmo = true
      WeaponService.Weapons.DE50.Stats.InfiniteAmmo = true
      WeaponService.Weapons.FLAME.Stats.InfiniteAmmo = true
      WeaponService.Weapons.SPARK.Stats.InfiniteAmmo = true
      WeaponService.Weapons.MINI.Stats.InfiniteAmmo = true
      WeaponService.Weapons.SAM.Stats.InfiniteAmmo = true
      WeaponService.Weapons.SAMC.Stats.InfiniteAmmo = true
      WeaponService.Weapons.SAMJ.Stats.InfiniteAmmo = true
      WeaponService.Weapons.SAMW.Stats.InfiniteAmmo = true
  end
  
end


local function apply_changes()
  json.dump_file("DWP\\Saved.json", Weapon_Vars)

  SetWeapon_DMGValues()
  WeaponService.apply_all_weapon_stats()
end

local function draw_profile_editor_ui()
  imgui.set_next_window_size({550, 1000}, 8)
  local stayOpen = imgui.begin_window("Profile Editor", show_profile_editor, 0)
  if not stayOpen then
    show_profile_editor = false
  end

  imgui.text("Changing fields provides a live preview. \nSave Changes button saves changes to the selected profile.")

  imgui.new_line()

  selectedProfileChanged, Weapon_Vars.Selected_Profile = imgui.combo("Weapon Profile", Weapon_Vars.Selected_Profile, Weapon_Vars.Weapon_Profiles)
  changed, Selected_Weapon = imgui.combo("Weapon", Selected_Weapon, Available_Weapons)

  if selectedProfileChanged then
    apply_changes()
  end

  local currentWeapon = nil

  if Selected_Weapon == 1 then
    currentWeapon = WeaponService.Weapons.VP70
  elseif Selected_Weapon == 2 then
    currentWeapon = WeaponService.Weapons.M1911
  elseif Selected_Weapon == 3 then
    currentWeapon = WeaponService.Weapons.BHP
  elseif Selected_Weapon == 4 then
    currentWeapon = WeaponService.Weapons.ARMY
  elseif Selected_Weapon == 5 then
    currentWeapon = WeaponService.Weapons.USP
  elseif Selected_Weapon == 6 then
    currentWeapon = WeaponService.Weapons.BROOM
  elseif Selected_Weapon == 7 then
    currentWeapon = WeaponService.Weapons.SLS
  elseif Selected_Weapon == 8 then
    currentWeapon = WeaponService.Weapons.M870
  elseif Selected_Weapon == 9 then
    currentWeapon = WeaponService.Weapons.MQ11
  elseif Selected_Weapon == 10 then
    currentWeapon = WeaponService.Weapons.MP5
  elseif Selected_Weapon == 11 then
    currentWeapon = WeaponService.Weapons.DE50
  elseif Selected_Weapon == 12 then
    currentWeapon = WeaponService.Weapons.SAM
  elseif Selected_Weapon == 13 then
    currentWeapon = WeaponService.Weapons.SAMC
  elseif Selected_Weapon == 14 then
    currentWeapon = WeaponService.Weapons.SAMJ
  elseif Selected_Weapon == 15 then
    currentWeapon = WeaponService.Weapons.SAMW
  elseif Selected_Weapon == 16 then
  currentWeapon = WeaponService.Weapons.FLAME
  elseif Selected_Weapon == 17 then
    currentWeapon = WeaponService.Weapons.SPARK
  elseif Selected_Weapon == 18 then
    currentWeapon = WeaponService.Weapons.MINI
  end

  imgui.new_line()


  if currentWeapon.Type == "HG" or currentWeapon.Type == "HGR" or currentWeapon.Type == "SMG" or currentWeapon.Type == "MAG"  then
    if imgui.tree_node("General") then
      
      -- Slur
      SlurChanged, updatedSlur = imgui.input_text("Spread", currentWeapon.Stats.Slur, 1)
      if SlurChanged then
        currentWeapon.Stats.Slur = tonumber(updatedSlur)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- SlurFit
      SlurFitChanged, updatedSlurFit = imgui.input_text("SpreadFit", currentWeapon.Stats.SlurFit, 1)
      if SlurFitChanged then
        currentWeapon.Stats.SlurFit = tonumber(updatedSlurFit)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      imgui.new_line()

      -- CritRate
      CritRateChanged, updatedCritRate = imgui.input_text("CritRate", currentWeapon.Stats.CritRate, 1)
      if CritRateChanged then
        currentWeapon.Stats.CritRate = tonumber(updatedCritRate)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- CritRateFit
      CritRateFitChanged, updatedCritRateFit = imgui.input_text("CritRateFit", currentWeapon.Stats.CritRateFit, 1)
      if CritRateFitChanged then
        currentWeapon.Stats.CritRateFit = tonumber(updatedCritRateFit)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      imgui.new_line()


      -- FireBulletType
      FireBulletTypeChanged, updatedFireBulletType = imgui.combo("Bullet Origin", currentWeapon.Stats.FireBulletType, FireBullet_Types)
      if FireBulletTypeChanged then
        currentWeapon.Stats.FireBulletType = updatedFireBulletType
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end


    imgui.tree_pop()
    end

    if imgui.tree_node("Damage") then


        -- Power
        PowerChanged, updatedPower = imgui.input_text("Power", currentWeapon.Stats.Power, 1)
        if PowerChanged then
          currentWeapon.Stats.Power = tonumber(updatedPower)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- Wince
        WinceChanged, updatedWince = imgui.input_text("Wince", currentWeapon.Stats.Wince, 1)
        if WinceChanged then
          currentWeapon.Stats.Wince = tonumber(updatedWince)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- Break
        BreakChanged, updatedBreak = imgui.input_text("Break", currentWeapon.Stats.Break, 1)
        if BreakChanged then
          currentWeapon.Stats.Break = tonumber(updatedBreak)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- PowerRate
        PowerRateChanged, updatedPowerRate = imgui.input_text("PowerRate", currentWeapon.Stats.PowerRate, 1)
        if PowerRateChanged then
          currentWeapon.Stats.PowerRate = tonumber(updatedPowerRate)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- WinceRate
        WinceRateChanged, updatedWinceRate = imgui.input_text("WinceRate", currentWeapon.Stats.WinceRate, 1)
        if WinceRateChanged then
          currentWeapon.Stats.WinceRate = tonumber(updatedWinceRate)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- BreakRate
        BreakRateChanged, updatedBreakRate = imgui.input_text("BreakRate", currentWeapon.Stats.BreakRate, 1)
        if BreakRateChanged then
          currentWeapon.Stats.BreakRate = tonumber(updatedBreakRate)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end
        imgui.new_line()

        -- FitRatePower
        FitRatePowerChanged, updatedFitRatePower = imgui.input_text("FitRatePower", currentWeapon.Stats.FitRatePower, 1)
        if FitRatePowerChanged then
          currentWeapon.Stats.FitRatePower = tonumber(updatedFitRatePower)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- FitRateWince
        FitRateWinceChanged, updatedFitRateWince = imgui.input_text("FitRateWince", currentWeapon.Stats.FitRateWince, 1)
        if FitRateWinceChanged then
          currentWeapon.Stats.FitRateWince = tonumber(updatedFitRateWince)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- FitRateBreak
        FitRateBreakChanged, updatedFitRateBreak = imgui.input_text("FitRateBreak", currentWeapon.Stats.FitRateBreak, 1)
        if FitRateBreakChanged then
          currentWeapon.Stats.FitRateBreak = tonumber(updatedFitRateBreak)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- CritRatePower
        CritRatePowerChanged, updatedCritRatePower = imgui.input_text("CritRatePower", currentWeapon.Stats.CritRatePower, 1)
        if CritRatePowerChanged then
          currentWeapon.Stats.CritRatePower = tonumber(updatedCritRatePower)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- CritRateWince
        CritRateWinceChanged, updatedCritRateWince = imgui.input_text("CritRateWince", currentWeapon.Stats.CritRateWince, 1)
        if CritRateWinceChanged then
          currentWeapon.Stats.CritRateWince = tonumber(updatedCritRateWince)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- CritRateBreak
        CritRateBreakChanged, updatedCritRateBreak = imgui.input_text("CritRateBreak", currentWeapon.Stats.CritRateBreak, 1)
        if CritRateBreakChanged then
          currentWeapon.Stats.CritRateBreak = tonumber(updatedCritRateBreak)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end



        imgui.tree_pop()
      end

    if imgui.tree_node("Ballistics") then


      -- HitNum
      HitNumChanged, updatedHitNum = imgui.input_text("HitNum", currentWeapon.Stats.HitNum, 1)
      if HitNumChanged then
        currentWeapon.Stats.HitNum = tonumber(updatedHitNum)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      imgui.new_line()

      -- HitNumBonusFit
      HitNumBonusFitChanged, updatedHitNumBonusFit = imgui.input_text("HitNumBonusFit", currentWeapon.Stats.HitNumBonusFit, 1)
      if HitNumBonusFitChanged then
        currentWeapon.Stats.HitNumBonusFit = tonumber(updatedHitNumBonusFit)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- HitNumBonusCrit
      HitNumBonusCritChanged, updatedHitNumBonusCrit = imgui.input_text("HitNumBonusCrit", currentWeapon.Stats.HitNumBonusCrit, 1)
      if HitNumBonusCritChanged then
        currentWeapon.Stats.HitNumBonusCrit = tonumber(updatedHitNumBonusCrit)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- PerformanceValue
      PerformanceValueChanged, updatedPerformanceValue = imgui.input_text("PerformanceValue", currentWeapon.Stats.PerformanceValue, 1)
      if PerformanceValueChanged then
        currentWeapon.Stats.PerformanceValue = tonumber(updatedPerformanceValue)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      imgui.new_line()

      -- BulletSpeed
      BulletSpeedChanged, updatedBulletSpeed = imgui.input_text("BulletSpeed", currentWeapon.Stats.BulletSpeed, 1)
      if BulletSpeedChanged then
        currentWeapon.Stats.BulletSpeed = tonumber(updatedBulletSpeed)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- MaxRange
      MaxRangeChanged, updatedMaxRange = imgui.input_text("MaxRange", currentWeapon.Stats.MaxRange, 1)
      if MaxRangeChanged then
        currentWeapon.Stats.MaxRange = tonumber(updatedMaxRange)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- EffectiveRange
      EffectiveRangeChanged, updatedEffectiveRange = imgui.input_text("EffectiveRange", currentWeapon.Stats.EffectiveRange, 1)
      if EffectiveRangeChanged then
        currentWeapon.Stats.EffectiveRange = tonumber(updatedEffectiveRange)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- Gravity
      GravityChanged, updatedGravity = imgui.input_text("Gravity", currentWeapon.Stats.Gravity, 1)
      if GravityChanged then
        currentWeapon.Stats.Gravity = tonumber(updatedGravity)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end



  imgui.tree_pop()
    end
    if currentWeapon.Type =="HGR" then
      
    
      if imgui.tree_node("EX Settings") then


        if imgui.tree_node("EX General") then
          
          -- Slur_EX
          Slur_EX_Changed, updatedSlur_EX = imgui.input_text("Spread_EX", currentWeapon.Stats.Slur_EX, 1)
          if Slur_EX_Changed then
            currentWeapon.Stats.Slur_EX = tonumber(updatedSlur_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- SlurFit_EX
          SlurFit_EX_Changed, updatedSlurFit_EX = imgui.input_text("SpreadFit_EX", currentWeapon.Stats.SlurFit_EX, 1)
          if SlurFit_EX_Changed then
            currentWeapon.Stats.SlurFit_EX = tonumber(updatedSlurFit_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          imgui.new_line()

          -- CritRate_EX
          CritRate_EX_Changed, updatedCritRate_EX = imgui.input_text("CritRate_EX", currentWeapon.Stats.CritRate_EX, 1)
          if CritRate_EX_Changed then
            currentWeapon.Stats.CritRate_EX = tonumber(updatedCritRate_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- CritRateFit_EX
          CritRateFit_EX_Changed, updatedCritRateFit_EX = imgui.input_text("CritRateFit_EX", currentWeapon.Stats.CritRateFit_EX, 1)
          if CritRateFit_EX_Changed then
            currentWeapon.Stats.CritRateFit_EX = tonumber(updatedCritRateFit_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end



          imgui.tree_pop()
        end

        if imgui.tree_node("EX Damage") then
          -- Power_EX
          Power_EX_Changed, updatedPower_EX = imgui.input_text("Power_EX", currentWeapon.Stats.Power_EX, 1)
          if Power_EX_Changed then
            currentWeapon.Stats.Power_EX = tonumber(updatedPower_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- Wince_EX
          Wince_EX_Changed, updatedWince_EX = imgui.input_text("Wince_EX", currentWeapon.Stats.Wince_EX, 1)
          if Wince_EX_Changed then
            currentWeapon.Stats.Wince_EX = tonumber(updatedWince_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- Break_EX
          Break_EX_Changed, updatedBreak_EX = imgui.input_text("Break_EX", currentWeapon.Stats.Break_EX, 1)
          if Break_EX_Changed then
            currentWeapon.Stats.Break_EX = tonumber(updatedBreak_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          imgui.new_line()

          -- PowerRate_EX
          PowerRate_EX_Changed, updatedPowerRate_EX = imgui.input_text("PowerRate_EX", currentWeapon.Stats.PowerRate_EX, 1)
          if PowerRate_EX_Changed then
            currentWeapon.Stats.PowerRate_EX = tonumber(updatedPowerRate_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- WinceRate_EX
          WinceRate_EX_Changed, updatedWinceRate_EX = imgui.input_text("WinceRate_EX", currentWeapon.Stats.WinceRate_EX, 1)
          if WinceRate_EX_Changed then
            currentWeapon.Stats.WinceRate_EX = tonumber(updatedWinceRate_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- BreakRate_EX
          BreakRate_EX_Changed, updatedBreakRate_EX = imgui.input_text("BreakRate_EX", currentWeapon.Stats.BreakRate_EX, 1)
          if BreakRate_EX_Changed then
            currentWeapon.Stats.BreakRate_EX = tonumber(updatedBreakRate_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          imgui.new_line()

          -- FitRatePower_EX
          FitRatePower_EX_Changed, updatedFitRatePower_EX = imgui.input_text("FitRatePower_EX", currentWeapon.Stats.FitRatePower_EX, 1)
          if FitRatePower_EX_Changed then
            currentWeapon.Stats.FitRatePower_EX = tonumber(updatedFitRatePower_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- FitRateWince_EX
          FitRateWince_EX_Changed, updatedFitRateWince_EX = imgui.input_text("FitRateWince_EX", currentWeapon.Stats.FitRateWince_EX, 1)
          if FitRateWince_EX_Changed then
            currentWeapon.Stats.FitRateWince_EX = tonumber(updatedFitRateWince_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- FitRateBreak_EX
          FitRateBreak_EX_Changed, updatedFitRateBreak_EX = imgui.input_text("FitRateBreak_EX", currentWeapon.Stats.FitRateBreak_EX, 1)
          if FitRateBreak_EX_Changed then
            currentWeapon.Stats.FitRateBreak_EX = tonumber(updatedFitRateBreak_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          imgui.new_line()

          -- CritRatePower_EX
          CritRatePower_EX_Changed, updatedCritRatePower_EX = imgui.input_text("CritRatePower_EX", currentWeapon.Stats.CritRatePower_EX, 1)
          if CritRatePower_EX_Changed then
            currentWeapon.Stats.CritRatePower_EX = tonumber(updatedCritRatePower_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- CritRateWince_EX
          CritRateWince_EX_Changed, updatedCritRateWince_EX = imgui.input_text("CritRateWince_EX", currentWeapon.Stats.CritRateWince_EX, 1)
          if CritRateWince_EX_Changed then
            currentWeapon.Stats.CritRateWince_EX = tonumber(updatedCritRateWince_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- CritRateBreak_EX
          CritRateBreak_EX_Changed, updatedCritRateBreak_EX = imgui.input_text("CritRateBreak_EX", currentWeapon.Stats.CritRateBreak_EX, 1)
          if CritRateBreak_EX_Changed then
            currentWeapon.Stats.CritRateBreak_EX = tonumber(updatedCritRateBreak_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end



          imgui.tree_pop()
        end

        if imgui.tree_node("EX Ballistics") then
          -- HitNum_EX
          HitNum_EX_Changed, updatedHitNum_EX = imgui.input_text("HitNum_EX", currentWeapon.Stats.HitNum_EX, 1)
          if HitNum_EX_Changed then
            currentWeapon.Stats.HitNum_EX = tonumber(updatedHitNum_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- HitNumBonusFit_EX
          HitNumBonusFit_EX_Changed, updatedHitNumBonusFit_EX = imgui.input_text("HitNumBonusFit_EX", currentWeapon.Stats.HitNumBonusFit_EX, 1)
          if HitNumBonusFit_EX_Changed then
            currentWeapon.Stats.HitNumBonusFit_EX = tonumber(updatedHitNumBonusFit_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- HitNumBonusCrit_EX
          HitNumBonusCrit_EX_Changed, updatedHitNumBonusCrit_EX = imgui.input_text("HitNumBonusCrit_EX", currentWeapon.Stats.HitNumBonusCrit_EX, 1)
          if HitNumBonusCrit_EX_Changed then
            currentWeapon.Stats.HitNumBonusCrit_EX = tonumber(updatedHitNumBonusCrit_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- PerformanceValue_EX
          PerformanceValue_EX_Changed, updatedPerformanceValue_EX = imgui.input_text("PerformanceValue_EX", currentWeapon.Stats.PerformanceValue_EX, 1)
          if PerformanceValue_EX_Changed then
            currentWeapon.Stats.PerformanceValue_EX = tonumber(updatedPerformanceValue_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          imgui.new_line()

          -- BulletSpeed_EX
          BulletSpeed_EX_Changed, updatedBulletSpeed_EX = imgui.input_text("BulletSpeed_EX", currentWeapon.Stats.BulletSpeed_EX, 1)
          if BulletSpeed_EX_Changed then
            currentWeapon.Stats.BulletSpeed_EX = tonumber(updatedBulletSpeed_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- MaxRange_EX
          MaxRange_EX_Changed, updatedMaxRange_EX = imgui.input_text("MaxRange_EX", currentWeapon.Stats.MaxRange_EX, 1)
          if MaxRange_EX_Changed then
            currentWeapon.Stats.MaxRange_EX = tonumber(updatedMaxRange_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- EffectiveRange_EX
          EffectiveRange_EX_Changed, updatedEffectiveRange_EX = imgui.input_text("EffectiveRange_EX", currentWeapon.Stats.EffectiveRange_EX, 1)
          if EffectiveRange_EX_Changed then
            currentWeapon.Stats.EffectiveRange_EX = tonumber(updatedEffectiveRange_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end

          -- Gravity_EX
          Gravity_EX_Changed, updatedGravity_EX = imgui.input_text("Gravity_EX", currentWeapon.Stats.Gravity_EX, 1)
          if Gravity_EX_Changed then
            currentWeapon.Stats.Gravity_EX = tonumber(updatedGravity_EX)
            WeaponService.apply_weapon_stats(currentWeapon.Id)
          end



          imgui.tree_pop()
        end

        imgui.tree_pop()
      end
    end

  end

  if currentWeapon.Type == "SG" then

    if imgui.tree_node("SG General") then

    -- SGAroundBulletCount
    SGAroundBulletCountChanged, updatedSGAroundBulletCount = imgui.input_text("SGAroundBulletCount", currentWeapon.Stats.SGAroundBulletCount, 1)
    if SGAroundBulletCountChanged then
      currentWeapon.Stats.SGAroundBulletCount = tonumber(updatedSGAroundBulletCount)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- SGAroundBulletDegree
    SGAroundBulletDegreeChanged, updatedSGAroundBulletDegree = imgui.input_text("SGAroundBulletDegree", currentWeapon.Stats.SGAroundBulletDegree, 1)
    if SGAroundBulletDegreeChanged then
      currentWeapon.Stats.SGAroundBulletDegree = tonumber(updatedSGAroundBulletDegree)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- SGAroundBulletLength
    SGAroundBulletLengthChanged, updatedSGAroundBulletLength = imgui.input_text("SGAroundBulletLength", currentWeapon.Stats.SGAroundBulletLength, 1)
    if SGAroundBulletLengthChanged then
      currentWeapon.Stats.SGAroundBulletLength = tonumber(updatedSGAroundBulletLength)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    imgui.new_line()

    -- SGAroundBulletCountFit
    SGAroundBulletCountFitChanged, updatedSGAroundBulletCountFit = imgui.input_text("SGAroundBulletCountFit", currentWeapon.Stats.SGAroundBulletCountFit, 1)
    if SGAroundBulletCountFitChanged then
      currentWeapon.Stats.SGAroundBulletCountFit = tonumber(updatedSGAroundBulletCountFit)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- SGAroundBulletDegreeFit
    SGAroundBulletDegreeFitChanged, updatedSGAroundBulletDegreeFit = imgui.input_text("SGAroundBulletDegreeFit", currentWeapon.Stats.SGAroundBulletDegreeFit, 1)
    if SGAroundBulletDegreeFitChanged then
      currentWeapon.Stats.SGAroundBulletDegreeFit = tonumber(updatedSGAroundBulletDegreeFit)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- SGAroundBulletLengthFit
    SGAroundBulletLengthFitChanged, updatedSGAroundBulletLengthFit = imgui.input_text("SGAroundBulletLengthFit", currentWeapon.Stats.SGAroundBulletLengthFit, 1)
    if SGAroundBulletLengthFitChanged then
      currentWeapon.Stats.SGAroundBulletLengthFit = tonumber(updatedSGAroundBulletLengthFit)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    imgui.new_line()

    -- FireBulletType
    FireBulletTypeChanged, updatedFireBulletType = imgui.combo("Bullet Origin", currentWeapon.Stats.FireBulletType, FireBullet_Types)
    if FireBulletTypeChanged then
      currentWeapon.Stats.FireBulletType = updatedFireBulletType
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end



      imgui.tree_pop()
    end

      if imgui.tree_node("Center Pellet") then

        if imgui.tree_node("Center General") then
          
      -- SGCenterSlur
      SGCenterSlurChanged, updatedSGCenterSlur = imgui.input_text("SGCenterSpread", currentWeapon.Stats.SGCenterSlur, 1)
      if SGCenterSlurChanged then
        currentWeapon.Stats.SGCenterSlur = tonumber(updatedSGCenterSlur)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- SGCenterSlurFit
      SGCenterSlurFitChanged, updatedSGCenterSlurFit = imgui.input_text("SGCenterSpreadFit", currentWeapon.Stats.SGCenterSlurFit, 1)
      if SGCenterSlurFitChanged then
        currentWeapon.Stats.SGCenterSlurFit = tonumber(updatedSGCenterSlurFit)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      imgui.new_line()

      -- SGCenterCritRate
      SGCenterCritRateChanged, updatedSGCenterCritRate = imgui.input_text("SGCenterCritRate", currentWeapon.Stats.SGCenterCritRate, 1)
      if SGCenterCritRateChanged then
        currentWeapon.Stats.SGCenterCritRate = tonumber(updatedSGCenterCritRate)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- SGCenterCritRateFit
      SGCenterCritRateFitChanged, updatedSGCenterCritRateFit = imgui.input_text("SGCenterCritRateFit", currentWeapon.Stats.SGCenterCritRateFit, 1)
      if SGCenterCritRateFitChanged then
        currentWeapon.Stats.SGCenterCritRateFit = tonumber(updatedSGCenterCritRateFit)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end


          imgui.tree_pop()
        end

        if imgui.tree_node("Center Damage") then

        -- SGCenterPower
        SGCenterPowerChanged, updatedSGCenterPower = imgui.input_text("SGCenterPower", currentWeapon.Stats.SGCenterPower, 1)
        if SGCenterPowerChanged then
          currentWeapon.Stats.SGCenterPower = tonumber(updatedSGCenterPower)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterWince
        SGCenterWinceChanged, updatedSGCenterWince = imgui.input_text("SGCenterWince", currentWeapon.Stats.SGCenterWince, 1)
        if SGCenterWinceChanged then
          currentWeapon.Stats.SGCenterWince = tonumber(updatedSGCenterWince)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterBreak
        SGCenterBreakChanged, updatedSGCenterBreak = imgui.input_text("SGCenterBreak", currentWeapon.Stats.SGCenterBreak, 1)
        if SGCenterBreakChanged then
          currentWeapon.Stats.SGCenterBreak = tonumber(updatedSGCenterBreak)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- SGCenterPowerRate
        SGCenterPowerRateChanged, updatedSGCenterPowerRate = imgui.input_text("SGCenterPowerRate", currentWeapon.Stats.SGCenterPowerRate, 1)
        if SGCenterPowerRateChanged then
          currentWeapon.Stats.SGCenterPowerRate = tonumber(updatedSGCenterPowerRate)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterWinceRate
        SGCenterWinceRateChanged, updatedSGCenterWinceRate = imgui.input_text("SGCenterWinceRate", currentWeapon.Stats.SGCenterWinceRate, 1)
        if SGCenterWinceRateChanged then
          currentWeapon.Stats.SGCenterWinceRate = tonumber(updatedSGCenterWinceRate)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterBreakRate
        SGCenterBreakRateChanged, updatedSGCenterBreakRate = imgui.input_text("SGCenterBreakRate", currentWeapon.Stats.SGCenterBreakRate, 1)
        if SGCenterBreakRateChanged then
          currentWeapon.Stats.SGCenterBreakRate = tonumber(updatedSGCenterBreakRate)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- SGCenterFitRatePower
        SGCenterFitRatePowerChanged, updatedSGCenterFitRatePower = imgui.input_text("SGCenterFitRatePower", currentWeapon.Stats.SGCenterFitRatePower, 1)
        if SGCenterFitRatePowerChanged then
          currentWeapon.Stats.SGCenterFitRatePower = tonumber(updatedSGCenterFitRatePower)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterFitRateWince
        SGCenterFitRateWinceChanged, updatedSGCenterFitRateWince = imgui.input_text("SGCenterFitRateWince", currentWeapon.Stats.SGCenterFitRateWince, 1)
        if SGCenterFitRateWinceChanged then
          currentWeapon.Stats.SGCenterFitRateWince = tonumber(updatedSGCenterFitRateWince)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterFitRateBreak
        SGCenterFitRateBreakChanged, updatedSGCenterFitRateBreak = imgui.input_text("SGCenterFitRateBreak", currentWeapon.Stats.SGCenterFitRateBreak, 1)
        if SGCenterFitRateBreakChanged then
          currentWeapon.Stats.SGCenterFitRateBreak = tonumber(updatedSGCenterFitRateBreak)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- SGCenterCritRatePower
        SGCenterCritRatePowerChanged, updatedSGCenterCritRatePower = imgui.input_text("SGCenterCritRatePower", currentWeapon.Stats.SGCenterCritRatePower, 1)
        if SGCenterCritRatePowerChanged then
          currentWeapon.Stats.SGCenterCritRatePower = tonumber(updatedSGCenterCritRatePower)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterCritRateWince
        SGCenterCritRateWinceChanged, updatedSGCenterCritRateWince = imgui.input_text("SGCenterCritRateWince", currentWeapon.Stats.SGCenterCritRateWince, 1)
        if SGCenterCritRateWinceChanged then
          currentWeapon.Stats.SGCenterCritRateWince = tonumber(updatedSGCenterCritRateWince)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterCritRateBreak
        SGCenterCritRateBreakChanged, updatedSGCenterCritRateBreak = imgui.input_text("SGCenterCritRateBreak", currentWeapon.Stats.SGCenterCritRateBreak, 1)
        if SGCenterCritRateBreakChanged then
          currentWeapon.Stats.SGCenterCritRateBreak = tonumber(updatedSGCenterCritRateBreak)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end


          imgui.tree_pop()
        end

        if imgui.tree_node("Center Ballistics") then
        -- SGCenterHitNum
        SGCenterHitNumChanged, updatedSGCenterHitNum = imgui.input_text("SGCenterHitNum", currentWeapon.Stats.SGCenterHitNum, 1)
        if SGCenterHitNumChanged then
          currentWeapon.Stats.SGCenterHitNum = tonumber(updatedSGCenterHitNum)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterHitNumBonusFit
        SGCenterHitNumBonusFitChanged, updatedSGCenterHitNumBonusFit = imgui.input_text("SGCenterHitNumBonusFit", currentWeapon.Stats.SGCenterHitNumBonusFit, 1)
        if SGCenterHitNumBonusFitChanged then
          currentWeapon.Stats.SGCenterHitNumBonusFit = tonumber(updatedSGCenterHitNumBonusFit)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterHitNumBonusCritical
        SGCenterHitNumBonusCriticalChanged, updatedSGCenterHitNumBonusCritical = imgui.input_text("SGCenterHitNumBonusCritical", currentWeapon.Stats.SGCenterHitNumBonusCritical, 1)
        if SGCenterHitNumBonusCriticalChanged then
          currentWeapon.Stats.SGCenterHitNumBonusCritical = tonumber(updatedSGCenterHitNumBonusCritical)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterPerformanceValue
        SGCenterPerformanceValueChanged, updatedSGCenterPerformanceValue = imgui.input_text("SGCenterPerformanceValue", currentWeapon.Stats.SGCenterPerformanceValue, 1)
        if SGCenterPerformanceValueChanged then
          currentWeapon.Stats.SGCenterPerformanceValue = tonumber(updatedSGCenterPerformanceValue)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- SGCenterBulletSpeed
        SGCenterBulletSpeedChanged, updatedSGCenterBulletSpeed = imgui.input_text("SGCenterBulletSpeed", currentWeapon.Stats.SGCenterBulletSpeed, 1)
        if SGCenterBulletSpeedChanged then
          currentWeapon.Stats.SGCenterBulletSpeed = tonumber(updatedSGCenterBulletSpeed)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterMaxRange
        SGCenterMaxRangeChanged, updatedSGCenterMaxRange = imgui.input_text("SGCenterMaxRange", currentWeapon.Stats.SGCenterMaxRange, 1)
        if SGCenterMaxRangeChanged then
          currentWeapon.Stats.SGCenterMaxRange = tonumber(updatedSGCenterMaxRange)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterEffectiveRange
        SGCenterEffectiveRangeChanged, updatedSGCenterEffectiveRange = imgui.input_text("SGCenterEffectiveRange", currentWeapon.Stats.SGCenterEffectiveRange, 1)
        if SGCenterEffectiveRangeChanged then
          currentWeapon.Stats.SGCenterEffectiveRange = tonumber(updatedSGCenterEffectiveRange)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGCenterGravity
        SGCenterGravityChanged, updatedSGCenterGravity = imgui.input_text("SGCenterGravity", currentWeapon.Stats.SGCenterGravity, 1)
        if SGCenterGravityChanged then
          currentWeapon.Stats.SGCenterGravity = tonumber(updatedSGCenterGravity)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end



          imgui.tree_pop()
        end


        imgui.tree_pop()
      end

      if imgui.tree_node("Around Pellets") then

        if imgui.tree_node("Around General") then
          
        -- SGAroundSlur
        SGAroundSlurChanged, updatedSGAroundSlur = imgui.input_text("SGAroundSpread", currentWeapon.Stats.SGAroundSlur, 1)
        if SGAroundSlurChanged then
          currentWeapon.Stats.SGAroundSlur = tonumber(updatedSGAroundSlur)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundSlurFit
        SGAroundSlurFitChanged, updatedSGAroundSlurFit = imgui.input_text("SGAroundSpreadFit", currentWeapon.Stats.SGAroundSlurFit, 1)
        if SGAroundSlurFitChanged then
          currentWeapon.Stats.SGAroundSlurFit = tonumber(updatedSGAroundSlurFit)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- SGAroundCritRate
        SGAroundCritRateChanged, updatedSGAroundCritRate = imgui.input_text("SGAroundCritRate", currentWeapon.Stats.SGAroundCritRate, 1)
        if SGAroundCritRateChanged then
          currentWeapon.Stats.SGAroundCritRate = tonumber(updatedSGAroundCritRate)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundCritRateFit
        SGAroundCritRateFitChanged, updatedSGAroundCritRateFit = imgui.input_text("SGAroundCritRateFit", currentWeapon.Stats.SGAroundCritRateFit, 1)
        if SGAroundCritRateFitChanged then
          currentWeapon.Stats.SGAroundCritRateFit = tonumber(updatedSGAroundCritRateFit)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end


          imgui.tree_pop()
        end

        if imgui.tree_node("Around Damage") then

        -- SGAroundPower
        SGAroundPowerChanged, updatedSGAroundPower = imgui.input_text("SGAroundPower", currentWeapon.Stats.SGAroundPower, 1)
        if SGAroundPowerChanged then
          currentWeapon.Stats.SGAroundPower = tonumber(updatedSGAroundPower)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundWince
        SGAroundWinceChanged, updatedSGAroundWince = imgui.input_text("SGAroundWince", currentWeapon.Stats.SGAroundWince, 1)
        if SGAroundWinceChanged then
          currentWeapon.Stats.SGAroundWince = tonumber(updatedSGAroundWince)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundBreak
        SGAroundBreakChanged, updatedSGAroundBreak = imgui.input_text("SGAroundBreak", currentWeapon.Stats.SGAroundBreak, 1)
        if SGAroundBreakChanged then
          currentWeapon.Stats.SGAroundBreak = tonumber(updatedSGAroundBreak)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- SGAroundPowerRate
        SGAroundPowerRateChanged, updatedSGAroundPowerRate = imgui.input_text("SGAroundPowerRate", currentWeapon.Stats.SGAroundPowerRate, 1)
        if SGAroundPowerRateChanged then
          currentWeapon.Stats.SGAroundPowerRate = tonumber(updatedSGAroundPowerRate)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundWinceRate
        SGAroundWinceRateChanged, updatedSGAroundWinceRate = imgui.input_text("SGAroundWinceRate", currentWeapon.Stats.SGAroundWinceRate, 1)
        if SGAroundWinceRateChanged then
          currentWeapon.Stats.SGAroundWinceRate = tonumber(updatedSGAroundWinceRate)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundBreakRate
        SGAroundBreakRateChanged, updatedSGAroundBreakRate = imgui.input_text("SGAroundBreakRate", currentWeapon.Stats.SGAroundBreakRate, 1)
        if SGAroundBreakRateChanged then
          currentWeapon.Stats.SGAroundBreakRate = tonumber(updatedSGAroundBreakRate)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- SGAroundFitRatePower
        SGAroundFitRatePowerChanged, updatedSGAroundFitRatePower = imgui.input_text("SGAroundFitRatePower", currentWeapon.Stats.SGAroundFitRatePower, 1)
        if SGAroundFitRatePowerChanged then
          currentWeapon.Stats.SGAroundFitRatePower = tonumber(updatedSGAroundFitRatePower)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundFitRateWince
        SGAroundFitRateWinceChanged, updatedSGAroundFitRateWince = imgui.input_text("SGAroundFitRateWince", currentWeapon.Stats.SGAroundFitRateWince, 1)
        if SGAroundFitRateWinceChanged then
          currentWeapon.Stats.SGAroundFitRateWince = tonumber(updatedSGAroundFitRateWince)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundFitRateBreak
        SGAroundFitRateBreakChanged, updatedSGAroundFitRateBreak = imgui.input_text("SGAroundFitRateBreak", currentWeapon.Stats.SGAroundFitRateBreak, 1)
        if SGAroundFitRateBreakChanged then
          currentWeapon.Stats.SGAroundFitRateBreak = tonumber(updatedSGAroundFitRateBreak)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- SGAroundCritRatePower
        SGAroundCritRatePowerChanged, updatedSGAroundCritRatePower = imgui.input_text("SGAroundCritRatePower", currentWeapon.Stats.SGAroundCritRatePower, 1)
        if SGAroundCritRatePowerChanged then
          currentWeapon.Stats.SGAroundCritRatePower = tonumber(updatedSGAroundCritRatePower)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundCritRateWince
        SGAroundCritRateWinceChanged, updatedSGAroundCritRateWince = imgui.input_text("SGAroundCritRateWince", currentWeapon.Stats.SGAroundCritRateWince, 1)
        if SGAroundCritRateWinceChanged then
          currentWeapon.Stats.SGAroundCritRateWince = tonumber(updatedSGAroundCritRateWince)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundCritRateBreak
        SGAroundCritRateBreakChanged, updatedSGAroundCritRateBreak = imgui.input_text("SGAroundCritRateBreak", currentWeapon.Stats.SGAroundCritRateBreak, 1)
        if SGAroundCritRateBreakChanged then
          currentWeapon.Stats.SGAroundCritRateBreak = tonumber(updatedSGAroundCritRateBreak)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end


          imgui.tree_pop()
        end

        if imgui.tree_node("Around Ballistics") then

        -- SGAroundHitNum
        SGAroundHitNumChanged, updatedSGAroundHitNum = imgui.input_text("SGAroundHitNum", currentWeapon.Stats.SGAroundHitNum, 1)
        if SGAroundHitNumChanged then
          currentWeapon.Stats.SGAroundHitNum = tonumber(updatedSGAroundHitNum)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundHitNumBonusFit
        SGAroundHitNumBonusFitChanged, updatedSGAroundHitNumBonusFit = imgui.input_text("SGAroundHitNumBonusFit", currentWeapon.Stats.SGAroundHitNumBonusFit, 1)
        if SGAroundHitNumBonusFitChanged then
          currentWeapon.Stats.SGAroundHitNumBonusFit = tonumber(updatedSGAroundHitNumBonusFit)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundHitNumBonusCritical
        SGAroundHitNumBonusCriticalChanged, updatedSGAroundHitNumBonusCritical = imgui.input_text("SGAroundHitNumBonusCritical", currentWeapon.Stats.SGAroundHitNumBonusCritical, 1)
        if SGAroundHitNumBonusCriticalChanged then
          currentWeapon.Stats.SGAroundHitNumBonusCritical = tonumber(updatedSGAroundHitNumBonusCritical)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundPerformanceValue
        SGAroundPerformanceValueChanged, updatedSGAroundPerformanceValue = imgui.input_text("SGAroundPerformanceValue", currentWeapon.Stats.SGAroundPerformanceValue, 1)
        if SGAroundPerformanceValueChanged then
          currentWeapon.Stats.SGAroundPerformanceValue = tonumber(updatedSGAroundPerformanceValue)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        imgui.new_line()

        -- SGAroundBulletSpeed
        SGAroundBulletSpeedChanged, updatedSGAroundBulletSpeed = imgui.input_text("SGAroundBulletSpeed", currentWeapon.Stats.SGAroundBulletSpeed, 1)
        if SGAroundBulletSpeedChanged then
          currentWeapon.Stats.SGAroundBulletSpeed = tonumber(updatedSGAroundBulletSpeed)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundMaxRange
        SGAroundMaxRangeChanged, updatedSGAroundMaxRange = imgui.input_text("SGAroundMaxRange", currentWeapon.Stats.SGAroundMaxRange, 1)
        if SGAroundMaxRangeChanged then
          currentWeapon.Stats.SGAroundMaxRange = tonumber(updatedSGAroundMaxRange)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundEffectiveRange
        SGAroundEffectiveRangeChanged, updatedSGAroundEffectiveRange = imgui.input_text("SGAroundEffectiveRange", currentWeapon.Stats.SGAroundEffectiveRange, 1)
        if SGAroundEffectiveRangeChanged then
          currentWeapon.Stats.SGAroundEffectiveRange = tonumber(updatedSGAroundEffectiveRange)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end

        -- SGAroundGravity
        SGAroundGravityChanged, updatedSGAroundGravity = imgui.input_text("SGAroundGravity", currentWeapon.Stats.SGAroundGravity, 1)
        if SGAroundGravityChanged then
          currentWeapon.Stats.SGAroundGravity = tonumber(updatedSGAroundGravity)
          WeaponService.apply_weapon_stats(currentWeapon.Id)
        end


          imgui.tree_pop()
        end

        imgui.tree_pop()
      end

  end 

  if currentWeapon.Type == "FLAM" then

    if imgui.tree_node("General") then
    -- RadiateLength
    RadiateLengthChanged, updatedRadiateLength = imgui.input_text("RadiateLength", currentWeapon.Stats.RadiateLength, 1)
    if RadiateLengthChanged then
      currentWeapon.Stats.RadiateLength = tonumber(updatedRadiateLength)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- FireBulletType
    FireBulletTypeChanged, updatedFireBulletType = imgui.combo("Bullet Origin", currentWeapon.Stats.FireBulletType, FireBullet_Types)
    if FireBulletTypeChanged then
      currentWeapon.Stats.FireBulletType = updatedFireBulletType
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

      imgui.tree_pop()
    end

    if imgui.tree_node("Damage") then

      -- PowerRate_A
      PowerRate_A_Changed, updatedPowerRate_A = imgui.input_text("PowerRate_A", currentWeapon.Stats.PowerRate_A, 1)
      if PowerRate_A_Changed then
        currentWeapon.Stats.PowerRate_A = tonumber(updatedPowerRate_A)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- WinceRate_A
      WinceRate_A_Changed, updatedWinceRate_A = imgui.input_text("WinceRate_A", currentWeapon.Stats.WinceRate_A, 1)
      if WinceRate_A_Changed then
        currentWeapon.Stats.WinceRate_A = tonumber(updatedWinceRate_A)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- BreakRate_A
      BreakRate_A_Changed, updatedBreakRate_A = imgui.input_text("BreakRate_A", currentWeapon.Stats.BreakRate_A, 1)
      if BreakRate_A_Changed then
        currentWeapon.Stats.BreakRate_A = tonumber(updatedBreakRate_A)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- PowerRate
      PowerRateChanged, updatedPowerRate = imgui.input_text("PowerRate", currentWeapon.Stats.PowerRate, 1)
      if PowerRateChanged then
        currentWeapon.Stats.PowerRate = tonumber(updatedPowerRate)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- WinceRate
      WinceRateChanged, updatedWinceRate = imgui.input_text("WinceRate", currentWeapon.Stats.WinceRate, 1)
      if WinceRateChanged then
        currentWeapon.Stats.WinceRate = tonumber(updatedWinceRate)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

      -- BreakRate
      BreakRateChanged, updatedBreakRate = imgui.input_text("BreakRate", currentWeapon.Stats.BreakRate, 1)
      if BreakRateChanged then
        currentWeapon.Stats.BreakRate = tonumber(updatedBreakRate)
        WeaponService.apply_weapon_stats(currentWeapon.Id)
      end

    imgui.tree_pop()
    end



  end


  if imgui.tree_node("Focus") then

    -- HoldAddFocus
    HoldAddFocusChanged, updatedHoldAddFocus = imgui.input_text("HoldAddFocus", currentWeapon.Stats.HoldAddFocus, 1)
    if HoldAddFocusChanged then
      currentWeapon.Stats.HoldAddFocus = tonumber(updatedHoldAddFocus)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- MoveSubFocus
    MoveSubFocusChanged, updatedMoveSubFocus = imgui.input_text("MoveSubFocus", currentWeapon.Stats.MoveSubFocus, 1)
    if MoveSubFocusChanged then
      currentWeapon.Stats.MoveSubFocus = tonumber(updatedMoveSubFocus)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- ShootSubFocus
    ShootSubFocusChanged, updatedShootSubFocus = imgui.input_text("ShootSubFocus", currentWeapon.Stats.ShootSubFocus, 1)
    if ShootSubFocusChanged then
      currentWeapon.Stats.ShootSubFocus = tonumber(updatedShootSubFocus)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- WatchSubFocus
    WatchSubFocusChanged, updatedWatchSubFocus = imgui.input_text("WatchSubFocus", currentWeapon.Stats.WatchSubFocus, 1)
    if WatchSubFocusChanged then
      currentWeapon.Stats.WatchSubFocus = tonumber(updatedWatchSubFocus)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- KeepFitLimitFocus
    KeepFitLimitFocusChanged, updatedKeepFitLimitFocus = imgui.input_text("KeepFitLimitFocus", currentWeapon.Stats.KeepFitLimitFocus, 1)
    if KeepFitLimitFocusChanged then
      currentWeapon.Stats.KeepFitLimitFocus = tonumber(updatedKeepFitLimitFocus)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

  imgui.tree_pop()
  end

  if imgui.tree_node("Recoil") then

    -- RecoilHorizontalMin
    RecoilHorizontalMinChanged, updatedRecoilHorizontalMin = imgui.input_text("RecoilHorizontalMin", currentWeapon.Stats.RecoilHorizontalMin, 1)
    if RecoilHorizontalMinChanged then
      currentWeapon.Stats.RecoilHorizontalMin = tonumber(updatedRecoilHorizontalMin)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- RecoilHorizontalMax
    RecoilHorizontalMaxChanged, updatedRecoilHorizontalMax = imgui.input_text("RecoilHorizontalMax", currentWeapon.Stats.RecoilHorizontalMax, 1)
    if RecoilHorizontalMaxChanged then
      currentWeapon.Stats.RecoilHorizontalMax = tonumber(updatedRecoilHorizontalMax)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- RecoilVerticalMin
    RecoilVerticalMinChanged, updatedRecoilVerticalMin = imgui.input_text("RecoilVerticalMin", currentWeapon.Stats.RecoilVerticalMin, 1)
    if RecoilVerticalMinChanged then
      currentWeapon.Stats.RecoilVerticalMin = tonumber(updatedRecoilVerticalMin)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    -- RecoilVerticalMax
    RecoilVerticalMaxChanged, updatedRecoilVerticalMax = imgui.input_text("RecoilVerticalMax", currentWeapon.Stats.RecoilVerticalMax, 1)
    if RecoilVerticalMaxChanged then
      currentWeapon.Stats.RecoilVerticalMax = tonumber(updatedRecoilVerticalMax)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end

    imgui.tree_pop()
  end

  if imgui.tree_node("Capacity") then

    -- Capacity
    CapacityChanged, updatedCapacity = imgui.input_text("Capacity", currentWeapon.Stats.Capacity, 1)
    if CapacityChanged then
      currentWeapon.Stats.Capacity = tonumber(updatedCapacity)
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end



    -- Infinite Ammo Checkbox
    infiniteAmmoChanged, infiniteAmmoChecked = imgui.checkbox("Infinite Ammo", currentWeapon.Stats.InfiniteAmmo)
    if infiniteAmmoChanged then
      currentWeapon.Stats.InfiniteAmmo = infiniteAmmoChecked
      WeaponService.apply_weapon_stats(currentWeapon.Id)
    end


    imgui.tree_pop()
  end

    imgui.new_line()

    if imgui.button("Save Changes") then
      local path = Weapon_Vars.Weapon_Profiles[Weapon_Vars.Selected_Profile]
      json.dump_file("DWP\\" .. path .. "\\" .. currentWeapon.Name.. ".json", currentWeapon.Stats)
    end
  
  imgui.end_window()
end


local function create_new_weapon_profile()
  if new_profile_name ~= nil and new_profile_name ~= '' then
    -- look for existing files
    local tempvp70_ = json.load_file("DWP\\" .. new_profile_name .. "\\VP70.json")

    -- if an existing profile folder wasn't found, copy None into the new profile folder
    if not tempvp70_ then
      local nonevp70_ = json.load_file("DWP\\None\\VP70.json")
      local noneM1911 = json.load_file("DWP\\None\\M1911.json")
      local noneBHP = json.load_file("DWP\\None\\BHP.json")
      local noneARMY = json.load_file("DWP\\None\\ARMY.json")
      local noneUSP = json.load_file("DWP\\None\\USP.json")
      local noneBROOM = json.load_file("DWP\\None\\BROOM.json")
      local noneSLS = json.load_file("DWP\\None\\SLS.json")
      local noneM870 = json.load_file("DWP\\None\\M870.json")
      local noneMQ11 = json.load_file("DWP\\None\\MQ11.json")
      local noneMP5 = json.load_file("DWP\\None\\MP5.json")
      local noneDE50 = json.load_file("DWP\\None\\DE50.json")
      local noneSAM = json.load_file("DWP\\None\\SAM.json")
      local noneSAMC = json.load_file("DWP\\None\\SAMC.json")
      local noneSAMJ = json.load_file("DWP\\None\\SAMJ.json")
      local noneSAMW = json.load_file("DWP\\None\\SAMW.json")
      


      json.dump_file("DWP\\" .. new_profile_name .. "\\VP70.json", nonevp70_)
      json.dump_file("DWP\\" .. new_profile_name .. "\\M1911.json", noneM1911)
      json.dump_file("DWP\\" .. new_profile_name .. "\\BHP.json", noneBHP)
      json.dump_file("DWP\\" .. new_profile_name .. "\\ARMY.json", noneARMY)
      json.dump_file("DWP\\" .. new_profile_name .. "\\USP.json", noneUSP)
      json.dump_file("DWP\\" .. new_profile_name .. "\\BROOM.json", noneBROOM)
      json.dump_file("DWP\\" .. new_profile_name .. "\\SLS.json", noneSLS)
      json.dump_file("DWP\\" .. new_profile_name .. "\\M870.json", noneM870)
      json.dump_file("DWP\\" .. new_profile_name .. "\\MQ11.json", noneMQ11)
      json.dump_file("DWP\\" .. new_profile_name .. "\\MP5.json", noneMP5)
      json.dump_file("DWP\\" .. new_profile_name .. "\\DE50.json", noneDE50)
      json.dump_file("DWP\\" .. new_profile_name .. "\\SAM.json", noneSAM)
      json.dump_file("DWP\\" .. new_profile_name .. "\\SAMC.json", noneSAMC)
      json.dump_file("DWP\\" .. new_profile_name .. "\\SAMJ.json", noneSAMJ)
      json.dump_file("DWP\\" .. new_profile_name .. "\\SAMW.json", noneSAMW)
    end

    local count = 1
    for _ in pairs(Weapon_Vars.Weapon_Profiles) do
      count = count + 1
    end
    Weapon_Vars.Weapon_Profiles[tostring(count)] = new_profile_name
    new_profile_name = ""
    json.dump_file("DWP\\Saved.json", Weapon_Vars)
  end
end

-- set the weapon values when the script first runs
SetWeapon_DMGValues()

local function generate_statics(typename)
  local t = sdk.find_type_definition(typename)
  if not t then return {} end

  local fields = t:get_fields()
  local enum = {}
  local enum_string = "\ncase \"" .. typename .. "\":" .. "\n    enum {"
  
  for i, field in ipairs(fields) do
      if field:is_static() then
          local name = field:get_name()
          local raw_value = field:get_data(nil)
          enum_string = enum_string .. "\n        " .. name .. " = " .. tostring(raw_value) .. ","
          enum[name] = raw_value
      end
  end
  
  --log.info(enum_string .. "\n    }" .. typename:gsub("%.", "_") .. ";\n    break;\n") --enums for RSZ template

  return enum
end

local function generate_statics_global(typename)
  local parts = {}
  for part in typename:gmatch("[^%.]+") do
      table.insert(parts, part)
  end
  local global = _G
  for i, part in ipairs(parts) do
      if not global[part] then
          global[part] = {}
      end
      global = global[part]
  end
  if global ~= _G then
      local static_class = generate_statics(typename)

      for k, v in pairs(static_class) do
          global[k] = v
          global[v] = k
      end
  end
  return global
end

generate_statics_global("via.hid.KeyboardKey")

re.on_draw_ui(function()
    local changed = false
    local was_changed = false

    if imgui.tree_node("Dynamic Weapon Profiles") then
        table.sort(Weapon_Vars.Weapon_Profiles)
        changed, Weapon_Vars.Selected_Profile = imgui.combo("Weapon Profile", Weapon_Vars.Selected_Profile,
            Weapon_Vars.Weapon_Profiles)
        was_changed = changed or was_changed

        changed, Weapon_Vars.No_Recoil = imgui.checkbox("No Recoil", Weapon_Vars.No_Recoil)
        was_changed = changed or was_changed

        changed, Weapon_Vars.No_Spread = imgui.checkbox("Perfect Accuracy", Weapon_Vars.No_Spread)
        was_changed = changed or was_changed

        changed, Weapon_Vars.Always_Focus = imgui.checkbox("Perfect Focus", Weapon_Vars.Always_Focus)
        was_changed = changed or was_changed

        changed, Weapon_Vars.No_Ammo_Cost = imgui.checkbox("Infinite Ammo", Weapon_Vars.No_Ammo_Cost)
        was_changed = changed or was_changed

        changed, Weapon_Vars.Extra_Wince = imgui.checkbox("Extra Stagger", Weapon_Vars.Extra_Wince)
        was_changed = changed or was_changed

        changed, Weapon_Vars.Extra_Break = imgui.checkbox("Extra Dismemberment", Weapon_Vars.Extra_Break)
        was_changed = changed or was_changed

        changed, Weapon_Vars.Headshots_Kill = imgui.checkbox("Lethal Headshots", Weapon_Vars.Headshots_Kill)
        was_changed = changed or was_changed

        imgui.tree_pop()
    end

    if was_changed then
        apply_changes()
    end

    if imgui.tree_node("DWP Profile Editing") then
        local editorButtonLabel = "Show Profile Editor"
        if show_profile_editor then
            editorButtonLabel = "Hide Profile Editor"
        end

        if imgui.button(editorButtonLabel) then
            show_profile_editor = not show_profile_editor
        end

        imgui.new_line()

        imgui.text("Enter the folder name of your custom profile to\nadd it to the list of available weapon profiles")

        local profileChanged = false
        local updated_profile_entry = ""
        profileChanged, updated_profile_entry = imgui.input_text("Folder Name", new_profile_name)

        if profileChanged then
            new_profile_name = updated_profile_entry
        end

        if imgui.button("Add Profile") then
            create_new_weapon_profile()
        end
        imgui.new_line()
    end
    imgui.new_line()
end)


re.on_frame(function()
  if show_profile_editor then
    draw_profile_editor_ui()
  end

  if scene_manager then
    if not scene then
      scene = sdk.call_native_func(scene_manager, sdk.find_type_definition("via.SceneManager"), "get_CurrentScene")
    end

    if scene then
      if not initialized then
        WeaponService.set_scene(scene)
        initialized = true
      end

      WeaponService.on_frame()
    end
  end

  if imgui.is_key_pressed(via.hid.KeyboardKey.Insert) then
    show_profile_editor = false
  end
end)
