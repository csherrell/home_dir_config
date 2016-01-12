#!/usr/bin/env python

import os
import os.path

# Project can be "bin", "lib", or "python"
PROJECT_TYPE=''

# Project Languag C, Python, Shell
PROJECT_LANG=''

source_dir = "."
SOURCEFILES_SCRIPTS_PYTHON = [os.path.join(source_dir, '.vimrc'),
                              os.path.join(source_dir, '.gitignore'),
                              os.path.join(source_dir, '.oh-my-zsh'),
                              os.path.join(source_dir, '.bashrc'),
                              os.path.join(source_dir, '.zshrc')]

#PROJECT_PATH = os.path.join(os.environ["PROJECT_DIR"], os.environ["PROJECT_ENV"])
PROJECT_PATH = './not_home/'

docs_dir = "docs"
DOCFILES_PYTHON = [os.path.join(docs_dir, "file_ops.rst")]
PROJECT_DOC_DIR = os.path.join(PROJECT_PATH, PROJECT_LANG, "docs")

env = Environment(ENV={"PYTHONPATH":os.environ["PYTHONPATH"]})

try:
    umask = os.umask(002)
    print 'setting umask to 002 (was 0%o)' % umask
except OSError:     # ignore on systems that don't support umask
    pass

def ChmodTargets(env = None, **kw):
    Execute(Chmod(kw.items()[0][1], 0775))
    return

ChmodTargets(CHMOD = SOURCEFILES_SCRIPTS_PYTHON)

for f in SOURCEFILES_SCRIPTS_PYTHON:
    print f
    Install(os.path.join(PROJECT_PATH, PROJECT_TYPE, PROJECT_LANG, os.path.dirname(f)[len(source_dir)+1:]), f)

Alias('install',PROJECT_PATH)

#if 'docs' in BUILD_TARGETS or 'all' in BUILD_TARGETS:
#    Execute(Mkdir(PROJECT_DOC_DIR))
#    for f in DOCFILES_PYTHON:
#        Execute(Mkdir(os.path.join(PROJECT_DOC_DIR, os.path.dirname(f)[len(docs_dir)+1:])))
#        Execute(Copy(os.path.join(PROJECT_DOC_DIR, os.path.dirname(f)[len(docs_dir)+1:]), f))
#        sphinx_build = ('sphinx-build -b html -d ' +
#                       '%s %s %s' % (os.path.join(PROJECT_DOC_DIR, 'doctrees'),
#                                     PROJECT_DOC_DIR,
#                                     os.path.join(PROJECT_DOC_DIR, 'html')))
#        #Alias('docs', env.Command("dummy_docs_target", "", "sphinx-build -b html -d /wmd/software/dev/python/docs/d
#        Alias('docs', env.Command("dummy_docs_target", "", sphinx_build))

if 'test' in BUILD_TARGETS or 'all' in BUILD_TARGETS:
    Alias('test', env.Command('dummy_test_target', '', 'cd tests; python test.py; cd ..'))

Alias('all',['install', 'docs', 'test'])
