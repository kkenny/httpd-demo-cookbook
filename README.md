# httpd

This cookbook installs, enables, and starts the httpd service on RHEL 9, and creates an index.html file with "Hello World" content.

## Requirements

- Chef 16.0 or higher
- RHEL 9 (or compatible like Rocky Linux 9, AlmaLinux 9)

## Usage

Include `httpd` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[httpd]"
  ]
}
```

## Testing

### Unit Tests

Run ChefSpec unit tests:

```bash
bundle install
bundle exec rspec
```

### Integration Tests

Run Test Kitchen integration tests:

```bash
# Install dependencies
bundle install

# Create and converge the test instance
kitchen create
kitchen converge

# Run InSpec tests
kitchen verify

# Destroy the test instance
kitchen destroy

# Or run all steps at once
kitchen test
```

## What This Cookbook Does

1. Installs the `httpd` package
2. Enables the `httpd` service to start on boot
3. Starts the `httpd` service
4. Creates `/var/www/html/index.html` with "Hello World" content
5. Sets appropriate ownership (apache:apache) and permissions (0644) on the index.html file

## Test Coverage

### Unit Tests (ChefSpec)
- Verifies httpd package is installed
- Verifies httpd service is enabled
- Verifies httpd service is started
- Verifies index.html file is created with correct content, owner, group, and mode

### Integration Tests (InSpec)
- Verifies httpd service is installed, enabled, and running
- Verifies port 80 is listening
- Verifies index.html exists with correct ownership, permissions, and content
