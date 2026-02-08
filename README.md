# 🐧 Linux Bash Automation Toolkit

A beginner-to-intermediate DevOps project demonstrating **Linux system monitoring, user management, and automated maintenance** using Bash scripts.  

This project showcases practical skills for DevOps and Linux administration, including:

- Bash scripting  
- Cron jobs automation  
- System health monitoring (CPU, memory, disk)  
- User and group management  
- Log file maintenance  

---


## ⚙️ Features

### 🖥️ 1. Server Health Monitoring
- Logs CPU, memory, and disk usage every 5 minutes  
- Alerts if usage exceeds configured thresholds  
- Logs are saved in `logs/health.log`  

---

### 👤 2. User Management
- Create new users  
- Assign them to specific groups  

**Example usage:**
```bash
./scripts/user_manager.sh mariam devops
```
---

### 🧹 3. Disk Cleanup

Deletes .log files older than 7 days

Can be safely run on project logs folder

**Example usage:**
```bash
./scripts/disk_cleanup.sh
```
---
### ⏰ 4. Cron Job Automation

Automate health_check.sh every 5 minutes.

Example cron job (cron/health_cron.txt):
```bash
*/5 * * * * /home/mariam/Bash/linux-bash-automation/scripts/health_check.sh
```
---
## 🚀 How to Use

1️⃣ **Clone the repository**
```bash
git clone https://github.com/MariammAbdelkader/linux-bash-automation.git
cd linux-bash-automation
```
2️⃣ **Make scripts executable**
```bash
chmod +x scripts/*.sh
```
3️⃣ **Run scripts manually**
```bash
./scripts/health_check.sh
./scripts/user_manager.sh <username> <group>
./scripts/disk_cleanup.sh
```
4️⃣**Configure thresholds**

Edit config/thresholds.conf:
```bash
CPU_THRESHOLD=80
MEM_THRESHOLD=75
DISK_THRESHOLD=85
```

5️⃣**Setup cron job**
```bash
crontab cron/health_cron.txt
```
📊 Example Output

```bash
[2026-02-06 19:30:00] CPU:12% MEM:45% DISK:60%
⚠️ ALERT: CPU usage exceeded threshold at 2026-02-06 19:30:00
```

## ✅ Skills Demonstrated

- Bash scripting & functions
- Linux system commands (top, free, df, find, useradd, groupadd)
- Cron job automation
- Log management
- Configurable scripts
  

## 📌 Notes

- Recommended to test disk_cleanup.sh in a safe folder, not /var/log directly
- Adjust thresholds in config/thresholds.conf as needed
- Works on Ubuntu / Debian-based Linux systems


