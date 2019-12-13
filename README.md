# puppet-lint-exec_idempotent-check

A puppet-lint plugin to check "exec" resources to ensure they have been written in an idempotent manner. Basically, ensure they used "onlyif", "unless", or "refreshonly".

## Installing
### From the command line
```shell
$ gem install puppet-lint-exec_idempotent-check
```

### In a Gemfile
```ruby
gem 'puppet-lint-exec_idempotent-check'
```

## Checks
### Validates that an exec resource is idempotent

For an `exec` resource to pass it must be using at least one parameter that ensures idempotence. The value being passed to the parameter is not checked. The parameters this
check will expect to find are one of "onlyif", "unless", or "refreshonly" as the use of any one of these is considered to ensure idempotance for the `exec` resource. This check
is, of course, opinionated in that regard, and to that end the "creates" parameter is not considered acceptable. This check does not view the creates parameter as a good
practice.

#### Disabling the check
To disable this check, you can add `--no-exec_idempotent-check` to your puppet-lint command line.

```shell
$ puppet-lint --no-exec_idempotent-check path/to/file.pp
```

Alternatively, if you’re calling puppet-lint via the Rake task, you should insert the following line to your `Rakefile`.

```ruby
PuppetLint.configuration.send('disable_exec_idempotent')
```

## Fix support
This check provides none! Fix your stuff :)
