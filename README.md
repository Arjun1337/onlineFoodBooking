# 宅食网上订餐系统
## 项目介绍

前端使用`Bootstrap`+`HTML`+`CSS`+`JS`
使用`AJAX`进行前后端数据交互
后端`SpringMVC`+`MyBatis`+`Spring`
数据库`MySql`
一个网页版的订餐系统，分成三种用户，不同用户不同功能
用户：选择店铺和餐点；对购物车操作；下单；查看订单信息；查看修改个人信息；申请开店铺；查看购买统计图
商家：修改店铺信息；修改菜品信息；修改订单状态；查看销量统计图；申请开店铺；查看修改个人信息
管理员：修改申请店铺的状态

## 项目部署

Eclipse项目,可以用Eclipse直接导入
导入`sql`文件夹中的数据到数据库
修改`jdbc.properties`中的数据库信息
修改`log4j.properties`中的日志文件位置

## 项目功能

**点餐**

用户点餐

![](https://github.com/MuTunCN/onlineFoodBooking/blob/master/ScreenShot/order.gif)

商家处理订单

![](https://github.com/MuTunCN/onlineFoodBooking/blob/master/ScreenShot/deal_order.gif)

用户评价订单

![](https://github.com/MuTunCN/onlineFoodBooking/blob/master/ScreenShot/comment.gif)

**申请开店**

![](https://github.com/MuTunCN/onlineFoodBooking/blob/master/ScreenShot/application_new_store.gif)

**查看统计图**

![](https://github.com/MuTunCN/onlineFoodBooking/blob/master/ScreenShot/statistic.png)

**修改店铺信息**

![](https://github.com/MuTunCN/onlineFoodBooking/blob/master/ScreenShot/modify_store.gif)

## 项目细节