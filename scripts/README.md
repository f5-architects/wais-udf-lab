# Lab Guide Update Scripts

## Files

| File | Purpose |
|---|---|
| `update-lab-guide.sh` | Pull latest from git, rsync `docs/` to nginx web root |
| `wais-lab-guide-update.service` | systemd one-shot service that runs the script on boot |

## One-time setup on the Ubuntu VM

Run these steps once after the Blueprint image is provisioned.

**1. Clone the repo (if not already present)**

```bash
sudo git clone https://github.com/f5-architects/wais-lab-guide.git /opt/wais-lab-guide
```

**2. Make the script executable**

```bash
sudo chmod +x /opt/wais-lab-guide/scripts/update-lab-guide.sh
```

**3. Install the systemd service**

```bash
sudo cp /opt/wais-lab-guide/scripts/wais-lab-guide-update.service \
        /etc/systemd/system/wais-lab-guide-update.service
sudo systemctl daemon-reload
sudo systemctl enable wais-lab-guide-update.service
```

**4. Run it once now to populate the web root**

```bash
sudo systemctl start wais-lab-guide-update.service
systemctl status wais-lab-guide-update.service
```

**5. Confirm nginx is serving the content**

```bash
curl -s http://localhost/ | grep -i wais
```

## Manual update

At any time:

```bash
sudo /opt/wais-lab-guide/scripts/update-lab-guide.sh
```

Log file: `/var/log/wais-lab-guide-update.log`

## Paths

| Variable | Default | Notes |
|---|---|---|
| `REPO_DIR` | `/opt/wais-lab-guide` | Edit in `update-lab-guide.sh` if different |
| `WEB_ROOT` | `/srv/wais-lab-guide` | Must match your nginx `root` directive |
| `BRANCH` | `main` | Change if deploying from a different branch |
