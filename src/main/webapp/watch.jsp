<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Watching: ${movie.title} - 3TapWatch</title>
            <link rel="stylesheet" href="css/style.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap" rel="stylesheet">
            <style>
                body {
                    background-color: #1a1a1a;
                    color: white;
                    min-height: 100vh;
                    display: flex;
                    flex-direction: column;
                }

                .player-container {
                    flex: 1;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    padding: 40px;
                }

                .screen-frame {
                    width: 100%;
                    max-width: 1000px;
                    aspect-ratio: 16/9;
                    background: black;
                    border-radius: 12px;
                    overflow: hidden;
                    box-shadow: 0 0 50px rgba(0, 0, 0, 0.5);
                    margin-bottom: 30px;
                }

                iframe {
                    width: 100%;
                    height: 100%;
                    border: none;
                }

                .controls {
                    display: flex;
                    gap: 20px;
                    align-items: center;
                }
            </style>
        </head>

        <body>

            <div class="navbar" style="background: #000; border-bottom: 1px solid #333;">
                <div class="nav-inner">
                    <a href="library" class="brand"><span>🔙</span> Back to Library</a>
                    <div class="nav-links">
                        <span style="font-weight: 700;">Now Playing: ${movie.title}</span>
                    </div>
                </div>
            </div>

            <div class="player-container">

                <div class="screen-frame">
                    <c:choose>
                        <c:when test="${not empty movie.trailerUrl}">
                            <iframe src="${movie.trailerUrl}?autoplay=1" allow="autoplay; fullscreen"
                                allowfullscreen></iframe>
                        </c:when>
                        <c:otherwise>
                            <div
                                style="height: 100%; display: flex; align-items: center; justify-content: center; color: #555;">
                                <p>Video source not found.</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="controls">
                    <h1>${movie.title}</h1>
                </div>
                <p style="color: #aaa; margin-top: 10px;">You are watching the ${movie.title} trailer as a demo.</p>

            </div>

        </body>

        </html>