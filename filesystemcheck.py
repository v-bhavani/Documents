import subprocess
 
def check_disk_space():
    print("Checking disk space usage...")
    result = subprocess.run(['df', '-h'], stdout=subprocess.PIPE, text=True)
    lines = result.stdout.splitlines()
    for line in lines:
        if 'Filesystem' in line or '/' in line:
            print(line)
    print("")
 
def check_inode_usage():
    print("Checking inode usage...")
    result = subprocess.run(['df', '-i'], stdout=subprocess.PIPE, text=True)
    lines = result.stdout.splitlines()
    for line in lines:
        if 'Filesystem' in line or '/' in line:
            print(line)
    print("")
 
def check_filesystem_errors():
    print("Checking filesystem for errors...")
    result = subprocess.run(['df', '-T'], stdout=subprocess.PIPE, text=True)
    lines = result.stdout.splitlines()
    filesystems = [line.split()[0] for line in lines if 'ext' in line]
    for fs in filesystems:
        print(f"Checking {fs}...")
        subprocess.run(['sudo', 'fsck', '-n', fs])
        print("")
 
def main():
    print("Starting filesystem check...")
    check_disk_space()
    check_inode_usage()
    check_filesystem_errors()
    print("Filesystem check completed.")
 
if __name__ == "__main__":
    main()
