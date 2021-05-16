# QB Roulette

#STEP 1
I used bt-target for my script use your own trigger, set this up, they're rather simple, for example here is my bt-trigger:
```
    AddBoxZone("CasinoRoulette", vector3(1138.62, 252.75, -51.04), 1.5, 2.5, {
		name = "CasinoRoulette",
		heading = 260.67,
		debugPoly = false,
		minZ = -52.04,
		maxZ = -50.75
    }, {
        options = {
            {
                event = "qb_ruletka:start",
                icon = "fas fa-coins",
                label = "Play Roulette",
            },
        },
        distance = 1.5
    })
```

#STEP 2
Install the script and start it easy peasy!