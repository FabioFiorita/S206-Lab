package aula6.pokemon;

import com.intuit.karate.junit5.Karate;

public class PokeRunner {

    @Karate.Test
    Karate testStarWars() {
        return Karate.run("pokemon").relativeTo(getClass());
    }

}
