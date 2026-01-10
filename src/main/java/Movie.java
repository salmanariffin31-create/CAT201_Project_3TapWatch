public class Movie {
    private int id;
    private String title;
    private String genre;
    private double price;

    public Movie(int id, String title, String genre, double price) {
        this.id = id;
        this.title = title;
        this.genre = genre;
        this.price = price;
    }

    // Getters - these allow the JSP to read the data
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getGenre() { return genre; }
    public double getPrice() { return price; }
}