sudo su
mkdir /var/repo
cd /var/repo
yum install httpd
systemctl start httpd
systemctl enable httpd
yum install createrepo
yum install yum-plugin-downloadonly
yum install -y https://centos7.iuscommunity.org/ius-release.rpm
yum install --downloadonly --downloaddir=/var/repo python36
yum install --downloadonly --downloaddir=/var/repo python36u-pip
createrepo /var/repo/
ln -s /var/repo /var/www/html/repo
yum install policycoreutils-python
semanage fcontext -a -t httpd_sys_content_t "/var/repo(/.*)?" && restorecon -rv /var/repo
