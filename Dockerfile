FROM node:24-alpine

# Copy package files and install dependencies in root
COPY package*.json ./
RUN npm ci --only=production

# Copy source code
COPY . .

# Run the action
ENTRYPOINT ["node", "/index.js"]
