package com.tapwatch.dao;

import com.tapwatch.model.Movie;

import java.util.ArrayList;
import java.util.List;

public class MovieDAO {

        // Static list to simulate a database in memory
        private static final List<Movie> movies = new ArrayList<>();

        static {
                movies.add(new Movie(1, "Inception", "Sci-Fi", 2010, 148, 8.8, "A mind-bending thriller.",
                                "images/inception.jpg", "", 12.99, 3.99));
                movies.add(new Movie(2, "Joker", "Drama", 2019, 122, 8.4, "A dark story of Gotham’s clown.",
                                "images/joker.jpg", "", 10.99, 3.99));
                movies.add(new Movie(3, "Interstellar", "Sci-Fi", 2014, 169, 8.6,
                                "A journey beyond space and time to save humanity.", "images/interstellar.png", "",
                                14.99, 4.99));
                movies.add(new Movie(4, "Avengers: Endgame", "Action", 2019, 181, 8.4,
                                "The Avengers assemble for one final battle.", "images/avengers endgame.png", "", 15.99,
                                4.99));
                movies.add(new Movie(5, "Whiplash", "Drama", 2014, 106, 8.5,
                                "A promising young drummer enrolls at a cut-throat music conservatory.",
                                "images/Whiplash.png", "", 9.99, 2.99));
                movies.add(new Movie(6, "Wonder Woman", "Action", 2017, 141, 7.4,
                                "When a pilot crashes and tells of conflict in the outside world, Diana leaves home to fight.",
                                "images/Wonder_Woman_(2017_film)_poster.jpg", "", 11.99, 3.99));
                movies.add(new Movie(7, "A Quiet Place", "Horror", 2018, 90, 7.5,
                                "In a post-apocalyptic world, a family is forced to live in silence.",
                                "images/a quite place .png", "", 10.99, 3.99));
                movies.add(new Movie(8, "Arrival", "Sci-Fi", 2016, 116, 7.9,
                                "A linguist works with the military to communicate with alien lifeforms.",
                                "images/arrival.png", "", 12.49, 3.99));
                movies.add(new Movie(9, "Back to the Future", "Adventure", 1985, 116, 8.5,
                                "Marty McFly is accidentally sent thirty years into the past.",
                                "images/back to the future.png", "", 8.99, 2.99));
                movies.add(new Movie(10, "Batman", "Action", 1989, 126, 7.5,
                                "The Dark Knight of Gotham City begins his war on crime.", "images/batman.png", "",
                                9.99, 2.99));
                movies.add(new Movie(11, "Deadpool", "Action", 2016, 108, 8.0,
                                "A wisecracking mercenary gets experimented on and becomes immortal but ugly.",
                                "images/deadpool.png", "", 11.99, 3.99));
                movies.add(new Movie(12, "Doctor Strange", "Action", 2016, 115, 7.5,
                                "While on a journey of physical and spiritual healing, a brilliant neurosurgeon is drawn into the world of the mystic arts.",
                                "images/doctor stranger.png", "", 11.99, 3.99));
                movies.add(new Movie(13, "E.T. the Extra-Terrestrial", "Sci-Fi", 1982, 115, 7.9,
                                "A troubled child summons the courage to help a friendly alien escape Earth and return to his home.",
                                "images/e.t the extra.png", "", 8.99, 2.99));
                movies.add(new Movie(14, "Everything Everywhere All At Once", "Sci-Fi", 2022, 139, 7.8,
                                "A middle-aged Chinese immigrant is swept up into an insane adventure.",
                                "images/everything everywheer all at once.png", "", 13.99, 4.99));
                movies.add(new Movie(15, "Ex Machina", "Sci-Fi", 2014, 108, 7.7,
                                "A young programmer is selected to participate in a ground-breaking experiment in synthetic intelligence.",
                                "images/ex machina.png", "", 10.49, 3.99));
                movies.add(new Movie(16, "Fight Club", "Drama", 1999, 139, 8.8,
                                "An insomniac office worker and a devil-may-care soap maker form an underground fight club.",
                                "images/fight club.png", "", 9.99, 2.99));
                movies.add(new Movie(17, "Forrest Gump", "Drama", 1994, 142, 8.8,
                                "The presidencies of Kennedy and Johnson, the Vietnam War, the Watergate scandal and other historical events unfold from the perspective of an Alabama man with an IQ of 75.",
                                "images/forrest gump.png", "", 9.99, 2.99));
                movies.add(new Movie(18, "The Grand Budapest Hotel", "Comedy", 2014, 99, 8.1,
                                "A writer encounters the owner of an aging high-class hotel, who tells him of his early years serving as a lobby boy in the hotel's glorious years under an exceptional concierge.",
                                "images/grand-budapest-hotel-poster.png", "", 10.99, 3.99));
                movies.add(new Movie(19, "Guardians of the Galaxy", "Action", 2014, 121, 8.0,
                                "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",
                                "images/guardians of the galaxy.png", "", 11.49, 3.99));
                movies.add(new Movie(20, "Her", "Drama", 2013, 126, 8.0,
                                "In a near future, a lonely writer develops an unlikely relationship with an operating system designed to meet his every need.",
                                "images/her.png", "", 10.99, 3.99));
                movies.add(new Movie(21, "Jurassic Park", "Adventure", 1993, 127, 8.2,
                                "A pragmatic paleontologist touring an almost complete theme park on an island in Central America is tasked with protecting a couple of kids after a power failure causes the park's cloned dinosaurs to run loose.",
                                "images/jurassic park.ong.jpg", "", 9.99, 2.99));
                movies.add(new Movie(22, "Knives Out", "Mystery", 2019, 130, 7.9,
                                "A detective investigates the death of a patriarch of an eccentric, combative family.",
                                "images/knives out.png", "", 11.99, 3.99));
                movies.add(new Movie(23, "La La Land", "Romance", 2016, 128, 8.0,
                                "While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.",
                                "images/la la land.png", "", 11.49, 3.99));
                movies.add(new Movie(24, "The Lion King", "Animation", 1994, 88, 8.5,
                                "Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.",
                                "images/lion king.png", "", 9.99, 2.99));
                movies.add(new Movie(25, "Logan", "Action", 2017, 137, 8.1,
                                "In a future where mutants are nearly extinct, an elderly and weary Logan leads a quiet life.",
                                "images/logan.png", "", 12.49, 3.99));
                movies.add(new Movie(26, "Pulp Fiction", "Crime", 1994, 154, 8.9,
                                "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
                                "images/pulp fiction.pn.jpg", "", 9.99, 2.99));
                movies.add(new Movie(27, "The Shawshank Redemption", "Drama", 1994, 142, 9.3,
                                "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
                                "images/shawshank.png", "", 9.99, 2.99));
                movies.add(new Movie(28, "Shrek", "Animation", 2001, 90, 7.9,
                                "A mean lord exiles fairytale creatures to the swamp of a grumpy ogre, who must go on a quest and rescue a princess for the lord in order to get his land back.",
                                "images/shrek.png", "", 8.99, 2.99));
                movies.add(new Movie(29, "Spirited Away", "Animation", 2001, 125, 8.6,
                                "During her family's move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.",
                                "images/spirited away.png", "", 10.99, 3.99));
                movies.add(new Movie(30, "The Dark Knight", "Action", 2008, 152, 9.0,
                                "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
                                "images/the dark knight.png", "", 10.99, 3.99));
                movies.add(new Movie(31, "The Godfather", "Crime", 1972, 175, 9.2,
                                "The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.",
                                "images/the godfather.png", "", 10.99, 3.99));
                movies.add(new Movie(32, "The Incredibles", "Animation", 2004, 115, 8.0,
                                "A family of undercover superheroes, while trying to live the quiet suburban life, are forced into action to save the world.",
                                "images/the incredibles.png", "", 9.99, 2.99));
                movies.add(new Movie(33, "The Matrix", "Sci-Fi", 1999, 136, 8.7,
                                "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.",
                                "images/the matrix.png", "", 9.99, 2.99));
                movies.add(new Movie(34, "The Social Network", "Biography", 2010, 120, 7.8,
                                "As Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, he is sued by the twins who claimed he stole their idea, and by the co-founder who was later squeezed out of the business.",
                                "images/the social network.png", "", 9.99, 2.99));
                movies.add(new Movie(35, "The Wolf of Wall Street", "Biography", 2013, 180, 8.2,
                                "Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.",
                                "images/the wolf of wall street.png", "", 11.99, 3.99));
        }

