# Risk like Strategy Games Dice Probability

When playing a board Game like Risk, or Cyclades, the result of a fight depends on dice. But does the attacking or defending side have the most chances to win? The particularity in Risk is that the attacker can use more dice, but the defender wins if there is an equality.

An easy way to answer this question is to simulate all the possible outcomes, and count the ones where the attacker is winning / losing. For instance, if there is only one die sent by each player :

![Risk results](https://github.com/beisutsukai/risk_like_games_probabilities/blob/master/array_risk_dice.png)

There are 36 possibilities, and the attacker wins only 15 times. Here it is easy to see that the defender has an advantage. But with a more complex case, with 3 attacking die against 2 defending dice, which is very common in Risk, who should win?

Drawing an array like the previous one would not be easy, so we will use a script to simulate all the 36 x 216 possibilities.

## The results are:

Attacker wins 37% of assaults

Defender wins 29% of assaults

Equality 33% of assaults