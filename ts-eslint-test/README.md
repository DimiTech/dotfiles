When the `main.ts` file is opened in `vim`, `syntastic` should show the following errors:

```
main.ts|6 col 1 warning| Missing return type on function. (@typescript-eslint/explicit-function-return-type)
main.ts|7 col 62 error| Extra semicolon. (semi)
main.ts|10 col 5 error| 'user' is never reassigned. Use 'const' instead. (prefer-const)
```
