@echo off

rem Protobuf
echo -- ManufacturingScenario.proto --
protoc.exe ManufacturingScenario.proto ^
	--csharp_out=../GeneratedSourceCode/C# ^
	--cpp_out=../GeneratedSourceCode/C++ ^
	--java_out=../GeneratedSourceCode/Java ^
	--python_out=../GeneratedSourceCode/Python ^
	--proto_path=OpenVectorFormat ^
	--proto_path=../Protobuf
call:check_error

echo -- ModuleDefinition.proto --
protoc.exe ModuleDefinition.proto ^
	--csharp_out=../GeneratedSourceCode/C# ^
	--cpp_out=../GeneratedSourceCode/C++ ^
	--java_out=../GeneratedSourceCode/Java ^
	--python_out=../GeneratedSourceCode/Python ^
	--proto_path=OpenVectorFormat ^
	--proto_path=../Protobuf
call:check_error

echo -- build_processor_strategy.proto --
protoc.exe build_processor_strategy.proto ^
	--csharp_out=../GeneratedSourceCode/C# ^
	--cpp_out=../GeneratedSourceCode/C++ ^
	--java_out=../GeneratedSourceCode/Java ^
	--python_out=../GeneratedSourceCode/Python ^
	--proto_path=OpenVectorFormat ^
	--proto_path=../Protobuf
call:check_error

echo -- open_vector_format.proto --
protoc.exe open_vector_format.proto ^
	--csharp_out=../GeneratedSourceCode/C# ^
	--cpp_out=../GeneratedSourceCode/C++ ^
	--java_out=../GeneratedSourceCode/Java ^
	--python_out=../GeneratedSourceCode/Python ^
	--proto_path=OpenVectorFormat ^
	--proto_path=../Protobuf
call:check_error
rem end Protobuf

echo.
pause
goto:eof


rem changes console text color to red if the last command did not return successful
:check_error
if %errorlevel% NEQ 0 (
	color 04
	echo ^!^! ERROR ^!^!
)
echo.
goto:eof