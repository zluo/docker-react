From node:alpine as builder

WORKDIR '/app'

COPY --chown=node:node package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html