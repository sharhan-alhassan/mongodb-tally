
# Action.yml
```yml
This metadata defines one who-to-greet input and one time output parameter. To pass inputs to the Docker container, you should declare the input using inputs and pass the input in the args keyword. Everything you include in args is passed to the container, but for better discoverability for users of your action, we recommended using inputs.

```

# Action output
```yml
In order for GitHub to recognize output variables, you must use a workflow command in a specific syntax: echo "::set-output name=<output name>::<value>"
```
