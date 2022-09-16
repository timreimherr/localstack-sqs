package monitor

import (
	"io/ioutil"
	"os/exec"

	"k8s.io/klog/v2"
)

func CheckQueueDepth() error {
	cmd := exec.Command("./monitor/check.sh")

	stdout, err := cmd.StdoutPipe()
	if err != nil {
		return err
	}

	err = cmd.Start()
	if err != nil {
		return err
	}

	data, err := ioutil.ReadAll(stdout)
	if err != nil {
		return err
	}

	klog.Info(string(data))

	if err := cmd.Wait(); err != nil {
		return err
	}

	return err
}
