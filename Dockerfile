FROM node:20.15.0-alpine3.20
RUN addgroup app && adduser -S -G app app
USER app
WORKDIR /app
RUN mkdir data
COPY package*.json .
RUN npm i
COPY . .
ENV API_URL=http://localhost:8080
EXPOSE 3000
CMD ["npm", "start"]
# ENTRYPOINT ["npm", "start"]