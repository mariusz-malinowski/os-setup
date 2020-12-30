#!/bin/sh

set -x

FF_PREFS_PATH=$(find ~/.mozilla/ -name prefs.js)

if [ -n $FF_PREFS_PATH ]; then
  FF_S1_O="user_pref(\"layers.acceleration.force-enabled\", false);"
  FF_S1_N="user_pref(\"layers.acceleration.force-enabled\", true);"
  FF_S2_O="user_pref(\"ui.context_menus.after_mouseup\", false);"
  FF_S2_N="user_pref(\"ui.context_menus.after_mouseup\", true);"

  grep -q "$FF_S1_O" $FF_PREFS_PATH && sed -i "s/${FF_S1_O}/${FF_S1_N}/" $FF_PREFS_PATH || echo "$FF_S1_N" >> $FF_PREFS_PATH
  grep -q "$FF_S1_O" $FF_PREFS_PATH && sed -i "s/${FF_S2_O}/${FF_S2_N}/" $FF_PREFS_PATH || echo "$FF_S2_N" >> $FF_PREFS_PATH
fi

