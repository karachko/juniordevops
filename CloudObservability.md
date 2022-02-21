## task 1
### Monitoring EC2


![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-21%20at%2012.41.50.png)

### To create an alarm using the Amazon EC2 console

Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/.

In the navigation pane, choose Instances.

Select the instance and choose Actions, Monitor and troubleshoot, Manage CloudWatch alarms.

On the Manage CloudWatch alarms detail page, under Add or edit alarm, select Create an alarm.

For Alarm notification, choose whether to turn the toggle on or off to configure Amazon Simple Notification Service (Amazon SNS) notifications. Enter an existing Amazon SNS topic or enter a name to create a new topic.

For Alarm action, choose whether to turn the toggle on or off to specify an action to take when the alarm is triggered. Select an action from the dropdown.

For Alarm thresholds, select the metric and criteria for the alarm. For example, you can leave the default settings for Group samples by (Average) and Type of data to sample (CPU utilization). For Alarm when, choose >= and enter 0.80. For Consecutive period, enter 1. For Period, select 5 minutes.

(Optional) For Sample metric data, choose Add to dashboard.

Choose Create.



### To  create an alarm to stop an idle instance using the Amazon CloudWatch console

Open the CloudWatch console at https://console.aws.amazon.com/cloudwatch/.

In the navigation pane, choose Alarms, Create Alarm.

For the Select Metric step, do the following:

Under EC2 Metrics, choose Per-Instance Metrics.

Select the row with the instance and the CPUUtilization metric.

For the statistic, choose Average.

Choose a period (for example, 1 Hour).

Choose Next.

For the Define Alarm step, do the following:

Under Alarm Threshold, type a unique name for the alarm (for example, Stop EC2 instance) and a description of the alarm (for example, Stop EC2 instance when CPU is idle too long). Alarm names must contain only ASCII characters.

Under Whenever, for is, choose < and type 10. For for, type 24 consecutive periods.

A graphical representation of the threshold is shown under Alarm Preview.

Under Notification, for Send notification to, choose an existing SNS topic or create a new one.

To create an SNS topic, choose New list. For Send notification to, type a name for the SNS topic (for example, Stop_EC2_Instance). For Email list, type a comma-separated list of email addresses to be notified when the alarm changes to the ALARM state. Each email address is sent a topic subscription confirmation email. You must confirm the subscription before notifications can be sent to an email address.

Choose EC2 Action.

For Whenever this alarm, choose State is ALARM. For Take this action, choose Stop this instance.

Choose Create Alarm.




![picture 1-1](https://github.com/karachko/juniordevops/blob/main/Screenshot%202022-02-21%20at%2012.41.50.png)
