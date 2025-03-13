import os

user_profile_directory = os.environ.get("USERPROFILE")
desktop_directory = os.path.join(user_profile_directory, "Desktop")

with open(os.path.join(desktop_directory, "MUST_READ.txt"), "w") as f:
    f.write("Your PC could have been compromised.\n\nI utilized a PI Pico to emulate a keyboard and download a payload I ran to create this file.\n\nDon't plug random USBs into your computer.\n\nThis file is located on your desktop if you wish to delete it.")