# 3TapWatch - Movie Management System

## Prerequisites
Before running this project, ensure you have the following installed on your machine:
- **Java JDK 17** or higher
- **Apache Maven** (for building the project)
- **Apache Tomcat 9** or **10** (web server)

## How to Run

### 1. Build the Project
Open your terminal or command prompt in the project root directory (where `pom.xml` is located) and run:

```bash
mvn clean package
```

This command will compile the code and create a deployment file.
Once finished, check the `target/` folder. You should see a file named:
`CAT_project_test.war`

### 2. Deploy to Tomcat
1.  Navigate to your Apache Tomcat installation directory.
2.  Open the `webapps` folder.
3.  Copy the `CAT_project_test.war` file from your project's `target/` folder and paste it into the `webapps/` folder.

### 3. Start the Server
1.  Go to the `bin` folder inside your Tomcat directory.
2.  Run the startup script:
    *   **Windows**: Double-click `startup.bat`
    *   **Mac/Linux**: Run `./startup.sh`

Wait for the server to start (you will see "Server startup in [x] ms").

### 4. Access the Application
Open your web browser and go to:
[http://localhost:8080/CAT_project_test/](http://localhost:8080/CAT_project_test/)

## Login Credentials

**Admin Account:**
- **Username:** `admin`
- **Password:** `1234`

**User Account (Test):**
- **Username:** `user`
- **Password:** `1234`

---
*Note: Any movies added or changes made (including uploaded posters) are stored temporarily in memory or the deployed local folder and may be reset if you restart the server or redeploy the application.*
