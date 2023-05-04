High-level architecture:

Frontend: A responsive web application using Phaser.js and TypeScript, hosted on Google Cloud Storage.
Backend: Vert.x based WebSocket server, hosted on a Google Cloud VM instance.
Database: TimescaleDB for storing player positions, with MyBatis as the ORM.
Caching: Redis for caching player positions.
CI/CD: Google Cloud Build with Docker Compose.
