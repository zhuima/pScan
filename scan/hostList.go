/*
Copyright © 2022 The Pragmatic Programmers, LLC
Copyrights apply to this source code.
Check LICENSE for details.

*/
// Package scan provides types and functions for scanning a list of hosts.
// scans on a list of hosts.
package scan

import (
	"bufio"
	"errors"
	"fmt"
	"io/ioutil"
	"os"
	"sort"
)

var (
	ErrExists    = errors.New("host already exists")
	ErrNotExists = errors.New("host does not exist")
)

// HostsList represents a list of hosts to run port scan
type HostsList struct {
	Hosts []string
}

// Search searches for a host in the list.
func (hl *HostsList) search(host string) (bool, int) {
	sort.Strings(hl.Hosts)

	i := sort.SearchStrings(hl.Hosts, host)

	if i < len(hl.Hosts) && hl.Hosts[i] == host {
		return true, i
	}

	return false, -1
}

// Add adds a host to the list.
func (hl *HostsList) Add(host string) error {
	if found, _ := hl.search(host); found {
		return fmt.Errorf("%w: %s", ErrExists, host)
	}

	hl.Hosts = append(hl.Hosts, host)
	return nil
}

// Remove removes a host from the list.
func (hl *HostsList) Remove(host string) error {
	if found, i := hl.search(host); found {
		hl.Hosts = append(hl.Hosts[:i], hl.Hosts[i+1:]...)
		return nil
	}

	return fmt.Errorf("%w: %s", ErrNotExists, host)
}

// List lists the hosts in the list.
func (hl *HostsList) List() {
	fmt.Println("Listing hosts:")
	for _, host := range hl.Hosts {
		fmt.Println(host)
	}
}

// Load obtains hosts from a hosts file
func (hl *HostsList) Load(filename string) error {
	f, err := os.Open(filename)
	if err != nil {
		if errors.Is(err, os.ErrNotExist) {
			return nil
		}
		return err
	}

	defer f.Close()

	scanner := bufio.NewScanner(f)
	for scanner.Scan() {
		hl.Hosts = append(hl.Hosts, scanner.Text())
	}

	return nil
}

// Save saves the hosts to a hosts file
func (hl *HostsList) Save(filename string) error {
	output := ""
	for _, host := range hl.Hosts {
		output += fmt.Sprintln(host)
	}
	return ioutil.WriteFile(filename, []byte(output), 0644)
}
