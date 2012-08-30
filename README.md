# puppet-ruby

Allows you to install ruby using [ruby-build](https://github.com/sstephenson/ruby-build).

## How It Works

Configures ruby by:

* Cloning and installing ruby-build.
* Installing packages necessary for compiling ruby
* Installs ruby via `alternatives` command (`man alternatives`)
* Adds profile script to ammend the path to point to the `alternatives`
  maintained `bin` path for ruby.

## Usage

Declare in your own class or manifest:

```puppet
node default {
  class { 'ruby': }
  ruby::version { '1.9.3-p194': }
}
```
