import subprocess

def check_disk_space():
    """Checks disk space usage and prints relevant details."""
    print("Checking disk space usage...")
    try:
        result = subprocess.run(['df', '-h'], stdout=subprocess.PIPE, universal_newlines=True, check=True)
        lines = result.stdout.splitlines()
        for line in lines:
            if 'Filesystem' in line or '/' in line:
                print(line)
    except subprocess.CalledProcessError as e:
        print(f"Error checking disk space: {e}")
    print("")

def check_inode_usage():
    """Checks inode usage and prints relevant details."""
    print("Checking inode usage...")
    try:
        result = subprocess.run(['df', '-i'], stdout=subprocess.PIPE, universal_newlines=True, check=True)
        lines = result.stdout.splitlines()
        for line in lines:
            if 'Filesystem' in line or '/' in line:
                print(line)
    except subprocess.CalledProcessError as e:
        print(f"Error checking inode usage: {e}")
    print("")

def check_filesystem_errors():
    """Checks for filesystem errors using fsck."""
    print("Checking filesystem for errors...")
    try:
        result = subprocess.run(['df', '-T'], stdout=subprocess.PIPE, universal_newlines=True, check=True)
        lines = result.stdout.splitlines()
        filesystems = [line.split()[0] for line in lines if 'ext' in line]  # Only checking ext-based filesystems
        for fs in filesystems:
            print(f"Checking {fs}...")
            subprocess.run(['sudo', 'fsck', '-n', fs], check=False)  # Do not force script failure if fsck has warnings
            print("")
    except subprocess.CalledProcessError as e:
        print(f"Error checking filesystem: {e}")
    except IndexError:
        print("Filesystem list extraction failed. No filesystems found to check.")
    print("")

def main():
    """Main function to execute disk checks."""
    print("Starting filesystem check...\n")
    check_disk_space()
    check_inode_usage()
    check_filesystem_errors()
    print("Filesystem check completed.")

if __name__ == "__main__":
    main()
