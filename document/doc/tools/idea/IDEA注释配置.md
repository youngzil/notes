通过创建代码模板的方式
Preferences | Editor | Live Templates中
1、创建Template Group，MyTemplateGroup
2、创建Live Template，2个
1、类注释
cc 、class comment template
/**
 * $CLASS_NAME$
 * @Description:
 *
 * @author：youngzil@163.com
 * @Date $DATE$ $TIME$
 * @since 1.0.0
 */
 className()、date()、date()

 2、方法注释
 mc 、 method comment template
 /**
 * $METHOD_NAME$
 * 
 * @Description: 
 * 
 * @param：$METHOD_PARAM$
 * 
 * @author：youngzil@163.com
 * @Date $DATE$ $TIME$
 * @since 1.0.0
 */
 methodName()、methodParameters()、methodParameters()


在Preferences | Editor | File and Code Templates 中点击右侧的Includes中找到File Header，在里面输入如下

/**
 * @ProjectName ${PROJECT_NAME}
 * @ClassName ${NAME}.java
 * @version 1.0.0
 * @Description TODO
 * @author youngzil@163.com
 * @createTime ${DATE} ${TIME}
 * @Copyright yangzl Corporation
 */

*注：
${PACKAGE_NAME} :  包路径
${NAME} :  文件名
${USER} ： 主机用户名
${DATE} ： 系统当前日期，格式为：yyyy/mm/dd
${TIME} ： 系统当前时间 格式为：HH:mm
${YEAR}：当前年
${MONTH}：当前月
${MONTH_NAME_SHORT} ： 月份名称简写；如：Jan, Feb, etc.
${MONTH_NAME_FULL} ： 月份名称全拼；如：January, February.
${DAY} ：当前天
${DAY_NAME_SHORT} ：星期简写；如：Mon, Tue, etc.
${DAY_NAME_FULL}：星期全写；如：Mon, Tue, etc.
${HOUR} ： 当前小时
${MINUTE} ：当前分钟
${PROJECT_NAME} ： 项目名称





