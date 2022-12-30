#include "log.hpp"

#include "spdlog/sinks/stdout_color_sinks.h"

namespace Arx
{
    std::shared_ptr<spdlog::logger> Logger::s_CoreLogger;
    std::shared_ptr<spdlog::logger> Logger::s_ClientLogger;

    void Logger::Init() 
    {
        spdlog::set_pattern("%^[&T] %n: %v%$");

        s_CoreLogger = spdlog::stdout_color_mt("Arx");
        s_CoreLogger->set_level(spdlog::level::trace);

        s_ClientLogger = spdlog::stdout_color_mt("Sandbox");
        s_ClientLogger->set_level(spdlog::level::trace);
    }
}