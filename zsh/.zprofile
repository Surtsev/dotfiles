if [ -z "$DBUS_SESSION_BUS_ADDRESS" ] && [ -z "$WAYLAND_DISPLAY" ]; then
    eval `dbus-launch --sh-syntax --exit-with-session`
    export DBUS_SESSION_BUS_ADDRESS
fi

# Запуск dwl при автовходе на tty1
if [ -z "${WAYLAND_DISPLAY}" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec startdwl
fi
