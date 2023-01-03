#pragma once

#include "Core/Core.hpp"

namespace Arx {
    class Layer {
        public:
            Layer(const std::string &name = "Layer");
            virtual ~Layer();

            virtual void OnAttach() {}
            virtual void OnDetach() {}
            virtual void OnUpdate() {}
            virtual void OnEvent() {} // Use the event class as input

            inline const std::string& GetName() const { return m_DebugName; }
        protected:
            std::string m_DebugName;
    };
}