project "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"

    targetdir "bin/%{cfg.buildcfg}"

    files
	{
		"src/**.hpp",
		"src/**.cpp"
	}

    includedirs
	{
		"%{wks.location}/Arx/vendor/spdlog/include",
		"%{wks.location}/Arx/src",
		"%{wks.location}/Arx/vendor",
	}

    links
	{
		"Arx"
	}