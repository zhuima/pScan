package scan

import (
	"fmt"
	"net"
	"time"
)

type PortState struct {
	Port int
	Open state
}

type state bool

// Results repersents the scan results for a single host
type Results struct {
	Host       string
	NotFound   bool
	PortStates []PortState
}

// String converts the boolean value of state to a human readable string
func (s state) String() string {
	if s {
		return "open"
	}
	return "closed"
}

// scanPort perfoms a port scan on a single TCP port
func scanPort(host string, port int) PortState {
	p := PortState{
		Port: port,
	}

	address := net.JoinHostPort(host, fmt.Sprintf("%d", port))

	scanConn, err := net.DialTimeout("tcp", address, time.Second)

	if err != nil {
		return p
	}

	scanConn.Close()
	p.Open = true
	return p

}

// Run performs a port scan on the hosts list
func Run(hl *HostsList, ports []int) []Results {
	res := make([]Results, 0, len(hl.Hosts))

	for _, host := range hl.Hosts {
		r := Results{
			Host: host,
		}

		if _, err := net.LookupHost(host); err != nil {
			r.NotFound = true

			res = append(res, r)

			continue

		}

		for _, port := range ports {
			r.PortStates = append(r.PortStates, scanPort(host, port))
		}
		res = append(res, r)
	}
	return res
}
