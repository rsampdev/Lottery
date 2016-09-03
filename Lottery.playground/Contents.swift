import GameplayKit;

typealias LotteryBalls = (ballOne: Int, ballTwo: Int, ballThree: Int, ballFour: Int, ballFive: Int, powerball: Int)

func play(userGuess: LotteryBalls) -> Int  {
    let random = GKRandomDistribution.init(lowestValue: 0, highestValue: 99)
    let tenthOfLotteryJackpot = GKRandomDistribution.init(lowestValue: 10000, highestValue: 1000000000000).nextInt()
    let lotteryBalls: LotteryBalls = (random.nextInt(), random.nextInt(), random.nextInt(), random.nextInt(), random.nextInt(), random.nextInt())
    let userOnlyGuessedThePowerball = (userGuess.0 != lotteryBalls.0 && userGuess.1 != lotteryBalls.1 && userGuess.2 != lotteryBalls.2 && userGuess.3 != lotteryBalls.3 && userGuess.4 != lotteryBalls.4 && userGuess.5 == lotteryBalls.5);
    
    var userWinnings = 0
    
    if userGuess == lotteryBalls {
        userWinnings = tenthOfLotteryJackpot * 10
    } else {
        if userGuess.ballOne == lotteryBalls.ballOne {
            userWinnings += tenthOfLotteryJackpot
        }
        if userGuess.ballTwo == lotteryBalls.ballTwo {
            userWinnings += tenthOfLotteryJackpot
        }
        if userGuess.ballThree == lotteryBalls.ballThree {
            userWinnings += tenthOfLotteryJackpot
        }
        if userGuess.ballFour == lotteryBalls.ballFour {
            userWinnings += tenthOfLotteryJackpot
        }
        if userGuess.ballFive == lotteryBalls.ballFive {
            userWinnings += tenthOfLotteryJackpot
        }
        
        if userOnlyGuessedThePowerball {
            userWinnings += tenthOfLotteryJackpot
        } else if userGuess.powerball == lotteryBalls.powerball {
            userWinnings *= 2
        }
    }
    
    return userWinnings
}

let guess: LotteryBalls = (1, 1, 1, 1, 1, 1); // change the numbers

let winnings = play(userGuess: guess)

print("Player! You have won \(winnings) dollars!")