        public List<Movie> getAllMovies() {
                return new ArrayList<>(movies);
        }

        public Movie getMovieById(int id) {
                return movies.stream()
                                .filter(m -> m.getId() == id)
                                .findFirst()
                                .orElse(null);
        }

        public void addMovie(Movie m) {
                int newId = movies.stream()
                                .mapToInt(Movie::getId)
                                .max()
                                .orElse(0) + 1;
                m.setId(newId);
                movies.add(m);
        }

        public void updateMovie(Movie updated) {
                for (int i = 0; i < movies.size(); i++) {
                        if (movies.get(i).getId() == updated.getId()) {
                                movies.set(i, updated);
                                break;
                        }
                }
        }

        public void deleteMovie(int id) {
                movies.removeIf(m -> m.getId() == id);
        }

        // Optional filtering (for search)
        public List<Movie> getMoviesByCriteria(String search, String genre) {
                List<Movie> result = new ArrayList<>();

                for (Movie m : movies) {
                        boolean ok = true;

                        if (search != null && !search.trim().isEmpty()) {
                                ok = m.getTitle().toLowerCase().contains(search.trim().toLowerCase());
                        }

                        if (ok && genre != null && !genre.trim().isEmpty() && !"All".equalsIgnoreCase(genre)) {
                                ok = m.getGenre().equalsIgnoreCase(genre.trim());
                        }

                        if (ok)
                                result.add(m);
                }

                return result;
        }
}
