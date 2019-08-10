#! /bin/sh

# The Docker App Container's development entrypoint.
# This is a script used by the project's Docker development environment to
# setup the app containers and databases upon runnning.
set -e

: ${LIB_PATH:="/usr/src"}
: ${LIB_TEMP_PATH:="$LIB_PATH/tmp"}
: ${LIB_SETUP_LOCK:="$LIB_TEMP_PATH/setup.lock"}
: ${LIB_SETUP_WAIT:="5"}

# 1: Define the functions lock and unlock our app containers setup processes:
lock_setup() { mkdir -p $LIB_TEMP_PATH && touch $LIB_SETUP_LOCK; }
unlock_setup() { rm -rf $LIB_SETUP_LOCK; }
wait_setup() { echo "Waiting for app setup to finish..."; sleep $LIB_SETUP_WAIT; }

# 2: 'Unlock' the setup process if the script exits prematurely:
trap unlock_setup HUP INT QUIT KILL TERM EXIT

# 3: Specify a default command, in case it wasn't issued:
if [ -z "$1" ]; then set -- rake spec "$@"; fi

# 4: Run the app setup only if the requested command requires it:
if [ "$1" = "rake" ] || [ "$1" = "guard" ] || [ "$1" = "rspec" ]
then
  # 5: Wait until the setup 'lock' file no longer exists:
  while [ -f $LIB_SETUP_LOCK ]; do wait_setup; done

  # 6: 'Lock' the setup process, to prevent a race condition when the project's
  # app containers will try to install gems and setup the database concurrently:
  lock_setup

  # 7: Check if the gem dependencies are met, or install
  bundle check || bundle install

  # 8: 'Unlock' the setup process:
  unlock_setup
fi

# 9: Execute the given or default command:
exec "$@"
