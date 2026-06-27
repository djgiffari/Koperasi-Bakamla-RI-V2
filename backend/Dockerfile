FROM node:18

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./
COPY prisma ./prisma/

# Install dependencies
RUN npm install --include=dev

# Copy application source code
COPY . .

# Generate Prisma Client (needed for ORM)
RUN npx prisma generate

# Build TypeScript to JavaScript
RUN npm run build

# Expose the API port
EXPOSE 3000

# Command to run the application
# We use a shell script inline to push migrations before starting the server
CMD npx prisma db push && npm start
