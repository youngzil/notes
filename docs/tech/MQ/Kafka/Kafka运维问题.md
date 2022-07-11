# Kafka运维问题


---------------------------------------------------------------------------------------------------------------------
## 客户端的Consumer加入consumer group失败，因为未验证的member id

Join group failed with org.apache.kafka.common.errors.MemberIdRequiredException: The group member needs to have a valid member id before actually entering a consumer group

会重新尝试的，只是打印了一下日志，

详情查看kafka 的KIP（ Kafka Improvement Proposals）  
[KIP-394: Require member.id for initial join group request](https://cwiki.apache.org/confluence/display/KAFKA/KIP-394%3A+Require+member.id+for+initial+join+group+request)


---------------------------------------------------------------------------------------------------------------------
## consumer poll timeout has expired

consumer poll timeout has expired. This means the time between subsequent calls to poll() was longer than the configured max.poll.interval.ms, which typically implies that the poll loop is spending too much time processing messages. You can address this either by increasing max.poll.interval.ms or by reducing the maximum size of batches returned in poll() with max.poll.records.


二次poll的时间间隔超过了max.poll.interval.ms设置

这个报错也只跟两次poll的时间间隔是不是大于max.poll.interval.ms有关，而且这个告警也是会自动恢复的

当你的两次poll时间小于配置后，也会自动恢复


---------------------------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------------------------





---------------------------------------------------------------------------------------------------------------------





---------------------------------------------------------------------------------------------------------------------





---------------------------------------------------------------------------------------------------------------------





---------------------------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------------------------








