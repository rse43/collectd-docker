Hostname "{{ HOSTNAME }}"

FQDNLookup false
Interval 10
Timeout 2
ReadThreads 5
WriteThreads 5
MaxPacketSize 1452

Include "/etc/collectd/collectd.d/*.conf"