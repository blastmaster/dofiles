# /etc/zsh/zshenv: system-wide .zshenv file for zsh(1).
#
# This file is sourced on all invocations of the shell.
# If the -f flag is present or if the NO_RCS option is
# set within this file, all other initialization files
# are skipped.
#
# This file should contain commands to set the command
# search path, plus other important environment variables.
# This file should not contain commands that produce
# output or assume the shell is attached to a tty.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

if [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]]
then
	export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/games:"
fi

# Enable lmod
if [ -d /etc/profile.d ]; then
  setopt no_nomatch
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  setopt nomatch
  done
fi

# lmod: Enable user defined modules and load default environment.
if [ -d "$HOME/modulefiles" ]; then
    module use "$HOME/modulefiles"
    module restore 2>/dev/null
fi
