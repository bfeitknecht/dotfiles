this serves as a standardized setup project to replicate with consistency the entire system



```bash
# enable touch id for sudo
sed -e 's/^#auth/auth/' /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
```
