@echo off
CLS

::rm.exe -f main.o mutex-2.exe
::g++.exe -c main.cpp -o main.o -I"C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/include" -I"C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/x86_64-w64-mingw32/include" -I"C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/lib/gcc/x86_64-w64-mingw32/5.1.0/include" -I"C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++" -m32 -std=gnu++11
::g++.exe main.o -o mutex-2.exe -L"C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/lib" -L"C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/x86_64-w64-mingw32/lib" -static-libgcc -lmingw32 -m32

::g++ -I"C:/C++/protobuf.3.5.1-gcc.4.9.2/include" -L"C:/C++/protobuf.3.5.1-gcc.4.9.2/lib" main.cpp addressbook.pb.cc -lprotobuf -pthread

del /s /q /f *.o
del /s /q /f *.a
del /s /q /f *.dll
del /s /q /f *.exe
ECHO.
ECHO.

SET "CPP=g++.exe"

SET "GCC_LIB_PATH_1=C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/lib"
SET "GCC_LIB_PATH_2=C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/x86_64-w64-mingw32/lib"

SET "GCC_INCLUDE_PATH_1=C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/include"
SET "GCC_INCLUDE_PATH_2=C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/x86_64-w64-mingw32/include"
SET "GCC_INCLUDE_PATH_3=C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/lib/gcc/x86_64-w64-mingw32/5.1.0/include"
SET "GCC_INCLUDE_PATH_4=C:/Program Files (x86)/Dev-Cpp/MinGW64.GCC5.1.0/lib/gcc/x86_64-w64-mingw32/5.1.0/include/c++"

SET "LIBS=-L"%GCC_LIB_PATH_1%" -L"%GCC_LIB_PATH_2%" -static-libgcc -m64"
SET "INCS=-I"%GCC_INCLUDE_PATH_1%" -I"%GCC_INCLUDE_PATH_2%" -I"%GCC_INCLUDE_PATH_3%""
SET "CXXINCS=-I"%GCC_INCLUDE_PATH_1%" -I"%GCC_INCLUDE_PATH_2%" -I"%GCC_INCLUDE_PATH_3%" -I"%GCC_INCLUDE_PATH_4%""

ECHO LIBS = %LIBS%
ECHO INCS = %INCS%
ECHO CXXINCS = %CXXINCS%

ECHO.
ECHO.

%CPP% -c main.cpp -o main.o -m32 -std=gnu++11 -D DF=123
::%CPP% main.o -o app.exe -m32 -static-libgcc -pthread -shared-libstdc++
%CPP% main.o -o app.exe -m32 -static-libgcc -pthread

::%CPP% -c addressbook.pb.cc -o addressbook.pb.o -I"C:/Program Files (x86)/Dev-Cpp/MinGW64/include" -I"C:/Program Files (x86)/Dev-Cpp/MinGW64/x86_64-w64-mingw32/include" -I"C:/C++/protobuf.3.5.1-gcc.4.9.2/include" -m32 -std=gnu++11
::%CPP% main.o addressbook.pb.o -o main.exe -L"C:/Program Files (x86)/Dev-Cpp/MinGW64/x86_64-w64-mingw32/lib32" -static-libgcc -L"C:/C++/protobuf.3.5.1-gcc.4.9.2/lib" -L"lib/libprotoc.a" -L"lib/libprotobuf.a" -m32

::%CPP% main.o -pthread