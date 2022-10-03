mkdir compile_commands
mkdir build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug -B build\
xcopy /s /F /y build\compile_commands.json compile_commands\debug_x64.json
cd build/
cmake --build .
cd ..
