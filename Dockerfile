# Base stage (minimal shared setup)

FROM node:22-alpine AS base
# Set working directory
WORKDIR /app
# Copy package.json and package-lock.json
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy the rest of the app
COPY . .

# Development stage
FROM base AS development
# Expose the port Next.js will run on
EXPOSE 3000
# Enable polling for Webpack to detect file changes in mounted volumes
ENV WATCHPACK_POLLING=true
CMD ["npm", "run", "dev"]

# Production build stage
FROM base AS builder
# Build the Next.js app for production
RUN npm run build

# Production runtime stage
FROM node:22-alpine AS production
# Set working directory
WORKDIR /app
# Copy only the necessary files from the builder stage
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules
# Expose the port Next.js will run on
EXPOSE 3000
# Set environment variable for production
ENV NODE_ENV=production
# Start the Next.js app
CMD ["npm", "run", "start"]



# --------------------------------------------- POST PONOĆ

# # Base stage (minimal shared setup)
# FROM node:18-alpine AS base
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .

# # Development stage
# FROM base AS development
# EXPOSE 3000
# # ENV WATCHPACK_POLLING=true
# CMD ["npm", "run", "dev"]

# # Production build stage
# FROM base AS builder
# RUN npm run build

# # Production runtime stage
# FROM node:18-alpine AS production
# WORKDIR /app
# COPY --from=builder /app/package*.json ./
# COPY --from=builder /app/.next ./.next
# COPY --from=builder /app/public ./public
# COPY --from=builder /app/node_modules ./node_modules
# EXPOSE 3000
# ENV NODE_ENV=production
# CMD ["npm", "run", "start"]


# --------------------------------------------- PRED PONOĆ

# # Base stage
# FROM node:18-alpine AS base
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .

# # Development stage
# FROM base AS development
# EXPOSE 3000
# ENV WATCHPACK_POLLING=true
# CMD ["npm", "run", "dev"]

# # Production build stage
# FROM base AS builder
# RUN npm run build

# # Production runtime stage
# FROM node:18-alpine AS production
# WORKDIR /app
# COPY --from=builder /app/package*.json ./
# COPY --from=builder /app/.next ./.next
# COPY --from=builder /app/public ./public
# COPY --from=builder /app/node_modules ./node_modules
# EXPOSE 3000
# ENV NODE_ENV=production
# CMD ["npm", "run", "start"]


# --------------------------------------------- NOVO

# # Stage 1: Build the Next.js app
# FROM node:18-alpine AS builder

# # Set working directory
# WORKDIR /app

# # Copy package.json and package-lock.json (if it exists)
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy the rest of the app
# COPY . .

# # Build the Next.js app for production
# RUN npm run build

# # Stage 2: Run the app
# FROM node:18-alpine AS runner

# # Set working directory
# WORKDIR /app

# # Copy only the necessary files from the builder stage
# COPY --from=builder /app/package*.json ./
# COPY --from=builder /app/.next ./.next
# COPY --from=builder /app/public ./public
# COPY --from=builder /app/node_modules ./node_modules

# # Expose the port Next.js will run on
# EXPOSE 3000

# # Set environment variable for production
# ENV NODE_ENV=production

# # Start the Next.js app
# CMD ["npm", "run", "start"]



