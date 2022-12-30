project "Arx"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir "bin/%{cfg.buildcfg}"

	pchheader "axpch.hpp"
	pchsource "axpch.cpp"

    files
	{
		"src/**.h",
		"src/**.cpp",
	}

    defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"GLFW_INCLUDE_NONE"
	}

    includedirs
	{
		"src",
		"vendor/spdlog/include",
		"Arx/vendor/spdlog/include", 
        "Arx/vendor/glfw/include",
		"Arx/vendor/glm"
	}

	links
	{
		"glfw",
		"glad",
		"glm"
	}

    filter "configurations:Debug"
		defines "HZ_DEBUG"
		runtime "Debug"
		symbols "on"

		-- links
		-- {
		-- 	"%{Library.ShaderC_Debug}",
		-- 	"%{Library.SPIRV_Cross_Debug}",
		-- 	"%{Library.SPIRV_Cross_GLSL_Debug}"
		-- }

	filter "configurations:Release"
		defines "HZ_RELEASE"
		runtime "Release"
		optimize "on"

		-- links
		-- {
		-- 	"%{Library.ShaderC_Release}",
		-- 	"%{Library.SPIRV_Cross_Release}",
		-- 	"%{Library.SPIRV_Cross_GLSL_Release}"
		-- }

	filter "configurations:Dist"
		defines "HZ_DIST"
		runtime "Release"
		optimize "on"

		-- links
		-- {
		-- 	"%{Library.ShaderC_Release}",
		-- 	"%{Library.SPIRV_Cross_Release}",
		-- 	"%{Library.SPIRV_Cross_GLSL_Release}"
		-- }
