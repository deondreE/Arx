#pragma once

#include "Core/PlatformDetection.hpp"

#ifdef AX_PLATFORM_WINDOWS
    #ifdef NOMINMAX
        #define NOMINMAX
    #endif
#endif

#include <iostream>
#include <memory>
#include <utility>
#include <algorithm>
#include <functional>

#include <string>
#include <sstream>
#include <array>
#include <vector>
#include <unordered_map>
#include <unordered_set>

#include "Arx.hpp"

#include "log.hpp"

// #include "Hazel/Debug/Instrumentor.h"

#ifdef HZ_PLATFORM_WINDOWS
    #include <Windows.h>
#endif