## How do we declare our classes?

#### Answer - $Animal & code gen creates Animal


### Define class as $Animal and code gen creates Animal

It looks messy to have the $ prefix on various classes but there may be no other way.

```
$Animal getAnimal(){
    return animal();
}
```

### Define class as Animal and code gen creates _Animal which extends / implements Animal

If we return Animal then the copyWith will not be accessible because copyWith is actually on _Animal which is private.
What we need is to return Animal and define it as Animal.  This is why in the other library there was the $ prefix.

```
Animal getAnimal(){
    return animal();
}
```
