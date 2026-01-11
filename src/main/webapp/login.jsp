<%@ page contentType="text/html;charset=UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>3TapWatch - Login</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>

        <div class="navbar">
            <div class="nav-inner">
                <a href="movies" class="brand"><span>🎬</span> 3TapWatch</a>
                <div class="nav-links">
                    <a href="movies">Home</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="card login-card">
                <h2>Welcome Back</h2>
                <p class="desc">Login to manage your account</p>

                <% String error=request.getParameter("error"); if ("invalid".equals(error)) { %>
                    <div class="alert error">Invalid username or password!</div>
                    <% } else if ("loginRequired".equals(error)) { %>
                        <div class="alert error">Please login to access the cart!</div>
                        <% } %>

                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label class="form-label">Username</label>
                                    <input type="text" name="username" class="form-input" placeholder="Enter username"
                                        required>
                                </div>

                                <div class="form-group">
                                    <label class="form-label">Password</label>
                                    <input type="password" name="password" class="form-input"
                                        placeholder="Enter password" required>
                                </div>

                                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                            </form>
            </div>
        </div>

    </body>

    </html>