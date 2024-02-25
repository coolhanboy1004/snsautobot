package com.bsbmanagement.snsautobot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ScheduledFuture;


@Service
public class DynamicSchedulerService {

    private final TaskScheduler taskScheduler;
    private Map<String, ScheduledFuture<?>> jobsMap = new HashMap<>();

    @Autowired
    public DynamicSchedulerService(TaskScheduler taskScheduler) {
        this.taskScheduler = taskScheduler;
    }

    public void startScheduledJob(String jobId, Runnable task, String cronExpression) {
        ScheduledFuture<?> scheduledTask = taskScheduler.schedule(task, new CronTrigger(cronExpression));
        jobsMap.put(jobId, scheduledTask);
    }

    public void stopScheduledJob(String jobId) {
        ScheduledFuture<?> scheduledTask = jobsMap.get(jobId);
        if (scheduledTask != null) {
            scheduledTask.cancel(true); // true로 설정하여 실행 중인 작업이 있으면 중지
            jobsMap.remove(jobId); // 작업 목록에서 제거
        }
    }
}