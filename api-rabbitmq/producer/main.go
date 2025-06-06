package main

import (
	"context"
	"log"
	"time"

	"github.com/rabbitmq/amqp091-go"
)

func main() {
	// Conecte-se ao RabbitMQ
	conn, err := amqp091.Dial("amqp://guest:guest@localhost:5672/")
	if err != nil {
		log.Fatalf("Erro ao conectar ao RabbitMQ: %s", err)
	}
	defer conn.Close()

	// Crie um canal
	channel, err := conn.Channel()
	if err != nil {
		log.Fatalf("Erro ao abrir o canal: %s", err)
	}
	defer channel.Close()

	// Declare a fila
	queue, err := channel.QueueDeclare(
		"Beltrame", // Nome da fila
		true,       // Durável
		false,      // Auto delete
		false,      // Exclusiva
		false,      // Sem espera
		nil,        // Argumentos adicionais
	)
	if err != nil {
		log.Fatalf("Erro ao declarar a fila: %s", err)
	}

	// Mensagem a ser enviada
	message := "Olá, Beltrame!"

	// Contexto com timeout para publicação
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	// Publicar a mensagem na fila
	err = channel.PublishWithContext(ctx,
		"",         // Exchange
		queue.Name, // Routing key
		false,      // Obrigatório
		false,      // Imediato
		amqp091.Publishing{
			ContentType: "text/plain",
			Body:        []byte(message),
		},
	)
	if err != nil {
		log.Fatalf("Erro ao publicar a mensagem: %s", err)
	}

	log.Printf("Mensagem publicada: %s", message)
}
