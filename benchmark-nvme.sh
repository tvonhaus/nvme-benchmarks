# Name of disk to be benchmarked
DISK='nvme0n1'

# write test
echo 'Testing Write...'
dd if=/dev/zero of=/dev/$DISK status=progress oflag=direct bs=10M count=1000 2> write-speed.txt
# read test
echo 'Testing Read...'
dd of=/dev/null if=/dev/$DISK status=progress iflag=direct bs=10M count=1000 2> read-speed.txt

#Bidirectional tests, xterm used to run at same time
echo 'Testing Bidirectional...'
# bi-write test
dd if=/dev/zero of=/dev/$DISK status=progress oflag=direct bs=10M count=1000 2> bidirectional-write-speed.txt &
# bi-read test
dd of=/dev/null if=/dev/$DISK status=progress iflag=direct bs=10M count=1000 2> bidirectional-read-speed.txt
