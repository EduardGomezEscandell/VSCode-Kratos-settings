# VSCode Settings for KratosMultiphysics

These are the settings I use for my Kratos workspace.

## How to setup
Clone this repository, and copy its contents to `Kratos/.vscode`. This directory is in Kratos' `.gitignore` so it won't interfere.
You may need to restart Visual Studio Code for `tasks.json` to be properly parsed.

On windows, you may need to change `"BOOST_ROOT"        : "${workspaceFolder}/../boost_1_77_0"` to the location of your boost source.

## How to use
You can compile anyime with `Ctrl`+`Shift`+`B`. A list will appear with build options, select the one you want and hit enter. KratosMultiphysics should compile without any issues.