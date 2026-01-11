<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html>

    <head>
        <title>3TapWatch - Order Confirmed</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            .wrap {
                width: min(900px, 92%);
                margin: 40px auto 60px;
                display: flex;
                justify-content: center;
            }

            .card.checkout-card {
                width: 640px;
                padding: 36px 34px;
                text-align: center;
            }

            .icon {
                width: 72px;
                height: 72px;
                margin: 0 auto 12px;
                border-radius: 999px;
                background: rgba(39, 174, 96, 0.12);
                border: 1px solid rgba(39, 174, 96, 0.25);
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 34px;
                color: var(--primary);
                font-weight: 1000;
            }

            .subtitle {
                margin: 0 0 18px;
                color: var(--muted);
                font-weight: 700;
            }

            .details {
                text-align: left;
                margin: 22px 0 20px;
                padding: 18px;
                border-radius: 16px;
                background: linear-gradient(135deg, rgba(39, 174, 96, 0.10), rgba(52, 152, 219, 0.08));
                border: 1px solid rgba(39, 174, 96, 0.18);
            }

            .grid-details {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 12px;
            }

            .item-detail {
                background: white;
                border: 1px solid var(--border);
                border-radius: 14px;
                padding: 12px 12px;
            }

            .label {
                color: var(--muted);
                font-size: 12px;
                font-weight: 1000;
                text-transform: uppercase;
                letter-spacing: 0.06em;
                margin-bottom: 6px;
            }

            .value {
                font-size: 15px;
                font-weight: 900;
                color: #111827;
            }

            .total-row {
                grid-column: 1 / -1;
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 14px 14px;
                border-radius: 14px;
                background: #fff;
                border: 1px solid var(--border);
                margin-top: 2px;
            }

            .total-row span {
                font-weight: 1000;
                font-size: 14px;
            }

            .total-row strong {
                font-size: 26px;
                font-weight: 1000;
                color: #e74c3c;
            }
        </style>
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

        <div class="wrap">
            <div class="card checkout-card">
                <div class="icon">✓</div>
                <h1 style="margin: 10px 0 6px; font-size: 32px; font-weight:1000; color:var(--primary);">Order Confirmed
                </h1>
                <p class="subtitle">Thank you for your purchase! Your order has been successfully placed.</p>

                <div class="details">
                    <div class="grid-details">
                        <div class="item-detail">
                            <div class="label">Order Date</div>
                            <div class="value">
                                <%= request.getAttribute("orderDate") %>
                            </div>
                        </div>

                        <div class="item-detail">
                            <div class="label">Number of Items</div>
                            <div class="value">
                                <%= request.getAttribute("itemCount") %>
                            </div>
                        </div>

                        <div class="total-row">
                            <span>Total Amount</span>
                            <strong>RM <%= String.format("%.2f", (Double) request.getAttribute("orderTotal")) %>
                                    </strong>
                        </div>
                    </div>
                </div>

                <p class="note">An order confirmation email will be sent to your registered email address shortly.</p>

                <a href="movies" class="btn">Continue Shopping</a>
            </div>
        </div>

    </body>

    </html>