#!/system/bin/sh

target=`getprop ro.board.platform`

case "$target" in
    "msm8998")
    chmod 0644 /sys/devices/system/cpu/cpu0/online
    chmod 0644 /sys/devices/system/cpu/cpu1/online
    chmod 0644 /sys/devices/system/cpu/cpu2/online
    chmod 0644 /sys/devices/system/cpu/cpu3/online
    chmod 0644 /sys/devices/system/cpu/cpu4/online
    chmod 0644 /sys/devices/system/cpu/cpu5/online
    chmod 0644 /sys/devices/system/cpu/cpu6/online
    chmod 0644 /sys/devices/system/cpu/cpu7/online

	#echo 2 > /sys/devices/system/cpu/cpu4/core_ctl/min_cpus
	#echo 60 > /sys/devices/system/cpu/cpu4/core_ctl/busy_up_thres
	#echo 30 > /sys/devices/system/cpu/cpu4/core_ctl/busy_down_thres
	#echo 100 > /sys/devices/system/cpu/cpu4/core_ctl/offline_delay_ms
	#echo 1 > /sys/devices/system/cpu/cpu4/core_ctl/is_big_cluster
	#echo 4 > /sys/devices/system/cpu/cpu4/core_ctl/task_thres

    # Enable input boost configuration
    echo "0:1324800" > /sys/module/cpu_boost/parameters/input_boost_freq
    echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
    echo "0:0 1:0 2:0 3:0 4:2208000 5:0 6:0 7:0" > /sys/module/cpu_boost/parameters/powerkey_input_boost_freq
    echo 400 > /sys/module/cpu_boost/parameters/powerkey_input_boost_ms

	echo N > /sys/module/lpm_levels/parameters/sleep_disabled

    echo 0 > /dev/cpuset/background/cpus
    echo 0-3 > /dev/cpuset/system-background/cpus
    echo 4-7 > /dev/cpuset/foreground/boost/cpus
    echo 0-2,4-7 > /dev/cpuset/foreground/cpus
    echo 0 > /proc/sys/kernel/sched_boost

    echo 1 > /sys/devices/system/cpu/cpu4/online
    echo 1 > /sys/devices/system/cpu/cpu5/online
    echo 1 > /sys/devices/system/cpu/cpu6/online
    echo 1 > /sys/devices/system/cpu/cpu7/online

	#echo 0 > /sys/devices/system/cpu/cpu4/core_ctl/min_cpus
	#echo 4 > /sys/devices/system/cpu/cpu4/core_ctl/max_cpus
	#echo 95 > /sys/devices/system/cpu/cpu4/core_ctl/busy_up_thres
	#echo 60 > /sys/devices/system/cpu/cpu4/core_ctl/busy_down_thres

	echo 5 > /proc/sys/vm/dirty_background_ratio
	echo 50 > /proc/sys/vm/overcommit_ratio
	echo 100 > /proc/sys/vm/swap_ratio
	echo 100 > /proc/sys/vm/vfs_cache_pressure
	echo 20 > /proc/sys/vm/dirty_ratio
    echo 3 > /proc/sys/vm/page-cluster
    echo 2000 > /proc/sys/vm/dirty_expire_centisecs
    echo 5000 > /proc/sys/vm/dirty_writeback_centisecs

    echo 512 > /sys/block/sda/queue/read_ahead_kb
    echo 0 > /sys/block/sda/queue/iostats

    echo "0:1324800" > /sys/module/cpu_boost/parameters/input_boost_freq
    echo 40 > /sys/module/cpu_boost/parameters/input_boost_ms
    echo "0:0 1:0 2:0 3:0 4:2208000 5:0 6:0 7:0" > /sys/module/cpu_boost/parameters/powerkey_input_boost_freq
    echo "40" > /sys/module/cpu_boost/parameters/powerkey_input_boost_ms
    echo 'Y' > /sys/module/cpu_boost/parameters/sched_boost_on_powerkey_input
    #echo 'Y' > /sys/module/cpu_boost/parameters/sched_boost_on_input

    echo 0 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk

    #stop woodpeckerd
    #stop debuggerd
    #stop debuggerd64
    #stop atfwd
    #stop perfd
    #stop logd
    #echo 0 > /sys/zte_power_debug/switch
    #echo N > /sys/kernel/debug/debug_enabled
    ;;
esac
