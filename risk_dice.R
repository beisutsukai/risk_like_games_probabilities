# Programm to compute the winrate of the attacker/defender in Risk game
# The attacker roll three 6 sides dice, the defender only two.
# The attacker compare his highest die to the highest of the defender
#   If he has a strictly superior result, he wins, else, he looses
# then his second highest to the second defender die.
#   If he has a strictly superior result, he wins, else, he looses

# So we can have three situations : 
# Attacker wins twice
# Defender wins twice
# Equality

# First we generate all the possible combinations : 


die1 = c(1, 2, 3, 4, 5, 6)
die2 = c(1, 2, 3, 4, 5, 6)
die3 = c(1, 2, 3, 4, 5, 6)

two_dice = data.frame(
  die1 = 0,
  die2 = 0
)

three_dice = data.frame(
  die1 = 0,
  die2 = 0,
  die3 = 0
)

i = 1
for (num_1 in die1) {
  for (num_2 in die2) {
    two_dice[i, "die1"] = num_1
    two_dice[i, "die2"] = num_2
    
    i = i + 1
  }
}

i = 1
for (num_1 in die1) {
  for (num_2 in die2) {
    for (num_3 in die3) {
      three_dice[i, "die1"] = num_1
      three_dice[i, "die2"] = num_2
      three_dice[i, "die3"] = num_3
      i = i + 1
    }
  }
}


# For every combination od two and three dice
# we evaluate if the attacker wins (1), looses (-1) or if there is equality (0)

combination_results = data.frame(
  two_dice = "",
  three_dice = "",
  result = 0
)

i = 1
for (n_two_dice_combination in 1:nrow(two_dice)) {
  two_dice_combination =  two_dice[n_two_dice_combination, ]
  for (n_three_dice_combination in 1:nrow(three_dice)) {
    three_dice_combination =  three_dice[n_three_dice_combination, ]
    combination_results[i, "two_dice"] = paste(two_dice_combination$die1, two_dice_combination$die2, sep = ",")
    combination_results[i, "three_dice"] = paste(three_dice_combination$die1, three_dice_combination$die2, three_dice_combination$die3, sep = ",")
    
    min_die2 = min(two_dice_combination$die1, two_dice_combination$die2)
    max_die2 = max(two_dice_combination$die1, two_dice_combination$die2)
    
    
    
    max_die3 = max(three_dice_combination$die1, three_dice_combination$die2, three_dice_combination$die3)
    second_max_die3 = sort(c(three_dice_combination$die1, three_dice_combination$die2, 
                            three_dice_combination$die3),partial=2)[2] # cf https://stackoverflow.com/questions/2453326/fastest-way-to-find-second-third-highest-lowest-value-in-vector-or-column
    if (max_die3 > max_die2) {
      
      if (second_max_die3 > min_die2) {
        combination_results[i, "result"] = 1
      } else {
        combination_results[i, "result"] = 0
      }
      
    } else {
      if (second_max_die3 > min_die2) {
        combination_results[i, "result"] = 0
      } else {
        combination_results[i, "result"] = -1
      }
    }
    
    i = i + 1
  }
  
}

# We now have the complete possibilities, let's compute the winrate

# Equality proportion
nrow(combination_results[combination_results$result == 0,]) / length(combination_results$result)
# 0.336

# Attacker winrate proportion
nrow(combination_results[combination_results$result == 1,]) / length(combination_results$result)
# 0.371

# Defender winrate proportion 
nrow(combination_results[combination_results$result == -1,]) / length(combination_results$result)
# 0.293