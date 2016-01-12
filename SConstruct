#!/usr/bin/env python

import os
import InstallFiles

PROJECT_PATH = os.environ["HOME"]
#Path for testing.
#PROJECT_PATH = os.path.join(os.environ["HOME"],'not_home')

env = Environment()
InstallFiles.TOOL_INSTALL(env)

env.InstallFiles(PROJECT_PATH, '.vimrc')
env.InstallFiles(PROJECT_PATH, '.zshrc')
env.InstallFiles(PROJECT_PATH, '.gitignore')
env.InstallFiles(os.path.join(PROJECT_PATH,'bin'), 'bin')
env.InstallFiles(os.path.join(PROJECT_PATH,'.oh-my-zsh'), '.oh-my-zsh')

Alias('install',PROJECT_PATH)
