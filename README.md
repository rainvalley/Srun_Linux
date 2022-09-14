非常感谢[NaHCOx](https://github.com/CHxCOOH)与[chillsoul](https://github.com/chillsoul)的帮助，我只做了非常微薄的贡献。

# 食用之前
* 撰写本脚本的初衷是为了可以在路由器上运行 Srun ，您只需要获取到路由器的 Telnet/SSH 权限即可运行该脚本。
* 本脚本已于 Padavan 和 Openwrt 固件的 Busybox 测试成功。
* 更新使用 wget 替换 curl ,节约闪存。
* 将脚本加入 Crontab 食用更佳。
* 更详细的食用手册可以访问：https://blog.raincorn.top/2020/10/02/srun_login/ 。注意：该网站已归档处理，更新内容将会发布在[此](https://raincorn.top) 。
* 已实现掉线自动登录，检测频率 1 分钟（受限于 crontab）。
* 掉线检测原理：执行脚本时用 wget 访问 generate_204 页面，掉线时会被深澜系统重定向到登录页，对 wget 返回结果判断是否为空即可。

# 食用手册
* 下载脚本：`wget https://github.com/CHxCOOH/Srun_Linux/raw/master/srun.sh`。如无法下载可在其他设备上下载后，使用 sftp 等方式传入，或者考虑使用镜像网站提供的脚本（不会及时更新）：`wget https://imgs.raincorn.top/file/srun.sh`。
* 授予脚本可执行权限：`chmod +x ./srun.sh`。
* 运行：`srun.sh username passwd`，username与passwd需要修改为您的账号与密码，例如 `./srun.sh 201916660212 123456`。
* 使用 `crontab -e` 对计划任务进行编辑来每分钟检测在线状态，如果掉线则自动重新登录，并将 log 写入 `~/login.log`，计划任务的写法如下：

```
* * * * * /root/srun.sh username passwd
# /root/srun.sh自行修改为脚本路径
```

* 如有需要，可自行修改脚本，关闭 log。

# 其它

* 我的路由器是斐讯K2 OpenWrt固件，29.9软妹币购于拼爹爹。
* Padavan路由器固件会在重启后删除缓存，请将脚本储存于`/etc/storage`。
* ~~准备加入下线自动连接，敬请期待~~（已加入）
* 已在 OpenWrt 完成测试，正常情况下约 18h 下线一次。如果频繁掉线，可能是触发了多设备检测。~~等待进一步测试~~
