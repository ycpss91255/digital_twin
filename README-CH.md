# 第一次需要設置

1. 新增 USB 規則
   1. 確認 De0-nano UART 裝置序列號(Serial)為 `0002`

        - 相機類，`video*`，基本上這是筆電內建相機
        - USB 類，`ttyUSB*`，例如：LaDAR、USB 相機...
        - 單晶片類，`ttyACM*`，例如：Arduino...
        - 依據上面類型替換`<drive_type>`

            ```bash
            $ ls /dev/<drive_type>
            # ex: ls/dev/ttyUSB*
            ```

        - 察看 De0-nano UART 裝置的序列埠(Serial)

            ```bash
            # 用之前找到的De0-nano UART 的序列埠替換<drive_type>
            $ udevadm info -a -n /dev/<drive_type> | grep '{serial}' | head -n1
            ```

        - 如果序列號(Serial)不是 `0002`，需要尋找 **CP210xSetIDs.exe** 軟體，通常會在 **CP210x_LegacyUtilities.zip** 裏面，接者到 `Windows` 進行相關設定

   2. 新增 USB 規則

        ```bash
            # <path to usb_rule> 替換為到工作區usb_rule的路徑
            $ ./<path to usb_rule>/create_rule.sh
        ```

<!--
2. 下載 Git 子模組(submodule)

    - powerlevel10k(zsh 主題)

    ```bash
        # 初始化子模組
        $ git submodule init
        # 更新子模組
        $ git submodule update
    ``` -->
