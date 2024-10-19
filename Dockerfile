FROM arm32v7/alpine

# Install packages
RUN apk update && apk add hostapd iw dhcp vim iptables

# Configure Hostapd
ADD confs/hostapd_wpa2.conf /etc/hostapd/hostapd.conf

# Configure DHCPD
ADD confs/dhcpd.conf /etc/dhcp/dhcpd.conf
RUN touch /var/lib/dhcp/dhcpd.leases

# Configure networking
ADD confs/interfaces /etc/network/interfaces
ADD confs/iptables.sh /iptables.sh

# Copy and execute init file
ADD confs/start.sh /start.sh
CMD ["/bin/sh", "/start.sh"]
