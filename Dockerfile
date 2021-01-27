FROM node:14-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# in Container /app/build <--- all the stuff we want to copy over doing run phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html