# Seeded Pseudo-Random AS3 Implementation

## Notice:
It is **not** Mersenne Twister pseudo-random number generator.

## Usage:

Initialize random generator with some seed.

```
const random : SeededRandom = new SeededRandom(getTimer())
```

Methods:

 - `nextInt() : int` [0..int.MAX_VALUE]
 - `nextBoolean() : Boolean`
 - `nextNumber(): Number` [0..1]
 - `nextIntWithin(from: int, to: int) : int` [from..to]
 - `intByChance(values:Vector.<int>, chances:Vector.<int>) : int` - returns random value from values-list based on chances

Example:

```
const random : SeededRandom = new SeededRandom(getTimer())
const values : Vector.<int> = new <int>[0, 1, 2];
const chances : Vector.<int> = new <int>[5, 10, 15]
const result : int = random.intByChance(values, chances);
trace(result);
```

*Notice:*

**intByChance** is using population algorithm, so it's a bit "fat" and not optimized.
