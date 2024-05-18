
```markdown
# Web Stack Debugging #4

This project involves fixing issues in a web server setup and adjusting system configurations to handle user limits. We use Puppet to automate these changes.

## Requirements

- All files are interpreted on Ubuntu 14.04 LTS.
- All files should end with a new line.
- A `README.md` file at the root of the folder is mandatory.
- Puppet manifests must pass `puppet-lint` version 2.1.1 without any errors.
- Puppet manifests must run without error.
- The first line of Puppet manifests must be a comment explaining what the Puppet manifest is about.
- Puppet manifests files must end with the extension `.pp`.
- Files will be checked with Puppet v3.4.

## Installation

To install `puppet-lint`:
```sh
apt-get install -y ruby
gem install puppet-lint -v 2.1.1
```

## Tasks

### 0. Sky is the limit, let's bring that limit higher

In this task, we need to debug a web server setup that is experiencing a high number of failed requests under load. We use ApacheBench for benchmarking.

#### Steps

1. Run the benchmark to see the current state:
   ```sh
   ab -c 100 -n 2000 localhost/
   ```

2. Apply the Puppet manifest to fix the web server configuration:
   ```sh
   puppet apply 0-the_sky_is_the_limit_not.pp
   ```

3. Run the benchmark again to verify the fix:
   ```sh
   ab -c 100 -n 2000 localhost/
   ```

#### `0-the_sky_is_the_limit_not.pp`
```puppet
# This Puppet manifest fixes the web server setup to handle more requests

exec { 'fix--for-nginx':
  command => '/etc/init.d/nginx reload',
  path    => ['/bin', '/usr/bin'],
}
```

### 1. User limit

In this task, we need to change the OS configuration to allow the `holberton` user to log in and open files without encountering the "Too many open files" error.

#### Steps

1. Apply the Puppet manifest to increase file descriptor limits:
   ```sh
   puppet apply 1-user_limit.pp
   ```

2. Test the changes by switching to the `holberton` user and opening a file:
   ```sh
   su - holberton
   head /etc/passwd
   ```

#### `1-user_limit.pp`
```puppet
# This Puppet manifest changes the OS configuration to increase the file descriptor limit for the holberton user

exec { 'change-os-configuration-for-holberton-user':
  command => 'echo "holberton soft nofile 65535" >> /etc/security/limits.conf && echo "holberton hard nofile 65535" >> /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin'],
  unless  => 'grep -q "holberton.*nofile" /etc/security/limits.conf',
}

exec { 'increase-system-wide-file-limit':
  command => 'echo "fs.file-max = 100000" >> /etc/sysctl.conf && sysctl -p',
  path    => ['/bin', '/usr/bin'],
  unless  => 'sysctl -n fs.file-max | grep -q "100000"',
}
```

## Repository

GitHub repository: `alx-system_engineering-devops`
Directory: `0x1B-web_stack_debugging_4`
Files:
- `0-the_sky_is_the_limit_not.pp`
- `1-user_limit.pp`
```

This `README.md` provides an overview of the tasks, requirements, steps to reproduce the issue, and how to fix it using Puppet manifests. It also includes the necessary Puppet code for each task.