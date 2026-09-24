# Set perf capabilities if needed
if [ $(whoami) = "wsl" ]; then
        # WSL does not have a specific perf version, hence it is not stored under the `uname -r` directory
        base_perf=$(ls /usr/lib/linux-tools/**/perf)
else
        base_perf=/usr/lib/linux-tools/$(uname -r)/perf
fi

if [ -f $base_perf ]; then
        real_perf=$(readlink -f $base_perf)
        [[ $(getcap $real_perf) != *"perfmon"* ]] && (
                echo "Need to set perf capabilities with sudo" &&
                        sudo setcap 'cap_ipc_lock,cap_sys_ptrace,cap_sys_admin,cap_syslog,cap_perfmon=ep' $real_perf &&
                        echo "Perf capabilities are set" || echo "Failed to set perf capabilities, perf might not be available"
        )
else
        echo "Could not find perf path"
fi

# ubuntu portable specific config
if [ $(whoami) = "latitude" ]; then
        # >>> JVM installed by coursier >>>
        export JAVA_HOME="/home/latitude/.cache/coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.28%252B6/OpenJDK11U-jdk_x64_linux_hotspot_11.0.28_6.tar.gz/jdk-11.0.28+6"
        export PATH="$PATH:/home/latitude/.cache/coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.28%252B6/OpenJDK11U-jdk_x64_linux_hotspot_11.0.28_6.tar.gz/jdk-11.0.28+6/bin"
        # <<< JVM installed by coursier <<<

        # >>> coursier install directory >>>
        export PATH="$PATH:/home/latitude/.local/share/coursier/bin"
        # <<< coursier install directory <<<
fi

# WSL only settings
if [ $(whoami) = "wsl" ]; then

        # >>> JVM installed by coursier >>>
        export JAVA_HOME="/home/wsl/.cache/coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.28%252B6/OpenJDK11U-jdk_x64_linux_hotspot_11.0.28_6.tar.gz/jdk-11.0.28+6"
        export PATH="$PATH:/home/wsl/.cache/coursier/arc/https/github.com/adoptium/temurin11-binaries/releases/download/jdk-11.0.28%252B6/OpenJDK11U-jdk_x64_linux_hotspot_11.0.28_6.tar.gz/jdk-11.0.28+6/bin"
        # <<< JVM installed by coursier <<<

        # >>> coursier install directory >>>
        export PATH="$PATH:/home/wsl/.local/share/coursier/bin"
        # <<< coursier install directory <<<
fi
