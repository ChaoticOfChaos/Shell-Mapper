@echo off
setlocal enabledelayedexpansion

cls
echo __________Shell_Mapper__________

set /p base_ip="IP Base > "
set /p sider="Sider > "

if %sider% GEQ 32 (
    ping -n 1 %base_ip%
) else (
    if %sider% GEQ 24 (
        for /L %%i in (1,1,254) do (
            set ip=%base_ip%.%%i
            ping -n 1 !ip! > nul
            if !errorlevel! EQU 0 (
                echo !ip! is UP
            )
        )
    ) else (
        if %sider% GEQ 22 (
            for /L %%x in (0,1,3) do (
                for /L %%y in (1,1,254) do (
                    set ip=%base_ip%.%%x.%%y
                    ping -n 1 !ip! > nul
                    if !errorlevel! EQU 0 (
                        echo !ip! is UP
                    )
                )
            )
        ) else (
            if %sider% GEQ 16 (
                for /L %%x in (1,1,254) do (
                    for /L %%y in (1,1,254) do (
                        set ip=%base_ip%.%%x.%%y
                        ping -n 1 !ip! > nul
                        if !errorlevel! EQU 0 (
                            echo !ip! is UP
                        )
                    )
                )
            ) else (
                echo "Error Sider Not Supported :("
            )
        )
    )
)