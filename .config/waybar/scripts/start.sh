#!/bin/bash

export TZ=$(cat /etc/timezone 2>/dev/null || timedatectl show --value --property=Timezone)
exec waybar

