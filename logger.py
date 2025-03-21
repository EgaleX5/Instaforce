import datetime
import json
import os

# ✅ Log File Path
LOG_FILE = "logs.txt"

# ✅ Log Function - Attack results & special responses save करता है
def save_log(username, password, status, response=None):
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    log_entry = f"[{timestamp}] Username: {username} | Password: {password} | Status: {status}\n"
    
    # अगर कोई special response मिला तो उसे JSON format में store करें
    if response:
        log_entry += f"🔴 Special Response: {json.dumps(response, indent=2)}\n"

    # Log file में entry save करें
    with open(LOG_FILE, "a") as log_file:
        log_file.write(log_entry + "\n")

    print(f"📄 Log Saved: {username} - {password} ({status})")


# ✅ Log File Reset करने का Function (अगर ज़रूरत हो)
def reset_logs():
    if os.path.exists(LOG_FILE):
        os.remove(LOG_FILE)
        print("🗑️ Old logs deleted!")
    else:
        print("ℹ️ No logs found to delete.")
