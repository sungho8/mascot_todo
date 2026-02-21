# Git Auto-Push Rule
- Whenever a significant work chunk (e.g., fixing a bug, implementing a feature, refactoring) is completed:
  1. Run `flutter analyze` to ensure no static analysis issues.
  2. Create appropriate unit tests for the changes made.
  3. Run the unit tests (e.g., `flutter test`) to verify correctness.
  4. If all checks pass, automatically commit and push the changes to the remote repository.
- Use descriptive commit messages following the Conventional Commits format (e.g., `fix:`, `feat:`, `refactor:`).
