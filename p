#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int movePlayer(int position) {
    // Ladders
    if (position == 3) return 22;
    if (position == 5) return 8;
    if (position == 11) return 26;
    if (position == 20) return 29;

    // Snakes
    if (position == 27) return 1;
    if (position == 21) return 9;
    if (position == 17) return 4;
    if (position == 19) return 7;

    return position;
}

int main() {
    int position = 0;
    char roll;

    srand(time(NULL)); // Seed for random number generation

    printf("🎲 Welcome to Snake and Ladder!\n");
    printf("Press 'r' to roll the dice, 'q' to quit.\n");

    while (position < 30) {
        printf("\nCurrent Position: %d\n", position);
        printf("Your move: ");
        scanf(" %c", &roll);

        if (roll == 'q') {
            printf("Game exited. Final position: %d\n", position);
            break;
        }

        if (roll == 'r') {
            int dice = (rand() % 6) + 1;
            printf("You rolled a %d!\n", dice);
            position += dice;

            if (position > 30) {
                position -= dice;
                printf("Overshot! Stay at %d\n", position);
                continue;
            }

            int newPos = movePlayer(position);
            if (newPos > position)
                printf("🎉 Ladder! Climb up to %d\n", newPos);
            else if (newPos < position)
                printf("🐍 Snake! Slide down to %d\n", newPos);

            position = newPos;
        } else {
            printf("Invalid input. Press 'r' to roll or 'q' to quit.\n");
        }
    }

    if (position == 30)
        printf("\n🏁 Congratulations! You reached the end.\n");

    return 0;
}
