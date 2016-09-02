import GameplayKit;

typealias LotteryBalls = (ballOne: Int, ballTwo: Int, ballThree: Int, ballFour: Int, ballFive: Int, powerball: Int)

func play(userGuess: LotteryBalls) -> Int  {
    let random = GKRandomDistribution.init(lowestValue: 0, highestValue: 99)
    let lotteryJackpot = (random.nextInt() * random.nextInt() * random.nextInt() * random.nextInt() * random.nextInt() * random.nextInt()) + 10000
    let lotteryBalls: LotteryBalls = (random.nextInt(), random.nextInt(), random.nextInt(), random.nextInt(), random.nextInt(), random.nextInt())
    let userOnlyGuessedThePowerball = (userGuess.0 == lotteryBalls.0 && userGuess.1 == lotteryBalls.1 && userGuess.2 == lotteryBalls.2 && userGuess.3 == lotteryBalls.3 && userGuess.4 == lotteryBalls.4 && userGuess.5 == lotteryBalls.5);
    
    var userWinnings = 0
    
    if userGuess == lotteryBalls {
        userWinnings = lotteryJackpot
    } else {
        if userGuess.ballOne == lotteryBalls.ballOne {
            userWinnings += lotteryJackpot / 10
        }
        if userGuess.ballTwo == lotteryBalls.ballTwo {
            userWinnings += lotteryJackpot / 10
        }
        if userGuess.ballThree == lotteryBalls.ballThree {
            userWinnings += lotteryJackpot / 10
        }
        if userGuess.ballFour == lotteryBalls.ballFour {
            userWinnings += lotteryJackpot / 10
        }
        if userGuess.ballFive == lotteryBalls.ballFive {
            userWinnings += lotteryJackpot / 10
        }
        
        if userOnlyGuessedThePowerball {
            userWinnings += lotteryJackpot / 10
        } else if userGuess.powerball == lotteryBalls.powerball {
            userWinnings *= 2
        }
    }
    
    return userWinnings
}

let guess: LotteryBalls = (1, 1, 1, 1, 1, 1); // change the numbers

let winnings = play(userGuess: guess)

print("Player! You have won \(winnings) dollars!")
