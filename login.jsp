<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login - YP CELULARES</title>
    <style>
        /* ====== ESTILO GENERAL ====== */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ffffff;
            color: #222;
            margin: 0;
            padding: 0;
        }

        /* ====== ENCABEZADO / LOGO ====== */
        header {
            background-color: #FFD700;
            color: #000;
            text-align: center;
            padding: 20px 0;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 2px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        /* ====== LOGIN ====== */
        .login-body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px);
            background-color: #fff;
            background-image: linear-gradient(135deg, #fff 70%, #FFD700 30%);
        }

        .login-container {
            background-color: #ffffff;
            padding: 40px 50px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            width: 350px;
            text-align: center;
            border-top: 6px solid #FFD700;
        }

        .login-title {
            margin-bottom: 25px;
            color: #111;
            font-size: 24px;
            font-weight: bold;
        }

        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: border 0.3s;
        }

        .login-form input[type="text"]:focus,
        .login-form input[type="password"]:focus {
            border-color: #FFD700;
        }

        .btn-login {
            width: 100%;
            background-color: #FFD700;
            color: #000;
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-login:hover {
            background-color: #e6c200;
        }

        .error-msg {
            color: #d11a2a;
            margin-top: 10px;
            font-weight: 500;
        }

        /* ====== RESPONSIVE ====== */
        @media (max-width: 480px) {
            header {
                font-size: 22px;
            }

            .login-container {
                width: 90%;
                padding: 30px 25px;
            }
        }
    </style>
</head>
<body>
    <header>
        YP CELULARES
    </header>

    <div class="login-body">
        <div class="login-container">
            <h2 class="login-title">Iniciar Sesión</h2>
            <form action="LoginServlet" method="post" class="login-form">
                <input type="text" name="correo" placeholder="Correo" required>
                <input type="password" name="password" placeholder="Contraseña" required>
                <input type="submit" value="Ingresar" class="btn-login">
            </form>
            <p class="error-msg">${error}</p>
        </div>
    </div>
</body>
</html>
