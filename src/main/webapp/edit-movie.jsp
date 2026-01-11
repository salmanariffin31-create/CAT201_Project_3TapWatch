<%@ page contentType="text/html;charset=UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <title>3TapWatch - Edit Movie</title>
    <link rel="stylesheet" href="css/style.css">
  </head>

  <body>

    <div class="navbar">
      <div class="nav-inner">
        <a href="admin" class="brand"><span>🎬</span> 3TapWatch Admin</a>
        <div class="nav-links">
          <a href="admin">Cancel</a>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="card login-card" style="max-width: 500px;">
        <h2>Edit Movie</h2>
        <p class="desc">Update details for ${movie.title}</p>

        <form action="admin" method="post">
          <input type="hidden" name="action" value="update">
          <input type="hidden" name="id" value="${movie.id}">

          <div class="form-group">
            <label class="form-label">Title</label>
            <input type="text" name="title" class="form-input" value="${movie.title}" required>
          </div>

          <div class="form-group">
            <label class="form-label">Genre</label>
            <input type="text" name="genre" class="form-input" value="${movie.genre}" required>
          </div>

          <div class="form-group">
            <label class="form-label">Price (RM)</label>
            <input type="number" name="price" class="form-input" value="${movie.price}" step="0.01" required>
          </div>

          <button type="submit" class="btn btn-primary btn-block">Save Changes</button>
          <a href="admin" class="btn btn-secondary btn-block"
            style="text-align: center; text-decoration: none; display: block;">Cancel</a>
        </form>
      </div>
    </div>

  </body>

  </html>