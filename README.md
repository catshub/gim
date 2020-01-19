# gim - `.gitignore` file manager

## Description

Use the `.gitignore` files from [github/gitignore](https://github.com/github/gitignore) repo to init your own repo.

## Installation

#### MacOS

```
curl -L -o- https://raw.githubusercontent.com/catshub/gim/master/install.sh | bash
```

## Usage

`gim` will copy the `chosen .ignore file content` to init your `.gitignore` :

```
gim [.ignore_file_type] [target_dir]
```

- use `Node.gitignore` file to init current repo (if the [target_dir] is current dir, you can omit this arg)

  ```shell
  gim node
  # or
  gim node .
  ```

- use `Ruby.gitignore` file to init the repo in `~/user/test-repo`

  ```shell
  gim Ruby ~/user/test-repo
  ```
