#
# Módulo   : Moon
# Autor    : Elio Joly Botogoske
# Data     : 21/03/2023
# Arquivo  : Makefile
# Objetivo : Compilar com o Microsoft C++ 2017
#

# Define as flags de compilação e linkagem
CPPFLAGS =/c /EHsc /O2 /favor:AMD64 /std:c++17
SFMLINCL = /I"C:\Users\eliob\source\sfml\include"
SFMLLINK = /LIBPATH:"C:\Users\eliob\source\sfml\lib" sfml-graphics.lib sfml-window.lib sfml-system.lib

# Regras para compilar e linkar
main.obj: main.cpp
	cl $(CPPFLAGS) $(SFMLINCL) main.cpp

particles.obj: particles.cpp
	cl -c $(CPPFLAGS) $(SFMLINCL) particles.cpp

moon: main.obj particles.obj
    link $(SFMLLINK) main.obj particles.obj /out:moon.exe

# Regra para limpar arquivos temporários
clean:
    del /Q *.obj *.exe
