# Evidence Checklist

Capture screenshots from your own Linux terminal after running the task. Keep text readable and include the command plus relevant output.

- [ ] `01_user_setup.png` — creation/login verification; show `whoami`, `id`, and `getent passwd forensic01`.
- [ ] `02_mock_log_file.png` — show `wc -l sys_events.log` with at least 20 lines and a sample of the log.
- [ ] `03_grep_error_results.png` — output from `grep "ERROR" sys_events.log`.
- [ ] `04_grep_user_root_results.png` — output from `grep -E "root|user01" sys_events.log`.
- [ ] `05_redirection_head_tail.png` — show report creation and `head -n 5` / `tail -n 5`.
- [ ] `06_file_permissions.png` — show `ls -l confidential.txt` after `chmod 600`.
- [ ] `07_root_ownership_access_test.png` — show `chown` result and actual read/write access test as `forensic01`.
- [ ] `08_user_management.png` — show `id guest1` and confirmation that `guest2` was removed.

## Screenshot hygiene

- Do not include passwords, password prompts with typed secrets, API keys, tokens, or unrelated personal information.
- Do not fabricate terminal output or edit screenshots to make a command appear successful.
- If a command fails, document the actual result and explain it in your findings.
- Use PNG or JPG files and descriptive filenames.
