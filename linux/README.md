# Linux materials

### Contents

**Aliases**

My aliases in `00-aliases.sh` file.

Usage:
```bash
wget https://raw.githubusercontent.com/NAndras95/linux/main/00-aliases.sh -P /etc/profile.d/
# then open a new session
```

**deb10-base**

Installs some predefinied packages.

Usage:
```bash
wget https://raw.githubusercontent.com/NAndras95/linux/main/deb10-base.sh -P /tmp/ && chmod +x /tmp/deb10-base.sh && bash /tmp/deb10-base.sh
```
There is two argument to use `dev` and `ansible`.
```bash
wget https://raw.githubusercontent.com/NAndras95/linux/main/deb10-base.sh -P /tmp/ && chmod +x /tmp/deb10-base.sh && bash /tmp/deb10-base.sh ansible
```
```bash
wget https://raw.githubusercontent.com/NAndras95/linux/main/deb10-base.sh -P /tmp/ && chmod +x /tmp/deb10-base.sh && bash /tmp/deb10-base.sh dev
```
**mysql-backup**

Edit the username and the password before you use the script.

Usage:
```
./mysql-backup.sh
```

**History timestamp**
```bash
echo 'HISTTIMEFORMAT="%F %T "' >> ~/.bashrc
source ~/.bashrc
```
