# Linux Task 03 — Forensic User & Log Analysis Workflow

A GitHub-ready workflow for completing and documenting **Linux Task 03**. Follow the activity in your own Linux/Kali lab, capture genuine terminal evidence, and then push the documentation to GitHub with Git Bash.

> **Important:** This repository is a documentation/template package. The commands have not been executed on your machine, and the screenshots/evidence are placeholders until you complete the lab.

## Task objectives

- Create `forensic01` with a home directory, `/bin/bash`, sudo-group membership, and a password.
- Create `/home/forensic01/logs/sys_events.log` with at least 20 lines of mock log entries.
- Filter logs with `grep`, use `less`, redirection, `head`, `tail`, and `cat`.
- Create `confidential.txt`, restrict its permissions, change its owner to `root`, and observe access as `forensic01`.
- Create `guest1` and `guest2`, add `guest1` to the sudo group, and remove `guest2` including its home directory.
- Record exact commands, terminal screenshots, and short explanations of `grep`, `chown`, and `usermod`.

## Repository layout

```text
Linux-Task-03-Forensic-User-Log-Analysis/
├── README.md
├── .gitignore
├── LICENSE
├── COMMANDS.md
├── commands_used.txt
├── EVIDENCE_CHECKLIST.md
├── docs/
│   ├── README.md
│   └── command_explanations.md
├── scripts/
│   ├── README.md
│   └── create_mock_logs.sh
├── evidence/
│   ├── README.md
│   └── findings_template.md
├── screenshots/
│   ├── README.md
│   └── .gitkeep
└── backup/
    └── README.md
```

## Safety and environment notes

- Perform account-management commands only in a Linux virtual machine or system you are authorized to administer.
- `sudo`, `useradd`, `usermod`, `chown`, and `userdel` change system state. Read each command before running it.
- If your distribution uses a different administrative group, verify it first. The task specifically asks for the `sudo` group.
- `userdel -r guest2` permanently removes that account and its home directory. Do not run it against any account containing needed data.
- Do not claim a command succeeded unless you ran it and checked the output.

## Suggested workflow

1. Read `COMMANDS.md` and `EVIDENCE_CHECKLIST.md`.
2. Open a terminal in your Linux lab VM and perform Part 1 through Part 4 of the task.
3. Save the exact commands you actually used in `commands_used.txt` (remove or correct any commands you did not run).
4. Capture your own screenshots and place them in `screenshots/`.
5. Complete `evidence/findings_template.md` and `docs/command_explanations.md`.
6. Review that no passwords, tokens, or unrelated personal information appear in evidence.
7. From Git Bash on Windows, commit and push this folder to your GitHub repository.

## Evidence status

The `screenshots/` folder intentionally contains a placeholder. Replace it with genuine screenshots from your completed lab. Do not present sample logs or templates as proof that the activity was completed.
