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
