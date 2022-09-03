premake vs2022
premake export-compile-commands
del compile_commands.json
:: TODO: make the .bat receive a variable to decide on build type and act accordingly
ln -s compile_commands/debug_x64.json compile_commands.json
msbuild ./build\opengl.vcxproj /p:Platform=x64
echo "========= BUILD FINISHED =========" 
echo "========= RUNNING EXE =========" 
.\bin\Debug\opengl.exe
