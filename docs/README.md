# BlogTemplate

* Host blogs with GitHub
* Write with Obsidian

## Fork and clone

1) Fork github repo: [https://github.com/hailiang-wang/blogtemplate](https://github.com/hailiang-wang/blogtemplate)

2) Clone your own repo.

```
git clone git@github.com:$YOUR_NAME/blogtemplate.git
```

Optional: modify your project name, such as `blogs`, later the project name would be used as part of URL in GitHub Pages Service.

## Add note with Obsidian

> ROOT_DIR, root dir, path cloned for BlogTemplate.

1. Install Obsidian, Git Bash, NodeJS

2. Copy obsidian vault

```
cd $ROOT_DIR
cp -rf assets/_obsidian .obsidian
```

3. Open root dir as vault in Obsidian


![Alt text](./assets/screenshot_20250208121046.png)

Enable all plugins.

![Alt text](./assets/screenshot_20250208121133.png)

4. Add new note in `posts`, e.g. `posts/hello.md`

![Alt text](./assets/screenshot_20250208123950.png)

Note -

* No spaces are allowed in note file name

## Build and serve locally

### Build

Open in Git Bash, cd to $ROOT_DIR

```
cd $ROOT_DIR
npm install 
./bin/build.sh
```


### Serve

```
cd $ROOT_DIR
./bin/dev.sh
```

## FAQs

### How to write in markdown

https://hexo.io/docs/writing

### More config on hexo

https://hexo.io/docs/configuration

### How to publish blogs

After pushed updates into GitHub, GitHub would fire publish jobs with your configurations.

More about GitHub Token, [link](https://docs.github.com/en/actions/security-for-github-actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow).

If working properly, the actions are executed with every git push.

https://github.com/xxxx/blogtemplate/actions

![Alt text](./assets/screenshot_20250208132548.png)

The files under `gh-pages` are updated as well.

![Alt text](./assets/screenshot_20250208132633.png)

Set GitHub Page service, choose deploy from a branch.

![Alt text](./assets/screenshot_20250208132737.png)

After saving the options, refresh the page after two minutes or so, you would get the deployment result.

![Alt text](./assets/screenshot_20250208132856.png)

Now, visit and share your github page blog, you may see page like this -

![Alt text](./assets/screenshot_20250208133341.png)

Now, you need to change the `_config.yml` to fix the URL path issue, for example, you get your blog URL as https://hailiang-wang.github.io/blogtemplate/, navigate to `_config.yml` in VSCode.

![Alt text](./assets/screenshot_20250208133139.png)

Change `url` to `https://hailiang-wang.github.io/blogtemplate/`, then push to GitHub repo again, after the Actions Workflow is done, the blog website would look like this -

![Alt text](./assets/screenshot_20250208133636.png)

Well done.

### Feeds and sitemap links

* Feeds URL submitted to RSS Readers

```
YOUR_BLOG_URL/atom
```

e.g. https://hailiang-wang.github.io/blogtemplate/atom

* Sitemap URL submitted to Searching Engine

```
YOUR_BLOG_URL/sitemap.xml
```

e.g. https://hailiang-wang.github.io/blogtemplate/sitemap.xml


## Others

* [markdown2word-doc-template](https://github.com/hailiang-wang/markdown2word-doc-template)


## License

Copyright 2025 Hai Liang Wang <hailiang.hl.wang@gmail.com>. All rights reserved.
This software and related documentation are provided under a license agreement containing 
restrictions on use and disclosure and are protected by intellectual property laws. 
Except as expressly permitted in your license agreement or allowed by law, you may not use, 
copy, reproduce, translate, broadcast, modify, license, transmit, distribute, exhibit, perform, 
publish, or display any part, in any form, or by any means. Reverse engineering, disassembly, 
or decompilation of this software, unless required by law for interoperability, is prohibited.
