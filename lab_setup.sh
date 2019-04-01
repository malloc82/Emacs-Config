#!/bin/bash

LOCAL_USER=$(whoami)
if [[ -d "/c/Users/caiz.ECS" ]]; then
    LOCAL_HOME="/c/Users/${LOCAL_USER}.ECS"
else
    LOCAL_HOME="/c/Users/${LOCAL_USER}"
fi

# rm -rf ${LOCAL_HOME}/AppData/Roaming/.emacs.d/
# cp -rf /h/.emacs.d ${LOCAL_HOME}/AppData/Roaming/.

echo "LOCAL_HOME=${LOCAL_HOME}"
git checkout-index -a -f --prefix="${LOCAL_HOME}/AppData/Roaming/.emacs.d/"
