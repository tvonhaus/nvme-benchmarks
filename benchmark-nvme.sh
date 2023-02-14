# Name of disk to be benchmarked
DISK='nvme0n1'

# write test
dd if=/dev/zero of=/dev/$DISK status=progress oflag=direct bs=10M count=1000 >> write-speed.txt
# read test
dd of=/dev/null if=/dev/$DISK status=progress iflag=direct bs=10M count=1000 >> read-speed.txt

#Bidirectional tests, xterm used to run at same time
# bi-write test
xterm -e dd if=/dev/zero of=/dev/$DISK status=progress oflag=direct bs=10M count=1000 >> bidirectional-write-speed.txt &
# bi-read test
xterm -e dd of=/dev/null if=/dev/$DISK status=progress iflag=direct bs=10M count=1000 >> bidirectional-read-speed.txt
