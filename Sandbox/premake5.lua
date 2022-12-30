project "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

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
	
	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "HZ_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "HZ_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "HZ_DIST"
		runtime "Release"
		optimize "on"