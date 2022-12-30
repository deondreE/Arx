workspace "Arx Engine"
   configurations { "Debug", "Release" }

    project "Arx"
        kind "ConsoleApp"
        language "C++"
        targetdir "bin/%{cfg.buildcfg}"

        files { "Arx/src/**.hpp", "Arx/src/**.cpp" }

        filter "configurations:Debug"
            defines { "DEBUG" }
            symbols "On"

        filter "configurations:Release"
            defines { "NDEBUG" }
            optimize "On"

        filter "action:xcode4"
            files {
                "source/mac/Info.plist", -- add your own your .plist and .entitlements so you can customise them
                "source/mac/app.entitlements",
            }

            links {
                "third_party/sdl2/macos/SDL2.framework",    -- relative path to third party frameworks
                "CoreFoundation.framework",                 -- no path needed for system frameworks
                "OpenGL.framework",
            }

            sysincludedirs {
                "third_party/sdl2/macos/SDL2.framework/Headers", -- need to explicitly add path to framework headers
            }

            frameworkdirs {
                "third_party/sdl2/macos/", -- path to search for third party frameworks
            }

            embedAndSign {
                "SDL2.framework" -- bundle the framework into the built .app and sign with your certificate
            }

            xcodebuildsettings {
                ["MACOSX_DEPLOYMENT_TARGET"] = "13.0",
                ["PRODUCT_BUNDLE_IDENTIFIER"] = 'com.megafire.arx',
                ["CODE_SIGN_STYLE"] = "Automatic",
                ["DEVELOPMENT_TEAM"] = 'Megafire Games',                                    -- your dev team id
                ["INFOPLIST_FILE"] = "./mac/config/Info.plist",                     -- path is relative to the generated project file
                ["CODE_SIGN_ENTITLEMENTS"] = ("./mac/config/app.entitlements"),     -- ^
                ["ENABLE_HARDENED_RUNTIME"] = "YES",                                    -- hardened runtime is required for notarization
                ["CODE_SIGN_IDENTITY"] = "Apple Development",                           -- sets 'Signing Certificate' to 'Development'. Defaults to 'Sign to Run Locally'. not doing this will crash your app if you upgrade the project when prompted by Xcode
                ["LD_RUNPATH_SEARCH_PATHS"] = "$(inherited) @executable_path/../Frameworks", -- tell the executable where to find the frameworks. Path is relative to executable location inside .app bundle
            }