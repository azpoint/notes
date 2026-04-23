Here’s your content cleanly converted into a Markdown file format:

````markdown
# Task Scheduling using Cron

## Crontab Management

```bash
# editing the current user’s crontab file 
crontab -e

# listing the current user’s crontab file 
crontab -l

# removing the current user’s crontab file 
crontab -r
````

---

## Common Examples

```bash
# run every minute
* * * * * /path_to_task_to_run.sh

# run every hour at minute 15
15 * * * * /path_to_task_to_run.sh

# run every day at 6:30 PM
30 18 * * * /path_to_task_to_run.sh

# run every Monday at 10:03 PM
3 22 * * 1 /path_to_task_to_run.sh

# run on the 1st of every Month at 6:10 AM
10 6 1 * * /path_to_task_to_run.sh

# run every hour at minute 1, 20 and 35
1,20,35 * * * * /path_to_task_to_run.sh

# run every two hours at minute 10
10 */2 * * * /path_to_task_to_run.sh

# run once a year on the 1st of January at midnight
@yearly     /path_to_task_to_run.sh

# run once a month at midnight on the first day of the month
@monthly    /path_to_task_to_run.sh

# run once a week at midnight on Sunday
@weekly     /path_to_task_to_run.sh

# run once an hour at the beginning of the hour
@hourly     /path_to_task_to_run.sh

# run at boot time
@reboot     /path_to_task_to_run.sh
```

---

## System Cron Directories

All scripts in the following directories will run as `root` at their respective intervals:

```bash
/etc/cron.hourly
/etc/cron.daily
/etc/cron.hourly
/etc/cron.monthly
/etc/cron.weekly
```

