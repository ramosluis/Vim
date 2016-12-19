# _Vimrc

_vimrc is the Vim configuration file for Windows, in order to use all the plugins in this _vimrc file, it's necesarry to download/install the following in Windows:

* [Vim with Python 3 and Lua support](https://tuxproject.de/projects/vim/)
* [Python 3](https://www.python.org/downloads/) ([Or Anaconda](https://www.continuum.io/downloads))
* [Vundle](https://github.com/VundleVim/Vundle.vim)
* [Lua binaries](http://joedf.ahkscript.org/LuaBuilds/)
* [Curl](https://curl.haxx.se/)
* [Git](https://git-scm.com/) ([Or Msysgit](https://git-for-windows.github.io/))
* [Flake8](https://pypi.python.org/pypi/flake8)
* [Exuberant Ctags](http://ctags.sourceforge.net/)

Once installed, simply copy the _vimrc file to the Vim installation directory and excecute the command

`:PluginInstall`


For OmniCompletion, Neocomplete is used along with jedi-vim for Python and OmniCppComplete for C/C++. For better C++ omnicompletion, YouCompleteMe can be used, just uncomment it from the _vimrc and comment out the other three plugins. In order to install it, [CMake](https://cmake.org/download/) must also be installed. Additionally, the latest pre-built LLVM+Clang binary must be downloaded from www.llvm.org as well and extracted to `%USERPROFILE%/ycm_temp/llvm_root_dir` using 7Zip (despite having an extension of `.exe` this file is actually an archive). In order to make YCM play nice with Anaconda (in case it was installed instead of the default Python package), the following steps must be followed:

* Run `:PluginInstall` in Vim to install YouCompleteMe
* Create the directory `%USERPROFILE%/ycm_build` and, in a command prompt, move to it
* Run the following command `cmake -G "Visual Studio 14 Win64" -DPYTHON_LIBRARY=%USERPROFILE%/Anaconda3/libs/python35.lib -DPYTHON_INCLUDE_DIR=%USERPROFILE%/Anaconda3/include -DUSE_PYTHON2=OFF -DPATH_TO_LLVM_ROOT=%USERPROFILE%/ycm_temp/llvm_root_dir . %USERPROFILE%/vimfiles/bundle/YouCompleteMe/third_party/ycmd/cpp` 
* Note that `-DPYTHON_LIBRARY` and `DPYTHON_INCLUDE_DIR` might change paths, in order to see where they are, change directories to `%USERPROFILE%/vimfiles/bundle/YouCompleteMe` and run the following command (which will fail, or press <C-c> to cancel it early): `python ./install --clang-completer`, both paths should appear in the command prompt
* Back in the ycm_build directory, run `cmake --build . --target ycm_core --config Release`
* Place the `.ycm_extra_conf.py` file in the `%USERPROFILE%` directory

Note that for ANSI C and Python Omnicompletion, Neocomplete has the same functionality as YCM, with much less setup and better Python integration, YCM should really only be used if doing C++ development.
