Here’s your content **cleaned, structured, and consistent in Markdown**, with minor corrections and better grouping:

---

# 🧾 Bash History

## 📜 Viewing & Managing History

```bash
history                  # Show command history

history -d 100           # Delete entry number 100
history -c               # Clear entire history
```

---

## 📊 History Size & Storage

```bash
echo $HISTFILESIZE       # Max commands stored in ~/.bash_history
echo $HISTSIZE           # Max commands stored in memory (current session)
```

---

## 🔁 Reusing Commands

```bash
!!                       # Run last command

!20                      # Run command number 20
!-10                     # Run command from 10 commands ago

!abc                     # Run last command starting with "abc"
!abc:p                   # Print (do not execute) last command starting with "abc"
```

---

## 🔍 Searching History

```bash
CTRL + R                 # Reverse search through history
```

---

## 🕒 Timestamps in History

```bash
HISTTIMEFORMAT="%d/%m/%y %T"   # Enable timestamps for history
```

### Make it persistent

```bash
echo 'HISTTIMEFORMAT="%d/%m/%y %T"' >> ~/.bashrc
```

---

## 🧠 Notes & Tips

* Changes to `.bashrc` require reload:

```bash
source ~/.bashrc
```

* History is stored in:

```bash
~/.bash_history
```

* To immediately write current session history:

```bash
history -w
```

* To append (instead of overwrite):

```bash
history -a
```

---

If you want, I can extend this into a **“history power-user” guide** (including `HISTCONTROL`, deduplication, ignoring commands, multi-session sync), which is where sysadmins get a lot more leverage.
