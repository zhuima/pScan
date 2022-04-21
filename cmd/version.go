/*
Copyright © 2022 The Pragmatic Programmers, LLC
Copyrights apply to this source code.
Check LICENSE for details.

*/
package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var (
	version   string
	buildTime string
	osArch    string
	gitCommit string
	goVersion string
)

// versionCmd represents the version command.
var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "A brief description of your command",
	Run: func(cmd *cobra.Command, args []string) {
		// fmt.Printf("Version: %s\nBuilt: %s\nOS/Arch: %s\n", version, buildTime, osArch)
		fmt.Printf("Version: %s\nCommitId: %s\nBuild Date: %s\nGo Version: %s\nOS/Arch: %s\n", version, gitCommit, buildTime, goVersion, osArch)
	},
}

func init() {
	rootCmd.AddCommand(versionCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// versionCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// versionCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
