# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build

# Include any dependencies generated for this target.
include CMakeFiles/petsc_solver.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/petsc_solver.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/petsc_solver.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/petsc_solver.dir/flags.make

CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.o: CMakeFiles/petsc_solver.dir/flags.make
CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.o: ../src/PETSC_FIM_solver.cpp
CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.o: CMakeFiles/petsc_solver.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.o"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.o -MF CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.o.d -o CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.o -c /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/PETSC_FIM_solver.cpp

CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.i"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/PETSC_FIM_solver.cpp > CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.i

CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.s"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/PETSC_FIM_solver.cpp -o CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.s

CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.o: CMakeFiles/petsc_solver.dir/flags.make
CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.o: ../src/PETScBSolverPS.cpp
CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.o: CMakeFiles/petsc_solver.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.o"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.o -MF CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.o.d -o CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.o -c /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/PETScBSolverPS.cpp

CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.i"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/PETScBSolverPS.cpp > CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.i

CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.s"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/PETScBSolverPS.cpp -o CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.s

CMakeFiles/petsc_solver.dir/src/decoup.cpp.o: CMakeFiles/petsc_solver.dir/flags.make
CMakeFiles/petsc_solver.dir/src/decoup.cpp.o: ../src/decoup.cpp
CMakeFiles/petsc_solver.dir/src/decoup.cpp.o: CMakeFiles/petsc_solver.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/petsc_solver.dir/src/decoup.cpp.o"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/petsc_solver.dir/src/decoup.cpp.o -MF CMakeFiles/petsc_solver.dir/src/decoup.cpp.o.d -o CMakeFiles/petsc_solver.dir/src/decoup.cpp.o -c /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/decoup.cpp

CMakeFiles/petsc_solver.dir/src/decoup.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/petsc_solver.dir/src/decoup.cpp.i"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/decoup.cpp > CMakeFiles/petsc_solver.dir/src/decoup.cpp.i

CMakeFiles/petsc_solver.dir/src/decoup.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/petsc_solver.dir/src/decoup.cpp.s"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/decoup.cpp -o CMakeFiles/petsc_solver.dir/src/decoup.cpp.s

CMakeFiles/petsc_solver.dir/src/preSolver.cpp.o: CMakeFiles/petsc_solver.dir/flags.make
CMakeFiles/petsc_solver.dir/src/preSolver.cpp.o: ../src/preSolver.cpp
CMakeFiles/petsc_solver.dir/src/preSolver.cpp.o: CMakeFiles/petsc_solver.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/petsc_solver.dir/src/preSolver.cpp.o"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/petsc_solver.dir/src/preSolver.cpp.o -MF CMakeFiles/petsc_solver.dir/src/preSolver.cpp.o.d -o CMakeFiles/petsc_solver.dir/src/preSolver.cpp.o -c /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/preSolver.cpp

CMakeFiles/petsc_solver.dir/src/preSolver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/petsc_solver.dir/src/preSolver.cpp.i"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/preSolver.cpp > CMakeFiles/petsc_solver.dir/src/preSolver.cpp.i

CMakeFiles/petsc_solver.dir/src/preSolver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/petsc_solver.dir/src/preSolver.cpp.s"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/preSolver.cpp -o CMakeFiles/petsc_solver.dir/src/preSolver.cpp.s

CMakeFiles/petsc_solver.dir/src/precond.cpp.o: CMakeFiles/petsc_solver.dir/flags.make
CMakeFiles/petsc_solver.dir/src/precond.cpp.o: ../src/precond.cpp
CMakeFiles/petsc_solver.dir/src/precond.cpp.o: CMakeFiles/petsc_solver.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/petsc_solver.dir/src/precond.cpp.o"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/petsc_solver.dir/src/precond.cpp.o -MF CMakeFiles/petsc_solver.dir/src/precond.cpp.o.d -o CMakeFiles/petsc_solver.dir/src/precond.cpp.o -c /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/precond.cpp

CMakeFiles/petsc_solver.dir/src/precond.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/petsc_solver.dir/src/precond.cpp.i"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/precond.cpp > CMakeFiles/petsc_solver.dir/src/precond.cpp.i

CMakeFiles/petsc_solver.dir/src/precond.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/petsc_solver.dir/src/precond.cpp.s"
	/APP/u22/x86/mpi/openmpi-5.0.0-icc-oneapi2023.2-ch4/bin/mpicxx $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/src/precond.cpp -o CMakeFiles/petsc_solver.dir/src/precond.cpp.s

# Object files for target petsc_solver
petsc_solver_OBJECTS = \
"CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.o" \
"CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.o" \
"CMakeFiles/petsc_solver.dir/src/decoup.cpp.o" \
"CMakeFiles/petsc_solver.dir/src/preSolver.cpp.o" \
"CMakeFiles/petsc_solver.dir/src/precond.cpp.o"

# External object files for target petsc_solver
petsc_solver_EXTERNAL_OBJECTS =

libpetsc_solver.a: CMakeFiles/petsc_solver.dir/src/PETSC_FIM_solver.cpp.o
libpetsc_solver.a: CMakeFiles/petsc_solver.dir/src/PETScBSolverPS.cpp.o
libpetsc_solver.a: CMakeFiles/petsc_solver.dir/src/decoup.cpp.o
libpetsc_solver.a: CMakeFiles/petsc_solver.dir/src/preSolver.cpp.o
libpetsc_solver.a: CMakeFiles/petsc_solver.dir/src/precond.cpp.o
libpetsc_solver.a: CMakeFiles/petsc_solver.dir/build.make
libpetsc_solver.a: CMakeFiles/petsc_solver.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library libpetsc_solver.a"
	$(CMAKE_COMMAND) -P CMakeFiles/petsc_solver.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/petsc_solver.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/petsc_solver.dir/build: libpetsc_solver.a
.PHONY : CMakeFiles/petsc_solver.dir/build

CMakeFiles/petsc_solver.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/petsc_solver.dir/cmake_clean.cmake
.PHONY : CMakeFiles/petsc_solver.dir/clean

CMakeFiles/petsc_solver.dir/depend:
	cd /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build /GLOBALFS/sysu_hpcscc_2/zhj/OpenCAEPoro_rep/petsc_solver/build/CMakeFiles/petsc_solver.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/petsc_solver.dir/depend

