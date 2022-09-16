package main

import (
	"os"
	"os/signal"
	"time"

	"k8s.io/klog/v2"

	"github.com/timreimherr/localstack-sqs/monitor"
)

func main() {

	// Wait for interrupt signal to gracefully shutdown the server
	quit := make(chan os.Signal, 1)

	// Register our signal handlers in order
	// ^C in the terminal will send an os.Interrupt
	signal.Notify(quit, os.Interrupt)

	ticker := time.NewTicker(1 * time.Second)

	for {
		select {
		case <-quit:
			return
		case <-ticker.C:
			err := monitor.CheckQueueDepth()
			if err != nil {
				klog.Info(err)
			}
		}
	}
}
