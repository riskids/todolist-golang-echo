FROM golang:alpine

# Tentukan working directory
WORKDIR /app

# Salin file go.mod dan go.sum
COPY go.mod go.sum ./

# Jalankan perintah go mod download untuk mendownload dependensi
RUN go mod download

# Salin kode sumber aplikasi ke dalam container
COPY . .

# Bangun aplikasi Go
RUN go build -o main .

# Tentukan port yang akan digunakan oleh aplikasi Echo
ENV PORT=3030
EXPOSE $PORT

# Tentukan perintah yang akan dijalankan saat container Docker dijalankan
CMD ["./main"]
