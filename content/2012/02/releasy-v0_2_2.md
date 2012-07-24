---
title: Releasy v0.2.2
kind: article
layout: article
created_at: 2012-02-01 13:00:00 +0000
tags: [ 'releasy', 'ruby' ]
---

* Ruby gem release: `gem install releasy`

### Changelog

  * Added new deployers: :rsync and :local
  * Removed 7z installation dependency on Windows (included 7za.exe in gem).
  * Fixes for Ruby 1.8.7
  * :osx_app build - Change directory into application directory before running app.
  * :osx_app build - Add BINARY to list of "fake" encodings.