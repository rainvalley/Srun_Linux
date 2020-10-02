# 食用之前
* 撰写本脚本的初衷是为了可以在路由器上运行Srun，您只需要获取到路由器的Telnet/SSH权限即可运行该脚本
* 本脚本在Bash与Busybox下均测试通过
* 将脚本加入Crontab食用更佳
* 更详细的食用手册可以访问：https://blog.raincorn.top/2020/10/02/srun_login/

# 食用手册
* 下载脚本：`wget https://raw.githubusercontent.com/rainvalley/Srun_Linux/master/srun.sh`，如无法下载请使用`wget https://imgs.raincorn.top/file/srun.sh`
* 运行：`bash srun.sh username passwd`，username与passwd需要修改为您的账号与密码，例如`bash srun.sh 201916660212 123456`
* 我偷懒直接把脚本加入了crontab避免掉线，每分钟登陆一次`*/1 * * * * bash /etc/storage/srun.sh username passwd`

# 其它
* 我的路由器是斐讯K2 PDCN固件，29.9软妹币购于拼爹爹
* 路由器固件一般会在重启后删除缓存，请将脚本储存于`/etc/storage`（PDCN）
* 准备加入下线自动连接，敬请期待
