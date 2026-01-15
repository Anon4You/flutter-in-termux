<a href="https://flutter.dev/">
  <h1 align="center">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://storage.googleapis.com/cms-storage-bucket/6e19fee6b47b36ca613f.png">
      <img alt="Flutter" src="https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png">
    </picture>
  </h1>
</a>

# flutter-in-termux
Flutter is Google's SDK for crafting beautiful, fast user experiences for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source. 

## Installation Options

### Option 1: Install from TermuxVoid Repo (Recommended)
Flutter is available in the [Termux Void Repo](https://termuxvoid.github.io) :

```bash
apt install flutter -y
```

### Install from github 

```baah
curl -sL https://github.com/Anon4You/flutter-in-termux/raw/main/flutter.sh | bash
```

## USAGE

### Linux Termux-x11

```bash
export DISPLAY=:0 && termux-x11 :0 >/dev/null 2>&1 &
flutter run -d linux
```

### Web Server

```bash
flutter run -d web-server --web-port 8080
```


## Notes
- The repository version is stable and recommended for most users 
- Will be auto upgrade and can be removed using `apt remove`

## Author
Code by [Alienkrishn](https://github.com/Anon4You)
