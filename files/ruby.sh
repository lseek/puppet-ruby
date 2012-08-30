# Ruby initialization script (sh)

# Fedora is notorious for being late with updates to ruby versions.
# This is a modified version of the qt script to apend the bin paths
# to the PATH and set the lib/include directories.

# I used ruby-build https://github.com/sstephenson/ruby-build to install
# the rubies to /usr/local/ruby-xxx and used alternatives to install one
# as the current one.  This script is meant to append the alternative
# maintained path (/usr/local/ruby/bin) to the PATH variable so that the
# right version of ruby and any installed gems' commands are correctly
# found. With this, the fedora ruby packages are no longer needed on the
# system

if [ -z "${RUBYDIR}" ]; then

    if [ -d "/usr/local/ruby" ]; then

        RUBYDIR="/usr/local/ruby"

        if ! echo ${PATH} | /bin/grep -q $RUBYDIR/bin ; then
            PATH=$RUBYDIR/bin:${PATH}
        fi

        RUBYINC="$RUBYDIR/include"
        RUBYLIB="$RUBYDIR/lib"

        export RUBYDIR RUBYINC RUBYLIB PATH

    fi

fi
