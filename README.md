# poker-cli

## Command

### Auth

`./poker.rb auth 'user_name'`

output:
```bash
$ ./poker.rb auth 'Igor'
$ Welcome, Igor!
```

### Poker create

`./poker.rb poker create 'poker_title' 'vote count'`

output:

```bash
$ ./poker.rb pokers create test 2
$ Poker test started
```

### Poker list

`./poker.rb poker list`

output:
```bash
$ ./poker.rb pokers list
+----+-------+---------+
| id | title | status  |
+----+-------+---------+
| 1  | test  | started |
+----+-------+---------+
```

### Poker show

`./poker.rb poker show 'poker_title'`

output:

```bash
+--------+--------+
| option | names  |
+--------+--------+
| 1      | Luke   |
| 2      | -      |
| 3      | -      |
| 4      | -      |
| 5      | -      |
| 8      | Igor B |
+--------+--------+
```

### Vote

`./poker.rb vote 'poker_title' 'option'`

output:
```bash
Final note: 8
+--------+--------------+
| option | names        |
+--------+--------------+
| 1      | -            |
| 2      | -            |
| 3      | -            |
| 4      | -            |
| 5      | -            |
| 8      | Igor B, Luke |
+--------+--------------+
```
