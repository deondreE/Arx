import sys
import platform
import os
from colorama import Fore

# Check the version color
if sys.version_info.major == 3:
    print(Fore.BLUE + 'Python3' + ' ✅ ')
else:
   print(Fore.RED + 'Python2 -- We require Python3 for our scripting!')


system = platform.machine()

systemName = ''

# create a premake file to execute
def write_premake_file(CONTENT):
    # Create the file
    file = open("premake5.lua", "w")
    file.write(CONTENT)
    print(Fore.CYAN + 'Created: premake5.lua')
    file.close()

match (system):
    case 'arm64':
        systemName = 'macos'
        print(Fore.RED + systemName)
        write_premake_file('include "../premake/"')
        os.system("premake5 xcode4")
    case 'x64':
        systemName = 'windows'
        print(Fore.Green + systemName)
        write_premake_file('include "../premake/"')
        os.system("premake5 vs2022")
    case 'x32':
        print('We dont support this versioning!')