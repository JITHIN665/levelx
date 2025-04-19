#  Flutter Post Viewer App

A clean and modern Flutter app that fetches posts from `https://jsonplaceholder.typicode.com/posts` using:
-  Riverpod state management
-  Clean architecture
-  Dio HTTP client
-  Infinite scroll pagination
-  Pull-to-refresh
-  Tab-based UI
-  GitHub Actions CI

---

## Features

- List posts with title, avatar, and actions (like/comment/share)
- Infinite scroll (20 items per load)
- Pull down to refresh
- Tab selector: Trending, Relationship, Self Care
- Modular Clean structure with reusable widgets

---



---

##  GitHub Actions CI

Automatically builds and analyzes code on every push or pull request to `main`.

 `.github/workflows/flutter_ci.yml`

```yaml
- flutter pub get
- flutter analyze
- flutter build apk
```

---

##  Dependencies

| Package         | Purpose                      |
|----------------|------------------------------|
| flutter_riverpod | State management            |
| dio             | API networking               |

---

## Screenshots
![Image](https://github.com/user-attachments/assets/b4fb4e49-fcf1-4162-9051-d5c24d319573)
![Image](https://github.com/user-attachments/assets/823b1cbe-1528-4983-b453-3cf42a5e7169)
![Image](https://github.com/user-attachments/assets/49607361-689c-4877-8314-1f41b7997f81)
---
